const dbConnect = require("../Configs/dbConnect");

const productsModel = {
  //CREATE METHOD
  // postProduct: (body) => {
  //   return new Promise((resolve, reject) => {
  //     const { id, name, price, stock, image, category_id } = body;
  //     let postQuery =
  //       "INSERT INTO products_table SET product_id=?, product_name=?, product_price=?,product_stock=?, product_image=?,category_id= ? ";
  //     dbConnect.query(
  //       postQuery,
  //       [id, name, price, stock, image, category_id],
  //       (error, result) => {
  //         if (!error) {
  //           resolve(result);
  //         } else {
  //           reject(error);
  //         }
  //       }
  //     );
  //   });
  // },
  addProduct: (body) => {
    return new Promise((resolve, reject) => {
      let postQuery = "INSERT INTO products SET ?";
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
  // getAllProducts: () => {
  //   return new Promise((resolve, reject) => {
  //     let getProductsQuery = "Select * FROM products";
  //     dbConnect.query(getProductsQuery, (error, result) => {
  //       if (!error) {
  //         resolve(result);
  //       } else {
  //         reject(error);
  //       }
  //     });
  //   });
  // },

  // sortProduct: (query) => {
  //   return new Promise((resolve, reject) => {
  //     let sortBased = query.sortBased;
  //     let sort = query.sort;
  //     let sortQuery = `SELECT products_table.product_id, products_table.product_name, products_table.product_price, products_table.product_stock, products_table.create_date, category_table.category_name FROM products_table JOIN category_table ON products_table.category_id=category_table.category_id ORDER BY products_table.${sortBased} ${sort}`;
  //     dbConnect.query(sortQuery, (error, result) => {
  //       if (!error) {
  //         resolve(result);
  //       } else {
  //         reject(error);
  //       }
  //     });
  //   });
  // },

  // searchProductByName: (name) => {
  //   return new Promise((resolve, reject) => {
  //     let getProductsQuery = `SELECT * FROM products_table WHERE product_name LIKE '%${name}%'`;
  //     dbConnect.query(getProductsQuery, (error, result) => {
  //       if (!error) {
  //         resolve(result);
  //       } else {
  //         reject(error);
  //       }
  //     });
  //   });
  // },

  searchAndPaginate: (query) => {
    return new Promise((resolve, reject) => {
      const { name, sortBy, orderBy, page, limit, newest } = query;
      const offset = (page - 1) * limit;
      const checkData = `SELECT * FROM products`;
      const queryString = `SELECT products.product_id, products.name, products.price,products.description, products.stock,products.image, products.create_date, products.category_id, category.category_name FROM products JOIN category ON products.category_id=category.id WHERE products.name LIKE '%${name}%' ORDER BY products.${sortBy} ${orderBy}, products.create_date ${newest}  LIMIT ${Number(
        limit
      )} OFFSET ${offset}`;
      dbConnect.query(checkData, (err, dataAll) => {
        if (err) {
          reject(err);
        } else {
          dbConnect.query(queryString, (err, data) => {
            if (!err) {
              resolve({ dataAll, data });
            } else {
              reject(err);
            }
          });
        }
      });
    });
  },

  updateProduct: (body, params) => {
    return new Promise((resolve, reject) => {
      const { id } = params;
      let updateQuery = `UPDATE products SET ? WHERE product_id=${id}`;
      dbConnect.query(updateQuery, body, (error, result) => {
        if (!error) {
          resolve(result);
        } else {
          reject(error);
        }
      });
    });
  },

  //DELETE METHOD
  deleteProduct: (params) => {
    return new Promise((resolve, reject) => {
      const { id } = params;
      let deleteQuery = "DELETE from products WHERE product_id=?";
      dbConnect.query(deleteQuery, [id], (error, result) => {
        if (!error) {
          resolve(result);
        } else {
          reject(error);
        }
      });
    });
  },
};

module.exports = productsModel;
