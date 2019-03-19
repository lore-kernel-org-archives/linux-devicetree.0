From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v6 4/4] arm64: dts: imx8mq-evk: Enable audio codec wm8952
Date: Tue, 19 Mar 2019 22:41:37 +0800
Message-ID: <20190319144135.GB24315@dragon>
References: <20190308120141.3698-1-daniel.baluta@nxp.com>
 <20190308120141.3698-5-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190308120141.3698-5-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "baruch@tkos.co.il" <baruch@tkos.co.il>, Abel Vesa <abel.vesa@nxp.com>, "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "spencercw@gmail.com" <spencercw@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 08, 2019 at 12:02:28PM +0000, Daniel Baluta wrote:
> The main Audio DAC used on the EVK board is wm8952.
> The EVK provides the MCLK to wm8952.
> 
> Digital interface is SAI2 which includes three signals:
> SYNC_CLK, BCLK and DACDAT.
> 
> This patch sets:
> 	* SAI2 pinctrl configuration
> 	* clock hierarchy
> 	* wm8960 codec
> 
> Then uses simple-card machine driver to connect them
> into a sound card.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Please rebase to my for-next branch.

> ---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 46 ++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> index 54737bf1772f..09000ee34757 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> @@ -31,6 +31,33 @@
>  		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  	};
> +
> +	wm8524: audio-codec {
> +		#sound-dai-cells = <0>;
> +		compatible = "wlf,wm8524";
> +		wlf,mute-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	sound-wm8524 {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "wm8524-audio";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,frame-master = <&cpudai>;
> +		simple-audio-card,bitclock-master = <&cpudai>;
> +		simple-audio-card,widgets =
> +			"Line", "Left Line Out Jack",
> +			"Line", "Right Line Out Jack";
> +		simple-audio-card,routing =
> +			"Left Line Out Jack", "LINEVOUTL",
> +			"Right Line Out Jack", "LINEVOUTR";

Please have a newline between properties and child node ...

> +		cpudai: simple-audio-card,cpu {
> +			sound-dai = <&sai2>;
> +		};

... and between nodes as well.

> +		link_codec: simple-audio-card,codec {
> +			sound-dai = <&wm8524>;
> +			clocks = <&clk IMX8MQ_CLK_SAI2_ROOT>;
> +		};
> +	};
>  };
>  
>  &fec1 {
> @@ -52,6 +79,15 @@
>  	};
>  };
>  
> +&sai2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai2>;
> +	assigned-clocks = <&clk IMX8MQ_CLK_SAI2>;
> +	assigned-clock-parents = <&clk IMX8MQ_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates = <24576000>;
> +	status = "okay";
> +};
> +
>  &i2c1 {
>  	clock-frequency = <100000>;
>  	pinctrl-names = "default";
> @@ -223,6 +259,16 @@
>  		>;
>  	};
>  
> +	pinctrl_sai2: sai2grp {

Please try to keep pinctrl nodes sort alphabetically.

Shawn

> +		fsl,pins = <
> +			MX8MQ_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC     0xd6
> +			MX8MQ_IOMUXC_SAI2_TXC_SAI2_TX_BCLK      0xd6
> +			MX8MQ_IOMUXC_SAI2_MCLK_SAI2_MCLK        0xd6
> +			MX8MQ_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0    0xd6
> +			MX8MQ_IOMUXC_GPIO1_IO08_GPIO1_IO8       0xd6
> +		>;
> +	};
> +
>  	pinctrl_i2c1: i2c1grp {
>  		fsl,pins = <
>  			MX8MQ_IOMUXC_I2C1_SCL_I2C1_SCL			0x4000007f
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
