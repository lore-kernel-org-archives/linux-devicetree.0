From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] ARM: BCM: Add SMP support for Broadcom 4708
Date: Thu, 15 Oct 2015 11:35:14 -0700
Message-ID: <561FF1E2.1010603@broadcom.com>
References: <1444844820-24290-1-git-send-email-kapilh@broadcom.com>
 <1444844820-24290-4-git-send-email-kapilh@broadcom.com>
 <561ED691.8080407@hauke-m.de> <20151014224003.GO15160@broadcom.com>
 <20151015154934.GD32089@broadcom.com> <20151015181409.GJ32089@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151015181409.GJ32089-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Looks good.

On 15-10-15 11:14 AM, Jon Mason wrote:
> ARM: BCM: Add SMP support for Broadcom 4708
>
> Add SMP support for Broadcom's 4708 SoCs.
>
> Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Acked-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>   arch/arm/boot/dts/bcm4708.dtsi | 2 ++
>   arch/arm/boot/dts/bcm94708.dts | 2 +-
>   arch/arm/mach-bcm/Kconfig      | 1 +
>   arch/arm/mach-bcm/Makefile     | 3 +++
>   4 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/bcm4708.dtsi b/arch/arm/boot/dts/bcm4708.dtsi
> index 31141e8..22a41df 100644
> --- a/arch/arm/boot/dts/bcm4708.dtsi
> +++ b/arch/arm/boot/dts/bcm4708.dtsi
> @@ -15,6 +15,8 @@
>   	cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> +		enable-method = "brcm,bcm-nsp-smp";
> +		secondary-boot-reg = <0xffff0400>;
>
>   		cpu@0 {
>   			device_type = "cpu";
> diff --git a/arch/arm/boot/dts/bcm94708.dts b/arch/arm/boot/dts/bcm94708.dts
> index f60bb1d..49682d6 100644
> --- a/arch/arm/boot/dts/bcm94708.dts
> +++ b/arch/arm/boot/dts/bcm94708.dts
> @@ -32,7 +32,7 @@
>
>   /dts-v1/;
>
> -#include "bcm5301x.dtsi"
> +#include "bcm4708.dtsi"
>
>   / {
>   	model = "NorthStar SVK (BCM94708)";
> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
> index 2e9dbb5..4fc8fa3 100644
> --- a/arch/arm/mach-bcm/Kconfig
> +++ b/arch/arm/mach-bcm/Kconfig
> @@ -54,6 +54,7 @@ config ARCH_BCM_NSP
>   config ARCH_BCM_5301X
>   	bool "Broadcom BCM470X / BCM5301X ARM SoC" if ARCH_MULTI_V7
>   	select ARCH_BCM_IPROC
> +	select HAVE_SMP
>   	help
>   	  Support for Broadcom BCM470X and BCM5301X SoCs with ARM CPU cores.
>
> diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
> index 36a4ca30..3ca1cf1 100644
> --- a/arch/arm/mach-bcm/Makefile
> +++ b/arch/arm/mach-bcm/Makefile
> @@ -43,6 +43,9 @@ obj-$(CONFIG_ARCH_BCM2835)	+= board_bcm2835.o
>
>   # BCM5301X
>   obj-$(CONFIG_ARCH_BCM_5301X)	+= bcm_5301x.o
> +ifeq ($(CONFIG_ARCH_BCM_5301X),y)
> +obj-$(CONFIG_SMP)		+= headsmp.o platsmp.o
> +endif
>
>   # BCM63XXx
>   ifeq ($(CONFIG_ARCH_BCM_63XX),y)
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
