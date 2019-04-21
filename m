From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx: Add mclk0 clock for SAI
Date: Sun, 21 Apr 2019 01:20:57 -0700
Message-ID: <20190421082038.GA8304@Asurada>
References: <20190420091239.3793-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190420091239.3793-1-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 20, 2019 at 09:12:52AM +0000, Daniel Baluta wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> SAI has 4 clock sources, which can be selected using MSEL
> bit of SAI TCR2 register.

I have a doubt at this statement. As far as I can understand,
this MSEL is probably used by its internal clock MUX, so it's
not really proving that SAI has 4 MCLK inputs. What I know is
that SAI block itself only has 3 MCLK inputs as we defined in
DT. It's just internally connects bus clock or MCLK1 to input0
of clock MUX's and connects MCLK[1-3] to input[1-3]. So adding
an MCLK0 here doesn't sound a right way to me. Unless someone
can justify for it, I think we should just fix it from driver
side.

Thanks
Nicolin

> 
> On imx6/7 mclk0 and mclk1 always point to the same clock
> source. Anyhow, this is no longer true for imx8.
> 
> For this reason, we need to add mclk0 and handle it
> in a generic way in SAI driver.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  arch/arm/boot/dts/imx6sx.dtsi | 6 ++++--
>  arch/arm/boot/dts/imx6ul.dtsi | 9 ++++++---
>  arch/arm/boot/dts/imx7s.dtsi  | 9 ++++++---
>  3 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
> index b16a123990a2..682207b5d868 100644
> --- a/arch/arm/boot/dts/imx6sx.dtsi
> +++ b/arch/arm/boot/dts/imx6sx.dtsi
> @@ -1071,9 +1071,10 @@
>  				reg = <0x021d4000 0x4000>;
>  				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6SX_CLK_SAI1_IPG>,
> +					 <&clks IMX6SX_CLK_SAI1>,
>  					 <&clks IMX6SX_CLK_SAI1>,
>  					 <&clks 0>, <&clks 0>;
> -				clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
>  				dma-names = "rx", "tx";
>  				dmas = <&sdma 31 24 0>, <&sdma 32 24 0>;
>  				status = "disabled";
> @@ -1090,9 +1091,10 @@
>  				reg = <0x021dc000 0x4000>;
>  				interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6SX_CLK_SAI2_IPG>,
> +					 <&clks IMX6SX_CLK_SAI2>,
>  					 <&clks IMX6SX_CLK_SAI2>,
>  					 <&clks 0>, <&clks 0>;
> -				clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
>  				dma-names = "rx", "tx";
>  				dmas = <&sdma 33 24 0>, <&sdma 34 24 0>;
>  				status = "disabled";
> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index bbf010c73336..e9691306f557 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -304,9 +304,10 @@
>  					reg = <0x02028000 0x4000>;
>  					interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>  					clocks = <&clks IMX6UL_CLK_SAI1_IPG>,
> +						 <&clks IMX6UL_CLK_SAI1>,
>  						 <&clks IMX6UL_CLK_SAI1>,
>  						 <&clks IMX6UL_CLK_DUMMY>, <&clks IMX6UL_CLK_DUMMY>;
> -					clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
>  					dmas = <&sdma 35 24 0>,
>  					       <&sdma 36 24 0>;
>  					dma-names = "rx", "tx";
> @@ -319,9 +320,10 @@
>  					reg = <0x0202c000 0x4000>;
>  					interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
>  					clocks = <&clks IMX6UL_CLK_SAI2_IPG>,
> +						 <&clks IMX6UL_CLK_SAI2>,
>  						 <&clks IMX6UL_CLK_SAI2>,
>  						 <&clks IMX6UL_CLK_DUMMY>, <&clks IMX6UL_CLK_DUMMY>;
> -					clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
>  					dmas = <&sdma 37 24 0>,
>  					       <&sdma 38 24 0>;
>  					dma-names = "rx", "tx";
> @@ -334,9 +336,10 @@
>  					reg = <0x02030000 0x4000>;
>  					interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>  					clocks = <&clks IMX6UL_CLK_SAI3_IPG>,
> +						 <&clks IMX6UL_CLK_SAI3>,
>  						 <&clks IMX6UL_CLK_SAI3>,
>  						 <&clks IMX6UL_CLK_DUMMY>, <&clks IMX6UL_CLK_DUMMY>;
> -					clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
>  					dmas = <&sdma 39 24 0>,
>  					       <&sdma 40 24 0>;
>  					dma-names = "rx", "tx";
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 0b01109ac0a9..693b88e37799 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -884,10 +884,11 @@
>  					reg = <0x308a0000 0x10000>;
>  					interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>  					clocks = <&clks IMX7D_SAI1_IPG_CLK>,
> +						 <&clks IMX7D_SAI1_ROOT_CLK>,
>  						 <&clks IMX7D_SAI1_ROOT_CLK>,
>  						 <&clks IMX7D_CLK_DUMMY>,
>  						 <&clks IMX7D_CLK_DUMMY>;
> -					clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
>  					dma-names = "rx", "tx";
>  					dmas = <&sdma 8 24 0>, <&sdma 9 24 0>;
>  					status = "disabled";
> @@ -899,10 +900,11 @@
>  					reg = <0x308b0000 0x10000>;
>  					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>  					clocks = <&clks IMX7D_SAI2_IPG_CLK>,
> +						 <&clks IMX7D_SAI2_ROOT_CLK>,
>  						 <&clks IMX7D_SAI2_ROOT_CLK>,
>  						 <&clks IMX7D_CLK_DUMMY>,
>  						 <&clks IMX7D_CLK_DUMMY>;
> -					clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
>  					dma-names = "rx", "tx";
>  					dmas = <&sdma 10 24 0>, <&sdma 11 24 0>;
>  					status = "disabled";
> @@ -914,10 +916,11 @@
>  					reg = <0x308c0000 0x10000>;
>  					interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
>  					clocks = <&clks IMX7D_SAI3_IPG_CLK>,
> +						 <&clks IMX7D_SAI3_ROOT_CLK>,
>  						 <&clks IMX7D_SAI3_ROOT_CLK>,
>  						 <&clks IMX7D_CLK_DUMMY>,
>  						 <&clks IMX7D_CLK_DUMMY>;
> -					clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
>  					dma-names = "rx", "tx";
>  					dmas = <&sdma 12 24 0>, <&sdma 13 24 0>;
>  					status = "disabled";
> -- 
> 2.17.1
> 
