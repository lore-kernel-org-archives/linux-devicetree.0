From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun7i: Enable USB DRC on Itead Ibox
Date: Tue, 9 Feb 2016 10:31:01 +0100
Message-ID: <56B9B1D5.7070002@redhat.com>
References: <1455010156-27754-1-git-send-email-codekipper@gmail.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBW7D422QKGQE3GJ5BYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1455010156-27754-1-git-send-email-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jo.

On 09-02-16 10:29, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Enable the otg/drc usb controller on the Itead Ibox device.
>
> Note this board has the otg-vbus connected directly to the 5v-dcc of
> the board, so there is no vbus0 regulator, nor vbus0-det.
>
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes since v1:
> - Added comment concerning vbus0 regulator and detection to commit message

Thanks patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Regards,

Hans


>
> ---
>   arch/arm/boot/dts/sun7i-a20-itead-ibox.dts     | 14 ++++++++++++++
>   arch/arm/boot/dts/sunxi-itead-core-common.dtsi |  9 +++++++++
>   2 files changed, 23 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
> index 661c21d..a512581 100644
> --- a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
> @@ -118,8 +118,22 @@
>   		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
>   		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>   	};
> +
> +	usb0_id_detect_pin: usb0_id_detect_pin@0 {
> +		allwinner,pins = "PH4";
> +		allwinner,function = "gpio_in";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +	};
>   };
>
>   &reg_ahci_5v {
>   	status = "okay";
>   };
> +
> +&usbphy {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb0_id_detect_pin>;
> +	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/sunxi-itead-core-common.dtsi b/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
> index 2565d51..d22eea3 100644
> --- a/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
> +++ b/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
> @@ -88,6 +88,10 @@
>   	status = "okay";
>   };
>
> +&otg_sram {
> +	status = "okay";
> +};
> +
>   #include "axp209.dtsi"
>
>   &reg_dcdc2 {
> @@ -129,6 +133,11 @@
>   	status = "okay";
>   };
>
> +&usb_otg {
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
>   &usbphy {
>   	usb1_vbus-supply = <&reg_usb1_vbus>;
>   	usb2_vbus-supply = <&reg_usb2_vbus>;
>
