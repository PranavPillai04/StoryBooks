// Handlebars helpers

const moment = require("moment");

module.exports = {
  formatDate: function (date, format) {
    return moment(date).utc().format(format);
  },
  truncate: function (str, len) {
    if (str.length > len && str.length > 0) {
      let newStr = str + " ";
      newStr = str.substr(0, len);
      newStr = str.substr(0, newStr.lastIndexOf(" "));
      newStr = newStr.length > 0 ? newStr : str.substr(0, len);
      return newStr + "...";
    }
    return str;
  },
  stripTags: function (input) {
    return input.replace(/<(?:.|\n)*?>/gm, "");
  },
  // floating below is to tell Materialize to float the button to the right,
  //      unless it is on single card view
  editIcon: function (storyUser, loggedUser, storyId, floating = true) {
    // if current user is the author of the card, they can edit it
    if (storyUser._id.toString() == loggedUser._id.toString()) {
      if (floating) {
        return `<a href="/stories/edit/${storyId}" class="btn-floating 
        halfway-fab blue"><i class="fas fa-edit fa-small"></i></a>`;
      } else {
        return `<a href="/stories/edit/${storyId}"><i class="fas fa-edit"></i></a>`;
      }
    } else {
      return "";
    }
  },
  //   From StackOverflow to select the correct option in the dropdown:
  select: function (selected, options) {
    return options
      .fn(this)
      .replace(
        new RegExp(' value="' + selected + '"'),
        '$& selected="selected"'
      )
      .replace(
        new RegExp(">" + selected + "</option>"),
        ' selected="selected"$&'
      );
  },
  capitalize: function (value) {
    if (typeof value !== "string") {
      return "";
    }
    return value.charAt(0).toUpperCase() + value.slice(1);
  },
};
