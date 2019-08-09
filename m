From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v3 05/21] ARM: dts: add recovery for I2C for iMX7
Date: Fri, 9 Aug 2019 14:45:38 +0000
Message-ID: <139d316e0dd0e6a3f95e94aade8df825c5a2486b.camel@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
 <20190807082556.5013-6-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190807082556.5013-6-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <898E8C007F07464AB0BA1BA7D1CAD1D4@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, Philippe Schenker <philippe.schenker@toradex.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.vokac@ysoft.com" <michal.vokac@ysoft.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, "linux-imx@nxp.com" <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2019-08-07 at 08:26 +0000, Philippe Schenker wrote:
> From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> 
> - add recovery mode for applicable i2c buses for
>   Colibri iMX7 module.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  arch/arm/boot/dts/imx7-colibri.dtsi | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi
> b/arch/arm/boot/dts/imx7-colibri.dtsi
> index a8d992f3e897..2480623c92ff 100644
> --- a/arch/arm/boot/dts/imx7-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri.dtsi
> @@ -140,8 +140,12 @@
>  
>  &i2c1 {
>  	clock-frequency = <100000>;
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "gpio";
>  	pinctrl-0 = <&pinctrl_i2c1 &pinctrl_i2c1_int>;
> +	pinctrl-1 = <&pinctrl_i2c1_recovery &pinctrl_i2c1_int>;
> +	scl-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
> +	sda-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
> +
>  	status = "okay";
>  
>  	codec: sgtl5000@a {
> @@ -242,8 +246,11 @@
>  
>  &i2c4 {
>  	clock-frequency = <100000>;
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "gpio";
>  	pinctrl-0 = <&pinctrl_i2c4>;
> +	pinctrl-1 = <&pinctrl_i2c4_recovery>;
> +	scl-gpios = <&gpio7 8 GPIO_ACTIVE_HIGH>;
> +	sda-gpios = <&gpio7 9 GPIO_ACTIVE_HIGH>;
>  };
>  
>  &lcdif {
> @@ -540,6 +547,13 @@
>  		>;
>  	};
>  
> +	pinctrl_i2c4_recovery: i2c4-recoverygrp {
> +		fsl,pins = <
> +			MX7D_PAD_ENET1_RGMII_TD2__GPIO7_IO8	0x400
> 0007f
> +			MX7D_PAD_ENET1_RGMII_TD3__GPIO7_IO9	0x400
> 0007f
> +		>;
> +	};
> +
>  	pinctrl_lcdif_dat: lcdif-dat-grp {
>  		fsl,pins = <
>  			MX7D_PAD_LCD_DATA00__LCD_DATA0		0x79
> @@ -740,6 +754,13 @@
>  		>;
>  	};
>  
> +	pinctrl_i2c1_recovery: i2c1-recoverygrp {
> +		fsl,pins = <
> +			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x400
> 0007f
> +			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x400
> 0007f
> +		>;
> +	};
> +
>  	pinctrl_cd_usdhc1: usdhc1-cd-grp {
>  		fsl,pins = <
>  			MX7D_PAD_LPSR_GPIO1_IO00__GPIO1_IO0	0x59
> /* CD */
