From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: Add support for ZII i.MX7 RPU2 board
Date: Thu, 28 Mar 2019 22:30:36 -0700
Message-ID: <CAHQ1cqHiz__CXFZKG_6GanDxNTMzdhTLc_f9Xa-pc8Tb5GyRuw@mail.gmail.com>
References: <20190327064150.31549-1-andrew.smirnov@gmail.com> <20190327064150.31549-2-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190327064150.31549-2-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 26, 2019 at 11:41 PM Andrey Smirnov
<andrew.smirnov@gmail.com> wrote:
>
> Add support for ZII's i.MX7 based Remote Peripheral Unit 2 (RPU2)
> board.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> ---
>  arch/arm/boot/dts/Makefile           |   1 +
>  arch/arm/boot/dts/imx7d-zii-rpu2.dts | 936 +++++++++++++++++++++++++++
>  2 files changed, 937 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx7d-zii-rpu2.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index efefce8efa05..687222907154 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -586,6 +586,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
>         imx7d-sdb.dtb \
>         imx7d-sdb-reva.dtb \
>         imx7d-sdb-sht11.dtb \
> +       imx7d-zii-rpu2.dtb \
>         imx7s-colibri-eval-v3.dtb \
>         imx7s-warp.dtb
>  dtb-$(CONFIG_SOC_IMX7ULP) += \
> diff --git a/arch/arm/boot/dts/imx7d-zii-rpu2.dts b/arch/arm/boot/dts/imx7d-zii-rpu2.dts
> new file mode 100644
> index 000000000000..6f36c7d9d214
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx7d-zii-rpu2.dts
> @@ -0,0 +1,936 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/*
> + * Device tree file for ZII's RPU2 board
> + *
> + * RPU - Remote Peripheral Unit
> + *
> + * Copyright (C) 2019 Zodiac Inflight Innovations
> + */
> +
> +/dts-v1/;
> +#include "imx7d.dtsi"
> +
> +/ {
> +       model = "ZII RPU2 Board";
> +       compatible = "zii,imx7d-rpu2", "fsl,imx7d";
> +
> +       chosen {
> +               stdout-path = &uart1;
> +       };
> +
> +       gpio-leds {
> +               compatible = "gpio-leds";
> +               pinctrl-0 = <&pinctrl_leds_debug>;
> +               pinctrl-names = "default";
> +
> +               debug {
> +                       label = "zii:green:debug1";
> +                       gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "heartbeat";
> +               };
> +       };
> +
> +       reg_can1_stby: regulator-can1-stby {
> +               compatible = "regulator-fixed";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_flexcan1_stby>;
> +               regulator-name = "can1-3v3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
> +
> +       reg_can2_stby: regulator-can2-stby {
> +               compatible = "regulator-fixed";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_flexcan2_stby>;
> +               regulator-name = "can2-3v3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpio = <&gpio1 8 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
> +
> +       reg_vref_1v8: regulator-vref-1v8 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vref-1v8";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-always-on;
> +       };
> +
> +       reg_3p3v: regulator-3p3v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "GEN_3V3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;
> +       };
> +
> +       reg_5p0v_main: regulator-5p0v-main {
> +               compatible = "regulator-fixed";
> +               regulator-name = "5V_MAIN";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               regulator-always-on;
> +       };
> +
> +       sound1 {
> +               compatible = "simple-audio-card";
> +               simple-audio-card,name = "Audio Output 1";
> +               simple-audio-card,format = "i2s";
> +               simple-audio-card,bitclock-master = <&sound1_codec>;
> +               simple-audio-card,frame-master = <&sound1_codec>;
> +               simple-audio-card,widgets =
> +                       "Headphone", "Headphone Jack";
> +               simple-audio-card,routing =
> +                       "Headphone Jack", "HPLEFT",
> +                       "Headphone Jack", "HPRIGHT",
> +                       "LEFTIN", "HPL",
> +                       "RIGHTIN", "HPR";
> +               simple-audio-card,aux-devs = <&hpa1>;
> +
> +               simple-audio-card,cpu {
> +                       sound-dai = <&sai1>;
> +               };
> +
> +               sound1_codec: simple-audio-card,codec {
> +                       sound-dai = <&codec1>;
> +                       clocks = <&cs2000>;
> +               };
> +       };
> +
> +       sound2 {
> +               compatible = "simple-audio-card";
> +               simple-audio-card,name = "Audio Output 2";
> +               simple-audio-card,format = "i2s";
> +               simple-audio-card,bitclock-master = <&sound2_codec>;
> +               simple-audio-card,frame-master = <&sound2_codec>;
> +               simple-audio-card,widgets =
> +                       "Headphone", "Headphone Jack";
> +               simple-audio-card,routing =
> +                       "Headphone Jack", "HPLEFT",
> +                       "Headphone Jack", "HPRIGHT",
> +                       "LEFTIN", "HPL",
> +                       "RIGHTIN", "HPR";
> +               simple-audio-card,aux-devs = <&hpa2>;
> +
> +               simple-audio-card,cpu {
> +                       sound-dai = <&sai2>;
> +               };
> +
> +               sound2_codec: simple-audio-card,codec {
> +                       sound-dai = <&codec2>;
> +                       clocks = <&cs2000>;
> +               };
> +       };
> +
> +       sound3 {
> +               compatible = "simple-audio-card";
> +               simple-audio-card,name = "Audio Output 3";
> +               simple-audio-card,format = "i2s";
> +               simple-audio-card,bitclock-master = <&sound3_codec>;
> +               simple-audio-card,frame-master = <&sound3_codec>;
> +               simple-audio-card,widgets =
> +                       "Headphone", "Headphone Jack";
> +               simple-audio-card,routing =
> +                       "Headphone Jack", "HPLEFT",
> +                       "Headphone Jack", "HPRIGHT",
> +                       "LEFTIN", "HPL",
> +                       "RIGHTIN", "HPR";
> +               simple-audio-card,aux-devs = <&hpa3>;
> +
> +               simple-audio-card,cpu {
> +                       sound-dai = <&sai3>;
> +               };
> +
> +               sound3_codec: simple-audio-card,codec {
> +                       sound-dai = <&codec3>;
> +                       clocks = <&cs2000>;
> +               };
> +       };
> +
> +       cs2000_ref: cs2000-ref {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <24576000>;
> +       };
> +
> +       cs2000_in_dummy: cs2000-in-dummy {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <0>;
> +       };
> +};
> +
> +&adc1 {
> +       vref-supply = <&reg_vref_1v8>;
> +       status = "okay";
> +};
> +
> +&adc2 {
> +       vref-supply = <&reg_vref_1v8>;
> +       status = "okay";
> +};

Tested this patch more and realized that these two above need to be
properly exposed via HWMON. Will submit an update v2 of this set.

Thanks,
Andrey Smirnov
