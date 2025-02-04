const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  return sequelize.define('PARTICULAR', {
    RentFrom: {
      type: DataTypes.DATE,
      allowNull: false
    },
    RentThrough: {
      type: DataTypes.DATE,
      allowNull: false
    },
    Dollars: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    Cents: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    Written: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    PayToFirst: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    PayToLast: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    tel: {
      type: DataTypes.STRING,
      allowNull: false,
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
    zip: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    cnty: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    OpenHours: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    OpenDays: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  });
};
