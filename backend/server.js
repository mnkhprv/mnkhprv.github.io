const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const { v4: uuidv4 } = require('uuid');
const places = require('./data/mock_places.json');

const app = express();
app.use(cors());
app.use(bodyParser.json());

app.get('/places', (req, res) => {
  const q = (req.query.q || '').toLowerCase();
  const lat = parseFloat(req.query.lat || '0');
  const lng = parseFloat(req.query.lng || '0');
  let results = places;
  if (q) results = results.filter(p => p.name.toLowerCase().includes(q) || (p.category || '').toLowerCase().includes(q));
  res.json(results.slice(0, 50));
});

app.get('/places/:id', (req, res) => {
  const p = places.find(x => x.id === req.params.id);
  if (!p) return res.status(404).json({error: 'Not found'});
  res.json(p);
});

let itineraries = [];

app.get('/itineraries', (req, res) => {
  const userId = req.query.userId;
  if (!userId) return res.json(itineraries);
  res.json(itineraries.filter(i => i.ownerId === userId));
});

app.post('/itineraries', (req, res) => {
  const it = req.body;
  it.id = uuidv4();
  itineraries.push(it);
  res.status(201).json(it);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log('Pinpoint backend stub listening on', PORT));
