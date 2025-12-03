const express = require("express");
const axios = require("axios");
const path = require("path");
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static files from 'public' folder
app.use(express.static(path.join(__dirname, "public")));

// API endpoint when form is submitted
app.post("/submit", async (req, res) => {
    try {
        const response = await axios.post(
          "http://backend:5000/submit",
    req.body,
    { headers: { "Content-Type": "application/json" } }
);
        res.json(response.data);
    } catch (error) {
        res.json({ error: error.toString() });
    }
});

app.listen(3000, () => {
    console.log("Frontend running at http://localhost:3000");
});
