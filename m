From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2] ARM: sun8i: h3: bluetooth for Banana Pi M2 Zero
 board
Date: Sun, 7 Apr 2019 22:23:21 +0200
Message-ID: <20190407222321.11ec297d@kemnade.info>
References: <20190301185212.26837-1-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1UsG1.G7V3JcR7JXg8+bK4C"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301185212.26837-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

--Sig_/1UsG1.G7V3JcR7JXg8+bK4C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

ping

On Fri,  1 Mar 2019 19:52:12 +0100
Andreas Kemnade <andreas@kemnade.info> wrote:

> The Banana Pi M2 Zero board has an AP6212 BT+Wifi combo chip
> with broadcom internals attached to UART1 and some gpios.
> This addition is in line with similar boards
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> changes in v2: remove pinctrl things
>  arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts b/arch/=
arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> index 1db2541135a7..57432d0500b1 100644
> --- a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> @@ -69,6 +69,8 @@
>  		compatible =3D "mmc-pwrseq-simple";
>  		pinctrl-names =3D "default";
>  		reset-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
> +		clocks =3D <&rtc 1>;
> +		clock-names =3D "ext_clock";
>  	};
>  };
> =20
> @@ -122,7 +124,20 @@
>  &uart1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> +	uart-has-rtscts;
>  	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "brcm,bcm43438-bt";
> +		clocks =3D <&rtc 1>;
> +		clock-names =3D "lpo";
> +		vbat-supply =3D <&reg_vcc3v3>;
> +		vddio-supply =3D <&reg_vcc3v3>;
> +		device-wakeup-gpios =3D <&pio 6 13 GPIO_ACTIVE_HIGH>; /* PG13 */
> +		host-wakeup-gpios =3D <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
> +		shutdown-gpios =3D <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
> +	};
> +
>  };
> =20
>  &usb_otg {
> --=20
> 2.11.0
>=20
>=20

--Sig_/1UsG1.G7V3JcR7JXg8+bK4C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAlyqXDkACgkQl4jFM1s/
ye/6QA/9F7JlHYlAs4ezxtgZ5wAWgUEB8VkmuKORtYctV3gF3wChZJ0PESl15yis
dgVX2SpOGCu1V3SFBc3tg+0o8Cspbku/cXJgRnTX3C5I128S693f/C4aVYmc3NSj
QxA7ZYhWigr4SNzophqhMTJXQwXDzUOR+YLW1QVdRD51uHezuKpHWFPlqHbBBCe6
PTmkAk39NBxIUY+4Oa0t7x3RG5WgKfpf1lrs6f7lEICX9b1swps0YfcL777b5YF/
AuuQ/W/iB8LBBU1i8HkiCRUf1izpV/o5RKg8Lqg7V24Vb4GXQIafk52IQpJlvpZ/
9kbq3QrEj4uBEImuZRG87/hPTYaUlV8arZKUWsxP7/bu9xtV2o3GBHjAbjY6we6E
OVWr4ywdVxtj/L25C2FoID8Zm67bW2zp2JSqUyVX/XKsG5nFI5T1fWo8+hrj+8eJ
EQqG6JTx54ezsLt28+5XsDBGrVsVwcEC1oxMaGrkzrySr3tAg1k/OBFI+SMwWpfC
K3konOdYdZOOZQNDo5wia6U4YeVDeBXgfv7iecN4C/Y2/dv6fpfswrGZlcMyAFMc
69PzbyYx1SJbD7tvgACybboLJ9cTwbEl4tO/vWNIhVJt2prgXTZuKyyXpnPw28hK
5pB1jBHmIDuzZ/YnWsH2JFTv6ANxn8eVjVhCdJaaoaBy2agAuPU=
=6gcg
-----END PGP SIGNATURE-----

--Sig_/1UsG1.G7V3JcR7JXg8+bK4C--
