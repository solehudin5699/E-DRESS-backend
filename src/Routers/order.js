const express = require("express");
const orderRouter = express.Router();
const orderController = require("../Controllers/order");
const checkToken = require("../Helpers/Middleware/checkToken");

//Create method
orderRouter.post("/", orderController.postOrder);
//Read method
orderRouter.get("/", orderController.getAllOrder);

//export
module.exports = orderRouter;
