const express = require("express");
const productsRouter = express.Router();
const productsController = require("../Controllers/products");
const uploadController = require("../Helpers/Middleware/uploadFile");
const checkToken = require("../Helpers/Middleware/checkToken");

//Create method
//post with upload file
productsRouter.post(
  "/",
  // checkToken.adminOnly,
  uploadController.singleUpload,
  productsController.addProduct
);

//Read method
productsRouter.get("/search", productsController.searchAndPaginate);

//Update method
// productsRouter.put("/update/:id", productsController.updateProduct);
productsRouter.patch(
  "/:id",
  // checkToken.adminOnly,
  uploadController.singleUpload,
  productsController.updateProduct
);

//Delete method
productsRouter.delete(
  "/:id",
  // checkToken.adminOnly,
  productsController.deleteProduct
);

//export
module.exports = productsRouter;
