From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/9] ARM: dts: imx7d: add flexcan support
Date: Sat, 2 Apr 2016 09:31:18 +0800
Message-ID: <20160402013118.GJ18833@tiger>
References: <1458037826-19375-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458050668-26748-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458050668-26748-3-git-send-email-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458050668-26748-3-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2016 at 03:04:21PM +0100, Gary Bisson wrote:
> Add the device nodes for the i.MX7 FlexCAN buses.
> 
> Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
> ---
> 
> Changelog v1 -> v2:
> - none
> 
> ---
>  arch/arm/boot/dts/imx7d.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> index a768716..c5e47a4 100644
> --- a/arch/arm/boot/dts/imx7d.dtsi
> +++ b/arch/arm/boot/dts/imx7d.dtsi
> @@ -930,6 +930,28 @@
>  				fsl,num-rx-queues=<3>;
>  				status = "disabled";
>  			};
> +
> +			flexcan1: can@30a00000 {
> +				compatible = "fsl,imx7d-flexcan", "fsl,imx6q-flexcan";
> +				reg = <0x30a00000 0x10000>;
> +				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks IMX7D_CLK_DUMMY>,
> +					<&clks IMX7D_CAN1_ROOT_CLK>;
> +				clock-names = "ipg", "per";
> +				stop-mode = <&gpr 0x10 1 0x10 17>;

Is this property documented anywhere, or even supported by mainline
kernel?

Shawn

> +				status = "disabled";
> +			};
> +
> +			flexcan2: can@30a10000 {
> +				compatible = "fsl,imx7d-flexcan", "fsl,imx6q-flexcan";
> +				reg = <0x30a10000 0x10000>;
> +				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks IMX7D_CLK_DUMMY>,
> +					<&clks IMX7D_CAN2_ROOT_CLK>;
> +				clock-names = "ipg", "per";
> +				stop-mode = <&gpr 0x10 2 0x10 18>;
> +				status = "disabled";
> +			};
>  		};
>  	};
>  };
> -- 
> 2.7.0
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
