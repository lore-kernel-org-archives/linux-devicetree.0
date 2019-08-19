From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 07/21] ARM: dts: imx7-colibri: fix 1.8V/UHS support
Date: Mon, 19 Aug 2019 13:18:48 +0200
Message-ID: <20190819111847.GQ5999@X250>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
 <20190812142105.1995-8-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812142105.1995-8-philippe.schenker@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>, Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan.agner@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 02:21:25PM +0000, Philippe Schenker wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
> 
> Add pinmuxing and do not specify voltage restrictions for the usdhc
> instance available on the modules edge connector. This allows to use
> SD-cards with higher transfer modes if supported by the carrier board.
> 
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
> Changes in v4:
> - Add Marcel Ziswiler's Ack
> 
> Changes in v3:
> - Add new commit message from Stefan's proposal on ML
> 
> Changes in v2: None
> 
>  arch/arm/boot/dts/imx7-colibri.dtsi | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
> index 5347ed38acb2..c563bb821b5e 100644
> --- a/arch/arm/boot/dts/imx7-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri.dtsi
> @@ -326,7 +326,6 @@
>  &usdhc1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_usdhc1 &pinctrl_cd_usdhc1>;
> -	no-1-8-v;
>  	cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
>  	disable-wp;
>  	vqmmc-supply = <&reg_LDO2>;
> @@ -671,6 +670,28 @@
>  		>;
>  	};
>  
> +	pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {
> +		fsl,pins = <
> +			MX7D_PAD_SD1_CMD__SD1_CMD	0x5a
> +			MX7D_PAD_SD1_CLK__SD1_CLK	0x1a
> +			MX7D_PAD_SD1_DATA0__SD1_DATA0	0x5a
> +			MX7D_PAD_SD1_DATA1__SD1_DATA1	0x5a
> +			MX7D_PAD_SD1_DATA2__SD1_DATA2	0x5a
> +			MX7D_PAD_SD1_DATA3__SD1_DATA3	0x5a
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1grp_200mhz {

No reference to them from usdhc1 node?

Shawn

> +		fsl,pins = <
> +			MX7D_PAD_SD1_CMD__SD1_CMD	0x5b
> +			MX7D_PAD_SD1_CLK__SD1_CLK	0x1b
> +			MX7D_PAD_SD1_DATA0__SD1_DATA0	0x5b
> +			MX7D_PAD_SD1_DATA1__SD1_DATA1	0x5b
> +			MX7D_PAD_SD1_DATA2__SD1_DATA2	0x5b
> +			MX7D_PAD_SD1_DATA3__SD1_DATA3	0x5b
> +		>;
> +	};
> +
>  	pinctrl_usdhc3: usdhc3grp {
>  		fsl,pins = <
>  			MX7D_PAD_SD3_CMD__SD3_CMD		0x59
> -- 
> 2.22.0
> 
