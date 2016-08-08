From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx: ventana: add RS485 txen gpio support
Date: Mon, 8 Aug 2016 16:40:29 +0800
Message-ID: <20160808084029.GE4678@tiger>
References: <1467207504-5218-1-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467207504-5218-1-git-send-email-tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 29, 2016 at 06:38:24AM -0700, Tim Harvey wrote:
> The GW54xx, GW53xx, and GW52xx all have an RS485 transceiver that uses an
> IMX GPIO for the TX enable of the transceiver. Declare this properly.
> 
> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6qdl-gw52xx.dtsi | 3 +++
>  arch/arm/boot/dts/imx6qdl-gw53xx.dtsi | 3 +++
>  arch/arm/boot/dts/imx6qdl-gw54xx.dtsi | 3 +++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
> index 8bf1020..25ed57d 100644
> --- a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
> @@ -315,6 +315,8 @@
>  &uart1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_uart1>;
> +	fsl,uart-has-rtscts;

This vendor specific property is deprecated.  Please use generic
uart-has-rtscts instead.

> +	rts-gpio = <&gpio7 1 GPIO_ACTIVE_HIGH>;

I cannot find this property in any bindings doc.  What I found is
rts-gpios in bindings/serial/serial.txt.  Also, I'm not sure how this
property is supported by IMX driver.

Shawn

>  	status = "okay";
>  };
>  
> @@ -493,6 +495,7 @@
>  			fsl,pins = <
>  				MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
>  				MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
> +				MX6QDL_PAD_SD3_DAT4__GPIO7_IO01		0x4001b0b1 /* TEN */
>  			>;
>  		};
>  
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
