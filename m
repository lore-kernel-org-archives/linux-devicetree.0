From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sunxi: dts: Add support for the
 cubieboard3, the CubieTruck
Date: Mon, 7 Oct 2013 22:44:09 +0200
Message-ID: <20131007204409.GB3041@lukather>
References: <1380986247-29112-1-git-send-email-oliver+list@schinagl.nl>
 <1380986247-29112-2-git-send-email-oliver+list@schinagl.nl>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBUF2ZSJAKGQEANWZFNA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380986247-29112-2-git-send-email-oliver+list-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: oliver+list-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On Sat, Oct 05, 2013 at 05:17:27PM +0200, oliver+list-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org wrote:
> From: Oliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
>=20
> Cubieboard3, CT

Please change the commit log to something meaningful.

> Signed-off-by: Oliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                 |  1 +
>  arch/arm/boot/dts/sun7i-a20-cubietruck.dts | 60 ++++++++++++++++++++++++=
++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-cubietruck.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index cc0f1fb..171e6c7 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -232,6 +232,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D \
>  	sun5i-a13-olinuxino.dtb \
>  	sun6i-a31-colombus.dtb \
>  	sun7i-a20-cubieboard2.dtb \
> +	sun7i-a20-cubietruck.dtb \
>  	sun7i-a20-olinuxino-micro.dtb
>  dtb-$(CONFIG_ARCH_TEGRA) +=3D tegra20-harmony.dtb \
>  	tegra20-iris-512.dtb \
> diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/d=
ts/sun7i-a20-cubietruck.dts
> new file mode 100644
> index 0000000..0167afe
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> @@ -0,0 +1,60 @@
> +/*
> + * Copyright 2013 Oliver Schinagl
> + *
> + * Oliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
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
> +
> +/ {
> +	model =3D "Cubietech Cubietruck";
> +	compatible =3D "cubietech,cubietech", "allwinner,sun7i-a20";

cubietech,cubietruck :)

> +
> +	soc@01c00000 {
> +		pinctrl@01c20800 {
> +			led_pins_cubietruck: led_pins@0 {
> +				allwinner,pins =3D "PH7", "PH11", "PH20", "PH21";
> +				allwinner,function =3D "gpio_out";
> +				allwinner,drive =3D <0>;
> +				allwinner,pull =3D <0>;
> +			};
> +		};
> +
> +		uart0: serial@01c28000 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&uart0_pins_a>;
> +			status =3D "okay";
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&led_pins_cubietruck>;
> +
> +		blue {
> +			label =3D "cubietruck:blue:usr";
> +			gpios =3D <&pio 7 21 0>;
> +		};

Newline

> +		orange {
> +			label =3D "cubietruck:orange:usr";
> +			gpios =3D <&pio 7 20 0>;
> +		};

Ditto.

> +		white {
> +			label =3D "cubietruck:white:usr";
> +			gpios =3D <&pio 7 11 0>;
> +		};

Ditto.

> +		green {
> +			label =3D "cubietruck:green:usr";
> +			gpios =3D <&pio 7 7 0>;
> +		};
> +	};
> +};
> --=20
> 1.8.1.5
>=20

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSUx0ZAAoJEBx+YmzsjxAgvfUQAMAjplnrQfTPeeCCep4OQQMu
lxFpbmBQ+Um3c1+nex7Y1WpKyR0KIAdh6XW+EQQpMvuLIkzmX4m+EoI7LCPMqt2T
Ct6xL+3qrGD6ifHRgf2irtjFnQMWICP8iskegQcre3Y4hA4eij3jCsKMCA5XTVoI
J1/I7FxdHFAAlxEpbBDojE6cLpZtx5DvIMM60Trsy+9udFL10hGVzoaSNTFT1H0B
yVZ7OYiY9Cf3YG7HZwGNWL1aGSzbVSWMviO1MrUyl8It4W9F/VfWl/LcHn/FQAGD
WP4/GyJ2byGoHFUQpYGOsWn4MckvJqCP2UxUcaVeRLystr03xWVIdr6I9uUCCg+d
G5/MqVhDGwfTHx2T//RKERjsnmZP9GYPNcbKHKW74IwLJzohXxjXRWkYabNleqH2
ULh7tfwN4bh46+63ZGG8QxWFu9Sg46hPbJ0rG+ETk7qgWuQein0ngcJag3PREC1Z
VN7cW7xmM1ukyRGkNuhQ+OCxo2QZTA+1MJf+Dq+r2Dgo7Uwqm4M/Lp8rf7PgFniy
d1JB072Y5ZVg1zo8U1N5e/IA3njWMpbJrpn9J9JQTtwl9PRtL6DTnafMiq+tEt7Q
sxl79UCxQq+vzWIcVCqXOfYMGeIu/HEXkUbjq3lfz0WVBs23ll63TET2GfuNbBsP
oBzp3DPWb3JxLY5V8JBl
=4MLT
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
