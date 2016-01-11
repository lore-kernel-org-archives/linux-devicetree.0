From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2] dtc: create tool to diff device trees
Date: Mon, 11 Jan 2016 13:37:42 +1100
Message-ID: <20160111023742.GA22925@voom.redhat.com>
References: <568EB672.6060300@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <568EB672.6060300@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2016 at 11:03:14AM -0800, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand@sonymobile.com>
>=20
> Create script to diff device trees.
>=20
> The device tree can be in any of the forms recognized by the dtc compiler:
>   - source
>   - binary blob
>   - file system tree (from /proc/devicetree)
>=20
> If the device tree is a source file, then it is pre-processed in the
> same way as it would be when built in the linux kernel source tree
> before diffing.
>=20
> Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
> ---
>=20
> Tools to develop and debug device tree are somewhat inadequate.  This is a
> small step in improving the situation.
>=20
> Rationale for and examples of using the script are provided in slides
> 1 - 78 of the elce 2015 presentation "Solving Device Tree Issues",
> which can be found at:
>=20
>    http://elinux.org/images/0/04/Dt_debugging_elce_2015_151006_0421.pdf
>=20
> (The script was named dtdiff instead of dtx_diff in the presentation.)
>=20
> Changes in v2:
>   - Remove dt-bindings from list of includes in cpp_flags
>   - Remove arch_dtc_flags, which were generated from the arch specific
>     dts makefile
>   - Reformat to 8 character tabs
>   - compile_to_dts(): added back missing return for binary blob
>=20
>=20
>  scripts/dtc/dtx_diff |  343 ++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>  1 file changed, 343 insertions(+)
>=20
> Index: b/scripts/dtc/dtx_diff

I think this is probably the wrong directory to put this in.  Because
it preprocesses in the style of the kernel, this script belongs in the
kernel tree, not the upstream dtc tree.  However, basically everything
else in this directory is imported directly from upstream dtc.

Putting this kernel-specific file in here will probably make updates
to newer upstream dtc versions more complicated.

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- /dev/null
> +++ b/scripts/dtc/dtx_diff
> @@ -0,0 +1,343 @@
> +#! /bin/bash
> +
> +# Copyright (C) 2015 Frank Rowand
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; version 2 of the License.
> +
> +
> +usage() {
> +
> +	# use spaces instead of tabs in the usage message
> +	cat >&2 <<eod
> +
> +Usage:
> +
> +   `basename $0` DTx
> +        decompile DTx
> +
> +   `basename $0` DTx_1 DTx_2
> +        diff DTx_1 and DTx_2
> +
> +
> +       -f           print full dts in diff (--unified=3D99999)
> +       -h           synonym for --help
> +       -help        synonym for --help
> +      --help        print this message and exit
> +       -s SRCTREE   linux kernel source tree is at path SRCTREE
> +                        (default is current directory)
> +       -S           linux kernel source tree is at root of current git r=
epo
> +       -u           unsorted, do not sort DTx
> +
> +
> +Each DTx is processed by the dtc compiler to produce a sorted dts source
> +file.  If DTx is a dts source file then it is pre-processed in the same
> +manner as done for the compile of the dts source file in the Linux kernel
> +build system ('#include' and '/include/' directives are processed).
> +
> +If two DTx are provided, the resulting dts source files are diffed.
> +
> +If DTx is a directory, it is treated as a DT subtree, such as
> +  /proc/device-tree.
> +
> +If DTx contains the binary blob magic value in the first four bytes,
> +  it is treated as a binary blob (aka .dtb or FDT).
> +
> +Otherwise DTx is treated as a dts source file (aka .dts).
> +
> +   If this script is not run from the root of the linux source tree,
> +   and DTx utilizes '#include' or '/include/' then the path of the
> +   linux source tree can be provided by '-s SRCTREE' or '-S' so that
> +   include paths will be set properly.
> +
> +   The shell variable \${ARCH} must provide the architecture containing
> +   the dts source file for include paths to be set properly for '#includ=
e'
> +   or '/include/' to be processed.
> +
> +   If DTx_1 and DTx_2 are in different architectures, then this script
> +   may not work since \${ARCH} is part of the include path.  Two possible
> +   workarounds:
> +
> +      `basename $0` \\
> +          <(ARCH=3Darch_of_dtx_1 `basename $0` DTx_1) \\
> +          <(ARCH=3Darch_of_dtx_2 `basename $0` DTx_2)
> +
> +      `basename $0` ARCH=3Darch_of_dtx_1 DTx_1 >tmp_dtx_1.dts
> +      `basename $0` ARCH=3Darch_of_dtx_2 DTx_2 >tmp_dtx_2.dts
> +      `basename $0` tmp_dtx_1.dts tmp_dtx_2.dts
> +      rm tmp_dtx_1.dts tmp_dtx_2.dts
> +
> +   If DTx_1 and DTx_2 are in different directories, then this script will
> +   add the path of DTx_1 and DTx_2 to the include paths.  If DTx_2 inclu=
des
> +   a local file that exists in both the path of DTx_1 and DTx_2 then the
> +   file in the path of DTx_1 will incorrectly be included.  Possible
> +   workaround:
> +
> +      `basename $0` DTx_1 >tmp_dtx_1.dts
> +      `basename $0` DTx_2 >tmp_dtx_2.dts
> +      `basename $0` tmp_dtx_1.dts tmp_dtx_2.dts
> +      rm tmp_dtx_1.dts tmp_dtx_2.dts
> +
> +eod
> +}
> +
> +
> +compile_to_dts() {
> +
> +	dtx=3D"$1"
> +
> +	if [ -d "${dtx}" ] ; then
> +
> +		# -----  input is file tree
> +
> +		if ( ! ${DTC} -I fs ${dtx} ) ; then
> +			exit 3
> +		fi
> +
> +	elif [ -f "${dtx}" ] && [ -r "${dtx}" ] ; then
> +
> +		magic=3D`hexdump -n 4 -e '/1 "%02x"' ${dtx}`
> +		if [ "${magic}" =3D "d00dfeed" ] ; then
> +
> +			# -----  input is FDT (binary blob)
> +
> +			if ( ! ${DTC} -I dtb ${dtx} ) ; then
> +				exit 3
> +			fi
> +
> +			return
> +
> +		fi
> +
> +		# -----  input is DTS (source)
> +
> +		if ( cpp ${cpp_flags} -x assembler-with-cpp ${dtx} \
> +			| ${DTC} -I dts ) ; then
> +			return
> +		fi
> +
> +		echo ""                                                      >&2
> +		echo "Possible hints to resolve the above error:"            >&2
> +		echo "  (hints might not fix the problem)"                   >&2
> +
> +		hint_given=3D0
> +
> +		if [ "${ARCH}" =3D "" ] ; then
> +			hint_given=3D1
> +			echo ""                                              >&2
> +			echo "  shell variable \$ARCH not set"               >&2
> +		fi
> +
> +		dtx_arch=3D`echo "/${dtx}" | sed -e 's|.*/arch/||' -e 's|/.*||'`
> +
> +		if [ "${dtx_arch}" !=3D ""  -a "${dtx_arch}" !=3D "${ARCH}" ] ; then
> +			hint_given=3D1
> +			echo ""                                              >&2
> +			echo "  architecture ${dtx_arch} is in file path,"   >&2
> +			echo "  but does not match shell variable \$ARCH"    >&2
> +			echo "  (${ARCH}) does not match shell variable"     >&2
> +			echo "  \$ARCH (${ARCH})"                            >&2
> +		fi
> +
> +		if [ ! -d ${srctree}/arch/${ARCH} ] ; then
> +			hint_given=3D1
> +			echo ""                                              >&2
> +			echo "  ${srctree}/arch/${ARCH}/ does not exist"     >&2
> +			echo "  Is \$ARCH=3D'${ARCH}' correct?"                >&2
> +			echo "  Possible fix: use '-s' option"               >&2
> +
> +			git_root=3D`git rev-parse --show-toplevel 2>/dev/null`
> +			if [ -d ${git_root}/arch/ ] ; then
> +				echo "  Possible fix: use '-S' option"       >&2
> +			fi
> +		fi
> +
> +		if [ $hint_given =3D 0 ] ; then
> +			echo ""                                              >&2
> +			echo "  No hints available."                         >&2
> +		fi
> +
> +		echo ""                                                      >&2
> +
> +		exit 3
> +
> +	else
> +		echo ""                                                     >&2
> +		echo "ERROR: ${dtx} does not exist or is not readable"      >&2
> +		echo ""                                                     >&2
> +		exit 2
> +	fi
> +
> +}
> +
> +
> +# -----  start of script
> +
> +cmd_diff=3D0
> +diff_flags=3D"-u"
> +dtx_file_1=3D""
> +dtx_file_2=3D""
> +dtc_sort=3D"-s"
> +help=3D0
> +srctree=3D""
> +
> +
> +while [ $# -gt 0 ] ; do
> +
> +	case $1 in
> +
> +	-f )
> +		diff_flags=3D"--unified=3D999999"
> +		shift
> +		;;
> +
> +	-h | -help | --help )
> +		help=3D1
> +		shift
> +		;;
> +
> +	-s )
> +		srctree=3D"$2"
> +		shift 2
> +		;;
> +
> +	-S )
> +		git_root=3D`git rev-parse --show-toplevel 2>/dev/null`
> +		srctree=3D"${git_root}"
> +		shift
> +		;;
> +
> +	-u )
> +		dtc_sort=3D""
> +		shift
> +		;;
> +
> +	*)
> +		if [ "${dtx_file_1}"  =3D "" ] ; then
> +			dtx_file_1=3D"$1"
> +		elif [ "${dtx_file_2}" =3D "" ] ; then
> +			dtx_file_2=3D"$1"
> +		else
> +			echo ""                                             >&2
> +			echo "ERROR: Unexpected parameter: $1"              >&2
> +			echo ""                                             >&2
> +			exit 2
> +		fi
> +		shift
> +		;;
> +
> +	esac
> +
> +done
> +
> +if [ "${srctree}" =3D "" ] ; then
> +	srctree=3D"."
> +fi
> +
> +if [ "${dtx_file_2}" !=3D "" ]; then
> +	cmd_diff=3D1
> +fi
> +
> +if (( ${help} )) ; then
> +	usage
> +	exit 1
> +fi
> +
> +# this must follow check for ${help}
> +if [ "${dtx_file_1}" =3D "" ]; then
> +	echo ""                                                             >&2
> +	echo "ERROR: parameter DTx required"                                >&2
> +	echo ""                                                             >&2
> +	exit 2
> +fi
> +
> +
> +# -----  prefer dtc from linux kernel, allow fallback to dtc in $PATH
> +
> +if [ "${KBUILD_OUTPUT:0:2}" =3D ".." ] ; then
> +	__KBUILD_OUTPUT=3D"${srctree}/${KBUILD_OUTPUT}"
> +elif [ "${KBUILD_OUTPUT}" =3D "" ] ; then
> +	__KBUILD_OUTPUT=3D"."
> +else
> +	__KBUILD_OUTPUT=3D"${KBUILD_OUTPUT}"
> +fi
> +
> +DTC=3D"${__KBUILD_OUTPUT}/scripts/dtc/dtc"
> +
> +if [ ! -x ${DTC} ] ; then
> +	__DTC=3D"dtc"
> +	if ( ! which ${__DTC} >/dev/null ) ; then
> +
> +		# use spaces instead of tabs in the error message
> +		cat >&2 <<eod
> +
> +ERROR: unable to find a 'dtc' program
> +
> +   Preferred 'dtc' (built from Linux kernel source tree) was not found or
> +   is not executable.
> +
> +      'dtc' is: ${DTC}
> +
> +      If it does not exist, create it from the root of the Linux source =
tree:
> +
> +         'make scripts'.
> +
> +      If not at the root of the Linux kernel source tree -s SRCTREE or -S
> +      may need to be specified to find 'dtc'.
> +
> +      If 'O=3D\${dir}' is specified in your Linux builds, this script re=
quires
> +      'export KBUILD_OUTPUT=3D\${dir}' or add \${dir}/scripts/dtc to \$P=
ATH
> +      before running.
> +
> +      If \${KBUILD_OUTPUT} is a relative path, then '-s SRCDIR', -S, or =
run
> +      this script from the root of the Linux kernel source tree is requi=
red.
> +
> +   Fallback '${__DTC}' was also not in \${PATH} or is not executable.
> +
> +eod
> +		exit 2
> +	fi
> +	DTC=3D${__DTC}
> +fi
> +
> +
> +# -----  cpp and dtc flags same as for linux source tree build of .dtb f=
iles,
> +#        plus directories of the dtx file(s)
> +
> +dtx_path_1_dtc_include=3D"-i `dirname ${dtx_file_1}`"
> +
> +dtx_path_2_dtc_include=3D""
> +if (( ${cmd_diff} )) ; then
> +	dtx_path_2_dtc_include=3D"-i `dirname ${dtx_file_2}`"
> +fi
> +
> +cpp_flags=3D"\
> +	-nostdinc                                  \
> +	-I${srctree}/arch/${ARCH}/boot/dts         \
> +	-I${srctree}/arch/${ARCH}/boot/dts/include \
> +	-I${srctree}/drivers/of/testcase-data      \
> +	-undef -D__DTS__"
> +
> +dtc_flags=3D"\
> +	-i ${srctree}/arch/${ARCH}/boot/dts/ \
> +	-i ${srctree}/kernel/dts             \
> +	${dtx_path_1_dtc_include}            \
> +	${dtx_path_2_dtc_include}"
> +
> +DTC=3D"${DTC} ${dtc_flags} -O dts -qq -f ${dtc_sort} -o -"
> +
> +
> +# -----  do the diff or decompile
> +
> +if (( ${cmd_diff} )) ; then
> +
> +	diff ${diff_flags} \
> +		<(compile_to_dts "${dtx_file_1}") \
> +		<(compile_to_dts "${dtx_file_2}")
> +
> +else
> +
> +	compile_to_dts "${dtx_file_1}"
> +
> +fi
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWkxV2AAoJEGw4ysog2bOS/GEQAOTj2EKZppCReFbzTS2Eisdv
Uj2ThH2AA1xtg6DrgLiGwc6fF58vW6gaPpD9YMiMdfTtNQ+N07llq/HUsjY/NmUJ
TYOWZ5dcFHONZUiYXWwRMOQUm2xfB0K3YoTIwmmbse9F/Iyne+c277fgPFuIvH6b
XaUNwNFUlryhUgVr44U4eVMnsgxnFuPPHBOf7d9PxPgqbUbTwGheVKNnfBHM7uCC
A+dhC2AhTxCMRuXtjKSnQxQNUi/U37VlvkGlhFoRdbmxF5J9XuofNj7qxY9+idBU
CjTH26I4H7xGSpLdxk6DKeY06eI9TxIOkDA88w1uHIv4gJ5vJKFzV0XV/iP6kwOc
jKKd270jaebhTJmnp7jdwuIpKwbGqYmh6rCgeXFf94NnRqnhHRcwO7igiOQt9eBN
D5GtHSceV8AryKB5LjjiQ6HkFxQxDuIQKSxUDAje+IBnxXUv9JAT7KPI6zKm2mO5
FwjFs+AjabnCUji96gWHJiANZCoBSfgH6b9hIGGO3oRwuQq/t6u21K6ysS6m+kGu
IT6hKsFkECERZ/mD/ZFe3xT8TZAGQgOgi8XNEzvPkv4IW3+/9Atkc0iuY8gEtTRl
3FetfxRX/3yLySUhF6WkY5EoeYRppb7zX2Of+jaQ10ezQBSGKqh5u1yyjVUCsLzL
SXWPUMxeXNv0nTCtzY00
=mGUM
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
