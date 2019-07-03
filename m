From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH v3] arm64: dts: imx8mq: Add sai3 and sai6 nodes
Date: Wed, 03 Jul 2019 07:00:46 -0600
Message-ID: <9ea5109f8645c3f27a9e350c5f9b2d4c@www.akkea.ca>
References: <20190702132353.18632-1-andradanciu1997@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702132353.18632-1-andradanciu1997@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andra Danciu <andradanciu1997@gmail.com>
Cc: shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, Anson.Huang@nxp.com, andrew.smirnov@gmail.com, ccaione@baylibre.com, agx@sigxcpu.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andra,

I tried this out on linux-next and I'm not able to record or play sound.

I also added the sai2 entry to test out our devkit and get a PCM timeout 
with that.

On 2019-07-02 07:23, Andra Danciu wrote:
> SAI3 and SAI6 nodes are used to connect to an external codec.
> They have 1 Tx and 1 Rx dataline.
> 
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
> ---
> Changes since v2:
> 	- removed multiple new lines
> 
> Changes since v1:
> 	- Added sai3 node because we need it to enable audio on pico-pi-8m
> 	- Added commit description
> 
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 29 
> +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index d09b808eff87..736cf81b695e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -278,6 +278,20 @@
>  			#size-cells = <1>;
>  			ranges = <0x30000000 0x30000000 0x400000>;
> 
> +			sai6: sai@30030000 {
> +				compatible = "fsl,imx8mq-sai",

I don't find this compatible string in sound/soc/fsl/fsl_sai.c. Aren't 
the registers at a different offset from "fsl,imx6sx-sai".

How is this supposed to work ?

Thanks
Angus

> +					"fsl,imx6sx-sai";
> +				reg = <0x30030000 0x10000>;
> +				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clk IMX8MQ_CLK_SAI6_IPG>,
> +					<&clk IMX8MQ_CLK_SAI6_ROOT>,
> +					<&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
> +				clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +				dmas = <&sdma2 4 24 0>, <&sdma2 5 24 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
>  			gpio1: gpio@30200000 {
>  				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
>  				reg = <0x30200000 0x10000>;
> @@ -728,6 +742,21 @@
>  				status = "disabled";
>  			};
> 
> +			sai3: sai@308c0000 {
> +				compatible = "fsl,imx8mq-sai",
> +					     "fsl,imx6sx-sai";
> +				reg = <0x308c0000 0x10000>;
> +				interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clk IMX8MQ_CLK_SAI3_IPG>,
> +					<&clk IMX8MQ_CLK_DUMMY>,
> +					<&clk IMX8MQ_CLK_SAI3_ROOT>,
> +					<&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
> +				clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +				dmas = <&sdma1 12 24 0>, <&sdma1 13 24 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
>  			i2c1: i2c@30a20000 {
>  				compatible = "fsl,imx8mq-i2c", "fsl,imx21-i2c";
>  				reg = <0x30a20000 0x10000>;
