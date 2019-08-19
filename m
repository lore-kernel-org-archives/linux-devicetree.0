From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 10/21] ARM: dts: imx6qdl-colibri: Add missing pin
 declaration in iomuxc
Date: Mon, 19 Aug 2019 13:25:40 +0200
Message-ID: <20190819112539.GT5999@X250>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
 <20190812142105.1995-11-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812142105.1995-11-philippe.schenker@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>, Fabio Estevam <festevam@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 02:21:29PM +0000, Philippe Schenker wrote:
> This adds the muxing for the optional pins usb-oc (overcurrent) and
> usb-id.
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
> Changes in v2: None
> 
>  arch/arm/boot/dts/imx6qdl-colibri.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
> index 019dda6b88ad..9a63debab0b5 100644
> --- a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
> @@ -615,6 +615,13 @@
>  		>;
>  	};
>  
> +	pinctrl_usbh_oc_1: usbh_oc-1 {

Please name it consistently in the way like:

	pinctrl_xxx: xxxgrp {
		...
	};

Also, it doesn't need to be separate patch but can just be added
together with the device referring to it.

Shawn

> +		fsl,pins = <
> +			/* USBH_OC */
> +			MX6QDL_PAD_EIM_D30__GPIO3_IO30		0x1b0b0
> +		>;
> +	};
> +
>  	pinctrl_spdif: spdifgrp {
>  		fsl,pins = <
>  			MX6QDL_PAD_GPIO_17__SPDIF_OUT 0x1b0b0
> @@ -681,6 +688,13 @@
>  		>;
>  	};
>  
> +	pinctrl_usbc_id_1: usbc_id-1 {
> +		fsl,pins = <
> +			/* USBC_ID */
> +			MX6QDL_PAD_NANDF_D2__GPIO2_IO02		0x1b0b0
> +		>;
> +	};
> +
>  	pinctrl_usdhc1: usdhc1grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_SD1_CMD__SD1_CMD	0x17071
> -- 
> 2.22.0
> 
