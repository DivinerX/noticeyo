const fs = require('fs')
const FormData = require('form-data')
const { PDFDocument, PageSizes } = require('pdf-lib');

// const api_key = "live_sk_n6d8UYmrfLagYXY4G2pccP"
const api_key = "test_sk_ttApE7u67Zfr4tc8JhMkyE"
const PDF_PATH = './public/postgrid.pdf'

const addNewPageOnPDF = async (filepath) => {
  const existingPdfBytes = fs.readFileSync(filepath);
  const pdfDoc = await PDFDocument.load(existingPdfBytes);
  pdfDoc.insertPage(0, PageSizes.Letter);
  const pdfBytes = await pdfDoc.save();
  fs.writeFileSync(PDF_PATH, pdfBytes);
}

module.exports = {
  createLetterWithPDF: async function (sender, recipient, filename) {
    const fetch = (await import('node-fetch')).default;
    const bodyData = JSON.stringify({
      "firstName": sender.fname,
      "lastName": sender.lname,
      "addressLine1": sender.address,
      "city": sender.cty,
      "provinceOrst": sender.st,
      "postalOrZip": sender.zip,
      "country": "US"
    })
    const recipientData = {
      ...recipient,
      country: "US"
      // cnty: alpha2Code(recipient.cnty)
    }
    let senderPostGrid = await fetch("https://api.postgrid.com/print-mail/v1/contacts", {
      method: 'POST',
      headers: {
        'x-api-key': api_key,
        'Content-Type': 'application/json',
      },
      body: bodyData
    })

    let recipientPostGrid = await fetch("https://api.postgrid.com/print-mail/v1/contacts", {
      method: 'POST',
      headers: {
        'x-api-key': api_key,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(recipientData)
    })
    senderPostGrid = await senderPostGrid.json()
    recipientPostGrid = await recipientPostGrid.json()

    console.log("senderPostGrid", senderPostGrid)
    console.log("recipientPostGrid", recipientPostGrid)

    const formData = new FormData();
    console.log(recipientPostGrid.id)
    console.log(senderPostGrid.id)
    console.log(`./public/${filename}.pdf`)
    formData.append('to', recipientPostGrid.id);
    formData.append('from', senderPostGrid.id);

    await addNewPageOnPDF(`./public/${filename}.pdf`)
    formData.append('pdf', fs.createReadStream(PDF_PATH));

    const requestOptions = {
      method: 'POST',
      headers: {
        'x-api-key': api_key,
        ...formData.getHeaders(),
      },
      body: formData,
    };

    const resp = await fetch("https://api.postgrid.com/print-mail/v1/letters", requestOptions);

    return await resp.json();
  }
}
