From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 6/9] ARM: dts: sun7i: Add board support for
 LinkSprite pcDuino V3
Date: Tue, 1 Jul 2014 10:22:11 +0800
Message-ID: <CAGb2v65mDnuwveUiTKU2J3b3jbNzRLvPjS+wXNEj2MRtDN4Q2w@mail.gmail.com>
References: <1404165479-23785-1-git-send-email-hdegoede@redhat.com> <1404165479-23785-7-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZ5WZCOQKGQE6Y4XQBA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1404165479-23785-7-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 1, 2014 at 5:57 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> From: Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
>
> The LinkSprite pcDuino V3 is an A20 based development board featuring
> arduino compatible io headers, 1G RAM, 4G nand, sata, rtl8188cus usb wifi
> and 100 Mbit ethernet using an ip101a phy:
>
> http://www.pcduino.com/pcduino-v3/
>
> Signed-off-by: Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
> [hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: Various cleanups, correct led pins]
> [hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: Add axp209, ir and gpio-keys nodes]
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> --
>
> Changes since v2:
>  - update MMC entry to comply with upstream
>  - unify the 4 patches into one
>
> Changes since v1:
>  - fix cosmetic issues
>  - fix i2c entry
>  - remove unnecessary input bindings include
>  - add MMC support
> ---
>  arch/arm/boot/dts/Makefile               |   3 +-
>  arch/arm/boot/dts/sun7i-a20-pcduino3.dts | 173 +++++++++++++++++++++++++++++++
>  2 files changed, 175 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-pcduino3.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index ed0de8b..fdc590e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -380,7 +380,8 @@ dtb-$(CONFIG_MACH_SUN7I) += \
>         sun7i-a20-cubieboard2.dtb \
>         sun7i-a20-cubietruck.dtb \
>         sun7i-a20-i12-tvbox.dtb \
> -       sun7i-a20-olinuxino-micro.dtb
> +       sun7i-a20-olinuxino-micro.dtb \
> +       sun7i-a20-pcduino3.dtb

You may need to rebase onto my sun8i ippo-q8h dts patch.

  https://patchwork.kernel.org/patch/4389951/

There's a likely conflict in the Makefile here.

>  dtb-$(CONFIG_ARCH_TEGRA) += tegra20-harmony.dtb \
>         tegra20-iris-512.dtb \
>         tegra20-medcom-wide.dtb \
> diff --git a/arch/arm/boot/dts/sun7i-a20-pcduino3.dts b/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
> new file mode 100644
> index 0000000..168b0bc
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-pcduino3.dts
> @@ -0,0 +1,173 @@
> +/*
> + * Copyright 2014 Zoltan HERPAI
> + * Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +/include/ "sun7i-a20.dtsi"
> +/include/ "sunxi-common-regulators.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +       model = "LinkSprite pcDuino3";
> +       compatible = "linksprite,pcduino3", "allwinner,sun7i-a20";
> +
> +       soc@01c00000 {
> +               mmc0: mmc@01c0f000 {
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_reference_design>;
> +                       vmmc-supply = <&reg_vcc3v3>;
> +                       bus-width = <4>;
> +                       cd-gpios = <&pio 7 1 0>; /* PH1 */
> +                       cd-inverted;
> +                       status = "okay";
> +               };
> +
> +               usbphy: phy@01c13400 {
> +                       usb1_vbus-supply = <&reg_usb1_vbus>;
> +                       usb2_vbus-supply = <&reg_usb2_vbus>;
> +                       status = "okay";
> +               };
> +
> +               ehci0: usb@01c14000 {
> +                       status = "okay";
> +               };
> +
> +               ohci0: usb@01c14400 {
> +                       status = "okay";
> +               };
> +
> +               ahci: sata@01c18000 {
> +                       target-supply = <&reg_ahci_5v>;
> +                       status = "okay";
> +               };
> +
> +               ehci1: usb@01c1c000 {
> +                       status = "okay";
> +               };
> +
> +               ohci1: usb@01c1c400 {
> +                       status = "okay";
> +               };
> +
> +               pinctrl@01c20800 {
> +                       ahci_pwr_pin_a: ahci_pwr_pin@0 {
> +                               allwinner,pins = "PH2";
> +                       };
> +
> +                       led_pins_pcduino3: led_pins@0 {
> +                               allwinner,pins = "PH15", "PH16";
> +                               allwinner,function = "gpio_out";
> +                               allwinner,drive = <0>;
> +                               allwinner,pull = <0>;
> +                       };
> +
> +                       key_pins_pcduino3: key_pins@0 {
> +                               allwinner,pins = "PH17", "PH18", "PH19";
> +                               allwinner,function = "gpio_in";
> +                               allwinner,drive = <0>;
> +                               allwinner,pull = <0>;
> +                       };
> +               };
> +
> +               ir0: ir@01c21800 {
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&ir0_pins_a>;
> +                       status = "okay";
> +               };
> +
> +               uart0: serial@01c28000 {
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&uart0_pins_a>;
> +                       status = "okay";
> +               };
> +
> +               i2c0: i2c@01c2ac00 {
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&i2c0_pins_a>;
> +                       status = "okay";
> +
> +                       axp209: pmic@34 {
> +                               compatible = "x-powers,axp209";
> +                               reg = <0x34>;
> +                               interrupt-parent = <&nmi_intc>;
> +                               interrupts = <0 8>;
> +
> +                               interrupt-controller;
> +                               #interrupt-cells = <1>;
> +                       };
> +               };
> +
> +               gmac: ethernet@01c50000 {
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&gmac_pins_mii_a>;
> +                       phy = <&phy1>;
> +                       phy-mode = "mii";
> +                       status = "okay";
> +
> +                       phy1: ethernet-phy@1 {
> +                               reg = <1>;
> +                       };
> +               };
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&led_pins_pcduino3>;
> +
> +               tx {
> +                       label = "pcduino3:green:tx";
> +                       gpios = <&pio 7 15 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               rx {
> +                       label = "pcduino3:green:rx";
> +                       gpios = <&pio 7 16 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       gpio_keys {
> +               compatible = "gpio-keys";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&key_pins_pcduino3>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               button@0 {
> +                       label = "Key Back";
> +                       linux,code = <KEY_BACK>;
> +                       gpios = <&pio 7 17 GPIO_ACTIVE_LOW>;
> +               };
> +               button@1 {
> +                       label = "Key Home";
> +                       linux,code = <KEY_HOME>;
> +                       gpios = <&pio 7 18 GPIO_ACTIVE_LOW>;
> +               };
> +               button@2 {
> +                       label = "Key Menu";
> +                       linux,code = <KEY_MENU>;
> +                       gpios = <&pio 7 19 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       reg_usb1_vbus: usb1-vbus {
> +               status = "okay";
> +       };
> +
> +       reg_usb2_vbus: usb2-vbus {
> +               status = "okay";
> +       };
> +
> +       reg_ahci_5v: ahci-5v {
> +               gpio = <&pio 7 2 0>;
> +               status = "okay";
> +       };
> +};
> --
> 2.0.0
>
