From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH v2 12/13] powerpc: enable building of all dtbs
Date: Mon, 12 Oct 2015 21:26:21 +1100
Message-ID: <1444645581.31951.2.camel@ellerman.id.au>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
	 <1444326827-3565-13-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444326827-3565-13-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-10-08 at 12:53 -0500, Rob Herring wrote:
> Enable building all dtb files when CONFIG_OF_ALL_DTBS is enabled. The dtbs
> are not really dependent on a platform being enabled or any other kernel
> config, so for testing coverage it is convenient to build all of the dtbs.
> This builds all dts files in the tree, not just targets listed.
> 
> Supporting this requires adding 'dtbs' make target which was not yet
> supported on powerpc.

I'm not entirely clear why we want this? It just means we can test build all
the dts regardless of what kernel config we are building?

Have you tested the powerpc build with this applied or do you want me to?

> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index b9b4af2..0ec35ff 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -273,6 +273,11 @@ bootwrapper_install:
>  %.dtb: scripts
>  	$(Q)$(MAKE) ARCH=ppc64 $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
>  
> +PHONY += dtbs
> +
> +dtbs: prepare scripts
> +	$(Q)$(MAKE) ARCH=ppc64 $(build)=$(boot)/dts

The ARCH should be powerpc, I guess you just copied the one above.

> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 4eec430..381df1a 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -402,7 +402,7 @@ zInstall: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
>  clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
>  	zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
>  	zImage.miboot zImage.pmac zImage.pseries \
> -	zImage.maple simpleImage.* otheros.bld *.dtb
> +	zImage.maple simpleImage.* otheros.bld

This looks like we used to clean *.dtb in the current dir but now we don't? But
I'm probably just not understanding how clean-files works.

> @@ -410,6 +410,9 @@ clean-kernel += $(addsuffix .gz,$(clean-kernel))
>  # If not absolute clean-files are relative to $(obj).
>  clean-files += $(addprefix $(objtree)/, $(clean-kernel))
>  
> +# Let clean descend into subdirs
> +subdir- := dts
> +
>  WRAPPER_OBJDIR := /usr/lib/kernel-wrapper
>  WRAPPER_DTSDIR := /usr/lib/kernel-wrapper/dts
>  WRAPPER_BINDIR := /usr/sbin
> diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
> new file mode 100644
> index 0000000..f121775
> --- /dev/null
> +++ b/arch/powerpc/boot/dts/Makefile
> @@ -0,0 +1,5 @@
> +dtstree		:= $(srctree)/$(src)
> +dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
> +
> +always		:= $(dtb-y)

How/is that different from just doing the more normal:

obj-$(CONFIG_OF_ALL_DTBS) := ...

?

cheers


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
