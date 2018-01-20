From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun9i: Enable USB support on Cubieboard4
Date: Sat, 20 Jan 2018 14:12:04 +0800
Message-ID: <CAGb2v66XNAHwAU1eosYjGKgYKkh9YiVEooE9e45RSVvPOvhYLg@mail.gmail.com>
References: <20171216205809.5485-1-kettenis@openbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171216205809.5485-1-kettenis-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mark Kettenis <kettenis-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Maxime,

On Sun, Dec 17, 2017 at 4:58 AM, Mark Kettenis <kettenis-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org> wrote:
> On the Cubieboard4 HCI0 is directly connected to a USB connector,
> and HCI2 is connected to a USB hub on the board.  HCI1 is available
> with HSIC throug 2 pins on the GPIO expansion header, but left
> disabled just like on the Optimus board.
>
> This patch also adds the VBUS regulators.
>
> Signed-off-by: Mark Kettenis <kettenis-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>

Any thoughts on this patch?

It's similar to what I sent a few years back:

    https://patchwork.kernel.org/patch/6359461/

ChenYu

> ---
>  arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 36 +++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
> index 4024639aa005..e38623265695 100644
> --- a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
> +++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
> @@ -74,6 +74,24 @@
>                 };
>         };
>
> +       reg_usb1_vbus: usb1-vbus {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usb2-drvbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               enable-active-high;
> +               gpio = <&pio 7 15 GPIO_ACTIVE_HIGH>; /* PH15 */
> +       };
> +
> +       reg_usb3_vbus: usb3-vbus {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usb1-drvbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               enable-active-high;
> +               gpio = <&pio 7 14 GPIO_ACTIVE_HIGH>; /* PH14 */
> +       };
> +
>         wifi_pwrseq: wifi-pwrseq {
>                 compatible = "mmc-pwrseq-simple";
>                 clocks = <&ac100_rtc 1>;
> @@ -83,6 +101,14 @@
>         };
>  };
>
> +&ehci0 {
> +       status = "okay";
> +};
> +
> +&ehci2 {
> +       status = "okay";
> +};
> +
>  &mmc0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&mmc0_pins>;
> @@ -408,3 +434,13 @@
>         pinctrl-0 = <&uart0_ph_pins>;
>         status = "okay";
>  };
> +
> +&usbphy1 {
> +       phy-supply = <&reg_usb1_vbus>;
> +       status = "okay";
> +};
> +
> +&usbphy3 {
> +       phy-supply = <&reg_usb3_vbus>;
> +       status = "okay";
> +};
> --
> 2.15.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
