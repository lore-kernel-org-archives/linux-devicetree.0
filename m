From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: at919260/at91sam9g20: fix SRAM device tree node
Date: Mon, 2 Mar 2015 10:53:59 +0100
Message-ID: <20150302095359.GJ4094@piout.net>
References: <1425276209-4899-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425276209-4899-1-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Wenyou,

I'd prefer fixing the sram lookup in pm.c. I'll propose something
however, I can't test on my side.

On 02/03/2015 at 14:03:29 +0800, Wenyou Yang wrote :
> Fix PM does not work on the at91sam9g20ek board
> --->8---
> at91_pm_sram_init: failed to find sram device!
> ---<8---
> 
> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/at91sam9260.dtsi |    9 +++++++--
>  arch/arm/boot/dts/at91sam9g20.dtsi |    9 +++++----
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/at91sam9260.dtsi
> index fff0ee6..d1eb27c 100644
> --- a/arch/arm/boot/dts/at91sam9260.dtsi
> +++ b/arch/arm/boot/dts/at91sam9260.dtsi
> @@ -69,9 +69,14 @@
>  		};
>  	};
>  
> -	sram0: sram@002ff000 {
> +	sram0: sram@00200000 {
>  		compatible = "mmio-sram";
> -		reg = <0x002ff000 0x2000>;
> +		reg = <0x00200000 0x1000>;
> +	};
> +
> +	sram1: sram@00300000 {
> +		compatible = "mmio-sram";
> +		reg = <0x00300000 0x1000>;
>  	};
>  
>  	ahb {
> diff --git a/arch/arm/boot/dts/at91sam9g20.dtsi b/arch/arm/boot/dts/at91sam9g20.dtsi
> index f593016..eb9a62d 100644
> --- a/arch/arm/boot/dts/at91sam9g20.dtsi
> +++ b/arch/arm/boot/dts/at91sam9g20.dtsi
> @@ -16,13 +16,14 @@
>  		reg = <0x20000000 0x08000000>;
>  	};
>  
> -	sram0: sram@002ff000 {
> -		status = "disabled";
> +	sram0: sram@00200000 {
> +		compatible = "mmio-sram";
> +		reg = <0x00200000 0x4000>;
>  	};
>  
> -	sram1: sram@002fc000 {
> +	sram1: sram@00300000 {
>  		compatible = "mmio-sram";
> -		reg = <0x002fc000 0x8000>;
> +		reg = <0x00300000 0x4000>;
>  	};
>  
>  	ahb {
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
