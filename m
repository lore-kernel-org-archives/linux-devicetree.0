From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6ul: add RTC support
Date: Thu, 6 Aug 2015 16:06:24 +0800
Message-ID: <20150806080623.GD9847@tiger>
References: <1438703698-2445-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438703698-2445-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 04, 2015 at 11:54:58PM +0800, Anson Huang wrote:
> Add RTC support for i.MX6UL.
> 
> Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Applied with a minor change below.

> ---
>  arch/arm/boot/dts/imx6ul.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index af865d3..b6c6c31 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -393,6 +393,18 @@
>  				fsl,anatop = <&anatop>;
>  			};
>  
> +			snvs: snvs@020cc000 {
> +				compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
> +				reg = <0x020cc000 0x4000>;
> +
> +				snvs_rtc: snvs-rtc-lp {
> +					compatible = "fsl,sec-v4.0-mon-rtc-lp";
> +					regmap = <&snvs>;
> +					offset = <0x34>;
> +					interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;

I wrapped the line as below.

	interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
		     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;

Shawn

> +				};
> +			};
> +
>  			epit1: epit@020d0000 {
>  				reg = <0x020d0000 0x4000>;
>  				interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
