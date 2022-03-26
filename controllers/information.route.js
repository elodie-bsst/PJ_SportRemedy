// controllers/information.route.js
const express = require('express');
const router = express.Router();

router.get('/', informationRootAction);

// http://localhost:7000/information
function informationRootAction(request, response) {
    response.render("information_view");
}

module.exports = router;