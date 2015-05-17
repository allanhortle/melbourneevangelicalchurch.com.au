var React = require('react');

var MarkdownPage = React.createClass({
    displayName: 'MarkdownPage',
    render: function () {
        console.log(this.data);
        return (
            <div>
                <h1>MelbourneEvangelicalChurch</h1>
            </div>
        );
    }
});

module.exports = MarkdownPage;
