From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun8i: Add common dtsi file for NanoPi SBCs
Date: Thu, 20 Oct 2016 18:04:43 +0200
Message-ID: <20161020160443.kbdtp626kvibgte4@lukather>
References: <20161020080701.15993-1-woogyom.kim@gmail.com>
 <20161020080701.15993-2-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xkmcu5sdthema2w7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161020080701.15993-2-woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, James Pettigrew <james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xkmcu5sdthema2w7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 20, 2016 at 05:06:59PM +0900, Milo Kim wrote:
> This patch provides a common file for NanoPi M1 and Neo SBC.
>=20
> Those have common features below.
>   * UART0
>   * 2 LEDs
>   * USB host (EHCI3, OHCI3) and PHY
>   * MicroSD
>   * GPIO key switch
>=20
> Cc: James Pettigrew <james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
> Signed-off-by: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3-nanopi.dtsi | 143 +++++++++++++++++++++++++++=
++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi b/arch/arm/boot/dts/s=
un8i-h3-nanopi.dtsi
> new file mode 100644
> index 0000000..e89ca6f
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
> @@ -0,0 +1,143 @@
> +/*
> + * Copyright (C) 2016 Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This looks like a copy of James' DT. Keeping him as the copyright
holder seems like the right thing to do.

> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
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
> +#include "sun8i-h3.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&leds_npi>, <&leds_r_npi>;
> +
> +		status {
> +			label =3D "nanopi:blue:status";
> +			gpios =3D <&pio 0 10 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +
> +		pwr {
> +			label =3D "nanopi:green:pwr";
> +			gpios =3D <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "on";
> +		};
> +	};
> +
> +	r_gpio_keys {
> +		compatible =3D "gpio-keys";
> +		input-name =3D "k1";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&sw_r_npi>;
> +
> +		k1@0 {
> +			label =3D "k1";
> +			linux,code =3D <KEY_POWER>;
> +			gpios =3D <&r_pio 0 3 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&ehci3 {
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>;
> +	cd-inverted;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin>;
> +	status =3D "okay";
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +};
> +
> +&ohci3 {
> +	status =3D "okay";
> +};
> +
> +&pio {
> +	leds_npi: led_pins@0 {
> +		allwinner,pins =3D "PA10";
> +		allwinner,function =3D "gpio_out";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +};
> +
> +&r_pio {
> +	leds_r_npi: led_pins@0 {
> +		allwinner,pins =3D "PL10";
> +		allwinner,function =3D "gpio_out";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +
> +	sw_r_npi: key_pins@0 {
> +		allwinner,pins =3D "PL3";
> +		allwinner,function =3D "gpio_in";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&usbphy {
> +	status =3D "okay";
> +};
> --=20
> 2.9.3
>=20

Looks good otherwise.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xkmcu5sdthema2w7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCOsbAAoJEBx+YmzsjxAg6hsP/2uAeljf0iEd6pLfcv6oUkrC
j3NKhGm57dL4oBTK1Osu9fmoP1l7XSfrW5Q0xg5871sSPpRjCXTkJOsqU0M0r1mY
LsJrcklsyiXLxzeAIH470m+4cK3zux7NC4ZhmXO5yKpKIsEw5+M5JhwB+W3nEVwI
Yfo9YgPBbyAhVNAiIbKEkcW4zNgDbThCGpcnT2UlXZAoeZdx8UoEpQgOUQAeNkUd
4t3tRgGoPaALUwD+0f9dJqtl7sCakZjQJ6UUfsGyf178JlcAvttkhJ5ce6owjNgh
nkpGvPy1bCMnD3YY8zSl0QuSw9hLEpaus0BRptE/XazZHsaXxKWFOdCUaAkDYbnw
OlBBVqRmFHOSyOfxgZf4hVp9tQHBwoeF15PnG2mx5wzYxybGnxsGfHL0FhsEk/Ts
Ao1p32jssUHFhOTr+iiwJqxgKykhq7ezZFDeHSfjfukeDfOCygkWiS0U3PWWco5U
w5/hp7Z1WFLm028klel274ivRDdkHwIKvzPHGbsPUIfj9MYA+QCc3w/amwwMH+rM
a+m+sRAQPL/pS3yrhyctub8fZ9pi96HsLa3WCvaCZKGzQAMBe+CtxcPHnR1mKvQk
F9JDumg/2653vlZG4+wz/o2QNjpM8qgeqTyk/ZkYQ5NPqYI1UmHPG1R4RlNCeENv
O24sw1ibs0frDJyX28kz
=Kevb
-----END PGP SIGNATURE-----

--xkmcu5sdthema2w7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
