From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V5] kbuild: dtbs_install: new make target
Date: Thu, 21 Nov 2013 17:31:49 -0600
Message-ID: <653B066B-5B24-4817-86EF-D4D9F129123D@codeaurora.org>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net> <1385062552-9882-1-git-send-email-jason@lakedaemon.net>
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385062552-9882-1-git-send-email-jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Nov 21, 2013, at 1:35 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:

> Unlike other build products in the Linux kernel, there is no 'make
> *install' mechanism to put devicetree blobs in a standard place.
>=20
> This patch is an attempt to fix this problem.  Akin to 'make install'=
,
> this creates a new make target, dtbs_install.  The script that gets
> called defers to a distribution or user supplied installdtbs binary,
> if found in the system.  Otherwise, the default action is to install =
a
> given dtb into
>=20
>  /boot/devicetrees/${kernel_version}/${dts_filename}.dtb
>=20
> This is done to keep dtbs from different kernel versions separate unt=
il
> things have settled down.  Once the dtbs are stable, and not so stron=
gly
> linked to the kernel version, the devicetree files will most likely m=
ove
> to their own repo.  Users will need to upgrade install scripts at tha=
t
> time.
>=20
> Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> ---
> changes since v4:
> - move make target from arch/arm/Makefile to Makefile (swarren)
> - change default install location to /boot/devicetrees/$KERNVER (swar=
ren/gcl)
> - add INSTALL_DTBS_PATH for changing build root (jac)
>=20
> changes since v3:
> - drop renaming files to ${compat}.dtb (rmk/swarren)
> - move installdtbs.sh to ./scripts/ (gcl)
>=20
> changes since v2:
> - use fdtget instead of a modified dtc to get the board compat string
>=20
> changes since v1:
> - added this patch
>=20
> Makefile               | 20 +++++++++++++++++++-
> scripts/installdtbs.sh | 33 +++++++++++++++++++++++++++++++++
> 2 files changed, 52 insertions(+), 1 deletion(-)
> create mode 100644 scripts/installdtbs.sh
>=20
> diff --git a/Makefile b/Makefile
> index 920ad07180c9..bd28cb211411 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -339,6 +339,7 @@ OBJDUMP		=3D $(CROSS_COMPILE)objdump
> AWK		=3D awk
> GENKSYMS	=3D scripts/genksyms/genksyms
> INSTALLKERNEL  :=3D installkernel
> +INSTALLDTBS    :=3D installdtbs
> DEPMOD		=3D /sbin/depmod
> PERL		=3D perl
> CHECK		=3D sparse
> @@ -391,7 +392,7 @@ KERNELVERSION =3D $(VERSION)$(if $(PATCHLEVEL),.$=
(PATCHLEVEL)$(if $(SUBLEVEL),.$(S
> export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
> export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS L=
D CC
> export CPP AR NM STRIP OBJCOPY OBJDUMP
> -export MAKE AWK GENKSYMS INSTALLKERNEL PERL UTS_MACHINE
> +export MAKE AWK GENKSYMS INSTALLKERNEL INSTALLDTBS PERL UTS_MACHINE
> export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
>=20
> export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLA=
GS
> @@ -704,6 +705,15 @@ export KBUILD_IMAGE ?=3D vmlinux
> export	INSTALL_PATH ?=3D /boot
>=20
> #
> +# INSTALL_DTBS_PATH specifies a prefix for relocations required by b=
uild roots.
> +# Like INSTALL_MOD_PATH, it isn't defined in the Makefile, but can b=
e passed as
> +# an argument if needed.
> +#

Nit, do we want to match INSTALL_MOD_PATH and drop the =92S=92 for INST=
ALL_DTB_PATH?

> +
> +DTBBOOT =3D $(INSTALL_DTBS_PATH)/boot/devicetrees/$(KERNELRELEASE)
> +export DTBBOOT
> +
> +#
> # INSTALL_MOD_PATH specifies a prefix to MODLIB for module directory
> # relocations required by build roots.  This is not defined in the
> # makefile but the argument can be passed to make if needed.
> @@ -914,6 +924,14 @@ firmware_install: FORCE
> 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.fwinst obj=3Dfirmware __f=
w_install
>=20
> # -------------------------------------------------------------------=
--------
> +# devicetree install
> +PHONY +=3D dtbs_install
> +
> +dtbs_install:
> +	$(CONFIG_SHELL) $(srctree)/scripts/installdtbs.sh $(KERNELRELEASE) =
\
> +	"$(DTBBOOT)" "$(srctree)"
> +
> +# ------------------------------------------------------------------=
---------
> # Kernel headers
>=20
> #Default location for installed headers
> diff --git a/scripts/installdtbs.sh b/scripts/installdtbs.sh
> new file mode 100644
> index 000000000000..11027f00c3a4
> --- /dev/null
> +++ b/scripts/installdtbs.sh
> @@ -0,0 +1,33 @@
> +#!/bin/sh
> +#
> +# This file is subject to the terms and conditions of the GNU Genera=
l Public
> +# License.  See the file "COPYING" in the main directory of this arc=
hive
> +# for more details.
> +#
> +# Copyright (C) 1995 by Linus Torvalds
> +#
> +# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
> +#
> +# Further adapted from arch/x86/boot/install.sh by Jason Cooper
> +#
> +# "make dtbs_install" script
> +#
> +# Arguments:
> +#   $1 - kernel version
> +#   $2 - default install path (blank if root directory)
> +#   $3 - directory containing dtbs
> +#
> +
> +# User may have a custom install script
> +
> +if [ -x ~/bin/${INSTALLDTBS} ]; then exec ~/bin/${INSTALLDTBS} "$@";=
 fi
> +if [ -x /sbin/${INSTALLDTBS} ]; then exec /sbin/${INSTALLDTBS} "$@";=
 fi
> +
> +# Default install
> +[ -d "$2" ] && rm -rf "$2"
> +
> +mkdir -p "$2"
> +
> +for dtb in `find "$3" -name "*.dtb"`; do
> +	cp "$dtb" "$2/${dtb##*/}"
> +done
> --=20
> 1.8.4.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
