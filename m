From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: add support for Pinebook
Date: Sat, 25 Feb 2017 15:14:02 +0800
Message-ID: <9241341488006842@web3g.yandex.ru>
References: <20170225070032.35834-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBPO5YTCQKGQE2CDIZBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170225070032.35834-1-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



25.02.2017, 15:01, "Icenowy Zheng" <icenowy-ymACFijhrKM@public.gmane.org>:
> Pinebook is a A64-based laptop produced by Pine64, with the following
> peripherals:
>
> USB:
> - Two external USB ports (one is directly connected to A64's OTG
> controller, the other is under a internal hub connected to the host-only
> controller.)
> - USB HID keyboard and touchpad connected to the internal hub.
> - USB UVC camera connected to the internal hub.
>
> Power-related:
> - A DC IN jack connected to AXP803's DCIN pin.
> - A Li-Polymer battery connected to AXP803's battery pins.
>
> Storage:
> - An eMMC by Foresee on the main board (in the product revision of the
> main board it's designed to be switchable).
> - An external MicroSD card slot.
>
> Display:
> - An eDP LCD panel (1366x768) connected via an ANX6345/ANX9807 RGB-eDP
> bridge.
> - A mini HDMI jack.
>
> Misc:
> - A Hall sensor designed to detect the status of lid, connected to GPIO P=
H10.
> - A headphone jack connected to the SoC's internal codec.
> - A BMA223 gravity sensor connected to the SoC's I2C1 bus. (Not
> supported yet)
> - A debug UART port muxed with one of the USB ports, only available on
> product revision of the main board.
>
> This commit adds basical support for it, with out-of-tree patches for
> display support the laptop can be basically usable.
>
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
> =C2=A0arch/arm64/boot/dts/allwinner/Makefile | 1 +
> =C2=A0.../boot/dts/allwinner/sun50i-a64-pinebook.dts | 123 ++++++++++++++=
+++++++
> =C2=A02 files changed, 124 insertions(+)
> =C2=A0create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pineboo=
k.dts
>
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index bc6f342be59f..893520c39955 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -1,4 +1,5 @@
> =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-bananapi-m64.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pinebook.dtb
> =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pine64-plus.dtb sun50i-a64=
-pine64.dtb
>
> =C2=A0always :=3D $(dtb-y)
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch=
/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> new file mode 100644
> index 000000000000..2dceba3132b0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> @@ -0,0 +1,123 @@
> +/*
> + * Copyright (c) 2016 ARM Ltd.
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + * a) This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + * b) Permission is hereby granted, free of charge, to any person
> + * obtaining a copy of this software and associated documentation
> + * files (the "Software"), to deal in the Software without
> + * restriction, including without limitation the rights to use,
> + * copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following
> + * conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> + * included in all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-a64.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>

Sorry but I missed a line here:

#include <dt-bindings/input/input.h>

It's for the switch code for gpio_keys part (it's used to describe
the Hall sensor).

> +
> +/ {
> + model =3D "Pinebook";
> + compatible =3D "pine64,pinebook", "allwinner,sun50i-a64";
> +
> + aliases {
> + serial0 =3D &uart0;
> + };
> +
> + chosen {
> + stdout-path =3D "serial0:115200n8";
> + };
> +
> + gpio_keys {
> + compatible =3D "gpio-keys";
> +
> + lid_switch {
> + label =3D "Lid Switch";
> + gpios =3D <&pio 7 10 GPIO_ACTIVE_LOW>; /* PH10 */
> + linux,input-type =3D <EV_SW>;
> + linux,code =3D <SW_LID>;
> + linux,can-disable;
> + };
> + };
> +
> + reg_vcc3v3: vcc3v3 {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "vcc3v3";
> + regulator-min-microvolt =3D <3300000>;
> + regulator-max-microvolt =3D <3300000>;
> + };
> +};
> +
> +&ehci1 {
> + status =3D "okay";
> +};
> +
> +&mmc0 {
> + pinctrl-names =3D "default";
> + pinctrl-0 =3D <&mmc0_pins>;
> + vmmc-supply =3D <&reg_vcc3v3>;
> + cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>;
> + cd-inverted;
> + disable-wp;
> + bus-width =3D <4>;
> + status =3D "okay";
> +};
> +
> +&mmc2 {
> + pinctrl-names =3D "default";
> + pinctrl-0 =3D <&mmc2_pins>;
> + vmmc-supply =3D <&reg_vcc3v3>;
> + bus-width =3D <8>;
> + non-removable;
> + cap-mmc-hw-reset;
> + status =3D "okay";
> +};
> +
> +&ohci1 {
> + status =3D "okay";
> +};
> +
> +&uart0 {
> + pinctrl-names =3D "default";
> + pinctrl-0 =3D <&uart0_pins_a>;
> + status =3D "okay";
> +};
> +
> +&usb_otg {
> + dr_mode =3D "host";
> + status =3D "okay";
> +};
> +
> +&usbphy {
> + status =3D "okay";
> +};
> --
> 2.11.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
