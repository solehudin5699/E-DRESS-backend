//Package import
const express = require("express");
const authRouter = express.Router();
//Filepath import
const authController = require("../Controllers/auth");
const uploadProfileController = require("../Helpers/Middleware/uploadProfileImages");

//IMPLEMENTATION
//ADMIN ONLY
authRouter.post("/registration", authController.registration);
//PUBLIC
authRouter.post("/login", authController.login);
authRouter.patch(
  "/update/:id",
  uploadProfileController.singleUpload,
  authController.updateUsers
);
// authRouter.post("/validate", checkToken.allUsers, (req, res) => {
//   res.json({ status:200,token: true });
// });

module.exports = authRouter;
