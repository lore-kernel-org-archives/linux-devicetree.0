From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: vf-colibri: add USB regulators
Date: Tue, 11 Nov 2014 22:12:30 +0800
Message-ID: <20141111141228.GB2704@dragon>
References: <1415106430-6271-1-git-send-email-stefan@agner.ch>
 <1415106430-6271-4-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415106430-6271-4-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 04, 2014 at 02:07:10PM +0100, Stefan Agner wrote:
> Add structure of USB supply logic. Especially, the USB hosts power
> enable regulator is needed to control VBUS supply.
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  arch/arm/boot/dts/vf-colibri-eval-v3.dtsi | 45 ++++++++++++++++++++++++++++++-
>  arch/arm/boot/dts/vf-colibri.dtsi         | 12 +++++++++
>  2 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
> index 80e8fbc..eb4ca50 100644
> --- a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
> +++ b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
> @@ -11,6 +11,41 @@
>  	chosen {
>  		bootargs = "console=ttyLP0,115200";
>  	};
> +
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		sys_5v0_reg: regulator@1 {
> +			compatible = "regulator-fixed";
> +			reg = <1>;

The numbering generally starts from 0 instead of 1.

> +			regulator-name = "5v0";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +		};
> +
> +		usbc_vbus_reg: regulator@2 {
> +			compatible = "regulator-fixed";
> +			reg = <2>;
> +			regulator-name = "usbc_vbus";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			vin-supply = <&sys_5v0_reg>;
> +		};
> +
> +		/* USBH_PEN */
> +		usbh_vbus_reg: regulator@3 {
> +			compatible = "regulator-fixed";
> +			reg = <3>;
> +			regulator-name = "usbh_vbus";
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			gpio = <&gpio3 19 GPIO_ACTIVE_LOW>;
> +			vin-supply = <&sys_5v0_reg>;
> +		};
> +	};
>  };
>  
>  &bl {
> @@ -51,4 +86,12 @@
>  
>  &uart2 {
>  	status = "okay";
> -};
> \ No newline at end of file
> +};
> +
> +&usbdev0 {
> +	vbus-supply = <&usbc_vbus_reg>;
> +};
> +
> +&usbh1 {
> +	vbus-supply = <&usbh_vbus_reg>;
> +};
> diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
> index 2371760..79ccfe2 100644
> --- a/arch/arm/boot/dts/vf-colibri.dtsi
> +++ b/arch/arm/boot/dts/vf-colibri.dtsi
> @@ -163,5 +163,17 @@
>  				VF610_PAD_PTD3__UART2_CTS		0x21a1
>  			>;
>  		};
> +
> +		pinctrl_usbh1_ext: gpio_usb_vbus {
> +			fsl,pins = <
> +				VF610_PAD_PTD4__GPIO_83			0x22ed

We used to know the GPIO usage by looking for the phandle reference to
the node.  But it doesn't work for VF610 case now.

I guess this is for usbh_vbus_reg usage?  It would be nice to have a
comment telling the usage of the GPIO.

> +			>;
> +		};
> +
> +		pinctrl_usbdev0_ext: gpio_usb_cdet {
> +			fsl,pins = <
> +				VF610_PAD_PTC29__GPIO_102		0x22ed

How is this one used?

Shawn

> +			>;
> +		};
>  	};
>  };
> -- 
> 2.1.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
