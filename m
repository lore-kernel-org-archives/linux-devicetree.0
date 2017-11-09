From: James Hogan <james-IP01RNCDaiKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH 2/2] kbuild: handle dtb-y and CONFIG_OF_ALL_DTBS natively
 in Makefile.lib
Date: Thu, 9 Nov 2017 12:19:02 +0000
Message-ID: <CAAG0J99envT6gtM6tHdTvetrHr0itX1dexkuWSU=u1c5UTLE1A@mail.gmail.com>
References: <1509859853-27473-1-git-send-email-yamada.masahiro@socionext.com>
 <1509859853-27473-3-git-send-email-yamada.masahiro@socionext.com> <CAAG0J98rRS+Sw8k_87gmTqYdNWByk=9zWVbWnC348vd63H4N9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAG0J98rRS+Sw8k_87gmTqYdNWByk=9zWVbWnC348vd63H4N9w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

(resend using a working From address)

<yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> If CONFIG_OF_ALL_DTBS is enabled, "make ARCH=arm64 dtbs" compiles each
> DTB twice; one from arch/arm64/boot/dts/*/Makefile and the other from
> the dtb-$(CONFIG_OF_ALL_DTBS) line in arch/arm64/boot/dts/Makefile.
> It could be a race problem when building DTBS in parallel.
>
> Another minor issue is CONFIG_OF_ALL_DTBS covers only *.dts in vendor
> sub-directories, so this broke when Broadcom added one more hierarchy
> in arch/arm64/boot/dts/broadcom/<soc>/.
>
> One idea to fix the issues in a clean way is to move DTB handling
> to Kbuild core scripts.  Makefile.dtbinst already recognizes dtb-y
> natively, so it should not hurt to do so.
>
> Add $(dtb-y) to extra-y, and $(dtb-) as well if CONFIG_OF_ALL_DTBS is
> enabled.  All clutter things in Makefiles go away.
>
> As a bonus clean-up, I also removed dts-dirs.  Just use subdir-y
> directly to traverse sub-directories.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

 ...

> diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
> index 7891ffa..b2b0d88 100644
> --- a/arch/mips/boot/dts/Makefile
> +++ b/arch/mips/boot/dts/Makefile
> @@ -1,20 +1,14 @@
> -dts-dirs       += brcm
> -dts-dirs       += cavium-octeon
> -dts-dirs       += img
> -dts-dirs       += ingenic
> -dts-dirs       += lantiq
> -dts-dirs       += mti
> -dts-dirs       += netlogic
> -dts-dirs       += ni
> -dts-dirs       += pic32
> -dts-dirs       += qca
> -dts-dirs       += ralink
> -dts-dirs       += xilfpga
> +subdir-y       += brcm
> +subdir-y       += cavium-octeon
> +subdir-y       += img
> +subdir-y       += ingenic
> +subdir-y       += lantiq
> +subdir-y       += mti
> +subdir-y       += netlogic
> +subdir-y       += ni
> +subdir-y       += pic32
> +subdir-y       += qca
> +subdir-y       += ralink
> +subdir-y       += xilfpga
>
> -obj-y          := $(addsuffix /, $(dts-dirs))
> -
> -dtstree                := $(srctree)/$(src)
> -dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(foreach d,$(dts-dirs), $(wildcard $(dtstree)/$(d)/*.dts)))
> -
> -always         := $(dtb-y)
> -subdir-y       := $(dts-dirs)
> +obj-$(BUILTIN_DTB)     := $(addsuffix /, $(subdir-y))

I wonder if that should be CONFIG_BUILTIN_DTB?

This is causing failures in linux-next with MIPS
cavium_octeon_defconfig like below, and changing this line to
CONFIG_BUILTIN_DTB seems to fix it.

arch/mips/cavium-octeon/setup.o: In function `__octeon_is_model_runtime__':
/work/mips/linux/main/./arch/mips/include/asm/octeon/octeon-model.h:368:
undefined reference to `__dtb_octeon_3xxx_begin'
arch/mips/cavium-octeon/setup.o: In function `device_tree_init':
/work/mips/linux/main/arch/mips/cavium-octeon/setup.c:1188: undefined
reference to `__dtb_octeon_3xxx_begin'
/work/mips/linux/main/arch/mips/cavium-octeon/setup.c:1184: undefined
reference to `__dtb_octeon_68xx_begin'
/work/mips/linux/main/arch/mips/cavium-octeon/setup.c:1184: undefined
reference to `__dtb_octeon_68xx_begin'

Thanks
James


-- 
James Hogan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
