From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: meson-gxbb: Add support for the Nexbox A95X Board
Date: Thu, 01 Sep 2016 14:05:47 -0700
Message-ID: <m2oa47ib4k.fsf@baylibre.com>
References: <1471951370-29269-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471951370-29269-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Neil
        Armstrong's message of "Tue, 23 Aug 2016 13:22:50 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Neil,

Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile               |  1 +
>  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 79 ++++++++++++++++=
++++++
>  2 files changed, 80 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts

Can we add this patch to your gx/gxbb/gxl breakup series?

Some other minor nits below...

> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/a=
mlogic/Makefile
> index 47ec703..2c50439 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxbb-p201.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxbb-vega-s95-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxbb-vega-s95-meta.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxbb-vega-s95-telos.dtb
> +dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxbb-nexbox-a95x.dtb
>=20=20
>  always		:=3D $(dtb-y)
>  subdir-y	:=3D $(dts-dirs)
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arc=
h/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> new file mode 100644
> index 0000000..c418bd7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> @@ -0,0 +1,79 @@
> +/*
> + * Copyright (c) 2016 Andreas F=C3=A4rber
> + * Copyright (c) 2016 BayLibre, Inc.
> + * Author: Neil Armstrong <narmstrong-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This library is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This library is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-gxbb.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	compatible =3D "nexbox,a95x", "amlogic,meson-gxbb";

>From checkpatch:

ARNING: DT compatible string "nexbox,a95x" appears un-documented --
check ./Documentation/devicetree/bindings/
#78: FILE: arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts:51:
+       compatible =3D "nexbox,a95x", "amlogic,meson-gxbb";

WARNING: DT compatible string vendor "nexbox" appears un-documented --
check ./Documentation/devicetree/bindings/vendor-prefixes.txt
#78: FILE: arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts:51:
+       compatible =3D "nexbox,a95x", "amlogic,meson-gxbb";


> +	model =3D "NEXBOX A95X";
> +=09

And some trailing whitespace here.

> +	aliases {
> +		serial0 =3D &uart_AO;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	memory@0 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x0 0x0 0x40000000>;
> +	};
> +};
> +
> +&uart_AO {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&uart_ao_a_pins>;
> +	pinctrl-names =3D "default";
> +};
> +
> +&ethmac {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&eth_pins>;
> +	pinctrl-names =3D "default";
> +};
> +

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
