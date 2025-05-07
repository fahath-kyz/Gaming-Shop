
const mongoose = require('mongoose');

const dbConfig = {
    url: 'mongodb://localhost:27017/gaming_product_manager'
};

mongoose.connect(dbConfig.url, {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(() => {
    console.log('Successfully connected to the database');
}).catch(err => {
    console.error('Could not connect to the database. Exiting now...', err);
    process.exit();
});

module.exports = dbConfig;