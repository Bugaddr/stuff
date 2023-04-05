# Awesome Bookmarks For Chromium Browser

### Open In Gitpod
```
javascript:(function(){var repoURL = window.location.href; window.open("https://gitpod.io/#" + repoURL, "_blank"); window.focus();})();
```

### Open IN GITHUB1s
```
javascript: window.location.href = window.location.href.replace(/github(1s)?.com/, function(match, p1) { return p1 ? 'github.com' : 'github1s.com' })
```

### Open In Free GOOGLE CLOUD SHELL
```
javascript:{window.location='https://ssh.cloud.google.com/cloudshell/editor?shellonly=true&cloudshell_git_repo='+encodeURIComponent(window.location.href)}
```

### Chromium Extension Downloader
```
javascript:location.href='https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion='+(navigator.appVersion.match(/Chrome\/(\S+)/)[1])+'&x=id%'+'3D'+(document.querySelector('a[href^="https://chrome.google.com/webstore/report/"]').pathname.match(/[^\/]+\/*$/)[0])+'%'+'26installsource%'+'3Dondemand%'+'26uc';
```
