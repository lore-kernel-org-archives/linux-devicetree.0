From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v6 1/4] arm64: dts: imx8mq: Add SDMA nodes
Date: Tue, 19 Mar 2019 22:31:42 +0800
Message-ID: <20190319143139.GA24315@dragon>
References: <20190308120141.3698-1-daniel.baluta@nxp.com>
 <20190308120141.3698-2-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190308120141.3698-2-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "baruch@tkos.co.il" <baruch@tkos.co.il>, Anson Huang <anson.huang@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "spencercw@gmail.com" <spencercw@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "festevam@gmail.com" <festevam@gmail.com>, s.hau
List-Id: devicetree@vger.kernel.org

On Fri, Mar 08, 2019 at 12:02:22PM +0000, Daniel Baluta wrote:
> SDMA1 is part of AIPS-3 region and SDMA2 is part
> of AIPS-1 region.
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by tag should go after your SoB, since that's the sequence of
how they come. 

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> [initial submit in i.MX internal tree]
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> [adaptation for linux-next]

I would see these notes in commit log or even just cover letter.

Shawn

> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 9155bd4784eb..9d48450453fb 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -234,6 +234,17 @@
>  				status = "disabled";
>  			};
>  
> +			sdma2: sdma@302c0000 {
> +				compatible = "fsl,imx8mq-sdma","fsl,imx7d-sdma";
> +				reg = <0x302c0000 0x10000>;
> +				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clk IMX8MQ_CLK_SDMA2_ROOT>,
> +					 <&clk IMX8MQ_CLK_SDMA2_ROOT>;
> +				clock-names = "ipg", "ahb";
> +				#dma-cells = <3>;
> +				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> +			};
> +
>  			iomuxc: iomuxc@30330000 {
>  				compatible = "fsl,imx8mq-iomuxc";
>  				reg = <0x30330000 0x10000>;
> @@ -575,6 +586,17 @@
>  				status = "disabled";
>  			};
>  
> +			sdma1: sdma@30bd0000 {
> +				compatible = "fsl, imx8mq-sdma","fsl,imx7d-sdma";
> +				reg = <0x30bd0000 0x10000>;
> +				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clk IMX8MQ_CLK_SDMA1_ROOT>,
> +					 <&clk IMX8MQ_CLK_SDMA1_ROOT>;
> +				clock-names = "ipg", "ahb";
> +				#dma-cells = <3>;
> +				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> +			};
> +
>  			fec1: ethernet@30be0000 {
>  				compatible = "fsl,imx8mq-fec", "fsl,imx6sx-fec";
>  				reg = <0x30be0000 0x10000>;
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
