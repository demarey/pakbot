Set up of credentials on CI infrastructure is not always easy but mandatory to run tests using 'git@xxx' urls.
To avoid to force the URL change in tests, this class will just rewrite the reposiory URL to ensure an https url  or a SSH url according to useHttps url flag.