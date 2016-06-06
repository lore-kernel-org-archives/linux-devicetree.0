From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun6i: Add pmic / regulator nodes to Mele
 A1000G quad dts
Date: Mon, 6 Jun 2016 15:12:52 +0800
Message-ID: <CAGb2v67Jo6MO7bp4JdV4hXrB4T60z4=ROkvAvE1i7dhAXk_UtQ@mail.gmail.com>
References: <1465133880-22921-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465133880-22921-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 5, 2016 at 9:37 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Add pmic / regulator nodes to Mele A1000G quad dts.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts | 88 +++++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts b/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts
> index e063dab..9782113 100644
> --- a/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts
> +++ b/arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts
> @@ -72,6 +72,10 @@
>         };
>  };
>
> +&cpu0 {
> +       cpu-supply = <&reg_dcdc3>;
> +};
> +
>  &ehci0 {
>         status = "okay";
>  };
> @@ -85,6 +89,7 @@
>         pinctrl-0 = <&gmac_pins_mii_a>;
>         phy = <&phy1>;
>         phy-mode = "mii";
> +       phy-supply = <&reg_dldo1>;
>         status = "okay";
>
>         phy1: ethernet-phy@1 {
> @@ -101,13 +106,26 @@
>  &mmc0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_m9>;
> -       vmmc-supply = <&reg_vcc3v3>;
> +       vmmc-supply = <&reg_dcdc1>;
>         bus-width = <4>;
>         cd-gpios = <&pio 7 22 GPIO_ACTIVE_HIGH>; /* PH22 */
>         cd-inverted;
>         status = "okay";
>  };
>
> +&p2wi {
> +       status = "okay";
> +
> +       axp22x: pmic@68 {
> +               compatible = "x-powers,axp221";
> +               reg = <0x68>;
> +               interrupt-parent = <&nmi_intc>;
> +               interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +       };
> +};
> +
> +#include "axp22x.dtsi"
> +
>  &pio {
>         led_pins_m9: led_pins@0 {
>                 allwinner,pins = "PH13";
> @@ -131,6 +149,73 @@
>         };
>  };
>
> +&reg_aldo1 {
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-wifi";
> +};
> +
> +&reg_aldo3 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <2700000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "avcc";
> +};
> +
> +&reg_dc5ldo {
> +       regulator-always-on;
> +       regulator-min-microvolt = <700000>;
> +       regulator-max-microvolt = <1320000>;
> +       regulator-name = "vdd-cpus"; /* This is an educated guess */
> +};
> +
> +&reg_dcdc1 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-3v3";
> +};
> +
> +&reg_dcdc2 {
> +       regulator-min-microvolt = <700000>;
> +       regulator-max-microvolt = <1320000>;
> +       regulator-name = "vdd-gpu";
> +};
> +
> +&reg_dcdc3 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <700000>;
> +       regulator-max-microvolt = <1320000>;
> +       regulator-name = "vdd-cpu";
> +};
> +
> +&reg_dcdc4 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <700000>;
> +       regulator-max-microvolt = <1320000>;
> +       regulator-name = "vdd-sys-dll";
> +};
> +
> +&reg_dcdc5 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <1500000>;
> +       regulator-max-microvolt = <1500000>;
> +       regulator-name = "vcc-dram";
> +};
> +
> +&reg_dldo1 {
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-ethernet-phy";
> +};
> +
> +&reg_dldo4 {
> +       regulator-always-on;

Why not tie this to the usbphy? Same for the other patch.

ChenYu

> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-usb-hub";
> +};
> +
>  &reg_usb1_vbus {
>         pinctrl-names = "default";
>         pinctrl-0 = <&usb1_vbus_pin_m9>;
> @@ -151,5 +236,6 @@
>
>  &usbphy {
>         usb1_vbus-supply = <&reg_usb1_vbus>;
> +       usb2_vbus-supply = <&reg_aldo1>;
>         status = "okay";
>  };
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
