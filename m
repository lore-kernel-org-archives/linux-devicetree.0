From: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: imx6ull: fix the i.MX6ULL UART8
 configuration
Date: Fri, 26 Jan 2018 16:57:31 +0800
Message-ID: <20180126085731.GB14058@b29396-OptiPlex-7040>
References: <1516955032-21167-1-git-send-email-LW@KARO-electronics.de>
 <1516955032-21167-2-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1516955032-21167-2-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-imx-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 26, 2018 at 09:23:50AM +0100, Lothar Waﬂmann wrote:
> UART8 on i.MX6ULL is not located on the SPBA bus like on i.MX6UL but
> on the (otherwise unused) AIPS-3 bus.
> Create the appropriate AIPS-3 bus configuration and move the uart8
> definition where it belongs.
> 
> Signed-off-by: Lothar Waﬂmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>

Stefan seemed already fixed this.

See:
https://patchwork.kernel.org/patch/10156125/

Regards
Dong Aisheng

> ---
>  arch/arm/boot/dts/imx6ull.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6ull.dtsi b/arch/arm/boot/dts/imx6ull.dtsi
> index 0c18291..abc815f 100644
> --- a/arch/arm/boot/dts/imx6ull.dtsi
> +++ b/arch/arm/boot/dts/imx6ull.dtsi
> @@ -41,3 +41,32 @@
>  
>  #include "imx6ul.dtsi"
>  #include "imx6ull-pinfunc.h"
> +
> +/ {
> +	soc {
> +		aips-bus@2000000 {
> +			spba-bus@2000000 {
> +				/delete-node/ serial@2024000;
> +			};
> +		};
> +
> +		aips3: aips-bus@2200000 {
> +			compatible = "fsl,aips-bus", "simple-bus";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <0x02200000 0x100000>;
> +			ranges;
> +
> +			uart8: serial@2288000 {
> +				compatible = "fsl,imx6ul-uart",
> +					     "fsl,imx6q-uart";
> +				reg = <0x02288000 0x4000>;
> +				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks IMX6UL_CLK_IPG>,
> +					 <&clks IMX6UL_CLK_UART8_SERIAL>;
> +				clock-names = "ipg", "per";
> +				status = "disabled";
> +			};
> +		};
> +	};
> +};
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
