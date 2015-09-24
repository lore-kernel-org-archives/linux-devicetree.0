From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun4i: Enable USB DRC on the
 Marsboard A10
Date: Thu, 24 Sep 2015 12:02:31 +0200
Message-ID: <5603CA37.8000604@redhat.com>
References: <1443080026-4011-1-git-send-email-mamlinav@gmail.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBO4UR6YAKGQELUIMK2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1443080026-4011-1-git-send-email-mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 24-09-15 09:33, Aleksei Mamlin wrote:
> Enable the otg/drc usb controller on the Marsboard A10.
> Similar to Cubieboard, the 5V of the otg is directly connected to the
> general 5V, so we only use the id pin.
>
> Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Regards,

Hans


> ---
>   arch/arm/boot/dts/sun4i-a10-marsboard.dts | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun4i-a10-marsboard.dts b/arch/arm/boot/dts/sun4i-a10-marsboard.dts
> index 02158bc..9a012db 100644
> --- a/arch/arm/boot/dts/sun4i-a10-marsboard.dts
> +++ b/arch/arm/boot/dts/sun4i-a10-marsboard.dts
> @@ -154,6 +154,10 @@
>   	status = "okay";
>   };
>
> +&otg_sram {
> +	status = "okay";
> +};
> +
>   &pio {
>   	led_pins_marsboard: led_pins@0 {
>   		allwinner,pins = "PB5", "PB6", "PB7", "PB8";
> @@ -161,6 +165,13 @@
>   		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>   		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>   	};
> +
> +	usb0_id_detect_pin: usb0_id_detect_pin@0 {
> +		allwinner,pins = "PH4";
> +		allwinner,function = "gpio_in";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
> +	};
>   };
>
>   &reg_usb1_vbus {
> @@ -184,7 +195,15 @@
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
> +	pinctrl-0 = <&usb0_id_detect_pin>;
> +	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
>   	usb1_vbus-supply = <&reg_usb1_vbus>;
>   	usb2_vbus-supply = <&reg_usb2_vbus>;
>   	status = "okay";
>
