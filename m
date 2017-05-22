From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: orange-pi-zero: enable SPI NOR
Date: Mon, 22 May 2017 11:29:00 +0200
Message-ID: <20170522092900.7v2mg5zkbt6eclhr@flea.lan>
References: <20170519213550.8434-1-geomatsi@gmail.com>
 <20170519213550.8434-3-geomatsi@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jxrb4eirxmoqhfkc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170519213550.8434-3-geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jxrb4eirxmoqhfkc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Sat, May 20, 2017 at 12:35:50AM +0300, Sergey Matyukevich wrote:
> Enable SPI NOR on orange-pi-zero board.
>=20
> For more information see:
> - http://linux-sunxi.org/Orange_Pi_Zero#SPI_NOR_flash

Same remark here than on the first patch

>=20
> Signed-off-by: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm=
/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> index 34e4a5a80136..fe39e96cee65 100644
> --- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> +++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> @@ -177,3 +177,19 @@
>  	status =3D "okay";
>  	usb0_id_det-gpios =3D <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
>  };
> +
> +&spi0 {
> +	status =3D "okay";
> +
> +	flash@0 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		compatible =3D "mxicy,mx25l1606e", "winbond,w25q128";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <40000000>;

How do the other OPi Zero that doesn't have that SPI flash behave?

> +
> +		partition@00000000 {
> +			reg =3D <0x00000000 0x200000>;	/* 2Mb */
> +		};

There's no need to create a first partition, this needs to be
user-defined.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jxrb4eirxmoqhfkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZIq9bAAoJEBx+YmzsjxAgvhAP/34tbf7Mq/xOb+Uq5Orkuw3M
NzGBB0tvkpJeBSK/HZvXNw4sujV7ucCzROcpa1641bj87ZGpSe+zHjvbUdY9QqUL
2JNYUXycQpUi3zslsugW4dMkmxGDO/EihS//j0k4d2jADDsm4PcjThSYgkk0H+A1
10H3kN1XFzBg9gxehRNajmYp8L9D/Kn5vuA/52ZpHo2bx7OkY3WkhY//7kfFN6ub
V5NgRD/kmqt3UIuhtEsVmYqUx89u6ehcuRFs+IM3BsdQVH9xgA05RZ6MNAgoltaX
LMaJBJBfywaeIBzpqwoFIvlK7pm01/hTfilKLowzWnHmk6wG6bryv9Z0NLu77H12
T34U0EcyPYozgMaYm6T/YrFEa/pyaPajy7YT9aJRIc76GNeqGM34vHOJ46j9ySVm
ZIHFIMl8hOT2ic+b+D7+BCilBzcLaqt4ycZWjt9HZhrn70fFxwDDiSfXGIh5AFun
CbnUA/zHxfYsSAdybzKFMMcAoiVSNaSZdE9nAfxRWcaIC6t5OWcP5Xd0w3qK4yIC
TfnHNpjM14alsVx5HXB2WCfJs4THldG8vGusV9XmX9rROSQEg1a3ThMLr/bIGDeY
QiigZHryaEe5es59LyY1M02Ahv2kczLAPGL/QGtdfxGMIQcVXOwOB5sCc8j/t5wE
FCH3c5kvEmdlLJSYMJHk
=/16s
-----END PGP SIGNATURE-----

--jxrb4eirxmoqhfkc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
