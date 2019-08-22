import ahoy from 'ahoy.js'
ahoy.configure({page: "Home Page"});
ahoy.trackView()
ahoy.trackClicks({class: 'a btn'})
ahoy.debug()