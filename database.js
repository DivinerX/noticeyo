const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('nnoticer', 'root', 'password', {
  host: 'localhost',
  port: 3306,
  dialect: 'mysql',
});

const Landlord = require('./models/Landlord')(sequelize);
const Property = require('./models/Property')(sequelize);
const Tenant = require('./models/Tenant')(sequelize);
const Particular = require('./models/Particular')(sequelize);
const CaseWorker = require('./models/CaseWorker')(sequelize);
const Section8 = require('./models/Section8')(sequelize);
const Payment = require('./models/Payment')(sequelize);
const Receiver = require('./models/Receiver')(sequelize);
const Manager = require('./models/Manager')(sequelize);
const Attorney = require('./models/Attorney')(sequelize);
const Notice = require('./models/Notice')(sequelize);


Landlord.hasMany(Property, {
  foreignKey: "O_ID"
});
Property.belongsTo(Landlord, {
  foreignKey: "O_ID"
});
Landlord.hasMany(Tenant, {
  foreignKey: "O_ID"
});
Tenant.belongsTo(Landlord, {
  foreignKey: "O_ID"
});
Landlord.hasMany(Section8, {
  foreignKey: "O_ID"
});
Section8.belongsTo(Landlord, {
  foreignKey: "O_ID"
});
Landlord.hasMany(CaseWorker, {
  foreignKey: "O_ID"
});
CaseWorker.belongsTo(Landlord, {
  foreignKey: "O_ID"
});

Manager.hasOne(Property, {
  foreignKey: "M_ID"
});
Property.belongsTo(Manager, {
  foreignKey: "M_ID"
});
Manager.hasMany(Tenant, {
  foreignKey: "M_ID"
});
Tenant.belongsTo(Manager, {
  foreignKey: "M_ID"
});
Manager.hasMany(Section8, {
  foreignKey: "M_ID"
});
Section8.belongsTo(Manager, {
  foreignKey: "M_ID"
});
Manager.hasMany(CaseWorker, {
  foreignKey: "M_ID"
});
CaseWorker.belongsTo(Manager, {
  foreignKey: "M_ID"
});

Attorney.hasOne(Property, {
  foreignKey: "A_ID"
});
Property.belongsTo(Attorney, {
  foreignKey: "A_ID"
});
Attorney.hasMany(Tenant, {
  foreignKey: "A_ID"
});
Tenant.belongsTo(Attorney, {
  foreignKey: "A_ID"
});
Attorney.hasMany(Section8, {
  foreignKey: "A_ID"
});
Section8.belongsTo(Attorney, {
  foreignKey: "A_ID"
});
Attorney.hasMany(CaseWorker, {
  foreignKey: "A_ID"
});
CaseWorker.belongsTo(Attorney, {
  foreignKey: "A_ID"
});

Property.hasMany(Tenant, {
  foreignKey: "P_ID"
});
Tenant.belongsTo(Property, {
  foreignKey: "P_ID"
});
Property.hasOne(Particular, {
  foreignKey: "P_ID"
});
Particular.belongsTo(Property, {
  foreignKey: "P_ID"
});
Property.hasOne(Section8, {
  foreignKey: "P_ID"
});
Section8.belongsTo(Property, {
  foreignKey: "P_ID"
});
Property.hasOne(CaseWorker, {
  foreignKey: "P_ID"
});
CaseWorker.belongsTo(Property, {
  foreignKey: "P_ID"
});

Tenant.hasOne(Section8, {
  foreignKey: "T1_ID"
});
Section8.belongsTo(Tenant, {
  foreignKey: "T1_ID"
});
Tenant.hasOne(CaseWorker, {
  foreignKey: "T1_ID"
});
CaseWorker.belongsTo(Tenant, {
  foreignKey: "T1_ID"
});

Property.hasOne(Payment, {
  foreignKey: "P_ID"
});
Payment.belongsTo(Property, {
  foreignKey: "P_ID"
});
Property.hasOne(Receiver, {
  foreignKey: "P_ID"
});
Receiver.belongsTo(Property, {
  foreignKey: "P_ID"
});
Property.hasOne(Notice, {
  foreignKey: "P_ID"
});
Notice.belongsTo(Property, {
  foreignKey: "P_ID"
});

(async () => {
  try {
    await sequelize.authenticate();
    console.log('Connection has been established successfully.');

    // Sync the models with the database
    await sequelize.sync();
    console.log('All models were synchronized successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }

})();

module.exports = {
  sequelize,
  Landlord,
  Property,
  Tenant,
  Particular,
  Section8,
  CaseWorker,
  Payment,
  Receiver
};