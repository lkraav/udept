#!/bin/bash
# vim:set ts=4 sw=4:
#
# Copyright (c) 2004-2006 Ed Catmur <ed@catmur.co.uk>
# This program is licensed under the terms of the GPL version 2.
#

source "$1" --exec :
cat <<END
.TH DEP 1 "$(date +%F)" "udept $VERSION" "Portage utilities"
.SH NAME
$PROG \- $SYNOPSIS
.SH SYNOPSIS
.B $PROG
END
echo "${USELINE}" | sed 's/\<[[:upper:]]\+\>/\\fI&\\fR/g'
cat <<END
.SH DESCRIPTION
.PP
${DESCRIPTION}
.SH "OPTIONS SUMMARY"
.PP 
Here is a short summary of the options available in dep\&. Please refer
to the detailed description below for a complete description\&.
.PP
Action selection:
.nf
END
shopt_help action 20 60
cat <<END
.fi
.PP
Info types:
.nf
END
shopt_help info 20 60
cat <<END
.fi
.PP
Options: (--option=[yes,no] unless otherwise indicated)      (default)
.nf
END
shopt_help opt 20 70
cat <<END
.fi
.SH OPTIONS
END
	for ((i=0; i<shopt_count; ++i)); do
		echo ".TP"
		for ((j=0; j<${#shopt_short[$i]}; ++j)); do
			[[ "${shopt_category[$i]}" == opt ]] \
				&& echo -n "\\fB\\(+-" || echo -n "\\fB-"
			echo -n "${shopt_short[$i]:$j:1}"
			[[ "${shopt_itype[$i]}" == "NUMBER" ]] && echo -n "[num]"
			echo -n "\\fR, "
		done
		echo -n "\\fB--${shopt_long[$i]}"
		if [[ "${shopt_itype[$i]}" == "NUMBER" ]]; then
			echo -n "[=num]"
		elif [[ "${shopt_itype[$i]}" == [[:lower:]]* ]]; then
			echo -n "[=${shopt_itype[$i]}]"
		fi
		echo "\\fR"
		echo -n "${shopt_desc[$i]}"
		[[ "${shopt_idefault[$i]}" ]] \
			&& echo " (default: ${shopt_idefault[$i]})" || echo
	done
cat <<END
.PP
${INSTRUCTIONS//
/

}
.SH EXAMPLES
.TP
dep \-e portage
List versions of sys-apps/portage.
.TP
dep -Ln python
Display installed and uninstalled packages that depend on python.
.SH FILES
.PP
/var/db/pkg
/var/cache/edb/dep
/etc/make.conf
/etc/make.profile
.SH "SEE ALSO"
.PP
portage(5), equery(1)
.SH AUTHOR
Written by Ed Catmur.
.SH "REPORTING BUGS"
Report bugs at <http://bugs\\&.catmur\\&.co\\&.uk/>, product udept. Check 
<http://catmur\\&.co\\&.uk/gentoo/udept/> for updates and more information.
.SH COPYRIGHT
Copyright \\(co 2006 Ed Catmur.
.br
This is free software.  You may redistribute copies of it under the terms of
the GNU General Public License <http://www\\&.gnu\\&.org/licenses/gpl\\&.html>.
There is NO WARRANTY, to the extent permitted by law.
