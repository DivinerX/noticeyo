const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  return sequelize.define('PAY', {
    fname: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    lname: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    dllr: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    cent: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    ptyp: {
      type: DataTypes.STRING,
      allowNull: false,
    }
  });
};