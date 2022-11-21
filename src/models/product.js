import {DataTypes} from "sequelize"
import {sequelize} from "../database/database.js"


export const product = sequelize.define ("product", {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    title: {
        type: DataTypes.STRING,
    },
    description: {
        type: DataTypes.STRING,
    },
  score: {
    type: DataTypes.INTEGER,
  },
  price: {
    type: DataTypes.INTEGER,
  }
})