const bycrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const dbConnect = require("../Configs/dbConnect");
const { changeUser } = require("../Configs/dbConnect");

const authModel = {
  registration: (body) => {
    return new Promise((resolve, reject) => {
      //CHECK AVAILABILITY OF USERNAME
      const { username } = body;
      const checkUsername = "SELECT username FROM users WHERE username=?";
      dbConnect.query(checkUsername, [username], (err, data) => {
        if (err) {
          reject({ msg: "Something is wrong" });
        } else if (data.length) {
          reject({ msg: "Username already registered" });
        } else {
          //DO THIS IF USERNAME IS NOT ALREADY
          bycrypt.genSalt(10, (err, salt) => {
            if (err) {
              reject({ msg: "Something is wrong" });
            }
            const { password } = body;
            bycrypt.hash(password, salt, (err, hashedPassword) => {
              if (err) {
                reject({ msg: "Something is wrong" });
              }
              console.log(hashedPassword);
              const newBody = {
                ...body,
                password: hashedPassword,
              };
              const postQuery = "INSERT INTO users SET ?";
              dbConnect.query(postQuery, newBody, (err, data) => {
                if (!err) {
                  const msg = "Registration is succes";
                  resolve({ msg });
                } else {
                  reject({ msg: "Registration is failed" });
                }
              });
            });
          });
        }
      });
    });
  },
  login: (body) => {
    return new Promise((resolve, reject) => {
      const { username } = body;
      const loginQuery =
        "SELECT user_id, name, username, email, password, level_id, image FROM users WHERE username=?";
      dbConnect.query(loginQuery, [username], (err, data) => {
        // dbConnect.query(loginQuery, body.username, (err, data) => {
        if (err) {
          reject(err);
        } else if (!data.length) {
          reject({ msg: "Data not Found" });
        } else {
          bycrypt.compare(body.password, data[0].password, (err, result) => {
            if (result) {
              const {
                user_id,
                name,
                username,
                email,
                password,
                level_id,
                image,
              } = data[0];
              const payload = {
                username,
                level_id,
              };
              //CHECK LEVEL USER (SUPERVISOR||CASHIER)
              let secretKey;
              if (level_id == 1) {
                secretKey = process.env.SECRET_KEY_ADMIN;
              } else {
                secretKey = process.env.SECRET_KEY_CUSTOMER;
              }
              //CREATE TOKEN
              const token = jwt.sign(payload, secretKey, {
                expiresIn: "10h",
              });
              const msg = "Login Succes";
              resolve({
                msg,
                user_id,
                name,
                username,
                email,
                level_id,
                image,
                token,
              });
            }
            if (!result) {
              reject({ msg: "Wrong Password" });
            }
            if (err) {
              reject(err);
            }
          });
        }
      });
    });
  },
  // updateUsers: (body, params) => {
  //   return new Promise((resolve, reject) => {
  //     const { id } = params;

  //     let updateQuery = `UPDATE users SET ? WHERE user_id=${id}`;
  //     dbConnect.query(updateQuery, body, (error, result) => {
  //       if (!error) {
  //         resolve(result);
  //       } else {
  //         reject(error);
  //       }
  //     });
  //   });
  // },
  updateUsers: (body, params) => {
    return new Promise((resolve, reject) => {
      const { id } = params;
      if (!body.password) {
        let updateQuery = `UPDATE users SET ? WHERE user_id=${id}`;
        dbConnect.query(updateQuery, body, (error, result) => {
          if (!error) {
            resolve(result);
          } else {
            reject(error);
          }
        });
      } else {
        bycrypt.genSalt(10, (err, salt) => {
          if (err) {
            reject(err);
          }
          const { password } = body;
          bycrypt.hash(password, salt, (err, hashedPassword) => {
            if (err) {
              reject(err);
            }
            console.log(hashedPassword);
            const newBody = {
              ...body,
              password: hashedPassword,
            };
            const postQuery = "UPDATE users SET ? WHERE user_id=" + id;
            dbConnect.query(postQuery, newBody, (err, data) => {
              if (!err) {
                const msg = "User information is succes to be updated.";
                resolve({ msg });
              } else {
                reject(err);
              }
            });
          });
        });
      }
    });
  },
};

module.exports = authModel;
