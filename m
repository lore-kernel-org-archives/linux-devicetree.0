From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM-i.MX6Q-dts : Added USB_OTG Support
Date: Fri, 24 Jan 2014 11:50:05 +0000
Message-ID: <20140124115005.GG814@e106331-lin.cambridge.arm.com>
References: <1390555724-9779-1-git-send-email-ashutosh.s@phytec.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1390555724-9779-1-git-send-email-ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ashutosh singh <ashuleapyear-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ashutosh singh <ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 24, 2014 at 09:28:44AM +0000, Ashutosh singh wrote:
> This patch adds support for USB_OTG on Phytec phyFLEX-i.MX6 Quad module.
> 
> Signed-off-by: Ashutosh singh <ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6q-phytec-pbab01.dts  |    4 ++++
>  arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi |   22 ++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6q-phytec-pbab01.dts b/arch/arm/boot/dts/imx6q-phytec-pbab01.dts
> index 7d37ec6..39e69bd 100644
> --- a/arch/arm/boot/dts/imx6q-phytec-pbab01.dts
> +++ b/arch/arm/boot/dts/imx6q-phytec-pbab01.dts
> @@ -32,3 +32,7 @@
>  &usdhc3 {
>  	status = "okay";
>  };
> +
> +&usbotg {
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi b/arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi
> index 1a3b50d..dcb1d59 100644
> --- a/arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi
> +++ b/arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi
> @@ -18,6 +18,19 @@
>  	memory {
>  		reg = <0x10000000 0x80000000>;
>  	};
> +
> +	regulators {
> +		compatible = "simple-bus";

This is _not_ a simple bus. It doesn't have the required ranges
property.

Why do these need to be in a regulators container node? We don't group
dma controllers under a dmas node, or uarts under a uarts node.

> +
> +		reg_usb_otg_vbus: usb_otg_vbus {
> +			compatible = "regulator-fixed";
> +			regulator-name = "usb_otg_vbus";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			gpio = <&gpio4 15 0>;
> +			enable-active-low;
> +		};
> +	};
>  };

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
