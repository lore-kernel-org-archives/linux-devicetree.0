From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Subject: Re: [PATCH v3 05/21] ARM: dts: add recovery for I2C for iMX7
Date: Mon, 12 Aug 2019 11:15:44 +0200
Message-ID: <cd0da6ed-6b59-be60-34b2-74eb603aa10d@ysoft.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
 <20190807082556.5013-6-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807082556.5013-6-philippe.schenker@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <festevam@gmail.com>
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 07. 08. 19 10:26, Philippe Schenker wrote:
> From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> 
> - add recovery mode for applicable i2c buses for
>    Colibri iMX7 module.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> ---
Hi Philippe,

since you are going to send v4 anyway I suggest you update the subject
to be consistent across all the patches.

	"ARM: dts: imx7-colibri: add recovery for I2C for iMX7"

fits better I think.

Thank you,
Michal

> 
> Changes in v3: None
> Changes in v2: None
> 
>   arch/arm/boot/dts/imx7-colibri.dtsi | 25 +++++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
> index a8d992f3e897..2480623c92ff 100644
> --- a/arch/arm/boot/dts/imx7-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri.dtsi
> @@ -140,8 +140,12 @@
>   
>   &i2c1 {
>   	clock-frequency = <100000>;
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "gpio";
>   	pinctrl-0 = <&pinctrl_i2c1 &pinctrl_i2c1_int>;
> +	pinctrl-1 = <&pinctrl_i2c1_recovery &pinctrl_i2c1_int>;
> +	scl-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
> +	sda-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
> +
>   	status = "okay";
>   
>   	codec: sgtl5000@a {
> @@ -242,8 +246,11 @@
>   
>   &i2c4 {
>   	clock-frequency = <100000>;
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "gpio";
>   	pinctrl-0 = <&pinctrl_i2c4>;
> +	pinctrl-1 = <&pinctrl_i2c4_recovery>;
> +	scl-gpios = <&gpio7 8 GPIO_ACTIVE_HIGH>;
> +	sda-gpios = <&gpio7 9 GPIO_ACTIVE_HIGH>;
>   };
>   
>   &lcdif {
> @@ -540,6 +547,13 @@
>   		>;
>   	};
>   
> +	pinctrl_i2c4_recovery: i2c4-recoverygrp {
> +		fsl,pins = <
> +			MX7D_PAD_ENET1_RGMII_TD2__GPIO7_IO8	0x4000007f
> +			MX7D_PAD_ENET1_RGMII_TD3__GPIO7_IO9	0x4000007f
> +		>;
> +	};
> +
>   	pinctrl_lcdif_dat: lcdif-dat-grp {
>   		fsl,pins = <
>   			MX7D_PAD_LCD_DATA00__LCD_DATA0		0x79
> @@ -740,6 +754,13 @@
>   		>;
>   	};
>   
> +	pinctrl_i2c1_recovery: i2c1-recoverygrp {
> +		fsl,pins = <
> +			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x4000007f
> +			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x4000007f
> +		>;
> +	};
> +
>   	pinctrl_cd_usdhc1: usdhc1-cd-grp {
>   		fsl,pins = <
>   			MX7D_PAD_LPSR_GPIO1_IO00__GPIO1_IO0	0x59 /* CD */
> 
