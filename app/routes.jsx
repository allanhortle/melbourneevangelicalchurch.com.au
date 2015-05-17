var React = require('react');
var Router = require('react-router');
var {Route, DefaultRoute, NotFoundRoute, RouteHandler} = Router;

var HomePageView = require('./HomePageView');
var MarkdownPage = require('./pages/MarkdownPage');

var AppHandler = React.createClass({
    displayName: 'App',
    render: function () {
        return <RouteHandler></RouteHandler>;
    }
});

var routes = (
    <Route handler={AppHandler}>
        <Route name="about" handler={MarkdownPage} />
        <Route name="nested" handler={AppHandler}>
            <Route name="nestee" handler={AppHandler}/>
            <DefaultRoute handler={AppHandler} />
        </Route>
        <DefaultRoute handler={HomePageView} />
    </Route>
);

module.exports = routes;


