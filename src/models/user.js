import {DataTypes} from "sequelize"
import {sequelize} from "../database/database.js"
import {product} from "../models/product.js"


   export const users = sequelize.define("users", {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true 
    },
    name: {
        type: DataTypes.STRING,
    },
    lastName: {
        type: DataTypes.STRING,
    },
    gender: {
        type: DataTypes.STRING,
    },
    birthday_date : {
        type: DataTypes.STRING
    }

   }) 

   users.hasMany(product, {
        foreignKey: "userId",
        sourceKey: "id"
   })

   product.belongsTo(users,{
    foreignKey: "userId",
    targetId: "id"
   })