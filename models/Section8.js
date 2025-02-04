const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  return sequelize.define('SECT8', {
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
