const express = require("express");
const axios = require("axios");
const path = require("path");
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static files from 'public' folder
app.use(express.static(path.join(__dirname, "public")));

// ------------------------
// Update this with your Elastic IP
const ELASTIC_IP = "52.72.121.74"; 
const BACKEND_URL = `http://${ELASTIC_IP}:5000`;
// ------------------------

// API endpoint when form is submitted
app.post("/submit", async (req, res) => {
    try {
        const response = await axios.post(
            `${BACKEND_URL}/submit`,
            req.body,
            { headers: { "Content-Type": "application/json" } }
        );
        res.json(response.data);
    } catch (error) {
        console.error(error);
        res.json({ error: error.toString() });
    }
});

// Listen on all network interfaces for browser access
app.listen(3000, '0.0.0.0', () => {
    console.log(`Frontend running at http://${ELASTIC_IP}:3000`);
});

