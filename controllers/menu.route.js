const express = require("express");
const router = express.Router();

router.get("/", function (request, response) {
    response.render("menu_view", { content: [] });
});


const auth = require("../utils/users.auth");
const userRepo = require("../utils/users.repository");

router.get("/admin/list", auth.checkAuthentication("ADMIN"), adminAction);
router.post("/login", loginPostAction);
router.get("/logout", logoutAction);


async function adminAction(request, response) {
  let userData = await userRepo.getOneUser(request.user.user_name);
  var userJson = JSON.stringify(userData)
  var myContent=[];
  myContent.push({ "category": "method",  "message": "ADMIN" });
  myContent.push({ "category": "userdata",  "message": userJson });
  response.render("menu_view", {"content": myContent });
}

async function loginPostAction(request, response) {
  areValid = await userRepo.areValidCredentials(request.body.username, request.body.userpass);

  if (areValid) {
    user = await userRepo.getOneUser(request.body.username);
    await request.login(user, function (err) { 
        if (err) { return next(err); }
    });
    if (request.user.user_role === "ADMIN") {
      return response.redirect("/admin/list");
    } else {
      response.send("Users do not have admin rights");
    }

  } else {
    response.send("Invalid credentials provided");
  }
}

function logoutAction(request, response) {
  request.logOut();
  response.redirect("/menu");
  
}



module.exports = router;