EXTRA_DIST = dep.completion.in
DISTCLEANFILES = dep

if BASH_COMPLETION
nodist_bashcompletion_DATA = dep
bashcompletiondir = $(datadir)/bash-completion
dep: $(srcdir)/dep.completion.in $(top_srcdir)/src/dep
	cat $(srcdir)/dep.completion.in > dep
	bash $(top_srcdir)/src/dep --exec 'for n in count short long type itype; do declare -p shopt_$$n; done' | sed 's/shopt_/_dep_completion_shopt_/' >> dep
endif

