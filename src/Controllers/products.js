const productsModel = require("../Models/products");
const responseResult = require("../Helpers/formResponse");

const productsController = {
  //CREATE METHOD
  //post with upload file
  addProduct: (req, res) => {
    productsModel
      .addProduct(req.body)
      .then((result) => {
        responseResult.success(res, req.body);
      })
      .catch((error) => {
        responseResult.error(res, error);
      });
  },
  //READ METHOD

  searchAndPaginate: (req, res) => {
    productsModel
      .searchAndPaginate(req.query)
      .then((result) => {
        responseResult.paginationSucces(req, res, result);
      })
      .catch((err) => {
        responseResult.error(res, err);
      });
  },

  //UPDATE METHOD

  updateProduct: (req, res) => {
    productsModel
      .updateProduct(req.body, req.params)
      .then((result) => {
        if (result.affectedRows !== 0) {
          const detailUpdate = {
            ...req.body,
          };
          // console.log(result);
          responseResult.success(res, detailUpdate);
        } else {
          const msg = `Id product = ${req.params.id} is not found`;
          responseResult.error(res, { msg });
        }
      })
      .catch((error) => {
        responseResult.error(res, error);
      });
  },
  //DELETE METHOD
  deleteProduct: (req, res) => {
    productsModel
      .deleteProduct(req.params)
      .then((result) => {
        responseResult.success(res, result);
      })
      .catch((error) => {
        responseResult.error(res, error);
      });
  },
};
module.exports = productsController;
