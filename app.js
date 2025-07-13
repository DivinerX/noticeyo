const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const favicon = require('serve-favicon');
const app = express();
const { Landlord, Property, Tenant, Particular, Section8, CaseWorker, sequelize, Payment, Receiver } = require('./database');
const { transfer } = require('./sendMail')
const { createLetterWithPDF } = require('./postgrid');
const { fillOdtBlanks, convertOdtToPdf } = require('./odtEdit');

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.set('view engine', 'ejs');

app.use(express.static('public'));
app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));

app.get('/landlord', (req, res) => {
  res.render('landlord');
});

app.get('/:page', (req, res) => {
  res.render(req.params.page);
});


app.post('/property', async (req, res) => {
  try {
    const data = req.body;
    const newLandload = await Landlord.create({ ...data })
    res.render('property', { O_ID: newLandload.id })
  } catch (err) {
    console.error(err)
    res.render('500', { err })
  }
});

app.post('/tenant', async (req, res) => {
  try {
    const data = req.body;
    const newProperty = await Property.create({ ...data })
    res.render('tenant', { P_ID: newProperty.id, O_ID: data.O_ID })
  } catch (err) {
    console.error(err)
    res.render('500', { err })
  }
})

app.post('/particular', async (req, res) => {
  try {
    const data = req.body;
    for (let i = 1; i <= 4; i++) {
      if (data[`first_name_${i}`] && data[`last_name_${i}`]) {
        await Tenant.create({
          Index: i,
          fname: data[`first_name_${i}`],
          lname: data[`last_name_${i}`],
          tel: data[`tel_${i}`],
          telcel: data[`telcel_${i}`],
          telfax: data[`tel_fax_${i}`],
          eml1: data[`email1_${i}`],
          eml2: data[`email2_${i}`],
          P_ID: data.P_ID
        })
      }
    }
    res.render('particular', { P_ID: data.P_ID })
  } catch (err) {
    console.error(err)
    res.render('500', { err })
  }
})

app.post('/receiver', async (req, res) => {
  try {
    const data = req.body;
    await Particular.create({ ...data })
    res.render('receiver', { P_ID: data.P_ID })
  } catch (err) {
    console.error(err)
    res.render('500', { err })
  }
})

app.post('/payment', async (req, res) => {
  const data = req.body;
  let section8, caseworker;
  const t = await sequelize.transaction();
  const receiver = {};
  try {
    const tenant1 = await Tenant.findOne({ where: { P_ID: data.P_ID, Index: 1 } });
    tenant1.eml1 = data[`tenant_email_1`]
    receiver[`tnt1`] = true;
    await tenant1.save({ transaction: t })
    for (let i = 2; i <= 4; i++) {
      if (data[`ctenant${i}`] == "on") {
        const tenant = await Tenant.findOne({ where: { P_ID: data.P_ID, Index: i } });
        tenant.eml1 = data[`tenant_email_${i}`]
        receiver[`tnt${i}`] = true;
        await tenant.save({ transaction: t })
      }
    }
    if (data["clandlord"] == "on") {
      receiver.Landlord = data['landlord_email']
    }
    if (data["clandlord_manager"] == "on") {
      receiver.Manager = data['landlord_manager_email']
    }
    if (data[`csection8`] == 'on') {
      section8 = {
        eml1: data['section8_email'],
        address: data['section8_street_address'],
        unit: data['section8_address_line_2'],
        cty: data['section8_cty'],
        st: data['section8_st_province_region'],
        zip: data['section8_postal'],
        P_ID: data.P_ID
      }
      await Section8.create(section8, { transaction: t })
    }
    if (data[`ccaseworker`] == 'on') {
      caseworker = {
        eml1: data['caseworker_email'],
        address: data['caseworker_street_address'],
        unit: data['caseworker_address_line_2'],
        cty: data['caseworker_cty'],
        st: data['caseworker_st_province_region'],
        zip: data['caseworker_postal'],
        Index: 1,
        P_ID: data.P_ID
      }
      await CaseWorker.create(caseworker, { transaction: t })
    }
    receiver.P_ID = data.P_ID
    await Receiver.create(receiver, { transaction: t })
    res.render('payment', { P_ID: data.P_ID })
    await t.commit();
  } catch (err) {
    console.error(err)
    res.render('500', { err })
    await t.rollback();
  }
})
app.post('/check', async (req, res) => {
  try {
    const data = req.body;
    await Payment.create(data)
    const property = await Property.findOne({
      where: { id: data.P_ID },
      include: [
        {
          model: Landlord
        },
        {
          model: Payment
        },
        {
          model: Tenant
        },
        {
          model: Particular
        },
      ]
    })
    console.log(property)
    res.render('check', { data: property })
  } catch (err) {
    console.error(err)
    res.render('500', { err })
  }
})

app.post('/3day', async (req, res) => {
  id = req.body.id
  try {
    const property = await Property.findOne({
      where: { id: id },
      include: [
        {
          model: Landlord
        },
        {
          model: Payment
        },
        {
          model: Tenant
        },
        {
          model: Particular
        },
        {
          model: Receiver
        },
      ]
    })
    await fillOdtBlanks("./templates/3 DAY NOTICE template.odt", `./public/${id}.odt`, property)
    await convertOdtToPdf(`./public/${id}.odt`, `./public/`)
    res.render('pdfshow', { data: property })
  } catch (err) {
    console.error(err)
    res.render('500', { err })
  }
})

app.post('/pay/:id', async (req, res) => {
  res.render('makepayment', { property: req.params.id })
})
app.get('/notice/:id', async (req, res) => {
  const notice = await Property.findOne({
    where: { id: req.params.id },
    include: [
      {
        model: Landlord
      },
      {
        model: Payment
      },
      {
        model: Tenant
      },
      {
        model: Particular
      },
    ]
  })
  res.render('notice', { data: notice });
});

app.post('/mail/:id', async (req, res) => {
  let emailList = []
  let emailReceivers = []
  try {
    const property = await Property.findOne({
      where: { id: req.params.id },
      include: [
        {
          model: Tenant
        },
        {
          model: Section8
        },
        {
          model: CaseWorker
        },
        {
          model: Landlord
        },
        {
          model: Receiver
        }
      ]
    })

    console.log("--------------- property", property)

    let sender = property.OWN
    let recipient = {
      "addressLine1": property.address,
      "cty": property.cty,
      "cnty": property.cnty,
      "provinceOrst": property.st,
      "postalOrZip:": property.zip,
    }
    property.TENs.forEach(async Tenant => {
      recipient = {
        ...recipient,
        fname: Tenant.fname,
        lname: Tenant.lname,
      }
      emailList = [
        ...emailList,
        {
          role: `Tenant ${Tenant.Index}`,
          name: `${Tenant.fname} ${Tenant.lname}`,
          email: Tenant.eml1,
          address: `${property.address}, ${property.cty}, ${property.cnty}, ${property.st}, ${property.zip}`
        }
      ]
      emailReceivers = [
        ...emailReceivers,
        {
          role: `Tenant ${Tenant.Index}`,
          email: Tenant.eml1,
        }
      ]
      console.log(await createLetterWithPDF(sender, recipient, req.params.id))
      transfer(Tenant.eml1, req.params.id)
    });
    if (!!property.Section8) {
      transfer(property.Section8.eml1, req.params.id)
      emailList = [
        ...emailList,
        {
          role: 'Section8',
          email: property.Section8.eml1,
          address: `${property.Section8.address}, ${property.Section8.cty}, ${property.Section8.cnty}, ${property.Section8.st}, ${property.Section8.zip}`
        }
      ]
      emailReceivers = [
        ...emailReceivers,
        {
          role: "Section8",
          email: property.Section8.eml1,
        }
      ]
    }
    if (!!property.CaseWorker) {
      transfer(property.CaseWorker.eml1, req.params.id)
      emailList = [
        ...emailList,
        {
          role: 'CaseWorker',
          email: property.CaseWorker.eml1,
          address: `${property.CaseWorker.address}, ${property.CaseWorker.cty}, ${property.CaseWorker.cnty}, ${property.CaseWorker.st}, ${property.CaseWorker.zip}`
        }
      ]
      emailReceivers = [
        ...emailReceivers,
        {
          role: 'CaseWorker',
          email: property.CaseWorker.eml1,
        }
      ]
    }
    if (property.RECEIVER.lndld) {
      emailReceivers = [
        ...emailReceivers,
        {
          role: 'Landlord',
          email: property.OWN.eml1,
        }
      ]
      transfer(property.OWN.eml1, req.params.id)
    }
    if (property.RECEIVER.mngr) {
      emailReceivers = [
        ...emailReceivers,
        {
          role: 'Landlord Manager',
          email: property.RECEIVER.mngr,
        }
      ]
      transfer(property.RECEIVER.mngr, req.params.id)
    }
    res.render("success", { addresses: emailList, recipients: emailReceivers })
  } catch (err) {
    console.error(err)
    res.render('500', { err })
  }
})

// Server 3000 port
app.listen(3000, () => {
  console.log('Server is running on http://localhost:3000');
});