Return-Path: <SRS0=E8Gn=ZF=solid-run.com=jon@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170123083320.GL5662@dragon>
References: <20170113144449.GQ14217@n2100.armlinux.org.uk> <E1cS36a-0002wB-Vy@rmk-PC.armlinux.org.uk>
 <20170123083320.GL5662@dragon>
From: Jon Nettleton <jon@solid-run.com>
Date: Mon, 23 Jan 2017 10:58:50 +0200
Message-ID: <CABdtJHtnyXK5OLRSsfxOE_PyPCikXCtR7yjoox0xckm88SaraA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/4] ARM: dts: imx6qdl: add HummingBoard2 boards
Content-Type: multipart/alternative; boundary=001a1143e124af0ea90546bf37dd
To: Shawn Guo <shawnguo@kernel.org>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

--001a1143e124af0ea90546bf37dd
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 23, 2017 at 10:33 AM, Shawn Guo <shawnguo@kernel.org> wrote:

> On Fri, Jan 13, 2017 at 02:45:24PM +0000, Russell King wrote:
> > From: Jon Nettleton <jon@solid-run.com>
> >
> > This adds support for the Hummingboard Gate and Edge devices from
> > SolidRun.
> >
> > Signed-off-by: Jon Nettleton <jon@solid-run.com>
> > Signed-off-by: Rabeeh Khoury <rabeeh@solid-run.com>
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > ---
> >  arch/arm/boot/dts/Makefile                   |   2 +
> >  arch/arm/boot/dts/imx6dl-hummingboard2.dts   |  52 +++
> >  arch/arm/boot/dts/imx6q-hummingboard2.dts    |  60 +++
> >  arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi | 543
> +++++++++++++++++++++++++++
> >  4 files changed, 657 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/imx6dl-hummingboard2.dts
> >  create mode 100644 arch/arm/boot/dts/imx6q-hummingboard2.dts
> >  create mode 100644 arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 7327250f0bb6..09227cc15199 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -348,6 +348,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
> >       imx6dl-gw552x.dtb \
> >       imx6dl-gw553x.dtb \
> >       imx6dl-hummingboard.dtb \
> > +     imx6dl-hummingboard2.dtb \
> >       imx6dl-icore.dtb \
> >       imx6dl-nit6xlite.dtb \
> >       imx6dl-nitrogen6x.dtb \
> > @@ -390,6 +391,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
> >       imx6q-gw553x.dtb \
> >       imx6q-h100.dtb \
> >       imx6q-hummingboard.dtb \
> > +     imx6q-hummingboard2.dtb \
> >       imx6q-icore.dtb \
> >       imx6q-icore-rqs.dtb \
> >       imx6q-marsboard.dtb \
> > diff --git a/arch/arm/boot/dts/imx6dl-hummingboard2.dts
> b/arch/arm/boot/dts/imx6dl-hummingboard2.dts
> > new file mode 100644
> > index 000000000000..990b5050de5b
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx6dl-hummingboard2.dts
> > @@ -0,0 +1,52 @@
> > +/*
> > + * Device Tree file for SolidRun HummingBoard2
> > + * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
> > + * Based on work by Russell King
> > + *
> > + * This file is dual-licensed: you can use it either under the terms
> > + * of the GPL or the X11 license, at your option. Note that this dual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This file is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License as
> > + *     published by the Free Software Foundation; either version 2 of
> the
> > + *     License.
> > + *
> > + *     This file is distributed in the hope that it will be useful
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentation
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
> > + *     sell copies of the Software, and to permit persons to whom the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall be
> > + *     included in all copies or substantial portions of the Software.
> > + *
> > + *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
>
> The licence text is still the mangled version.
>
> > +/dts-v1/;
> > +
> > +#include "imx6dl.dtsi"
> > +#include "imx6qdl-hummingboard2.dtsi"
> > +
> > +/ {
> > +     model = "SolidRun HummingBoard2 Solo/DualLite";
> > +     compatible = "solidrun,hummingboard2/dl", "fsl,imx6dl";
> > +};
> > diff --git a/arch/arm/boot/dts/imx6q-hummingboard2.dts
> b/arch/arm/boot/dts/imx6q-hummingboard2.dts
> > new file mode 100644
> > index 000000000000..f5eec9163bb8
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx6q-hummingboard2.dts
> > @@ -0,0 +1,60 @@
> > +/*
> > + * Device Tree file for SolidRun HummingBoard2
> > + * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
> > + * Based on work by Russell King
> > + *
> > + * This file is dual-licensed: you can use it either under the terms
> > + * of the GPL or the X11 license, at your option. Note that this dual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This file is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License as
> > + *     published by the Free Software Foundation; either version 2 of
> the
> > + *     License.
> > + *
> > + *     This file is distributed in the hope that it will be useful
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentation
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
> > + *     sell copies of the Software, and to permit persons to whom the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall be
> > + *     included in all copies or substantial portions of the Software.
> > + *
> > + *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
>
> Ditto
>
> > +/dts-v1/;
> > +
> > +#include "imx6q.dtsi"
> > +#include "imx6qdl-hummingboard2.dtsi"
> > +
> > +/ {
> > +     model = "SolidRun HummingBoard2 Dual/Quad";
> > +     compatible = "solidrun,hummingboard2/q", "fsl,imx6q";
> > +};
> > +
> > +&sata {
> > +     status = "okay";
> > +     fsl,transmit-level-mV = <1104>;
> > +     fsl,transmit-boost-mdB = <0>;
> > +     fsl,transmit-atten-16ths = <9>;
> > +     fsl,no-spread-spectrum;
> > +};
> > diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
> b/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
> > new file mode 100644
> > index 000000000000..11b63f6f2b89
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
> > @@ -0,0 +1,543 @@
> > +/*
> > + * Device Tree file for SolidRun HummingBoard2
> > + * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
> > + *
> > + * This file is dual-licensed: you can use it either under the terms
> > + * of the GPL or the X11 license, at your option. Note that this dual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This file is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License as
> > + *     published by the Free Software Foundation; either version 2 of
> the
> > + *     License.
> > + *
> > + *     This file is distributed in the hope that it will be useful,
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively,
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentation
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
> > + *     sell copies of the Software, and to permit persons to whom the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall be
> > + *     included in all copies or substantial portions of the Software.
> > + *
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
>
> This one is correct.
>
> > +#include "imx6qdl-microsom.dtsi"
> > +#include "imx6qdl-microsom-ar8035.dtsi"
> > +
> > +/ {
> > +     chosen {
> > +             stdout-path = &uart1;
> > +     };
> > +
> > +     ir_recv: ir-receiver {
> > +             compatible = "gpio-ir-receiver";
> > +             gpios = <&gpio7 9 1>;
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&pinctrl_hummingboard2_gpio7_9>;
> > +             linux,rc-map-name = "rc-rc6-mce";
> > +     };
> > +
> > +     usdhc2_pwrseq: usdhc2-pwrseq {
> > +             compatible = "mmc-pwrseq-simple";
> > +             reset-gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;
> > +     };
> > +
> > +     reg_3p3v: regulator-3p3v {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "3P3V";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_1p8v: regulator-1p8v {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "1P8V";
> > +             regulator-min-microvolt = <1800000>;
> > +             regulator-max-microvolt = <1800000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_usbh1_vbus: regulator-usb-h1-vbus {
> > +             compatible = "regulator-fixed";
> > +             enable-active-high;
> > +             gpio = <&gpio1 0 0>;
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&pinctrl_hummingboard2_usbh1_vbus>;
> > +             regulator-name = "usb_h1_vbus";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +     };
> > +
> > +     reg_usbotg_vbus: regulator-usb-otg-vbus {
> > +             compatible = "regulator-fixed";
> > +             enable-active-high;
> > +             gpio = <&gpio3 22 0>;
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&pinctrl_hummingboard2_usbotg_vbus>;
> > +             regulator-name = "usb_otg_vbus";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +     };
> > +
> > +     reg_usbh2_vbus: regulator-usb-h2-vbus {
> > +             compatible = "regulator-gpio";
> > +             enable-active-high;
> > +             enable-gpio = <&gpio2 13 0>;
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&pinctrl_hummingboard2_usbh2_vbus>;
> > +             regulator-name = "usb_h2_vbus";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +             regulator-boot-on;
> > +     };
> > +
> > +     reg_usbh3_vbus: regulator-usb-h3-vbus {
> > +             compatible = "regulator-gpio";
> > +             enable-active-high;
> > +             enable-gpio = <&gpio7 10 0>;
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&pinctrl_hummingboard2_usbh3_vbus>;
> > +             regulator-name = "usb_h3_vbus";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +             regulator-boot-on;
> > +     };
> > +
> > +     sound-sgtl5000 {
> > +             audio-codec = <&sgtl5000>;
> > +             audio-routing =
> > +                     "MIC_IN", "Mic Jack",
> > +                     "Mic Jack", "Mic Bias",
> > +                     "Headphone Jack", "HP_OUT";
> > +             compatible = "fsl,imx-audio-sgtl5000";
> > +             model = "On-board Codec";
> > +             mux-ext-port = <5>;
> > +             mux-int-port = <1>;
> > +             ssi-controller = <&ssi1>;
> > +     };
> > +};
> > +
> > +&audmux {
> > +     status = "okay";
> > +};
> > +
> > +&ecspi2 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_hummingboard2_ecspi2>;
> > +     cs-gpios = <&gpio2 26 0>;
> > +     status = "okay";
> > +};
> > +
> > +&hdmi {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_hummingboard2_hdmi>;
> > +     ddc-i2c-bus = <&i2c2>;
> > +     status = "okay";
> > +};
> > +
> > +&i2c1 {
> > +     clock-frequency = <100000>;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_hummingboard2_i2c1>;
> > +     status = "okay";
> > +
> > +     pcf8523: rtc@68 {
> > +             compatible = "nxp,pcf8523";
> > +             reg = <0x68>;
> > +             nxp,12p5_pf;
> > +     };
>
> I do not see this support in mainline kernel.
>

Sorry that is my fault.  I will remove it, and re-add it after the driver
changes are upstreamed.


>
> Shawn
>
> > +
> > +     sgtl5000: codec@0a {
> > +             clocks = <&clks IMX6QDL_CLK_CKO>;
> > +             compatible = "fsl,sgtl5000";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&pinctrl_hummingboard2_sgtl5000>;
> > +             reg = <0x0a>;
> > +             VDDA-supply = <&reg_3p3v>;
> > +             VDDIO-supply = <&reg_3p3v>;
> > +     };
> > +};
> > +
> > +&i2c2 {
> > +     clock-frequency = <100000>;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_hummingboard2_i2c2>;
> > +     status = "okay";
> > +};
> > +
> > +&i2c3 {
> > +     clock-frequency = <100000>;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_hummingboard2_i2c3>;
> > +     status = "okay";
> > +};
> > +
> > +&iomuxc {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_hog>;
> > +
> > +     hummingboard2 {
> > +             pinctrl_hog: hoggrp {
> > +             fsl,pins = <
> > +                             /*
> > +                              * 36 pin headers GPIO description. The
> pins
> > +                              * numbering as following -
> > +                              *
> > +                              *      3.2v    5v      74      75
> > +                              *      73      72      71      70
> > +                              *      69      68      67      66
> > +                              *
> > +                              *      77      78      79      76
> > +                              *      65      64      61      60
> > +                              *      53      52      51      50
> > +                              *      49      48      166     132
> > +                              *      95      94      90      91
> > +                              *      GND     54      24      204
> > +                              *
> > +                              * The GPIO numbers can be extracted using
> > +                              * signal name from below.
> > +                              * Example -
> > +                              * MX6QDL_PAD_EIM_DA10__GPIO3_IO10 is
> > +                              * GPIO(3,10) which is (3-1)*32+10 = gpio
> 74
> > +                              *
> > +                              * i.e. The mapping of GPIO(X,Y) to Linux
> gpio
> > +                              * number is : gpio number = (X-1) * 32 + Y
> > +                              */
> > +                             /* DI1_PIN15 */
> > +                             MX6QDL_PAD_EIM_DA10__GPIO3_IO10 0x400130b1
> > +                             /* DI1_PIN02 */
> > +                             MX6QDL_PAD_EIM_DA11__GPIO3_IO11 0x400130b1
> > +                             /* DISP1_DATA00 */
> > +                             MX6QDL_PAD_EIM_DA9__GPIO3_IO09 0x400130b1
> > +                             /* DISP1_DATA01 */
> > +                             MX6QDL_PAD_EIM_DA8__GPIO3_IO08 0x400130b1
> > +                             /* DISP1_DATA02 */
> > +                             MX6QDL_PAD_EIM_DA7__GPIO3_IO07 0x400130b1
> > +                             /* DISP1_DATA03 */
> > +                             MX6QDL_PAD_EIM_DA6__GPIO3_IO06 0x400130b1
> > +                             /* DISP1_DATA04 */
> > +                             MX6QDL_PAD_EIM_DA5__GPIO3_IO05 0x400130b1
> > +                             /* DISP1_DATA05 */
> > +                             MX6QDL_PAD_EIM_DA4__GPIO3_IO04 0x400130b1
> > +                             /* DISP1_DATA06 */
> > +                             MX6QDL_PAD_EIM_DA3__GPIO3_IO03 0x400130b1
> > +                             /* DISP1_DATA07 */
> > +                             MX6QDL_PAD_EIM_DA2__GPIO3_IO02 0x400130b1
> > +                             /* DI1_D0_CS */
> > +                             MX6QDL_PAD_EIM_DA13__GPIO3_IO13 0x400130b1
> > +                             /* DI1_D1_CS */
> > +                             MX6QDL_PAD_EIM_DA14__GPIO3_IO14 0x400130b1
> > +                             /* DI1_PIN01 */
> > +                             MX6QDL_PAD_EIM_DA15__GPIO3_IO15 0x400130b1
> > +                             /* DI1_PIN03 */
> > +                             MX6QDL_PAD_EIM_DA12__GPIO3_IO12 0x400130b1
> > +                             /* DISP1_DATA08 */
> > +                             MX6QDL_PAD_EIM_DA1__GPIO3_IO01 0x400130b1
> > +                             /* DISP1_DATA09 */
> > +                             MX6QDL_PAD_EIM_DA0__GPIO3_IO00 0x400130b1
> > +                             /* DISP1_DATA10 */
> > +                             MX6QDL_PAD_EIM_EB1__GPIO2_IO29 0x400130b1
> > +                             /* DISP1_DATA11 */
> > +                             MX6QDL_PAD_EIM_EB0__GPIO2_IO28 0x400130b1
> > +                             /* DISP1_DATA12 */
> > +                             MX6QDL_PAD_EIM_A17__GPIO2_IO21 0x400130b1
> > +                             /* DISP1_DATA13 */
> > +                             MX6QDL_PAD_EIM_A18__GPIO2_IO20 0x400130b1
> > +                             /* DISP1_DATA14 */
> > +                             MX6QDL_PAD_EIM_A19__GPIO2_IO19 0x400130b1
> > +                             /* DISP1_DATA15 */
> > +                             MX6QDL_PAD_EIM_A20__GPIO2_IO18 0x400130b1
> > +                             /* DISP1_DATA16 */
> > +                             MX6QDL_PAD_EIM_A21__GPIO2_IO17 0x400130b1
> > +                             /* DISP1_DATA17 */
> > +                             MX6QDL_PAD_EIM_A22__GPIO2_IO16 0x400130b1
> > +                             /* DISP1_DATA18 */
> > +                             MX6QDL_PAD_EIM_A23__GPIO6_IO06 0x400130b1
> > +                             /* DISP1_DATA19 */
> > +                             MX6QDL_PAD_EIM_A24__GPIO5_IO04 0x400130b1
> > +                             /* DISP1_DATA20 */
> > +                             MX6QDL_PAD_EIM_D31__GPIO3_IO31 0x400130b1
> > +                             /* DISP1_DATA21 */
> > +                             MX6QDL_PAD_EIM_D30__GPIO3_IO30 0x400130b1
> > +                             /* DISP1_DATA22 */
> > +                             MX6QDL_PAD_EIM_D26__GPIO3_IO26 0x400130b1
> > +                             /* DISP1_DATA23 */
> > +                             MX6QDL_PAD_EIM_D27__GPIO3_IO27 0x400130b1
> > +                             /* DI1_DISP_CLK */
> > +                             MX6QDL_PAD_EIM_A16__GPIO2_IO22 0x400130b1
> > +                             /* SPDIF_IN */
> > +                             MX6QDL_PAD_ENET_RX_ER__GPIO1_IO24
> 0x400130b1
> > +                             /* SPDIF_OUT */
> > +                             MX6QDL_PAD_GPIO_17__GPIO7_IO12 0x400130b1
> > +
> > +                             /* MikroBUS GPIO pin number 10 */
> > +                             MX6QDL_PAD_EIM_LBA__GPIO2_IO27 0x400130b1
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_ecspi2: hummingboard2-ecspi2grp {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_EIM_OE__ECSPI2_MISO  0x100b1
> > +                             MX6QDL_PAD_EIM_CS1__ECSPI2_MOSI 0x100b1
> > +                             MX6QDL_PAD_EIM_CS0__ECSPI2_SCLK 0x100b1
> > +                             MX6QDL_PAD_EIM_RW__GPIO2_IO26   0x000b1 /*
> CS */
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_gpio7_9: hummingboard2-gpio7_9 {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_SD4_CMD__GPIO7_IO09 0x80000000
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_hdmi: hummingboard2-hdmi {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE
> 0x1f8b0
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_i2c1: hummingboard2-i2c1 {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_EIM_D21__I2C1_SCL 0x4001b8b1
> > +                             MX6QDL_PAD_EIM_D28__I2C1_SDA 0x4001b8b1
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_i2c2: hummingboard2-i2c2 {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_KEY_COL3__I2C2_SCL 0x4001b8b1
> > +                             MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b8b1
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_i2c3: hummingboard2-i2c3 {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_EIM_D17__I2C3_SCL 0x4001b8b1
> > +                             MX6QDL_PAD_EIM_D18__I2C3_SDA 0x4001b8b1
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_mipi: hummingboard2_mipi {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_SD4_DAT2__GPIO2_IO10 0x4001b8b1
> > +                             MX6QDL_PAD_KEY_COL4__GPIO4_IO14 0x4001b8b1
> > +                             MX6QDL_PAD_NANDF_CS2__CCM_CLKO2 0x130b0
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_pcie_reset:
> hummingboard2-pcie-reset {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_SD4_DAT3__GPIO2_IO11 0x1b0b1
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_pwm1: pwm1grp {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_DISP0_DAT8__PWM1_OUT 0x1b0b1
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_sgtl5000: hummingboard2-sgtl5000 {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_DISP0_DAT19__AUD5_RXD 0x130b0
> > +                             MX6QDL_PAD_KEY_COL0__AUD5_TXC 0x130b0
> > +                             MX6QDL_PAD_KEY_ROW0__AUD5_TXD 0x110b0
> > +                             MX6QDL_PAD_KEY_COL1__AUD5_TXFS 0x130b0
> > +                             MX6QDL_PAD_GPIO_5__CCM_CLKO1 0x130b0
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_usbh1_vbus:
> hummingboard2-usbh1-vbus {
> > +                     fsl,pins = <MX6QDL_PAD_GPIO_0__GPIO1_IO00 0x1b0b0>;
> > +             };
> > +
> > +             pinctrl_hummingboard2_usbh2_vbus:
> hummingboard2-usbh2-vbus {
> > +                     fsl,pins = <MX6QDL_PAD_SD4_DAT5__GPIO2_IO13
> 0x1b0b0>;
> > +             };
> > +
> > +             pinctrl_hummingboard2_usbh3_vbus:
> hummingboard2-usbh3-vbus {
> > +                     fsl,pins = <MX6QDL_PAD_SD4_CLK__GPIO7_IO10
> 0x1b0b0>;
> > +             };
> > +
> > +             pinctrl_hummingboard2_usbotg_id: hummingboard2-usbotg-id {
> > +                     /*
> > +                      * Similar to pinctrl_usbotg_2, but we want it
> > +                      * pulled down for a fixed host connection.
> > +                      */
> > +                     fsl,pins = <MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x13059>;
> > +             };
> > +
> > +             pinctrl_hummingboard2_usbotg_vbus:
> hummingboard2-usbotg-vbus {
> > +                     fsl,pins = <MX6QDL_PAD_EIM_D22__GPIO3_IO22
> 0x1b0b0>;
> > +             };
> > +
> > +             pinctrl_hummingboard2_usdhc2_aux:
> hummingboard2-usdhc2-aux {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_GPIO_4__GPIO1_IO04    0x13071
> > +                             MX6QDL_PAD_KEY_ROW1__SD2_VSELECT 0x1b071
> > +                             MX6QDL_PAD_DISP0_DAT9__GPIO4_IO30 0x1b0b0
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_usdhc2: hummingboard2-usdhc2 {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_SD2_CMD__SD2_CMD    0x17059
> > +                             MX6QDL_PAD_SD2_CLK__SD2_CLK    0x10059
> > +                             MX6QDL_PAD_SD2_DAT0__SD2_DATA0 0x17059
> > +                             MX6QDL_PAD_SD2_DAT1__SD2_DATA1 0x17059
> > +                             MX6QDL_PAD_SD2_DAT2__SD2_DATA2 0x17059
> > +                             MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x13059
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_usdhc2_100mhz:
> hummingboard2-usdhc2-100mhz {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_SD2_CMD__SD2_CMD    0x170b9
> > +                             MX6QDL_PAD_SD2_CLK__SD2_CLK    0x100b9
> > +                             MX6QDL_PAD_SD2_DAT0__SD2_DATA0 0x170b9
> > +                             MX6QDL_PAD_SD2_DAT1__SD2_DATA1 0x170b9
> > +                             MX6QDL_PAD_SD2_DAT2__SD2_DATA2 0x170b9
> > +                             MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x130b9
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_usdhc2_200mhz:
> hummingboard2-usdhc2-200mhz {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_SD2_CMD__SD2_CMD    0x170f9
> > +                             MX6QDL_PAD_SD2_CLK__SD2_CLK    0x100f9
> > +                             MX6QDL_PAD_SD2_DAT0__SD2_DATA0 0x170f9
> > +                             MX6QDL_PAD_SD2_DAT1__SD2_DATA1 0x170f9
> > +                             MX6QDL_PAD_SD2_DAT2__SD2_DATA2 0x170f9
> > +                             MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x130f9
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_usdhc3: hummingboard2-usdhc3 {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_SD3_CMD__SD3_CMD    0x17059
> > +                             MX6QDL_PAD_SD3_CLK__SD3_CLK    0x10059
> > +                             MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x17059
> > +                             MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x17059
> > +                             MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x17059
> > +                             MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x17059
> > +                             MX6QDL_PAD_SD3_DAT4__SD3_DATA4 0x17059
> > +                             MX6QDL_PAD_SD3_DAT5__SD3_DATA5 0x17059
> > +                             MX6QDL_PAD_SD3_DAT6__SD3_DATA6 0x17059
> > +                             MX6QDL_PAD_SD3_DAT7__SD3_DATA7 0x17059
> > +                             MX6QDL_PAD_SD3_RST__SD3_RESET  0x17059
> > +                     >;
> > +             };
> > +
> > +             pinctrl_hummingboard2_uart3: hummingboard2-uart3 {
> > +                     fsl,pins = <
> > +                             MX6QDL_PAD_EIM_D25__UART3_TX_DATA
>  0x1b0b1
> > +                             MX6QDL_PAD_EIM_D24__UART3_RX_DATA
>  0x40013000
> > +                     >;
> > +             };
> > +     };
> > +};
> > +
> > +&ldb {
> > +     status = "disabled";
> > +
> > +     lvds-channel@0 {
> > +             fsl,data-mapping = "spwg";
> > +             fsl,data-width = <18>;
> > +     };
> > +};
> > +
> > +&pcie {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_hummingboard2_pcie_reset>;
> > +     reset-gpio = <&gpio2 11 0>;
> > +     status = "okay";
> > +};
> > +
> > +&pwm1 {
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&pinctrl_hummingboard2_pwm1>;
> > +        status = "okay";
> > +};
> > +
> > +&pwm3 {
> > +     status = "disabled";
> > +};
> > +
> > +&pwm4 {
> > +     status = "disabled";
> > +};
> > +
> > +&ssi1 {
> > +     status = "okay";
> > +};
> > +
> > +&usbh1 {
> > +     disable-over-current;
> > +     vbus-supply = <&reg_usbh1_vbus>;
> > +     status = "okay";
> > +};
> > +
> > +&usbotg {
> > +     disable-over-current;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_hummingboard2_usbotg_id>;
> > +     vbus-supply = <&reg_usbotg_vbus>;
> > +     status = "okay";
> > +};
> > +
> > +&usdhc2 {
> > +     pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > +     pinctrl-0 = <
> > +             &pinctrl_hummingboard2_usdhc2_aux
> > +             &pinctrl_hummingboard2_usdhc2
> > +     >;
> > +     pinctrl-1 = <
> > +             &pinctrl_hummingboard2_usdhc2_aux
> > +             &pinctrl_hummingboard2_usdhc2_100mhz
> > +     >;
> > +     pinctrl-2 = <
> > +             &pinctrl_hummingboard2_usdhc2_aux
> > +             &pinctrl_hummingboard2_usdhc2_200mhz
> > +     >;
> > +     mmc-pwrseq = <&usdhc2_pwrseq>;
> > +     cd-gpios = <&gpio1 4 0>;
> > +     status = "okay";
> > +};
> > +
> > +&usdhc3 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <
> > +             &pinctrl_hummingboard2_usdhc3
> > +     >;
> > +     vmmc-supply = <&reg_3p3v>;
> > +     vqmmc-supply = <&reg_3p3v>;
> > +     bus-width = <8>;
> > +     non-removable;
> > +     status = "okay";
> > +};
> > +
> > +&uart3 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_hummingboard2_uart3>;
> > +     status = "okay";
> > +};
> > --
> > 2.7.4
> >
>

I will resubmit with the additional license changes.

--001a1143e124af0ea90546bf37dd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIE1vbiwgSmFuIDIzLCAyMDE3IGF0IDEwOjMzIEFNLCBTaGF3biBH
dW8gPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86c2hhd25ndW9Aa2VybmVsLm9y
ZyIgdGFyZ2V0PSJfYmxhbmsiPnNoYXduZ3VvQGtlcm5lbC5vcmc8L2E+Jmd0Ozwvc3Bhbj4gd3Jv
dGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAg
MCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYg
Y2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPk9uIEZyaSwgSmFuIDEzLCAyMDE3IGF0IDAy
OjQ1OjI0UE0gKzAwMDAsIFJ1c3NlbGwgS2luZyB3cm90ZTo8YnI+DQomZ3Q7IEZyb206IEpvbiBO
ZXR0bGV0b24gJmx0OzxhIGhyZWY9Im1haWx0bzpqb25Ac29saWQtcnVuLmNvbSI+am9uQHNvbGlk
LXJ1bi5jb208L2E+Jmd0Ozxicj4NCiZndDs8YnI+DQomZ3Q7IFRoaXMgYWRkcyBzdXBwb3J0IGZv
ciB0aGUgSHVtbWluZ2JvYXJkIEdhdGUgYW5kIEVkZ2UgZGV2aWNlcyBmcm9tPGJyPg0KJmd0OyBT
b2xpZFJ1bi48YnI+DQomZ3Q7PGJyPg0KJmd0OyBTaWduZWQtb2ZmLWJ5OiBKb24gTmV0dGxldG9u
ICZsdDs8YSBocmVmPSJtYWlsdG86am9uQHNvbGlkLXJ1bi5jb20iPmpvbkBzb2xpZC1ydW4uY29t
PC9hPiZndDs8YnI+DQomZ3Q7IFNpZ25lZC1vZmYtYnk6IFJhYmVlaCBLaG91cnkgJmx0OzxhIGhy
ZWY9Im1haWx0bzpyYWJlZWhAc29saWQtcnVuLmNvbSI+cmFiZWVoQHNvbGlkLXJ1bi5jb208L2E+
Jmd0Ozxicj4NCiZndDsgU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nICZsdDs8YSBocmVmPSJt
YWlsdG86cm1rJTJCa2VybmVsQGFybWxpbnV4Lm9yZy51ayI+cm1rK2tlcm5lbEBhcm1saW51eC5v
cmcudWs8L2E+Jmd0Ozxicj4NCiZndDsgLS0tPGJyPg0KJmd0O8KgIGFyY2gvYXJtL2Jvb3QvZHRz
L01ha2VmaWxlwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICs8YnI+DQomZ3Q7
wqAgYXJjaC9hcm0vYm9vdC9kdHMvaW14NmRsLTx3YnI+aHVtbWluZ2JvYXJkMi5kdHPCoCDCoHzC
oCA1MiArKys8YnI+DQomZ3Q7wqAgYXJjaC9hcm0vYm9vdC9kdHMvaW14NnEtPHdicj5odW1taW5n
Ym9hcmQyLmR0c8KgIMKgIHzCoCA2MCArKys8YnI+DQomZ3Q7wqAgYXJjaC9hcm0vYm9vdC9kdHMv
aW14NnFkbC08d2JyPmh1bW1pbmdib2FyZDIuZHRzaSB8IDU0MyArKysrKysrKysrKysrKysrKysr
KysrKysrKys8YnI+DQomZ3Q7wqAgNCBmaWxlcyBjaGFuZ2VkLCA2NTcgaW5zZXJ0aW9ucygrKTxi
cj4NCiZndDvCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMvaW14NmRsLTx3
YnI+aHVtbWluZ2JvYXJkMi5kdHM8YnI+DQomZ3Q7wqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtL2Jvb3QvZHRzL2lteDZxLTx3YnI+aHVtbWluZ2JvYXJkMi5kdHM8YnI+DQomZ3Q7wqAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwtPHdicj5odW1taW5nYm9h
cmQyLmR0c2k8YnI+DQomZ3Q7PGJyPg0KJmd0OyBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvTWFrZWZpbGUgYi9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZTxicj4NCiZndDsgaW5kZXgg
NzMyNzI1MGYwYmI2Li4wOTIyN2NjMTUxOTkgMTAwNjQ0PGJyPg0KJmd0OyAtLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9NYWtlZmlsZTxicj4NCiZndDsgKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvTWFr
ZWZpbGU8YnI+DQomZ3Q7IEBAIC0zNDgsNiArMzQ4LDcgQEAgZHRiLSQoQ09ORklHX1NPQ19JTVg2
USkgKz0gXDxicj4NCiZndDvCoCDCoCDCoCDCoGlteDZkbC1ndzU1MnguZHRiIFw8YnI+DQomZ3Q7
wqAgwqAgwqAgwqBpbXg2ZGwtZ3c1NTN4LmR0YiBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgaW14NmRs
LWh1bW1pbmdib2FyZC5kdGIgXDxicj4NCiZndDsgK8KgIMKgIMKgaW14NmRsLWh1bW1pbmdib2Fy
ZDIuZHRiIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBpbXg2ZGwtaWNvcmUuZHRiIFw8YnI+DQomZ3Q7
wqAgwqAgwqAgwqBpbXg2ZGwtbml0NnhsaXRlLmR0YiBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgaW14
NmRsLW5pdHJvZ2VuNnguZHRiIFw8YnI+DQomZ3Q7IEBAIC0zOTAsNiArMzkxLDcgQEAgZHRiLSQo
Q09ORklHX1NPQ19JTVg2USkgKz0gXDxicj4NCiZndDvCoCDCoCDCoCDCoGlteDZxLWd3NTUzeC5k
dGIgXDxicj4NCiZndDvCoCDCoCDCoCDCoGlteDZxLWgxMDAuZHRiIFw8YnI+DQomZ3Q7wqAgwqAg
wqAgwqBpbXg2cS1odW1taW5nYm9hcmQuZHRiIFw8YnI+DQomZ3Q7ICvCoCDCoCDCoGlteDZxLWh1
bW1pbmdib2FyZDIuZHRiIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBpbXg2cS1pY29yZS5kdGIgXDxi
cj4NCiZndDvCoCDCoCDCoCDCoGlteDZxLWljb3JlLXJxcy5kdGIgXDxicj4NCiZndDvCoCDCoCDC
oCDCoGlteDZxLW1hcnNib2FyZC5kdGIgXDxicj4NCiZndDsgZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2lteDZkbC08d2JyPmh1bW1pbmdib2FyZDIuZHRzIGIvYXJjaC9hcm0vYm9vdC9k
dHMvaW14NmRsLTx3YnI+aHVtbWluZ2JvYXJkMi5kdHM8YnI+DQomZ3Q7IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0PGJyPg0KJmd0OyBpbmRleCAwMDAwMDAwMDAwMDAuLjk5MGI1MDUwZGU1Yjxicj4NCiZn
dDsgLS0tIC9kZXYvbnVsbDxicj4NCiZndDsgKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NmRs
LTx3YnI+aHVtbWluZ2JvYXJkMi5kdHM8YnI+DQomZ3Q7IEBAIC0wLDAgKzEsNTIgQEA8YnI+DQom
Z3Q7ICsvKjxicj4NCiZndDsgKyAqIERldmljZSBUcmVlIGZpbGUgZm9yIFNvbGlkUnVuIEh1bW1p
bmdCb2FyZDI8YnI+DQomZ3Q7ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTUgUmFiZWVoIEtob3VyeSAm
bHQ7PGEgaHJlZj0ibWFpbHRvOnJhYmVlaEBzb2xpZC1ydW4uY29tIj5yYWJlZWhAc29saWQtcnVu
LmNvbTwvYT4mZ3Q7PGJyPg0KJmd0OyArICogQmFzZWQgb24gd29yayBieSBSdXNzZWxsIEtpbmc8
YnI+DQomZ3Q7ICsgKjxicj4NCiZndDsgKyAqIFRoaXMgZmlsZSBpcyBkdWFsLWxpY2Vuc2VkOiB5
b3UgY2FuIHVzZSBpdCBlaXRoZXIgdW5kZXIgdGhlIHRlcm1zPGJyPg0KJmd0OyArICogb2YgdGhl
IEdQTCBvciB0aGUgWDExIGxpY2Vuc2UsIGF0IHlvdXIgb3B0aW9uLiBOb3RlIHRoYXQgdGhpcyBk
dWFsPGJyPg0KJmd0OyArICogbGljZW5zaW5nIG9ubHkgYXBwbGllcyB0byB0aGlzIGZpbGUsIGFu
ZCBub3QgdGhpcyBwcm9qZWN0IGFzIGE8YnI+DQomZ3Q7ICsgKiB3aG9sZS48YnI+DQomZ3Q7ICsg
Kjxicj4NCiZndDsgKyAqwqAgYSkgVGhpcyBmaWxlIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vcjxicj4NCiZndDsgKyAqwqAgwqAgwqBtb2RpZnkgaXQgdW5k
ZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhczxicj4NCiZn
dDsgKyAqwqAgwqAgwqBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsg
ZWl0aGVyIHZlcnNpb24gMiBvZiB0aGU8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgTGljZW5zZS48YnI+
DQomZ3Q7ICsgKjxicj4NCiZndDsgKyAqwqAgwqAgwqBUaGlzIGZpbGUgaXMgZGlzdHJpYnV0ZWQg
aW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bDxicj4NCiZndDsgKyAqwqAgwqAgwqBi
dXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50
eSBvZjxicj4NCiZndDsgKyAqwqAgwqAgwqBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1Ig
QSBQQVJUSUNVTEFSIFBVUlBPU0UuwqAgU2VlIHRoZTxicj4NCiZndDsgKyAqwqAgwqAgwqBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLjxicj4NCiZndDsgKyAqPGJy
Pg0KJmd0OyArICogT3IsIGFsdGVybmF0aXZlbHk8YnI+DQomZ3Q7ICsgKjxicj4NCiZndDsgKyAq
wqAgYikgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFu
eSBwZXJzb248YnI+DQomZ3Q7ICsgKsKgIMKgIMKgb2J0YWluaW5nIGEgY29weSBvZiB0aGlzIHNv
ZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb248YnI+DQomZ3Q7ICsgKsKgIMKgIMKg
ZmlsZXMgKHRoZSAmcXVvdDtTb2Z0d2FyZSZxdW90OyksIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJl
IHdpdGhvdXQ8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRo
b3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0cyB0byB1c2U8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgY29w
eSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29y
PGJyPg0KJmd0OyArICrCoCDCoCDCoHNlbGwgY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRv
IHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlPGJyPg0KJmd0OyArICrCoCDCoCDCoFNvZnR3YXJl
IGlzIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nPGJyPg0KJmd0
OyArICrCoCDCoCDCoGNvbmRpdGlvbnM6PGJyPg0KJmd0OyArICo8YnI+DQomZ3Q7ICsgKsKgIMKg
IMKgVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ug
c2hhbGwgYmU8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgaW5jbHVkZWQgaW4gYWxsIGNvcGllcyBvciBz
dWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuPGJyPg0KJmd0OyArICo8YnI+DQom
Z3Q7ICsgKsKgIMKgIMKgVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICwgV0lUSE9VVCBXQVJSQU5U
WSBPRiBBTlkgS0lORDxicj4NCiZndDsgKyAqwqAgwqAgwqBFWFBSRVNTIE9SIElNUExJRUQsIElO
Q0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVM8YnI+DQomZ3Q7ICsgKsKg
IMKgIMKgT0YgTUVSQ0hBTlRBQklMSVRZLCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RSBBTkQ8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBT
SEFMTCBUSEUgQVVUSE9SUyBPUiBDT1BZUklHSFQ8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgSE9MREVS
UyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFk8YnI+
DQomZ3Q7ICsgKsKgIMKgIMKgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQg
T1IgT1RIRVJXSVNFLCBBUklTSU5HPGJyPg0KJmd0OyArICrCoCDCoCDCoEZST00sIE9VVCBPRiBP
UiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1I8YnI+DQomZ3Q7
ICsgKsKgIMKgIMKgT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLjxicj4NCiZndDsgKyAq
Lzxicj4NCjxicj4NCjwvZGl2PjwvZGl2PlRoZSBsaWNlbmNlIHRleHQgaXMgc3RpbGwgdGhlIG1h
bmdsZWQgdmVyc2lvbi48YnI+DQo8ZGl2PjxkaXYgY2xhc3M9Img1Ij48YnI+DQomZ3Q7ICsvZHRz
LXYxLzs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsjaW5jbHVkZSAmcXVvdDtpbXg2ZGwuZHRzaSZx
dW90Ozxicj4NCiZndDsgKyNpbmNsdWRlICZxdW90O2lteDZxZGwtaHVtbWluZ2JvYXJkMi5kdHNp
JnF1b3Q7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArLyB7PGJyPg0KJmd0OyArwqAgwqAgwqBtb2Rl
bCA9ICZxdW90O1NvbGlkUnVuIEh1bW1pbmdCb2FyZDIgU29sby9EdWFsTGl0ZSZxdW90Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtzb2xpZHJ1bixodW1taW5nYm9hcmQy
L2RsJnF1b3Q7LCAmcXVvdDtmc2wsaW14NmRsJnF1b3Q7Ozxicj4NCiZndDsgK307PGJyPg0KJmd0
OyBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnEtPHdicj5odW1taW5nYm9hcmQy
LmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxLTx3YnI+aHVtbWluZ2JvYXJkMi5kdHM8YnI+
DQomZ3Q7IG5ldyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KJmd0OyBpbmRleCAwMDAwMDAwMDAwMDAu
LmY1ZWVjOTE2M2JiODxicj4NCiZndDsgLS0tIC9kZXYvbnVsbDxicj4NCiZndDsgKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvaW14NnEtPHdicj5odW1taW5nYm9hcmQyLmR0czxicj4NCiZndDsgQEAg
LTAsMCArMSw2MCBAQDxicj4NCiZndDsgKy8qPGJyPg0KJmd0OyArICogRGV2aWNlIFRyZWUgZmls
ZSBmb3IgU29saWRSdW4gSHVtbWluZ0JvYXJkMjxicj4NCiZndDsgKyAqIENvcHlyaWdodCAoQykg
MjAxNSBSYWJlZWggS2hvdXJ5ICZsdDs8YSBocmVmPSJtYWlsdG86cmFiZWVoQHNvbGlkLXJ1bi5j
b20iPnJhYmVlaEBzb2xpZC1ydW4uY29tPC9hPiZndDs8YnI+DQomZ3Q7ICsgKiBCYXNlZCBvbiB3
b3JrIGJ5IFJ1c3NlbGwgS2luZzxicj4NCiZndDsgKyAqPGJyPg0KJmd0OyArICogVGhpcyBmaWxl
IGlzIGR1YWwtbGljZW5zZWQ6IHlvdSBjYW4gdXNlIGl0IGVpdGhlciB1bmRlciB0aGUgdGVybXM8
YnI+DQomZ3Q7ICsgKiBvZiB0aGUgR1BMIG9yIHRoZSBYMTEgbGljZW5zZSwgYXQgeW91ciBvcHRp
b24uIE5vdGUgdGhhdCB0aGlzIGR1YWw8YnI+DQomZ3Q7ICsgKiBsaWNlbnNpbmcgb25seSBhcHBs
aWVzIHRvIHRoaXMgZmlsZSwgYW5kIG5vdCB0aGlzIHByb2plY3QgYXMgYTxicj4NCiZndDsgKyAq
IHdob2xlLjxicj4NCiZndDsgKyAqPGJyPg0KJmd0OyArICrCoCBhKSBUaGlzIGZpbGUgaXMgZnJl
ZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yPGJyPg0KJmd0OyArICrC
oCDCoCDCoG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGFzPGJyPg0KJmd0OyArICrCoCDCoCDCoHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBT
b2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZTxicj4NCiZndDsgKyAq
wqAgwqAgwqBMaWNlbnNlLjxicj4NCiZndDsgKyAqPGJyPg0KJmd0OyArICrCoCDCoCDCoFRoaXMg
ZmlsZSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsPGJy
Pg0KJmd0OyArICrCoCDCoCDCoGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVu
IHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mPGJyPg0KJmd0OyArICrCoCDCoCDCoE1FUkNIQU5UQUJJ
TElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS7CoCBTZWUgdGhlPGJyPg0K
Jmd0OyArICrCoCDCoCDCoEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFp
bHMuPGJyPg0KJmd0OyArICo8YnI+DQomZ3Q7ICsgKiBPciwgYWx0ZXJuYXRpdmVseTxicj4NCiZn
dDsgKyAqPGJyPg0KJmd0OyArICrCoCBiKSBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBm
cmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbjxicj4NCiZndDsgKyAqwqAgwqAgwqBvYnRhaW5p
bmcgYSBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbjxi
cj4NCiZndDsgKyAqwqAgwqAgwqBmaWxlcyAodGhlICZxdW90O1NvZnR3YXJlJnF1b3Q7KSwgdG8g
ZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dDxicj4NCiZndDsgKyAqwqAgwqAgwqByZXN0cmlj
dGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzIHRvIHVzZTxicj4N
CiZndDsgKyAqwqAgwqAgwqBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRl
LCBzdWJsaWNlbnNlLCBhbmQvb3I8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgc2VsbCBjb3BpZXMgb2Yg
dGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGU8YnI+DQomZ3Q7
ICsgKsKgIMKgIMKgU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRo
ZSBmb2xsb3dpbmc8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgY29uZGl0aW9uczo8YnI+DQomZ3Q7ICsg
Kjxicj4NCiZndDsgKyAqwqAgwqAgwqBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhp
cyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZTxicj4NCiZndDsgKyAqwqAgwqAgwqBpbmNsdWRl
ZCBpbiBhbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS48
YnI+DQomZ3Q7ICsgKjxicj4NCiZndDsgKyAqwqAgwqAgwqBUSEUgU09GVFdBUkUgSVMgUFJPVklE
RUQgLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5EPGJyPg0KJmd0OyArICrCoCDCoCDCoEVY
UFJFU1MgT1IgSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFO
VElFUzxicj4NCiZndDsgKyAqwqAgwqAgwqBPRiBNRVJDSEFOVEFCSUxJVFksIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORDxicj4NCiZndDsgKyAqwqAgwqAgwqBOT05JTkZSSU5H
RU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRSBBVVRIT1JTIE9SIENPUFlSSUdIVDxicj4NCiZn
dDsgKyAqwqAgwqAgwqBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9S
IE9USEVSIExJQUJJTElUWTxicj4NCiZndDsgKyAqwqAgwqAgwqBXSEVUSEVSIElOIEFOIEFDVElP
TiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkc8YnI+DQomZ3Q7ICsgKsKg
IMKgIMKgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1Ig
VEhFIFVTRSBPUjxicj4NCiZndDsgKyAqwqAgwqAgwqBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09G
VFdBUkUuPGJyPg0KJmd0OyArICovPGJyPg0KPGJyPg0KPC9kaXY+PC9kaXY+RGl0dG88YnI+DQo8
ZGl2PjxkaXYgY2xhc3M9Img1Ij48YnI+DQomZ3Q7ICsvZHRzLXYxLzs8YnI+DQomZ3Q7ICs8YnI+
DQomZ3Q7ICsjaW5jbHVkZSAmcXVvdDtpbXg2cS5kdHNpJnF1b3Q7PGJyPg0KJmd0OyArI2luY2x1
ZGUgJnF1b3Q7aW14NnFkbC1odW1taW5nYm9hcmQyLmR0c2kmcXVvdDs8YnI+DQomZ3Q7ICs8YnI+
DQomZ3Q7ICsvIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoG1vZGVsID0gJnF1b3Q7U29saWRSdW4gSHVt
bWluZ0JvYXJkMiBEdWFsL1F1YWQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqBjb21wYXRpYmxl
ID0gJnF1b3Q7c29saWRydW4saHVtbWluZ2JvYXJkMi9xJnF1b3Q7LCAmcXVvdDtmc2wsaW14NnEm
cXVvdDs7PGJyPg0KJmd0OyArfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO3NhdGEgezxi
cj4NCiZndDsgK8KgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoGZzbCx0cmFuc21pdC1sZXZlbC1tViA9ICZsdDsxMTA0Jmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoGZzbCx0cmFuc21pdC1ib29zdC1tZEIgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqBmc2wsdHJhbnNtaXQtYXR0ZW4tMTZ0aHMgPSAmbHQ7OSZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqBmc2wsbm8tc3ByZWFkLXNwZWN0cnVtOzxicj4NCiZndDsgK307PGJyPg0KJmd0OyBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFkbC08d2JyPmh1bW1pbmdib2FyZDIuZHRz
aSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwtPHdicj5odW1taW5nYm9hcmQyLmR0c2k8YnI+
DQomZ3Q7IG5ldyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KJmd0OyBpbmRleCAwMDAwMDAwMDAwMDAu
LjExYjYzZjZmMmI4OTxicj4NCiZndDsgLS0tIC9kZXYvbnVsbDxicj4NCiZndDsgKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvaW14NnFkbC08d2JyPmh1bW1pbmdib2FyZDIuZHRzaTxicj4NCiZndDsg
QEAgLTAsMCArMSw1NDMgQEA8YnI+DQomZ3Q7ICsvKjxicj4NCiZndDsgKyAqIERldmljZSBUcmVl
IGZpbGUgZm9yIFNvbGlkUnVuIEh1bW1pbmdCb2FyZDI8YnI+DQomZ3Q7ICsgKiBDb3B5cmlnaHQg
KEMpIDIwMTUgUmFiZWVoIEtob3VyeSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhYmVlaEBzb2xpZC1y
dW4uY29tIj5yYWJlZWhAc29saWQtcnVuLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0OyArICo8YnI+DQom
Z3Q7ICsgKiBUaGlzIGZpbGUgaXMgZHVhbC1saWNlbnNlZDogeW91IGNhbiB1c2UgaXQgZWl0aGVy
IHVuZGVyIHRoZSB0ZXJtczxicj4NCiZndDsgKyAqIG9mIHRoZSBHUEwgb3IgdGhlIFgxMSBsaWNl
bnNlLCBhdCB5b3VyIG9wdGlvbi4gTm90ZSB0aGF0IHRoaXMgZHVhbDxicj4NCiZndDsgKyAqIGxp
Y2Vuc2luZyBvbmx5IGFwcGxpZXMgdG8gdGhpcyBmaWxlLCBhbmQgbm90IHRoaXMgcHJvamVjdCBh
cyBhPGJyPg0KJmd0OyArICogd2hvbGUuPGJyPg0KJmd0OyArICo8YnI+DQomZ3Q7ICsgKsKgIGEp
IFRoaXMgZmlsZSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQv
b3I8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXM8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgcHVibGlz
aGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2Yg
dGhlPGJyPg0KJmd0OyArICrCoCDCoCDCoExpY2Vuc2UuPGJyPg0KJmd0OyArICo8YnI+DQomZ3Q7
ICsgKsKgIMKgIMKgVGhpcyBmaWxlIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQg
d2lsbCBiZSB1c2VmdWwsPGJyPg0KJmd0OyArICrCoCDCoCDCoGJ1dCBXSVRIT1VUIEFOWSBXQVJS
QU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mPGJyPg0KJmd0OyArICrC
oCDCoCDCoE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RS7CoCBTZWUgdGhlPGJyPg0KJmd0OyArICrCoCDCoCDCoEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGZvciBtb3JlIGRldGFpbHMuPGJyPg0KJmd0OyArICo8YnI+DQomZ3Q7ICsgKiBPciwgYWx0
ZXJuYXRpdmVseSw8YnI+DQomZ3Q7ICsgKjxicj4NCiZndDsgKyAqwqAgYikgUGVybWlzc2lvbiBp
cyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb248YnI+DQomZ3Q7
ICsgKsKgIMKgIMKgb2J0YWluaW5nIGEgY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lh
dGVkIGRvY3VtZW50YXRpb248YnI+DQomZ3Q7ICsgKsKgIMKgIMKgZmlsZXMgKHRoZSAmcXVvdDtT
b2Z0d2FyZSZxdW90OyksIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQ8YnI+DQomZ3Q7
ICsgKsKgIMKgIMKgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhl
IHJpZ2h0cyB0byB1c2U8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgY29weSwgbW9kaWZ5LCBtZXJnZSwg
cHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yPGJyPg0KJmd0OyArICrCoCDC
oCDCoHNlbGwgY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRv
IHdob20gdGhlPGJyPg0KJmd0OyArICrCoCDCoCDCoFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBk
byBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nPGJyPg0KJmd0OyArICrCoCDCoCDCoGNvbmRp
dGlvbnM6PGJyPg0KJmd0OyArICo8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgVGhlIGFib3ZlIGNvcHly
aWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmU8YnI+DQomZ3Q7
ICsgKsKgIMKgIMKgaW5jbHVkZWQgaW4gYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9u
cyBvZiB0aGUgU29mdHdhcmUuPGJyPg0KJmd0OyArICo8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgVEhF
IFNPRlRXQVJFIElTIFBST1ZJREVEICZxdW90O0FTIElTJnF1b3Q7LCBXSVRIT1VUIFdBUlJBTlRZ
IE9GIEFOWSBLSU5ELDxicj4NCiZndDsgKyAqwqAgwqAgwqBFWFBSRVNTIE9SIElNUExJRUQsIElO
Q0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVM8YnI+DQomZ3Q7ICsgKsKg
IMKgIMKgT0YgTUVSQ0hBTlRBQklMSVRZLCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RSBBTkQ8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBT
SEFMTCBUSEUgQVVUSE9SUyBPUiBDT1BZUklHSFQ8YnI+DQomZ3Q7ICsgKsKgIMKgIMKgSE9MREVS
UyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksPGJy
Pg0KJmd0OyArICrCoCDCoCDCoFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JU
IE9SIE9USEVSV0lTRSwgQVJJU0lORzxicj4NCiZndDsgKyAqwqAgwqAgwqBGUk9NLCBPVVQgT0Yg
T1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SPGJyPg0KJmd0
OyArICrCoCDCoCDCoE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS48YnI+DQomZ3Q7ICsg
Ki88YnI+DQo8YnI+DQo8L2Rpdj48L2Rpdj5UaGlzIG9uZSBpcyBjb3JyZWN0Ljxicj4NCjxkaXY+
PGRpdiBjbGFzcz0iaDUiPjxicj4NCiZndDsgKyNpbmNsdWRlICZxdW90O2lteDZxZGwtbWljcm9z
b20uZHRzaSZxdW90Ozxicj4NCiZndDsgKyNpbmNsdWRlICZxdW90O2lteDZxZGwtbWljcm9zb20t
YXI4MDM1LmR0c2kmcXVvdDs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsvIHs8YnI+DQomZ3Q7ICvC
oCDCoCDCoGNob3NlbiB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGRvdXQtcGF0
aCA9ICZhbXA7dWFydDE7PGJyPg0KJmd0OyArwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZn
dDsgK8KgIMKgIMKgaXJfcmVjdjogaXItcmVjZWl2ZXIgezxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2dwaW8taXItcmVjZWl2ZXImcXVvdDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvcyA9ICZsdDsmYW1wO2dwaW83IDkgMSZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVm
YXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZs
dDsmYW1wO3BpbmN0cmxfaHVtbWluZ2JvYXJkMl9ncGlvN188d2JyPjkmZ3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgbGludXgscmMtbWFwLW5hbWUgPSAmcXVvdDtyYy1yYzYtbWNl
JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDC
oCDCoHVzZGhjMl9wd3JzZXE6IHVzZGhjMi1wd3JzZXEgezxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O21tYy1wd3JzZXEtc2ltcGxlJnF1b3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVzZXQtZ3Bpb3MgPSAmbHQ7JmFtcDtncGlvNCAz
MCBHUElPX0FDVElWRV9ISUdIJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoH07PGJyPg0KJmd0OyAr
PGJyPg0KJmd0OyArwqAgwqAgwqByZWdfM3AzdjogcmVndWxhdG9yLTNwM3Ygezxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3JlZ3VsYXRvci1maXhlZCZx
dW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1uYW1lID0gJnF1
b3Q7M1AzViZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1t
aW4tbWljcm92b2x0ID0gJmx0OzMzMDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MzMwMDAwMCZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItYWx3YXlzLW9uOzxicj4NCiZndDsgK8Kg
IMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoHJlZ18xcDh2OiByZWd1bGF0
b3ItMXA4diB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1
b3Q7cmVndWxhdG9yLWZpeGVkJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
cmVndWxhdG9yLW5hbWUgPSAmcXVvdDsxUDhWJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MTgwMDAwMCZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9ICZsdDsx
ODAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1hbHdh
eXMtb247PGJyPg0KJmd0OyArwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKg
IMKgcmVnX3VzYmgxX3ZidXM6IHJlZ3VsYXRvci11c2ItaDEtdmJ1cyB7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7cmVndWxhdG9yLWZpeGVkJnF1b3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZW5hYmxlLWFjdGl2ZS1oaWdoOzxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZ3BpbyA9ICZsdDsmYW1wO2dwaW8xIDAgMCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVm
YXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZs
dDsmYW1wO3BpbmN0cmxfaHVtbWluZ2JvYXJkMl91c2JoMV88d2JyPnZidXMmZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDt1c2JfaDFfdmJ1
cyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1taW4tbWlj
cm92b2x0ID0gJmx0OzUwMDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
cmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7NTAwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgcmVnX3VzYm90Z192YnVzOiBy
ZWd1bGF0b3ItdXNiLW90Zy12YnVzIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGNv
bXBhdGlibGUgPSAmcXVvdDtyZWd1bGF0b3ItZml4ZWQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqBlbmFibGUtYWN0aXZlLWhpZ2g7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqBncGlvID0gJmx0OyZhbXA7Z3BpbzMgMjIgMCZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1wO3BpbmN0cmxfaHVt
bWluZ2JvYXJkMl88d2JyPnVzYm90Z192YnVzJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7dXNiX290Z192YnVzJnF1b3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7NTAw
MDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItbWF4LW1p
Y3Jvdm9sdCA9ICZsdDs1MDAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoH07PGJyPg0KJmd0
OyArPGJyPg0KJmd0OyArwqAgwqAgwqByZWdfdXNiaDJfdmJ1czogcmVndWxhdG9yLXVzYi1oMi12
YnVzIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDty
ZWd1bGF0b3ItZ3BpbyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGVuYWJs
ZS1hY3RpdmUtaGlnaDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGVuYWJsZS1ncGlv
ID0gJmx0OyZhbXA7Z3BpbzIgMTMgMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1wO3BpbmN0cmxfaHVtbWluZ2JvYXJkMl91
c2JoMl88d2JyPnZidXMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxh
dG9yLW5hbWUgPSAmcXVvdDt1c2JfaDJfdmJ1cyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gJmx0OzUwMDAwMDAmZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7
NTAwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItYm9v
dC1vbjs8YnI+DQomZ3Q7ICvCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAg
wqByZWdfdXNiaDNfdmJ1czogcmVndWxhdG9yLXVzYi1oMy12YnVzIHs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtyZWd1bGF0b3ItZ3BpbyZxdW90Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGVuYWJsZS1hY3RpdmUtaGlnaDs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGVuYWJsZS1ncGlvID0gJmx0OyZhbXA7Z3BpbzcgMTAg
MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1
b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwt
MCA9ICZsdDsmYW1wO3BpbmN0cmxfaHVtbWluZ2JvYXJkMl91c2JoM188d2JyPnZidXMmZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDt1c2Jf
aDNfdmJ1cyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1t
aW4tbWljcm92b2x0ID0gJmx0OzUwMDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7NTAwMDAwMCZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItYm9vdC1vbjs8YnI+DQomZ3Q7ICvCoCDC
oCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqBzb3VuZC1zZ3RsNTAwMCB7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBhdWRpby1jb2RlYyA9ICZsdDsmYW1wO3NndGw1
MDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGF1ZGlvLXJvdXRpbmcgPTxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7TUlDX0lOJnF1
b3Q7LCAmcXVvdDtNaWMgSmFjayZxdW90Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZxdW90O01pYyBKYWNrJnF1b3Q7LCAmcXVvdDtNaWMgQmlhcyZxdW90Oyw8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O0hlYWRwaG9u
ZSBKYWNrJnF1b3Q7LCAmcXVvdDtIUF9PVVQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7ZnNsLGlteC1hdWRpby1zZ3RsNTAwMCZxdW90Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoG1vZGVsID0gJnF1b3Q7T24tYm9hcmQgQ29k
ZWMmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBtdXgtZXh0LXBvcnQgPSAm
bHQ7NSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBtdXgtaW50LXBvcnQgPSAm
bHQ7MSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBzc2ktY29udHJvbGxlciA9
ICZsdDsmYW1wO3NzaTEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgfTs8YnI+DQomZ3Q7ICt9Ozxi
cj4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7YXVkbXV4IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoHN0
YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArfTs8YnI+DQomZ3Q7ICs8YnI+DQom
Z3Q7ICsmYW1wO2Vjc3BpMiB7PGJyPg0KJmd0OyArwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1
b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1w
O3BpbmN0cmxfaHVtbWluZ2JvYXJkMl88d2JyPmVjc3BpMiZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqBjcy1ncGlvcyA9ICZsdDsmYW1wO2dwaW8yIDI2IDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
c3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsgKzxicj4N
CiZndDsgKyZhbXA7aGRtaSB7PGJyPg0KJmd0OyArwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1
b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1w
O3BpbmN0cmxfaHVtbWluZ2JvYXJkMl9oZG1pJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoGRkYy1p
MmMtYnVzID0gJmx0OyZhbXA7aTJjMiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqBzdGF0dXMgPSAm
cXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFt
cDtpMmMxIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVv
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2h1bW1p
bmdib2FyZDJfaTJjMSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5
JnF1b3Q7Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgcGNmODUyMzogcnRjQDY4IHs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtueHAscGNm
ODUyMyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDY4
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoG54cCwxMnA1X3BmOzxicj4NCiZn
dDsgK8KgIMKgIMKgfTs8YnI+DQo8YnI+DQo8L2Rpdj48L2Rpdj5JIGRvIG5vdCBzZWUgdGhpcyBz
dXBwb3J0IGluIG1haW5saW5lIGtlcm5lbC48YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2
PjxkaXY+U29ycnkgdGhhdCBpcyBteSBmYXVsdC7CoCBJIHdpbGwgcmVtb3ZlIGl0LCBhbmQgcmUt
YWRkIGl0IGFmdGVyIHRoZSBkcml2ZXIgY2hhbmdlcyBhcmUgdXBzdHJlYW1lZC48L2Rpdj48ZGl2
PsKgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAg
MCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8
c3BhbiBjbGFzcz0iSE9FblpiIj48Zm9udCBjb2xvcj0iIzg4ODg4OCI+PGJyPg0KU2hhd248YnI+
DQo8L2ZvbnQ+PC9zcGFuPjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPjxicj4N
CiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgc2d0bDUwMDA6IGNvZGVjQDBhIHs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa3MgSU1YNlFETF9DTEtf
Q0tPJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVv
dDtmc2wsc2d0bDUwMDAmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5j
dHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1wO3BpbmN0cmxfaHVtbWluZ2JvYXJkMl88d2JyPnNn
dGw1MDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDBh
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoFZEREEtc3VwcGx5ID0gJmx0OyZh
bXA7cmVnXzNwM3YmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgVkRESU8tc3Vw
cGx5ID0gJmx0OyZhbXA7cmVnXzNwM3YmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgfTs8YnI+DQom
Z3Q7ICt9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7aTJjMiB7PGJyPg0KJmd0OyArwqAg
wqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
cGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9odW1taW5nYm9hcmQyX2kyYzImZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICt9Ozxi
cj4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7aTJjMyB7PGJyPg0KJmd0OyArwqAgwqAgwqBjbG9j
ay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoHBpbmN0cmwt
bmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgcGluY3RybC0w
ID0gJmx0OyZhbXA7cGluY3RybF9odW1taW5nYm9hcmQyX2kyYzMmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsg
Kzxicj4NCiZndDsgKyZhbXA7aW9tdXhjIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoHBpbmN0cmwtbmFt
ZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgcGluY3RybC0wID0g
Jmx0OyZhbXA7cGluY3RybF9ob2cmZ3Q7Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKg
aHVtbWluZ2JvYXJkMiB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2hv
ZzogaG9nZ3JwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGZzbCxwaW5zID0gJmx0
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Lyo8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAqIDM2IHBpbiBoZWFkZXJzIEdQSU8gZGVzY3JpcHRpb24uIFRoZSBwaW5zPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBudW1iZXJpbmcg
YXMgZm9sbG93aW5nIC08YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAqPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgKsKgIMKgIMKgIDMuMnbCoCDCoCA1dsKgIMKgIMKgIDc0wqAgwqAgwqAg
NzU8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAqwqAgwqAgwqAgNzPCoCDCoCDCoCA3MsKgIMKgIMKgIDcxwqAgwqAgwqAgNzA8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqwqAgwqAgwqAg
NjnCoCDCoCDCoCA2OMKgIMKgIMKgIDY3wqAgwqAgwqAgNjY8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKsKgIMKgIMKgIDc3wqAgwqAgwqAg
NzjCoCDCoCDCoCA3OcKgIMKgIMKgIDc2PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKsKgIMKgIMKgIDY1wqAgwqAgwqAgNjTCoCDCoCDCoCA2
McKgIMKgIMKgIDYwPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgKsKgIMKgIMKgIDUzwqAgwqAgwqAgNTLCoCDCoCDCoCA1McKgIMKgIMKgIDUw
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
KsKgIMKgIMKgIDQ5wqAgwqAgwqAgNDjCoCDCoCDCoCAxNjbCoCDCoCDCoDEzMjxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICrCoCDCoCDCoCA5
NcKgIMKgIMKgIDk0wqAgwqAgwqAgOTDCoCDCoCDCoCA5MTxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICrCoCDCoCDCoCBHTkTCoCDCoCDCoDU0
wqAgwqAgwqAgMjTCoCDCoCDCoCAyMDQ8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBUaGUgR1BJTyBudW1iZXJzIGNhbiBiZSBleHRyYWN0
ZWQgdXNpbmc8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAqIHNpZ25hbCBuYW1lIGZyb20gYmVsb3cuPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBFeGFtcGxlIC08YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIE1YNlFETF9QQURf
RUlNX0RBMTBfX0dQSU8zXzx3YnI+SU8xMCBpczxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogR1BJTygzLDEwKSB3aGljaCBpcyAoMy0xKSoz
MisxMCA9IGdwaW8gNzQ8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAqPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgKiBpLmUuIFRoZSBtYXBwaW5nIG9mIEdQSU8oWCxZKSB0byBMaW51eCBn
cGlvPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgKiBudW1iZXIgaXMgOiBncGlvIG51bWJlciA9IChYLTEpICogMzIgKyBZPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIERJMV9QSU4x
NSAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgTVg2UURMX1BBRF9FSU1fREExMF9fR1BJTzNfPHdicj5JTzEwIDB4NDAwMTMwYjE8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIERJMV9Q
SU4wMiAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgTVg2UURMX1BBRF9FSU1fREExMV9fR1BJTzNfPHdicj5JTzExIDB4NDAwMTMwYjE8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIERJ
U1AxX0RBVEEwMCAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREE5X19HUElPM19JTzA5IDB4NDAwMTMwYjE8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIERJ
U1AxX0RBVEEwMSAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREE4X19HUElPM19JTzA4IDB4NDAwMTMwYjE8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIERJ
U1AxX0RBVEEwMiAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREE3X19HUElPM19JTzA3IDB4NDAwMTMwYjE8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIERJ
U1AxX0RBVEEwMyAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREE2X19HUElPM19JTzA2IDB4NDAwMTMwYjE8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIERJ
U1AxX0RBVEEwNCAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREE1X19HUElPM19JTzA1IDB4NDAwMTMwYjE8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIERJ
U1AxX0RBVEEwNSAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREE0X19HUElPM19JTzA0IDB4NDAwMTMwYjE8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIERJ
U1AxX0RBVEEwNiAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREEzX19HUElPM19JTzAzIDB4NDAwMTMwYjE8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIERJ
U1AxX0RBVEEwNyAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREEyX19HUElPM19JTzAyIDB4NDAwMTMwYjE8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIERJ
MV9EMF9DUyAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREExM19fR1BJTzNfPHdicj5JTzEzIDB4NDAwMTMwYjE8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8q
IERJMV9EMV9DUyAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREExNF9fR1BJTzNfPHdicj5JTzE0IDB4NDAwMTMw
YjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oC8qIERJMV9QSU4wMSAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREExNV9fR1BJTzNfPHdicj5JTzE1IDB4NDAw
MTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoC8qIERJMV9QSU4wMyAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREExMl9fR1BJTzNfPHdicj5JTzEyIDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEEwOCAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREExX19HUElPM19JTzAxIDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEEwOSAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fREEwX19HUElPM19JTzAwIDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEExMCAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fRUIxX19HUElPMl9JTzI5IDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEExMSAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fRUIwX19HUElPMl9JTzI4IDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEExMiAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fQTE3X19HUElPMl9JTzIxIDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEExMyAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fQTE4X19HUElPMl9JTzIwIDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEExNCAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fQTE5X19HUElPMl9JTzE5IDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEExNSAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fQTIwX19HUElPMl9JTzE4IDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEExNiAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fQTIxX19HUElPMl9JTzE3IDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEExNyAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fQTIyX19HUElPMl9JTzE2IDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEExOCAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fQTIzX19HUElPNl9JTzA2IDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEExOSAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fQTI0X19HUElPNV9JTzA0IDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEEyMCAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fRDMxX19HUElPM19JTzMxIDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEEyMSAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fRDMwX19HUElPM19JTzMwIDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEEyMiAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fRDI2X19HUElPM19JTzI2IDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJU1AxX0RBVEEyMyAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fRDI3X19HUElPM19JTzI3IDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIERJMV9ESVNQX0NMSyAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fQTE2X19HUElPMl9JTzIyIDB4
NDAwMTMwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC8qIFNQRElGX0lOICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBNWDZRRExfUEFEX0VORVRfUlhfRVJfX0dQSU8xXzx3YnI+SU8y
NCAweDQwMDEzMGIxPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAvKiBTUERJRl9PVVQgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfR1BJT18xN19fR1BJTzdfSU8xMiAw
eDQwMDEzMGIxPGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBNaWtyb0JVUyBHUElPIHBpbiBudW1iZXIgMTAgKi88YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFE
TF9QQURfRUlNX0xCQV9fR1BJTzJfSU8yNyAweDQwMDEzMGIxPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxf
aHVtbWluZ2JvYXJkMl9lY3NwaTI6IGh1bW1pbmdib2FyZDItZWNzcGkyZ3JwIHs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZzbCxwaW5zID0gJmx0Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BB
RF9FSU1fT0VfX0VDU1BJMl9NSVNPwqAgMHgxMDBiMTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9FSU1fQ1MxX19FQ1NQSTJf
PHdicj5NT1NJIDB4MTAwYjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfRUlNX0NTMF9fRUNTUEkyXzx3YnI+U0NMSyAweDEw
MGIxPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBNWDZRRExfUEFEX0VJTV9SV19fR1BJTzJfSU8yNsKgIMKgMHgwMDBiMSAvKiBDUyAqLzxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqBwaW5jdHJsX2h1bW1pbmdib2FyZDJfZ3BpbzdfOTogaHVtbWluZ2JvYXJkMi1ncGlv
N185IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZzbCxwaW5z
ID0gJmx0Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgTVg2UURMX1BBRF9TRDRfQ01EX19HUElPN19JTzA5IDB4ODAwMDAwMDA8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgcGluY3RybF9odW1taW5nYm9hcmQyX2hkbWk6IGh1bW1pbmdib2FyZDItaGRtaSB7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmc2wscGlucyA9ICZsdDs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFE
TF9QQURfS0VZX1JPVzJfX0hETUlfVFhfPHdicj5DRUNfTElORSAweDFmOGIwPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oHBpbmN0cmxfaHVtbWluZ2JvYXJkMl9pMmMxOiBodW1taW5nYm9hcmQyLWkyYzEgezxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnNsLHBpbnMgPSAmbHQ7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNWDZRRExf
UEFEX0VJTV9EMjFfX0kyQzFfU0NMIDB4NDAwMWI4YjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfRUlNX0QyOF9fSTJDMV9T
REEgMHg0MDAxYjhiMTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2h1bW1pbmdib2FyZDJfaTJjMjogaHVt
bWluZ2JvYXJkMi1pMmMyIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGZzbCxwaW5zID0gJmx0Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9LRVlfQ09MM19fSTJDMl9TQ0wgMHg0MDAxYjhi
MTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
TVg2UURMX1BBRF9LRVlfUk9XM19fSTJDMl9TREEgMHg0MDAxYjhiMTxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5j
dHJsX2h1bW1pbmdib2FyZDJfaTJjMzogaHVtbWluZ2JvYXJkMi1pMmMzIHs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZzbCxwaW5zID0gJmx0Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9F
SU1fRDE3X19JMkMzX1NDTCAweDQwMDFiOGIxPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNWDZRRExfUEFEX0VJTV9EMThfX0kyQzNfU0RBIDB4
NDAwMWI4YjE8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9odW1taW5nYm9hcmQyX21pcGk6IGh1bW1pbmdi
b2FyZDJfbWlwaSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBm
c2wscGlucyA9ICZsdDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoE1YNlFETF9QQURfU0Q0X0RBVDJfX0dQSU8yXzx3YnI+SU8xMCAweDQwMDFi
OGIxPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBNWDZRRExfUEFEX0tFWV9DT0w0X19HUElPNF88d2JyPklPMTQgMHg0MDAxYjhiMTxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BB
RF9OQU5ERl9DUzJfX0NDTV88d2JyPkNMS08yIDB4MTMwYjA8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9o
dW1taW5nYm9hcmQyX3BjaWVfPHdicj5yZXNldDogaHVtbWluZ2JvYXJkMi1wY2llLXJlc2V0IHs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZzbCxwaW5zID0gJmx0
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
TVg2UURMX1BBRF9TRDRfREFUM19fR1BJTzJfPHdicj5JTzExIDB4MWIwYjE8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
cGluY3RybF9odW1taW5nYm9hcmQyX3B3bTE6IHB3bTFncnAgezxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnNsLHBpbnMgPSAmbHQ7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNWDZRRExfUEFEX0RJU1AwX0RB
VDhfX1BXTTFfPHdicj5PVVQgMHgxYjBiMTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Jmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2h1bW1pbmdib2Fy
ZDJfPHdicj5zZ3RsNTAwMDogaHVtbWluZ2JvYXJkMi1zZ3RsNTAwMCB7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmc2wscGlucyA9ICZsdDs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfRElT
UDBfREFUMTlfX0FVRDVfPHdicj5SWEQgMHgxMzBiMDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9LRVlfQ09MMF9fQVVENV9U
WEMgMHgxMzBiMDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgTVg2UURMX1BBRF9LRVlfUk9XMF9fQVVENV9UWEQgMHgxMTBiMDxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9L
RVlfQ09MMV9fQVVENV9UWEZTIDB4MTMwYjA8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfR1BJT181X19DQ01fQ0xLTzEgMHgx
MzBiMDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2h1bW1pbmdib2FyZDJfdXNiaDFfPHdicj52YnVzOiBo
dW1taW5nYm9hcmQyLXVzYmgxLXZidXMgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZnNsLHBpbnMgPSAmbHQ7TVg2UURMX1BBRF9HUElPXzBfX0dQSU8xX0lPMDAg
MHgxYjBiMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsg
Kzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9odW1taW5nYm9hcmQyX3Vz
YmgyXzx3YnI+dmJ1czogaHVtbWluZ2JvYXJkMi11c2JoMi12YnVzIHs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZzbCxwaW5zID0gJmx0O01YNlFETF9QQURfU0Q0
X0RBVDVfX0dQSU8yXzx3YnI+SU8xMyAweDFiMGIwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBw
aW5jdHJsX2h1bW1pbmdib2FyZDJfdXNiaDNfPHdicj52YnVzOiBodW1taW5nYm9hcmQyLXVzYmgz
LXZidXMgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnNsLHBp
bnMgPSAmbHQ7TVg2UURMX1BBRF9TRDRfQ0xLX19HUElPN188d2JyPklPMTAgMHgxYjBiMCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9odW1taW5nYm9hcmQyX3VzYm90Z188d2JyPmlk
OiBodW1taW5nYm9hcmQyLXVzYm90Zy1pZCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAvKjxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgICogU2ltaWxhciB0byBwaW5jdHJsX3VzYm90Z18yLCBidXQgd2Ugd2FudCBpdDxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogcHVsbGVkIGRvd24gZm9yIGEg
Zml4ZWQgaG9zdCBjb25uZWN0aW9uLjxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBm
c2wscGlucyA9ICZsdDtNWDZRRExfUEFEX0dQSU9fMV9fVVNCX09UR19JRCAweDEzMDU5Jmd0Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2h1bW1pbmdib2FyZDJfdXNib3RnXzx3YnI+dmJ1
czogaHVtbWluZ2JvYXJkMi11c2JvdGctdmJ1cyB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBmc2wscGlucyA9ICZsdDtNWDZRRExfUEFEX0VJTV9EMjJfX0dQSU8z
Xzx3YnI+SU8yMiAweDFiMGIwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07
PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2h1bW1p
bmdib2FyZDJfdXNkaGMyXzx3YnI+YXV4OiBodW1taW5nYm9hcmQyLXVzZGhjMi1hdXggezxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnNsLHBpbnMgPSAmbHQ7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNWDZR
RExfUEFEX0dQSU9fNF9fR1BJTzFfSU8wNMKgIMKgIDB4MTMwNzE8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfS0VZX1JPVzFf
X1NEMl88d2JyPlZTRUxFQ1QgMHgxYjA3MTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9ESVNQMF9EQVQ5X19HUElPNF88d2Jy
PklPMzAgMHgxYjBiMDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2h1bW1pbmdib2FyZDJfdXNkaGMyOiBo
dW1taW5nYm9hcmQyLXVzZGhjMiB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBmc2wscGlucyA9ICZsdDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfU0QyX0NNRF9fU0QyX0NNRMKgIMKgIDB4
MTcwNTk8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoE1YNlFETF9QQURfU0QyX0NMS19fU0QyX0NMS8KgIMKgIDB4MTAwNTk8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfU0Qy
X0RBVDBfX1NEMl9EQVRBMCAweDE3MDU5PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNWDZRRExfUEFEX1NEMl9EQVQxX19TRDJfREFUQTEgMHgx
NzA1OTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgTVg2UURMX1BBRF9TRDJfREFUMl9fU0QyX0RBVEEyIDB4MTcwNTk8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfU0QyX0RB
VDNfX1NEMl9EQVRBMyAweDEzMDU5PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7
ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaHVtbWluZ2JvYXJkMl91
c2RoYzJfPHdicj4xMDBtaHo6IGh1bW1pbmdib2FyZDItdXNkaGMyLTEwMG1oeiB7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmc2wscGlucyA9ICZsdDs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9Q
QURfU0QyX0NNRF9fU0QyX0NNRMKgIMKgIDB4MTcwYjk8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfU0QyX0NMS19fU0QyX0NM
S8KgIMKgIDB4MTAwYjk8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoE1YNlFETF9QQURfU0QyX0RBVDBfX1NEMl9EQVRBMCAweDE3MGI5PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNWDZRRExf
UEFEX1NEMl9EQVQxX19TRDJfREFUQTEgMHgxNzBiOTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9TRDJfREFUMl9fU0QyX0RB
VEEyIDB4MTcwYjk8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoE1YNlFETF9QQURfU0QyX0RBVDNfX1NEMl9EQVRBMyAweDEzMGI5PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoHBpbmN0cmxfaHVtbWluZ2JvYXJkMl91c2RoYzJfPHdicj4yMDBtaHo6IGh1bW1pbmdib2Fy
ZDItdXNkaGMyLTIwMG1oeiB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBmc2wscGlucyA9ICZsdDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfU0QyX0NNRF9fU0QyX0NNRMKgIMKgIDB4MTcw
Zjk8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oE1YNlFETF9QQURfU0QyX0NMS19fU0QyX0NMS8KgIMKgIDB4MTAwZjk8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfU0QyX0RB
VDBfX1NEMl9EQVRBMCAweDE3MGY5PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBNWDZRRExfUEFEX1NEMl9EQVQxX19TRDJfREFUQTEgMHgxNzBm
OTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
TVg2UURMX1BBRF9TRDJfREFUMl9fU0QyX0RBVEEyIDB4MTcwZjk8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfU0QyX0RBVDNf
X1NEMl9EQVRBMyAweDEzMGY5PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaHVtbWluZ2JvYXJkMl91c2Ro
YzM6IGh1bW1pbmdib2FyZDItdXNkaGMzIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGZzbCxwaW5zID0gJmx0Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9TRDNfQ01EX19TRDNfQ01EwqAg
wqAgMHgxNzA1OTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgTVg2UURMX1BBRF9TRDNfQ0xLX19TRDNfQ0xLwqAgwqAgMHgxMDA1OTxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BB
RF9TRDNfREFUMF9fU0QzX0RBVEEwIDB4MTcwNTk8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfU0QzX0RBVDFfX1NEM19EQVRB
MSAweDE3MDU5PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBNWDZRRExfUEFEX1NEM19EQVQyX19TRDNfREFUQTIgMHgxNzA1OTxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9T
RDNfREFUM19fU0QzX0RBVEEzIDB4MTcwNTk8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfU0QzX0RBVDRfX1NEM19EQVRBNCAw
eDE3MDU5PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBNWDZRRExfUEFEX1NEM19EQVQ1X19TRDNfREFUQTUgMHgxNzA1OTxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BBRF9TRDNf
REFUNl9fU0QzX0RBVEE2IDB4MTcwNTk8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURfU0QzX0RBVDdfX1NEM19EQVRBNyAweDE3
MDU5PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBNWDZRRExfUEFEX1NEM19SU1RfX1NEM19SRVNFVMKgIDB4MTcwNTk8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcGlu
Y3RybF9odW1taW5nYm9hcmQyX3VhcnQzOiBodW1taW5nYm9hcmQyLXVhcnQzIHs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZzbCxwaW5zID0gJmx0Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTVg2UURMX1BB
RF9FSU1fRDI1X19VQVJUM19UWF88d2JyPkRBVEHCoCDCoCDCoCDCoDB4MWIwYjE8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE1YNlFETF9QQURf
RUlNX0QyNF9fVUFSVDNfUlhfPHdicj5EQVRBwqAgwqAgwqAgwqAweDQwMDEzMDAwPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoH07PGJyPg0KJmd0OyArfTs8YnI+
DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO2xkYiB7PGJyPg0KJmd0OyArwqAgwqAgwqBzdGF0dXMg
PSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoGx2
ZHMtY2hhbm5lbEAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGZzbCxkYXRhLW1h
cHBpbmcgPSAmcXVvdDtzcHdnJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
ZnNsLGRhdGEtd2lkdGggPSAmbHQ7MTgmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgfTs8YnI+DQom
Z3Q7ICt9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7cGNpZSB7PGJyPg0KJmd0OyArwqAg
wqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1wO3BpbmN0cmxfaHVtbWluZ2JvYXJkMl9wY2llXzx3YnI+
cmVzZXQmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgcmVzZXQtZ3BpbyA9ICZsdDsmYW1wO2dwaW8y
IDExIDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8
YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7cHdtMSB7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9odW1taW5nYm9h
cmQyX3B3bTEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIHN0YXR1cyA9ICZxdW90O29rYXkm
cXVvdDs7PGJyPg0KJmd0OyArfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO3B3bTMgezxi
cj4NCiZndDsgK8KgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0
OyArfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO3B3bTQgezxicj4NCiZndDsgK8KgIMKg
IMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyArfTs8YnI+DQomZ3Q7
ICs8YnI+DQomZ3Q7ICsmYW1wO3NzaTEgezxicj4NCiZndDsgK8KgIMKgIMKgc3RhdHVzID0gJnF1
b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7
dXNiaDEgezxicj4NCiZndDsgK8KgIMKgIMKgZGlzYWJsZS1vdmVyLWN1cnJlbnQ7PGJyPg0KJmd0
OyArwqAgwqAgwqB2YnVzLXN1cHBseSA9ICZsdDsmYW1wO3JlZ191c2JoMV92YnVzJmd0Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArfTs8
YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO3VzYm90ZyB7PGJyPg0KJmd0OyArwqAgwqAgwqBk
aXNhYmxlLW92ZXItY3VycmVudDs8YnI+DQomZ3Q7ICvCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAm
cXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgcGluY3RybC0wID0gJmx0OyZh
bXA7cGluY3RybF9odW1taW5nYm9hcmQyXzx3YnI+dXNib3RnX2lkJmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoHZidXMtc3VwcGx5ID0gJmx0OyZhbXA7cmVnX3VzYm90Z192YnVzJmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArfTs8YnI+
DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO3VzZGhjMiB7PGJyPg0KJmd0OyArwqAgwqAgwqBwaW5j
dHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90OywgJnF1b3Q7c3RhdGVfMTAwbWh6JnF1b3Q7
LCAmcXVvdDtzdGF0ZV8yMDBtaHomcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqBwaW5jdHJsLTAg
PSAmbHQ7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAmYW1wO3BpbmN0cmxfaHVtbWlu
Z2JvYXJkMl91c2RoYzJfPHdicj5hdXg8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCZh
bXA7cGluY3RybF9odW1taW5nYm9hcmQyX3VzZGhjMjxicj4NCiZndDsgK8KgIMKgIMKgJmd0Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoHBpbmN0cmwtMSA9ICZsdDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCZhbXA7cGluY3RybF9odW1taW5nYm9hcmQyX3VzZGhjMl88d2JyPmF1eDxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgJmFtcDtwaW5jdHJsX2h1bW1pbmdib2FyZDJfdXNk
aGMyXzx3YnI+MTAwbWh6PGJyPg0KJmd0OyArwqAgwqAgwqAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgcGluY3RybC0yID0gJmx0Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgJmFtcDtw
aW5jdHJsX2h1bW1pbmdib2FyZDJfdXNkaGMyXzx3YnI+YXV4PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAmYW1wO3BpbmN0cmxfaHVtbWluZ2JvYXJkMl91c2RoYzJfPHdicj4yMDBtaHo8
YnI+DQomZ3Q7ICvCoCDCoCDCoCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqBtbWMtcHdyc2VxID0g
Jmx0OyZhbXA7dXNkaGMyX3B3cnNlcSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqBjZC1ncGlvcyA9
ICZsdDsmYW1wO2dwaW8xIDQgMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqBzdGF0dXMgPSAmcXVv
dDtva2F5JnF1b3Q7Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDt1
c2RoYzMgezxicj4NCiZndDsgK8KgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQm
cXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAmYW1wO3BpbmN0cmxfaHVtbWluZ2JvYXJkMl91c2RoYzM8YnI+DQom
Z3Q7ICvCoCDCoCDCoCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqB2bW1jLXN1cHBseSA9ICZsdDsm
YW1wO3JlZ18zcDN2Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoHZxbW1jLXN1cHBseSA9ICZsdDsm
YW1wO3JlZ18zcDN2Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoGJ1cy13aWR0aCA9ICZsdDs4Jmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoG5vbi1yZW1vdmFibGU7PGJyPg0KJmd0OyArwqAgwqAgwqBz
dGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0K
Jmd0OyArJmFtcDt1YXJ0MyB7PGJyPg0KJmd0OyArwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1
b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1w
O3BpbmN0cmxfaHVtbWluZ2JvYXJkMl91YXJ0MyZndDs8d2JyPjs8YnI+DQomZ3Q7ICvCoCDCoCDC
oHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArfTs8YnI+DQomZ3Q7IC0tPGJy
Pg0KJmd0OyAyLjcuNDxicj4NCiZndDs8YnI+DQo8L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PC9k
aXY+PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj5JIHdpbGwgcmVzdWJtaXQgd2l0
aCB0aGUgYWRkaXRpb25hbCBsaWNlbnNlIGNoYW5nZXMuPC9kaXY+PC9kaXY+DQo=
--001a1143e124af0ea90546bf37dd--
