AC_INIT(udept, 0.5.99.0.2.95)
AC_SUBST(PACKAGE_TAG, ["I Just Know It'll End Up Sounding Lame"])
AM_INIT_AUTOMAKE([dist-bzip2])

AC_ARG_ENABLE(bash-completion, AS_HELP_STRING([--disable-bash-completion], 
	      [don't install bash completion]), [], 
	      [enable_bash_completion=yes])
AM_CONDITIONAL(BASH_COMPLETION, test x$enable_bash_completion = xyes)

AC_CONFIG_FILES([Makefile
		 doc/Makefile
		 src/Makefile src/dep
		 completion/Makefile
		 packaging/Makefile])
AC_OUTPUT
