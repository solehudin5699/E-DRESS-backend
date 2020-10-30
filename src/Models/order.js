const dbConnect = require("../Configs/dbConnect");

const orderModel = {
  //CREATE METHOD
  postOrder: (body) => {
    return new Promise((resolve, reject) => {
      let postQuery = "INSERT INTO transaction SET ?";
      dbConnect.query(postQuery, body, (error, result) => {
        if (!error) {
          resolve(result);
        } else {
          reject(error);
        }
      });
    });
  },
  //READ METHOD
  getAllOrder: () => {
    return new Promise((resolve, reject) => {
      let getOrdersQuery =
        "Select transaction.transaction_id,transaction.user_id,transaction.products,transaction.total_item,transaction.price_item,transaction.totalprice, transaction.transaction_date, users.name,users.username,users.email FROM transaction JOIN users ON transaction.user_id=users.user_id ORDER BY transaction.transaction_id DESC";
      dbConnect.query(getOrdersQuery, (error, result) => {
        if (!error) {
          resolve(result);
        } else {
          reject(error);
        }
      });
    });
  },
  getOrderByCustomer: (params) => {
    const { id } = params;
    return new Promise((resolve, reject) => {
      let getOrdersQuery =
        "Select * FROM transaction WHERE user_id=? ORDER BY transaction.transaction_id DESC";
      dbConnect.query(getOrdersQuery, [id], (error, result) => {
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
