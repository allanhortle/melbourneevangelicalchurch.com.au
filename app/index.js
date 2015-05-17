var stalactite = require('stalactite');

stalactite.build({
    assets: 'res',
    routes: 'app/routes.jsx',
    src: {
        talks: '_posts/**/*.{md,markdown}'
    },
    dest: './dest'
});
