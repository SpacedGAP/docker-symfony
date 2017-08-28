var Encore = require('@symfony/webpack-encore');

Encore
    .setOutputPath('web/assets/build/')

    .setPublicPath('/assets/build')

    .cleanupOutputBeforeBuild()

    .enableSassLoader()

    .enableSourceMaps(!Encore.isProduction())

    .createSharedEntry('vendor', [
        'jquery',
        'materialize-css',
        './app/Resources/assets/plugins/material-preloader/js/materialPreloader.js',
        './app/Resources/assets/plugins/jquery-blockui/jquery.blockui.js',
        './app/Resources/assets/js/alpha.js',

        './node_modules/materialize-css/sass/materialize.scss',
        './app/Resources/assets/plugins/material-preloader/css/materialPreloader.css',
        './app/Resources/assets/css/alpha.css'
    ])
    
    .autoProvidejQuery()
;

module.exports = Encore.getWebpackConfig();
