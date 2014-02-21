From: Warner Losh <wlosh-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Fri, 21 Feb 2014 11:22:54 -0700
Message-ID: <7F6C2FEA-D330-4CFA-8DC2-554DB8908EC6@bsdimp.com>
References: <20140217180544.GU7862@titan.lakedaemon.net> <20140218155750.GS17250@pengutronix.de> <20140218181854.GB7862@titan.lakedaemon.net> <CAOesGMhvoB7vRf3H1kMaL5+MgZ2gJy=ZVNU0gsXVye9S4YGBOg@mail.gmail.com> <CAOesGMi8zJXhfj46CLB-_Kk2s4MY9da46DhMoCtRj=zSUiuOGA@mail.gmail.com> <CA+bK7J5+n2Se4cLv5WjR5B31ej7FdrGjPcjUULNrhb1UQ7=vmA@mail.gmail.com> <20140219090854.GW17250@pengutronix.de> <53051102.8060801@gmail.com> <CACxGe6uhA6FMR76WJGVEt44x6bQOC=woCkDr6ZUH30hTd8f2wA@mail.gmail.com> <53058B69.4040502@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53058B69.4040502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Feb 19, 2014, at 9:58 PM, Frank Rowand wrote:

> On 2/19/2014 1:15 PM, Grant Likely wrote:
>> On Wed, Feb 19, 2014 at 8:16 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 2/19/2014 1:08 AM, Sascha Hauer wrote:
>>>> On Tue, Feb 18, 2014 at 02:44:15PM -0800, Tim Bird wrote:
>>>>> I'm not in favor of separating the device tree information from the kernel.
>>>>> 
>>>>> If we switch, then whatever synchronization issues other projects
>>>>> are having now with synching with the device tree info from the kernel will
>>>>> just then become the problem of the kernel developers, who will then
>>>>> have to sync with the device tree info from another repository.  If the
>>>>> sync issues can't be solved now for them, why or how would it be solved
>>>>> post-separation for us?  (It sounds like a zero-sum game of pain transfer
>>>>> to me.)
>>>>> 
>>>>> I'm relatively unfamiliar with the arguments.  Can someone provide
>>>>> a brief list of reasons this is needed, and how the inconvenience to Linux
>>>>> kernel developers will be minimized, should it proceed?
>>>> 
>>> 
>>> 
>>>> One of the reasons for doing devicetrees is to separate the hardware
>>>> description from the code so that:
>>>> - Other OSes (and bootloaders) can use the same description to start on
>>>>  a given hardware
>>>> - A generic Kernel can be started on any hardware
>>>> - A hardware describes itself, makes itself more introspecitve so we can
>>>>  go away from very specialized kernels
>>> 
>>> Tim knows this ^^^^.  He was asking for the arguments for moving dts files
>>> out of the linux kernel source tree.
>> 
>> We've made the decision that devicetree bindings need to be treated as
>> ABI, but as long as the .dts files live in the kernel there will
>> always be the temptation to just tweak things in lock-step and nobody
>> will notice. Splitting the files out gives that extra push to think
>> about whether changes to a binding will backwards compatible with a
>> tree that doesn't have those changes because the chances are a lot
>> higher that someone will hit that combination.
>> 
>> The other argument is shared source between
>> BSD/U-Boot/Barebox/Linux/etc. Until we have a separate .dts repo there
>> is no good way to share the database of hardware descriptions.
> 
> We could provide an easy export (see below).  What do you think?

So what would the process be to get changes to those files upstream if you did this? It would make it marginally easier to USE, but once disconnected from the git world, a lot harder to track and fix.

Also, you should export the device tree docs too, since they are, in theory, a set. And honestly, the device tree doc files need more work than the .dts and .dtsi files.

Warner

> -Frank
> 
> 
> 
> Proof of concept: export devicetree source and header files
> 
> Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> 
> 
> ---
> Makefile                   |   27 	26 +	1 -	0 !
> scripts/Makefile.dtsexport |   19 	19 +	0 -	0 !
> scripts/dts.sh             |   11 	11 +	0 -	0 !
> 3 files changed, 56 insertions(+), 1 deletion(-)
> 
> Index: b/Makefile
> ===================================================================
> --- a/Makefile
> +++ b/Makefile
> @@ -234,6 +234,9 @@ endif
> # Where to locate arch specific headers
> hdr-arch  := $(SRCARCH)
> 
> +# Where to locate arch specific dts
> +dts-arch  := $(SRCARCH)
> +
> KCONFIG_CONFIG	?= .config
> export KCONFIG_CONFIG
> 
> @@ -463,7 +466,7 @@ version_h := include/generated/uapi/linu
> no-dot-config-targets := clean mrproper distclean \
> 			 cscope gtags TAGS tags help %docs check% coccicheck \
> 			 $(version_h) headers_% archheaders archscripts \
> -			 kernelversion %src-pkg
> +			 kernelversion %src-pkg dts_export%
> 
> config-targets := 0
> mixed-targets  := 0
> @@ -933,6 +936,26 @@ firmware_install: FORCE
> 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.fwinst obj=firmware __fw_install
> 
> # ---------------------------------------------------------------------------
> +# devicetree source and headers export
> +
> +#Default location for installed headers
> +export EXPORT_DTS_PATH = $(KBUILD_OUTPUT)/usr/dts
> +
> +PHONY += dts_export_headers
> +dts_export_headers: scripts_basic
> +	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.dtsexport obj=include/dt-bindings
> +	@echo $(KERNELRELEASE) >$(EXPORT_DTS_PATH)/linux_version
> +
> +PHONY += dts_export_all
> +dts_export_all: dts_export_headers
> +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/dts.sh
> +
> +PHONY += dts_export
> +dts_export:
> +	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.dtsexport obj=arch/$(dts-arch)/boot/dts
> +
> +
> +# ---------------------------------------------------------------------------
> # Kernel headers
> 
> #Default location for installed headers
> @@ -1160,6 +1183,8 @@ help:
> 	@echo  '  modules_prepare - Set up for building external modules'
> 	@echo  '  tags/TAGS	  - Generate tags file for editors'
> 	@echo  '  cscope	  - Generate cscope index'
> +	@echo  '  dts_export_all  - Export devicetree source and headers to EXPORT_DTS_PATH'
> +	@echo  '                    (default: $(EXPORT_DTS_PATH))'
> 	@echo  '  gtags           - Generate GNU GLOBAL index'
> 	@echo  '  kernelrelease	  - Output the release version string'
> 	@echo  '  kernelversion	  - Output the version stored in Makefile'
> Index: b/scripts/Makefile.dtsexport
> ===================================================================
> --- /dev/null
> +++ b/scripts/Makefile.dtsexport
> @@ -0,0 +1,19 @@
> +# ==========================================================================
> +# Exporting dts source and header files
> +#
> +# ==========================================================================
> +
> +srcpath := $(srctree)/$(obj)/*
> +dstpath := $(EXPORT_DTS_PATH)/$(obj)
> +
> +include scripts/Kbuild.include
> +
> +
> +quiet_cmd_install = EXPORT $(subst $(srctree)/,,$(srcpath))
> +      cmd_install = mkdir -p $(dstpath); cp -a $(srcpath) $(dstpath)
> +
> +
> +.PHONY: export
> +export:
> +	$(call cmd,install)
> +
> Index: b/scripts/dts.sh
> ===================================================================
> --- /dev/null
> +++ b/scripts/dts.sh
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +# Run dts_export command for all architectures
> +
> +# Stop on error
> +set -e
> +
> +for arch in $(ls ${srctree}/arch); do
> +	if [ -d ${srctree}/arch/${arch}/boot/dts ]; then
> +		make ARCH=${arch} dts_export
> +	fi
> +done
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
