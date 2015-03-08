From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: add cubietech cubieboard4
Date: Sun, 8 Mar 2015 18:28:58 +0100
Message-ID: <20150308172858.GI5085@lukather>
References: <1425684905-23652-1-git-send-email-tyler.baker@linaro.org>
 <1425684905-23652-2-git-send-email-tyler.baker@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pe+tqlI1iYzVj1X/"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425684905-23652-2-git-send-email-tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pe+tqlI1iYzVj1X/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tyler,

On Fri, Mar 06, 2015 at 03:35:04PM -0800, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
> From: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> Add a Cubietech Cubieboard4 device tree and instruct make to build it. Th=
is
> device tree has been derived from the sun9i-a80-optimus.dts as they are v=
ery
> similar in design[1]. Notably, I2C3 is not used on Cubieboard4 and the LE=
D/PWM
> definitions will need to be updated in the future.
>=20
> [1] http://dl.cubieboard.org/model/cc-a80/Hardware/CC-A80-HW-V1.1.pdf
>=20
> Signed-off-by: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                  |   3 +-
>  arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 100 ++++++++++++++++++++++=
++++++
>  2 files changed, 102 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 4837044..0f67dab 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -553,7 +553,8 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-a23-ippo-q8h-v5.dtb \
>  	sun8i-a23-ippo-q8h-v1.2.dtb
>  dtb-$(CONFIG_MACH_SUN9I) +=3D \
> -	sun9i-a80-optimus.dtb
> +	sun9i-a80-optimus.dtb \
> +	sun9i-a80-cubieboard4.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) +=3D \
>  	tegra20-harmony.dtb \
>  	tegra20-iris-512.dtb \
> diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boot/=
dts/sun9i-a80-cubieboard4.dts
> new file mode 100644
> index 0000000..b239b39
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
> @@ -0,0 +1,100 @@
> +/*
> + * Copyright 2015 Tyler Baker
> + *
> + * Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> + * Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
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
> +#include "sun9i-a80.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	model =3D "Cubietech Cubieboard4";
> +	compatible =3D "cubietech,a80-cubietruck", "allwinner,sun9i-a80";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		bootargs =3D "earlyprintk console=3DttyS0,115200";

It would be great not to use earlyprintk, just in case we have a
kernel compiled with earlyprintk support, but for another SoC.

And while we're at it, using stdout-path would allow use to get rid of
the bootargs entirely.

> +	};
> +
> +};
> +
> +&pio {
> +

This new line is not needed.

> +	mmc0_cd_pin_cubieboard4: mmc0_cd_pin@0 {
> +		allwinner,pins =3D "PH18";
> +		allwinner,function =3D "gpio_in";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> +	};
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins>, <&mmc0_cd_pin_cubieboard4>;
> +	vmmc-supply =3D <&reg_vcc3v0>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 7 18 GPIO_ACTIVE_HIGH>; /* PH18 */
> +	cd-inverted;
> +	status =3D "okay";
> +};
> +
> +&mmc2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc2_8bit_pins>;
> +	vmmc-supply =3D <&reg_vcc3v0>;
> +	bus-width =3D <8>;
> +	non-removable;
> +	status =3D "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pins_a>;
> +	status =3D "okay";
> +};

Looks good otherwise, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--pe+tqlI1iYzVj1X/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU/IbaAAoJEBx+YmzsjxAg6sMP/2TOG+Xd8/afFsAxi/isTCuO
ZBqUckaAXLw10a4W/wPh/D0Vm0zVG57Eor72wazA7mkgZBqxInGZ3PPUJheb474k
PIULWG2Q44wZJ0+aOwryF/3CfhIkcBOPcC+szrpNDLq8Uuh0/301xbMaraqMnmp1
VOxmk+jK+pcmW2OuiLrJ+8KpxaPGLnNKUJip04DE5sRVgQwqx/fXnhVlVO0b04B4
RvJUyaaLAn4+yilHdhA/BQUSCxBJ/EZEnwc+nl2w3RHWL3L/uAlX+xjFDkFbPNM2
iWQF9QDaBH20+PoYVMHCOsgDUbOOSKbl9KSbdiyAifyFwHoYcXhJg2hkHW5x9434
SX8OyMWi3Vn4uyvq0UH4bSycTqsmMDxkIKkd0u01HdnoUnnSvQwkbRsgw/ODqwmj
hHY0ImSe/ottvOzpvV8BY3Rmqc/3wZHy5otBDWkMwPxvr0HCD+3Y0pJkG3dwJAXu
HrZB61VkRf/h5UKu2TDGmudlSUFjDn+hazya3aMYaJTE7hqhK0ANkqfBugdPVoEk
fsBkQyC/WI8XV48UgwtWbqkhiXUPcdqykWOeLm9x2UMwhHGJzxYPMlhsA4NsrsSQ
7BzMhTnOGigbmBwPht1R8x/7uPpMSLkPnPg7cxjEHBO9TNEUfs0hwA9BGrvd1EEr
S+o+seclhk9wquhzTi7E
=Yqi6
-----END PGP SIGNATURE-----

--pe+tqlI1iYzVj1X/--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
