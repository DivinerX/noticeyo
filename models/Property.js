const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  return sequelize.define('PROP', {
    name: {
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
    cnty: {
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
    numunits: {
      type: DataTypes.STRING,
    },
  });
};
