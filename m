From: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: at91: sama5d2 Xplained: Describe the SD card
 power supply
Date: Wed, 6 Sep 2017 08:41:16 +0200
Message-ID: <20170906064116.kr4rbq6o5jly7oo5@rfolt0960.corp.atmel.com>
References: <20170905101805.15127-1-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170905101805.15127-1-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 05, 2017 at 12:18:05PM +0200, Romain Izard wrote:
> As the SAMA5D2 SDHCI controller works with an external power supply,
> describe the power supply for the SD card slot. This makes it possible
> to use mmc power sequences, in the case of external SDIO modules.
> 
> Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

> ---
>  arch/arm/boot/dts/at91-sama5d2_xplained.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
> index 2e2c3d1a1fa2..e0b0292ef132 100644
> --- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
> +++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
> @@ -103,6 +103,8 @@
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_sdmmc1_default>;
>  			status = "okay"; /* conflict with qspi0 */
> +			vqmmc-supply = <&vdd_3v3_reg>;
> +			vmmc-supply = <&vdd_3v3_reg>;
>  		};
>  
>  		apb {
> -- 
> 2.11.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
