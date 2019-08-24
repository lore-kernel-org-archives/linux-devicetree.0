From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2, 3/3] arm64: dts: meson-g12b-ugoos-am6: add initial device-tree
Date: Sat, 24 Aug 2019 23:29:05 +0200
Message-ID: <CAFBinCC-ncHtni9-Ve1_eQROTrJg0WPkA_rOi1We7T-uSOyYHg@mail.gmail.com>
References: <1566633850-9421-1-git-send-email-christianshewitt@gmail.com> <1566633850-9421-4-git-send-email-christianshewitt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566633850-9421-4-git-send-email-christianshewitt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Oleg Ivanov <balbes-150@yandex.ru>
List-Id: devicetree@vger.kernel.org

Hi Christian,

On Sat, Aug 24, 2019 at 10:06 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> The Ugoos AM6 is based on the Amlogic W400 (G12B) reference design using the
> S922X chipset. Hardware specifications:
>
> - 2GB LPDDR4 RAM
> - 16GB eMMC storage
> - 10/100/1000 Base-T Ethernet using External RGMII PHY
> - 802.11 a/b/g/b/ac + BT 5.0 sdio wireless (Ampak 6398S)
> - HDMI 2.0 (4k@60p) video
> - Composite video + 2-channel audio output on 3.5mm jack
> - S/PDIF audio output
> - Aux input
> - 1x USB 3.0
> - 3x USB 2.0
> - 1x micro SD card slot
>
> The device-tree is laregly based on meson-g12b-odroid-n2 but with audio
typo -> largely

[...]
> +       tflash_vdd: regulator-tflash_vdd {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "TFLASH_VDD";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&gpio_ao GPIOAO_8 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
do we need regulator-always-on here as well, see [0]?

[...]
> +       usb_pwr_en: regulator-usb_pwr_en {
> +               compatible = "regulator-fixed";
> +               regulator-name = "USB_PWR_EN";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               vin-supply = <&vcc_5v>;
> +
> +               /* Connected to the microUSB port power enable */
> +               gpio = <&gpio GPIOH_6 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
the photos I found don't show a micro USB port (but 3x USB A 2.0 and
1x USB A 3.0 - just like you mentioned in the patch description)
does this regulator exist?

[...]
> +&ethmac {
> +       pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +       phy-mode = "rgmii";
> +       phy-handle = <&external_phy>;
> +       amlogic,tx-delay-ns = <2>;
> +};
is the PHY reset GPIO not wired to GPIOZ_15 like on Odroid-N2 and X96 Max?


Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts?id=dc7f2cb218b5ef65ab3d455a0e62d27e44075203
