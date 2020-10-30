//Package import
const express = require("express");
//Filepath import
const productsRouter = require("./products");
const orderRouter = require("./order");
const authRouter = require("./auth");
// const checkToken = require("../Helpers/Middleware/checkToken");
//Declaration
const indexRouter = express.Router();

//Implementation
indexRouter.use("/products", productsRouter);
indexRouter.use("/order", orderRouter);

//PUBLIC ROUTE OR PRIVATE ROUTE
indexRouter.use("/auth", authRouter);

//Export
module.exports = indexRouter;
