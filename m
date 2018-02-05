From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: imx6ull: add support for the esai interface
Date: Mon, 5 Feb 2018 00:07:16 -0600
Message-ID: <20180205020815.birkvwie45lcohjf@rob-hp-laptop>
References: <1516955032-21167-1-git-send-email-LW@KARO-electronics.de>
 <1516955032-21167-3-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1516955032-21167-3-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 26, 2018 at 09:23:51AM +0100, Lothar Waﬂmann wrote:
> The address space taken by the UART8 on the i.MX6UL is used for the
> ESAI interface on i.MX6ULL.
> 
> Since the ESAI unit on i.MX6ULL has two more bits in the TFCR register
> (TFIN, TAENB) it deserves to get its own compatible string, though the
> bits are currently not used by the driver.
> 
> Signed-off-by: Lothar Waﬂmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/sound/fsl,esai.txt |  4 ++--
>  arch/arm/boot/dts/imx6ull.dtsi                       | 17 +++++++++++++++++
>  sound/soc/fsl/fsl_esai.c                             |  1 +
>  3 files changed, 20 insertions(+), 2 deletions(-)

As mentioned, this really should be 3 patches. At least split out the 
dts file.

> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,esai.txt b/Documentation/devicetree/bindings/sound/fsl,esai.txt
> index cacd18b..4103f46 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,esai.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl,esai.txt
> @@ -7,8 +7,8 @@ other DSPs. It has up to six transmitters and four receivers.
>  
>  Required properties:
>  
> -  - compatible		: Compatible list, must contain "fsl,imx35-esai" or
> -			  "fsl,vf610-esai"
> +  - compatible		: Compatible list, must contain "fsl,imx35-esai",
> +			  "fsl,vf610-esai" or "fsl,imx6ull-esai"

Please reformat as on compatible per line.

>  
>    - reg			: Offset and length of the register set for the device.
>  
> diff --git a/arch/arm/boot/dts/imx6ull.dtsi b/arch/arm/boot/dts/imx6ull.dtsi
> index abc815f..8724fdb2 100644
> --- a/arch/arm/boot/dts/imx6ull.dtsi
> +++ b/arch/arm/boot/dts/imx6ull.dtsi
> @@ -47,6 +47,23 @@
>  		aips-bus@2000000 {
>  			spba-bus@2000000 {
>  				/delete-node/ serial@2024000;
> +
> +				esai: esai@2024000 {
> +					compatible = "fsl,imx6ull-esai", "fsl,imx35-esai";
> +					reg = <0x02024000 0x4000>;
> +					interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +					clocks = <&clks IMX6ULL_CLK_ESAI_IPG>,
> +						 <&clks IMX6ULL_CLK_ESAI_MEM>,
> +						 <&clks IMX6ULL_CLK_ESAI_EXTAL>,
> +						 <&clks IMX6ULL_CLK_ESAI_IPG>,
> +						 <&clks IMX6UL_CLK_SPBA>;
> +					clock-names = "core", "mem", "extal",
> +						      "fsys", "spba";
> +					dmas = <&sdma 0 21 0>,
> +					       <&sdma 47 21 0>;
> +					dma-names = "rx", "tx";
> +					status = "disabled";

Don't show status in examples.

> +				};
>  			};
>  		};
>  
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index cef79a1..5b6a53f 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -910,6 +910,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id fsl_esai_dt_ids[] = {
> +	{ .compatible = "fsl,imx6ull-esai", },
>  	{ .compatible = "fsl,imx35-esai", },
>  	{ .compatible = "fsl,vf610-esai", },
>  	{}
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
