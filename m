From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 15/20] ARM: dts: sun7i: Enable USB DRC on Bananapi (BROKEN!)
Date: Fri, 05 Jun 2015 21:15:09 +0200
Message-ID: <5571F53D.1090104@redhat.com>
References: <1433530943-12599-1-git-send-email-hdegoede@redhat.com> <1433530943-12599-16-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433530943-12599-16-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 05-06-15 21:02, Hans de Goede wrote:
> Enable the otg/drc usb controller on the Bananapi.
>
> This is based on the fex file settings which claim that vbus-det is
> PH5, but this does not work and the schematic shows that it is actually
> connected to gpio1 of the axp209, so we cannot add otg support for the
> bananapi until we get support for the axp209 gpio pins in the kernel.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

This one obviously should not have been part of this set, please
ignore this one.

Thanks,

Hans


> ---
>   arch/arm/boot/dts/sun7i-a20-bananapi.dts | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> index 9f7b472..ce318bf 100644
> --- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> @@ -159,7 +159,25 @@
>   	status = "okay";
>   };
>
> +&otg_sram {
> +	status = "okay";
> +};
> +
>   &pio {
> +	usb0_id_detect_pin: usb0_id_detect_pin@0 {
> +		allwinner,pins = "PH4";
> +		allwinner,function = "gpio_in";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
> +	};
> +
> +	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
> +		allwinner,pins = "PH5";
> +		allwinner,function = "gpio_in";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
> +	};
> +
>   	mmc0_cd_pin_bananapi: mmc0_cd_pin@0 {
>   		allwinner,pins = "PH10";
>   		allwinner,function = "gpio_in";
> @@ -182,6 +200,10 @@
>   	};
>   };
>
> +&reg_usb0_vbus {
> +	status = "okay";
> +};
> +
>   &reg_usb1_vbus {
>   	status = "okay";
>   };
> @@ -216,7 +238,17 @@
>   	status = "okay";
>   };
>
> +&usb_otg {
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
>   &usbphy {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
> +	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
> +	usb0_vbus_det-gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
> +	usb0_vbus-supply = <&reg_usb0_vbus>;
>   	usb1_vbus-supply = <&reg_usb1_vbus>;
>   	usb2_vbus-supply = <&reg_usb2_vbus>;
>   	status = "okay";
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
