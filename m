From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 11/21] ARM: dts: imx6qdl-apalis: Add sleep state to
 can interfaces
Date: Mon, 19 Aug 2019 13:27:55 +0200
Message-ID: <20190819112754.GU5999@X250>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
 <20190812142105.1995-12-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812142105.1995-12-philippe.schenker@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>, Fabio Estevam <festevam@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 02:21:31PM +0000, Philippe Schenker wrote:
> This patch prepares the devicetree for the new Ixora V1.2 where we are
> able to turn off the supply of the can transceiver. This implies to use
> a sleep state on transmission pins in order to prevent backfeeding.
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
> Changes in v4:
> - Add Marcel Ziswiler's Ack
> 
> Changes in v3: None
> Changes in v2:
> - Changed commit title to '...imx6qdl-apalis:...'
> 
>  arch/arm/boot/dts/imx6qdl-apalis.dtsi | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
> index 7c4ad541c3f5..59ed2e4a1fd1 100644
> --- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
> @@ -148,14 +148,16 @@
>  };
>  
>  &can1 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_flexcan1>;

This line doesn't need to be changed.

> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_flexcan1_default>;
> +	pinctrl-1 = <&pinctrl_flexcan1_sleep>;
>  	status = "disabled";
>  };
>  
>  &can2 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_flexcan2>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_flexcan2_default>;
> +	pinctrl-1 = <&pinctrl_flexcan2_sleep>;
>  	status = "disabled";
>  };
>  
> @@ -599,19 +601,32 @@
>  		>;
>  	};
>  
> -	pinctrl_flexcan1: flexcan1grp {

Ditto.  I take them as unnecessary changes.

Shawn

> +	pinctrl_flexcan1_default: flexcan1defgrp {
>  		fsl,pins = <
>  			MX6QDL_PAD_GPIO_7__FLEXCAN1_TX 0x1b0b0
>  			MX6QDL_PAD_GPIO_8__FLEXCAN1_RX 0x1b0b0
>  		>;
>  	};
>  
> -	pinctrl_flexcan2: flexcan2grp {
> +	pinctrl_flexcan1_sleep: flexcan1slpgrp {
> +		fsl,pins = <
> +			MX6QDL_PAD_GPIO_7__GPIO1_IO07 0x0
> +			MX6QDL_PAD_GPIO_8__GPIO1_IO08 0x0
> +		>;
> +	};
> +
> +	pinctrl_flexcan2_default: flexcan2defgrp {
>  		fsl,pins = <
>  			MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX 0x1b0b0
>  			MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX 0x1b0b0
>  		>;
>  	};
> +	pinctrl_flexcan2_sleep: flexcan2slpgrp {
> +		fsl,pins = <
> +			MX6QDL_PAD_KEY_COL4__GPIO4_IO14 0x0
> +			MX6QDL_PAD_KEY_ROW4__GPIO4_IO15 0x0
> +		>;
> +	};
>  
>  	pinctrl_gpio_bl_on: gpioblon {
>  		fsl,pins = <
> -- 
> 2.22.0
> 
