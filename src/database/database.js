import { Sequelize } from "sequelize";

export const sequelize = new Sequelize("eccommerce", "postgres", "root2022", {
  host: "localhost",
  dialect: "postgres",
});
