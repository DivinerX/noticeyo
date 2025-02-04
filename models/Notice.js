const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  return sequelize.define('NOTICETBL', {
    noticetyp: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  });
};
