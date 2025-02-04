const { DataTypes } = require('sequelize');
const CaseWorker = require('./CaseWorker');

module.exports = (sequelize) => {
  return sequelize.define('RECEIVER', {
    tnt1: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
    },
    tnt2: {
      type: DataTypes.BOOLEAN,
    },
    tnt3: {
      type: DataTypes.BOOLEAN,
    },
    tnt4: {
      type: DataTypes.BOOLEAN,
      require: true
    },
    lndld:{
      type: DataTypes.STRING,
    },
    mngr:{
      type: DataTypes.STRING,
    },
    attn:{
      type: DataTypes.STRING,
    }, 
  });
};