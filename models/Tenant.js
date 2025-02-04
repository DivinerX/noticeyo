const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  return sequelize.define('TEN', {
    fname: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    lname: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    Index: {
      type: DataTypes.INTEGER,
      require: true
    },
    tel:{
      type: DataTypes.STRING,
      allowNull: false,
    },
    telcel:{
      type: DataTypes.STRING,
    },
    telfax:{
      type: DataTypes.STRING,
    },
    eml1: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    eml2: {
      type: DataTypes.STRING,
    },
    SS: {
      type: DataTypes.STRING,
    },
    DOB: {
      type: DataTypes.STRING,
    },
    DL: {
      type: DataTypes.STRING,
    },
    DLST: {
      type: DataTypes.STRING,
    },
  });
};