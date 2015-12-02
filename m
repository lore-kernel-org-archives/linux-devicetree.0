From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v4 5/5] ARM: BCM: Add SMP support for Broadcom 4708
Date: Wed, 2 Dec 2015 16:03:03 +0100
Message-ID: <565F0827.4000406@hauke-m.de>
References: <1448987049-17041-1-git-send-email-kapilh@broadcom.com>
 <1448987049-17041-6-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448987049-17041-6-git-send-email-kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/01/2015 05:24 PM, Kapil Hali wrote:
> From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> 
> Add SMP support for Broadcom's 4708 SoCs.
> 
> Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Acked-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
> Tested-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
> Signed-off-by: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm4708.dtsi | 2 ++
>  arch/arm/mach-bcm/Kconfig      | 1 +
>  arch/arm/mach-bcm/Makefile     | 3 +++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/bcm4708.dtsi b/arch/arm/boot/dts/bcm4708.dtsi
> index 31141e8..eed4dd1 100644
> --- a/arch/arm/boot/dts/bcm4708.dtsi
> +++ b/arch/arm/boot/dts/bcm4708.dtsi
> @@ -15,6 +15,7 @@
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		enable-method = "brcm,bcm-nsp-smp";
>  
>  		cpu@0 {
>  			device_type = "cpu";
> @@ -27,6 +28,7 @@
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a9";
>  			next-level-cache = <&L2>;
> +			secondary-boot-reg = <0xffff0400>;
>  			reg = <0x1>;
>  		};
>  	};
> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
> index 83765a0..e85246f 100644
> --- a/arch/arm/mach-bcm/Kconfig
> +++ b/arch/arm/mach-bcm/Kconfig
> @@ -54,6 +54,7 @@ config ARCH_BCM_NSP
>  config ARCH_BCM_5301X
>  	bool "Broadcom BCM470X / BCM5301X ARM SoC" if ARCH_MULTI_V7
>  	select ARCH_BCM_IPROC
> +	select HAVE_SMP
>  	help
>  	  Support for Broadcom BCM470X and BCM5301X SoCs with ARM CPU cores.
>  

When applying this patch please make sure it is correctly applied this
patch causes some problems here:

http://www.spinics.net/lists/arm-kernel/msg462137.html

> diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
> index 5193a25..7d66515 100644
> --- a/arch/arm/mach-bcm/Makefile
> +++ b/arch/arm/mach-bcm/Makefile
> @@ -43,6 +43,9 @@ obj-$(CONFIG_ARCH_BCM2835)	+= board_bcm2835.o
>  
>  # BCM5301X
>  obj-$(CONFIG_ARCH_BCM_5301X)	+= bcm_5301x.o
> +ifeq ($(CONFIG_ARCH_BCM_5301X),y)
> +obj-$(CONFIG_SMP)		+= platsmp.o
> +endif
>  
>  # BCM63XXx
>  ifeq ($(CONFIG_ARCH_BCM_63XX),y)
> 

I am getting this on a Northstar 1 / BCM4708:

[ 0.137634] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[ 0.143643] Setting up static identity map for 0x82a0 - 0x82d4
[ 0.189772] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[ 0.189861] Brought up 2 CPUs
[ 0.198845] SMP: Total of 2 processors activated (3188.32 BogoMIPS).
[ 0.205446] CPU: WARNING: CPU(s) started in wrong/inconsistent modes
(primary CPU mode 0x13)
[ 0.214167] CPU: This may indicate a broken bootloader or firmware.

I assume that this is correct and the bootloader is just broken, it uses
this bootloader: "CFE for Foxconn Router version: v1.0.14", I haven't
noticed any problems, so it is ok for me.

Hauke
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
