From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: at91/dt: sama5d3 add gpio regulator for vmmc0
Date: Tue, 21 Apr 2015 17:14:41 +0200
Message-ID: <20150421151441.GE2245@odux.rfo.atmel.com>
References: <1427391505-29129-1-git-send-email-ben.dooks@codethink.co.uk>
 <1427391505-29129-4-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427391505-29129-4-git-send-email-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 26, 2015 at 05:38:25PM +0000, Ben Dooks wrote:
> Add gpio regulator for vmmc0 and attach the vmmc for it to the mmc0
> node on the SAM5D3 Xplained board. This will remove the following
> warning from the kernel:
> 
> atmel_mci f0000000.mmc: No vmmc regulator found
> 
> Note, atmel_defconfig will need gpio regulator support enabled if this
> is to be used properly.
> 
> Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> --
> CC: Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>
> CC: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> CC: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> CC: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> CC: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> CC: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> CC: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  arch/arm/boot/dts/at91-sama5d3_xplained.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> index 1eb150d..6b6ad5c 100644
> --- a/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> +++ b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> @@ -36,6 +36,7 @@
>  			mmc0: mmc@f0000000 {
>  				pinctrl-0 = <&pinctrl_mmc0_clk_cmd_dat0 &pinctrl_mmc0_dat1_3 &pinctrl_mmc0_dat4_7 &pinctrl_mmc0_cd>;
>  				status = "okay";
> +				vmmc-supply = <&vcc_mmc0_reg>;
>  				vqmmc-supply = <&vcc_3v3_reg>;
>  				slot@0 {
>  					reg = <0>;
> @@ -285,6 +286,14 @@
>  		};
>  	};
>  
> +	vcc_mmc0_reg: regulator@1 {
> +		compatible = "regualtor-gpio";

typo here and I think it is a fixed regulator and not a gpio one since
we can't configure voltage.

> +		gpio = <&pioE 2 GPIO_ACTIVE_LOW>;
> +		regulator-name = "mmc0-card-supply";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
>  	gpio_keys {
>  		compatible = "gpio-keys";
>  
> -- 
> 2.1.4
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
