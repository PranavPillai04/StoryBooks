const GoogleStrategy = require('passport-google-oauth20').Strategy;
const mongoose = require('mongoose');
const User = require('../models/User');


module.exports = function (passport) {
    passport.use(new GoogleStrategy({
        clientID: process.env.GOOGLE_CLIENT_ID, // from Google Developer Console
        clientSecret: process.env.GOOGLE_CLIENT_SECRET, // from Google Developer Console
        callbackURL: '/auth/google/callback' // from Google Developer Console
    },
        async (accessToken, refreshToken, profile, done) => {
            console.log(profile);
        }
    ));

    passport.serializeUser((user, done) => {
        done(null, user.id);
    });

    passport.deserializeUser((id, done) => {
        User.findById(id, (err, user) => done(err, user));
    });
}