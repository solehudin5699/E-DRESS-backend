const dbConnect = require("../Configs/dbConnect");

const orderModel = {
  //CREATE METHOD
  postOrder: (body) => {
    return new Promise((resolve, reject) => {
      const { product_id, user_id, detail_order, totalprice } = body;
      let postQuery =
        "INSERT INTO transaction SET product_id=?, user_id=?, detail_order=?, totalprice=?";
      dbConnect.query(
        postQuery,
        [product_id, user_id, detail_order, totalprice],
        (error, result) => {
          if (!error) {
            resolve(result);
          } else {
            reject(error);
          }
        }
      );
    });
  },
  //READ METHOD
  getAllOrder: () => {
    return new Promise((resolve, reject) => {
      let getOrdersQuery = "Select * FROM transaction";
      dbConnect.query(getOrdersQuery, (error, result) => {
        if (!error) {
          resolve(result);
        } else {
          reject(error);
        }
      });
    });
  },
};

module.exports = orderModel;
