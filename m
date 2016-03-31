From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/18] ARM: dts: vf610: add modules required for PM
Date: Thu, 31 Mar 2016 16:34:41 +0800
Message-ID: <20160331083441.GY28207@tiger>
References: <1457576219-7971-1-git-send-email-stefan@agner.ch>
 <1457576219-7971-6-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457576219-7971-6-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sergeimir-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 09, 2016 at 06:16:46PM -0800, Stefan Agner wrote:
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  arch/arm/boot/dts/vfxxx.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
> index b038ea4..335f4e5 100644
> --- a/arch/arm/boot/dts/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/vfxxx.dtsi
> @@ -434,6 +434,11 @@
>  				reg = <0x40050000 0x400>;
>  			};
>  
> +			scsc: scsc@40052000 {
> +				compatible = "fsl,vf610-scsc";

These new compatible strings should be documented somewhere.

Shawn

> +				reg = <0x40052000 0x1000>;
> +			};
> +
>  			usbphy0: usbphy@40050800 {
>  				compatible = "fsl,vf610-usbphy";
>  				reg = <0x40050800 0x400>;
> @@ -480,6 +485,13 @@
>  				status = "disabled";
>  			};
>  
> +			wakeup: wkpu@4006a000 {
> +				compatible = "fsl,vf610-wkpu";
> +				reg = <0x4006a000 0x1000>;
> +				interrupts = <92 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks VF610_CLK_WKPU>;
> +			};
> +
>  			clks: ccm@4006b000 {
>  				compatible = "fsl,vf610-ccm";
>  				reg = <0x4006b000 0x1000>;
> @@ -600,6 +612,13 @@
>  				status = "disabled";
>  			};
>  
> +			ddrmc: ddrmc@400ae000 {
> +				compatible = "fsl,vf610-ddrmc";
> +				reg = <0x400ae000 0x400>;
> +				clocks = <&clks VF610_CLK_DDRMC>;
> +				clock-names = "ddrc";
> +			};
> +
>  			adc1: adc@400bb000 {
>  				compatible = "fsl,vf610-adc";
>  				reg = <0x400bb000 0x1000>;
> -- 
> 2.7.2
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
