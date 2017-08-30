From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 4/7] ARM: dts: sun8i: h3: Enable AP6212 WiFi on mmc1 on
 Nanopi M1 Plus
Date: Wed, 30 Aug 2017 16:52:11 +0200
Message-ID: <20170830145211.snicbwdytobtd7ro@flea.lan>
References: <1504062070-13523-1-git-send-email-embed3d@gmail.com>
 <1504062070-13523-5-git-send-email-embed3d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cf6ljkg5cxmwxnqv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1504062070-13523-5-git-send-email-embed3d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Rossak <embed3d@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--cf6ljkg5cxmwxnqv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 30, 2017 at 05:01:07AM +0200, Philipp Rossak wrote:
> From: Philipp Rossak <embed3d@gmail.com>
>=20
> The WiFi side of the AP6212 WiFi/BT combo module is connected to
> mmc1. There are also GPIOs for enable and interrupts.
>=20
> Enable WiFi on this board by enabling mmc1 and adding the power
> sequencing clocks and GPIO, as well as the chip's interrupt line.
>=20
> Signed-off-by: Philipp Rossak <embed3d@gmail.com>
> ---
>  arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts | 35 +++++++++++++++++++++=
++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts b/arch/arm/boo=
t/dts/sun8i-h3-nanopi-m1-plus.dts
> index b9c6c27..3054308 100644
> --- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> @@ -48,6 +48,7 @@
> =20
>  	aliases {
>  		ethernet0 =3D &emac;
> +		ethernet1 =3D &ap6212;
>  	};
> =20
>  	reg_gmac_3v3: gmac-3v3 {
> @@ -59,6 +60,14 @@
>  		enable-active-high;
>  		gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>;
>  	};
> +
> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&wifi_en_npi_m1p>;

There's no need for pinctrl nodes when the pin is set to a GPIO.

> +		reset-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
> +	};
> +
>  };
> =20
>  &ehci1 {
> @@ -93,6 +102,25 @@
>  	};
>  };
> =20
> +&mmc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc1_pins_a>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	vqmmc-supply =3D <&reg_vcc3v3>;

You don't need vqmmc in this case.

> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +
> +	ap6212: sdio_wifi@1 {

You're sure you need a label here?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cf6ljkg5cxmwxnqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZptEbAAoJEBx+YmzsjxAgU5oQAMEEV2gLJAJ+WgzMMwyiNWmR
Ko8mO3Ndsvhw+5tlpPIgtxUe5umYql3TizgoWwsZgRchmXuNWn1ZxTtal13bZu+b
JYxF5SAD4Hf+MPbzfo7SBFJrTjqWCfwVRUvzLQoZNkuJEH8y2D9oNctaax36neUO
wGdUOOJs//rGkxyPbSB73XEsNObsl26eozL8Rj/rurW1YEchNy/6OhVWelH2BRob
H2GkoA5LFLZFsmrhKhAtycwn/+WE9o6I+KZvgep2WjA3qpAUpHu6Ejd6Xnc8y9/W
3A3ptwmL0jkzaE7vxweiU0DBH20ku57se5uI8LhbdZe1ljdwiDhSREUQvA1bd6iS
ENm06TL9WsyGYp3aJWmkHKfIJgP3qvUdEVe9N11eTY1xuAdm8rWGIItekbl8/BX4
wJsJ9u8JsXH9o7NDILRTTgiFnC3wPRGUw+Eb4ZZDDDErYole+rHtAJiRMLeQBUMO
JGbDLrftUT2/bCcCBsCAmC7fEjBr7agGz1TNXD/DgZn+odg4ex3tROjpFe6XAHqP
FlIpNdMjzYiBqtGztb4xVv80p0Wq4Jje/Btu7exrasPuYEIIw8Uxh9epGZyZ5Da2
QlTUXOhu4U/y2RFihdHdRxxXNlDI+qy2B3quAnDK4T4E/urOdK1ShlfERk6CXmyq
w0UDQ3o+d/k4I6GU2B1U
=JukS
-----END PGP SIGNATURE-----

--cf6ljkg5cxmwxnqv--
