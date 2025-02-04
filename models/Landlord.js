const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  return sequelize.define('OWN', {
    fname: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    lname: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    bname: {
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
    tel: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    telcel: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    telfax: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    eml1: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    eml2: {
      type: DataTypes.STRING,
    }
  });
};
