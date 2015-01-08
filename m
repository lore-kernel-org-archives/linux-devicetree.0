From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: pcduino: Enable user LED and button
 support for pcDuino
Date: Thu, 8 Jan 2015 14:59:53 +0100
Message-ID: <20150108135953.GU7853@lukather>
References: <1420709664-12687-1-git-send-email-wigyori@uid0.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OxWh+UR3R7TveXYN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1420709664-12687-1-git-send-email-wigyori-1V5s5g7wVVk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--OxWh+UR3R7TveXYN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 08, 2015 at 10:34:24AM +0100, Zoltan HERPAI wrote:
> The pcDuino board has LEDs connected to PH15/PH16, and back/home/menu
> buttons to PH17/18/19 respectively. Enable these via gpio-leds and
> gpio-keys. This is shared across the v1 and v2 versions of the board.
>=20
> Tested on a v2 and verified against the schematics of a v1.
>=20
> Signed-off-by: Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
> Acked-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> ---
>  arch/arm/boot/dts/sun4i-a10-pcduino.dts |   57 +++++++++++++++++++++++++=
++++++
>  1 file changed, 57 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun4i-a10-pcduino.dts b/arch/arm/boot/dts/=
sun4i-a10-pcduino.dts
> index 48161ad..c26a6bb 100644
> --- a/arch/arm/boot/dts/sun4i-a10-pcduino.dts
> +++ b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
> @@ -51,6 +51,8 @@
>  #include "sunxi-common-regulators.dtsi"
> =20
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> =20
>  / {
>  	model =3D "LinkSprite pcDuino";
> @@ -64,6 +66,22 @@
>  			status =3D "okay";
>  		};
> =20
> +		pinctrl@01c20800 {
> +			led_pins_pcduino: led_pins@0 {
> +				allwinner,pins =3D "PH15", "PH16";
> +				allwinner,function =3D "gpio_out";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			key_pins_pcduino: key_pins@0 {
> +				allwinner,pins =3D "PH17", "PH18", "PH19";
> +				allwinner,function =3D "gpio_in";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +		};
> +
>  		mdio@01c0b080 {
>  			status =3D "okay";
> =20
> @@ -126,6 +144,45 @@
>  		};
>  	};
> =20
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&led_pins_pcduino>;
> +
> +		tx {
> +			label =3D "pcduino:green:tx";
> +			gpios =3D <&pio 7 15 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		rx {
> +			label =3D "pcduino:green:rx";
> +			gpios =3D <&pio 7 16 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	gpio_keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&key_pins_pcduino>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		button@0 {
> +			label =3D "Key Back";
> +			linux,code =3D <KEY_BACK>;
> +			gpios =3D <&pio 7 17 GPIO_ACTIVE_LOW>;
> +		};
> +		button@1 {
> +			label =3D "Key Home";
> +			linux,code =3D <KEY_HOME>;
> +			gpios =3D <&pio 7 18 GPIO_ACTIVE_LOW>;
> +		};
> +		button@2 {
> +			label =3D "Key Menu";
> +			linux,code =3D <KEY_MENU>;
> +			gpios =3D <&pio 7 19 GPIO_ACTIVE_LOW>;
> +		};
> +	};

Some newlines here would have been nice between the button nodes. I
added them and applied the patch.

Thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--OxWh+UR3R7TveXYN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUro1ZAAoJEBx+YmzsjxAghyMQALapvgashw03q3oOK9N32pTU
ZaJ+lUXPL33+BBzfoEGG8buKgfMVwUE7/UdfeLBTlL9OcwXZOYKpNNw9DT0L0Qzc
P7BhKkyo5YSiZUijEIz1+ts5S5p930L55iILHLcfMT10QankYBHORChuKKHorbDt
LZXkWM7aXC2LiJVOY1qhURNtEPABqVIv0r7vOAzvezjBtIZeMlDaI4IstnRTTrpm
S2GR/EUBSVHHvzfvX05UOKeBzv+CRA6g5DOBfnzWOg2YZRo37843FCiKnYZb0m8n
hEMETEecd8t9DRPI9ifA8Sr0exXzPC66QGTTHS0xmMHFd78Dlg43b0aLkNHphtKh
lACy1Xwxd7BSIsCnmbT4IBwTmioOGC9brtoTSBKtoMR1MYCVCrMrGncWOUXN6aMK
IBz9FKpaPhnTMglHfINnABvw50YizzTUv9Qlv9hhDPv/6iOrq/WBR5Hy0tQLeaR0
94BOX0PZOfl/bN8WZPOAFlbZHII5DDkAdn3KdsKma+lADfLH63OZpmSOjvi/TG0y
0r+B4vNbA5myrwvyDgkWiXaRrhYemgG1beBBeNPjDxVm+8X8CcQJ1cEDBgU3VpLq
yQCC0AovasFuBFbLzFM8mkCq96JRvgoq0IcQ8YLpgZzYVu7ZlvyohZBJxX14Kr2Q
xxNkIfzBJ9JQ1swXfTzF
=8M5+
-----END PGP SIGNATURE-----

--OxWh+UR3R7TveXYN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
