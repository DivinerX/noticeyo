const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  return sequelize.define('CWORKER', {
    Index: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    fname: {
      type: DataTypes.STRING,
    },
    lname: {
      type: DataTypes.STRING,
    },
    address: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    unit: {
      type: DataTypes.STRING,
    },
    cty: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    st: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    tel: {
      type: DataTypes.STRING,
    },
    telcel: {
      type: DataTypes.STRING,
    },
    telfax: {
      type: DataTypes.STRING,
    },
    eml1: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    eml2: {
      type: DataTypes.STRING,
    },
  });
};
