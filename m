From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vfxxx: Include support for dspi[23]
 functionality.
Date: Wed, 18 Nov 2015 22:41:45 -0800
Message-ID: <eefcbf4a3e7d3477546b3b8a97eb9c22@agner.ch>
References: <1447905280-5172-2-git-send-email-cory.tusar@pid1solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447905280-5172-2-git-send-email-cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org
List-Id: devicetree@vger.kernel.org

Verified too, looks good to me.

Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

--
Stefan

On 2015-11-18 19:54, Cory Tusar wrote:
> Extend the existing Vybrid DSPI devicetree implementation to also
> describe the dspi2 and dspi3 functional blocks.
> 
> Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
> ---
>  arch/arm/boot/dts/vfxxx.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
> index 1cca43a..858e60a 100644
> --- a/arch/arm/boot/dts/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/vfxxx.dtsi
> @@ -453,6 +453,30 @@
>  				status = "disabled";
>  			};
>  
> +			dspi2: dspi2@400ac000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,vf610-dspi";
> +				reg = <0x400ac000 0x1000>;
> +				interrupts = <69 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks VF610_CLK_DSPI2>;
> +				clock-names = "dspi";
> +				spi-num-chipselects = <2>;
> +				status = "disabled";
> +			};
> +
> +			dspi3: dspi3@400ad000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,vf610-dspi";
> +				reg = <0x400ad000 0x1000>;
> +				interrupts = <70 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks VF610_CLK_DSPI3>;
> +				clock-names = "dspi";
> +				spi-num-chipselects = <2>;
> +				status = "disabled";
> +			};
> +
>  			adc1: adc@400bb000 {
>  				compatible = "fsl,vf610-adc";
>  				reg = <0x400bb000 0x1000>;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
