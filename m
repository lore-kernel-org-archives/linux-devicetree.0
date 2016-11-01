From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: dts: imx: add Boundary Devices Nitrogen6_SOM2
 support
Date: Tue, 1 Nov 2016 22:13:39 +0800
Message-ID: <20161101141338.GC9807@dragon>
References: <20161025211955.5345-1-gary.bisson@boundarydevices.com>
 <20161025211955.5345-2-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161025211955.5345-2-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 11:19:51PM +0200, Gary Bisson wrote:
> SoM based on i.MX6 Quad with 1GB of DDR3.
> 
> https://boundarydevices.com/product/nit6x-som-v2/
> 
> Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/imx6q-nitrogen6_som2.dts    |  53 ++
>  arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi | 770 ++++++++++++++++++++++++++
>  3 files changed, 824 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6q-nitrogen6_som2.dts
>  create mode 100644 arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi

<snip>

> +/ {
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +
> +	memory {
> +		reg = <0x10000000 0x40000000>;
> +	};
> +
> +	backlight_lcd: backlight_lcd {

Please use hyphen instead of underscore in node name.  Please check
through the patch series.

Shawn

> +		compatible = "pwm-backlight";
> +		pwms = <&pwm1 0 5000000>;
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <7>;
> +		power-supply = <&reg_3p3v>;
> +		status = "okay";
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
