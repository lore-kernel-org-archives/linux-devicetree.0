From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: ls208xa: add power monitor chip node
Date: Tue, 26 Dec 2017 17:15:21 +0800
Message-ID: <20171226091520.GQ23070@X250>
References: <20171225075723.31080-1-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171225075723.31080-1-andy.tang-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuantian Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 25, 2017 at 03:57:23PM +0800, Yuantian Tang wrote:
> Ina220 chip was used on ls208xardb platform to monitor power
> comsumption. So add ina220 chip node in dts to enable power
> consumption monitor feature.
> 
> Signed-off-by: Tang Yuantian <andy.tang-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
> index 9a1d0d2..a75132c 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
> @@ -95,6 +95,17 @@
>  			};
>  		};
>  
> +		i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x02>;

We generally have a newline between property list and child node.  I
fixed it up and applied the patch.

Shawn

> +			ina220@40 {
> +				compatible = "ti,ina220";
> +				reg = <0x40>;
> +				shunt-resistor = <500>;
> +			};
> +		};
> +
>  		i2c@3 {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -- 
> 1.7.1
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
