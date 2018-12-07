From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH v3] ARM: dts: Add support for Liebherr's BK4 device
 (vf610 based)
Date: Fri, 7 Dec 2018 10:29:50 +0100
Message-ID: <20181207102950.68796cf0@jawa>
References: <20180921152726.31742-1-lukma@denx.de>
        <20181009105028.17971-1-lukma@denx.de>
        <CAOMZO5BN5KJ+s6F9CJXQPX=Ta0Ow0PaV_AmFHYSDNr78jLjziQ@mail.gmail.com>
        <20181206092255.2359f7e6@jawa>
        <CAOMZO5CE2ei-Pu-85zpYHTg-MamMT3DahLxBHNFjX4uLEi1XWg@mail.gmail.com>
        <20181206140840.53d49cd6@jawa>
        <CAOMZO5CUfN7uLf7bsw6Xg4+TNrRYodw11Ekg5ypqyXU6q-UFtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eOd0DIfTyV7kvaKrSrv+R8x"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5CUfN7uLf7bsw6Xg4+TNrRYodw11Ekg5ypqyXU6q-UFtg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

--Sig_/eOd0DIfTyV7kvaKrSrv+R8x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Lukasz,
>=20
> On Thu, Dec 6, 2018 at 11:08 AM Lukasz Majewski <lukma@denx.de> wrote:
>=20
> > I will check this latter this week... =20
>=20
> Reading the spi dt-binding it states that the spi slave node is
> optional.
>=20
> If I remove it like this, then the warning is gone:

Unfortunately, the "slave" node is necessary - the "lwn,bk4" compatible
causes the spidev driver to be bound.=20

Use space applications on this system use it to perform SPI
transmission.

IMHO, removing the node is not a solution - we shall discover why on
current next we do see such errors.

>=20
> --- a/arch/arm/boot/dts/vf610-bk4.dts
> +++ b/arch/arm/boot/dts/vf610-bk4.dts
> @@ -109,12 +109,6 @@
>         bus-num =3D <3>;
>         status =3D "okay";
>         spi-slave;
> -
> -       slave@0 {
> -               compatible =3D "lwn,bk4";
> -               spi-max-frequency =3D <30000000>;
> -               reg =3D <0>;
> -       };
>  };
>=20
>  &edma0 {
>=20
> Does spi slave still work without it?


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/eOd0DIfTyV7kvaKrSrv+R8x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlwKPY4ACgkQAR8vZIA0
zr2RUgf/YnEIV68dKxAVESsSbAZT8jOZkqAz/boXBXrfzYkXZRBbygWJwH0DpW1Y
KXADq+lujl2DIWo+Ip4usgcOoRteRv8yTzJEGGzN8Xkpufm10l9+bheJr2vJDF0q
vmwdpFqhd5zo5L9gJBkQDh06GD10zTVWjN+FdvivEw5b8Je04HZtbqyDAirPB4FH
kRxRZjxSAQHEEoU3tkzjCxG/36qt44ZXJwmP62L/qOYzPdO82UpCXQAlQlOhXzO4
aXSMf/BmM0i9M5LfCNRZw6isYM7diTVZnkhtVI0OcBKeNpqZSGEcEO8B9eQyOeml
bksQDEKef00es8wxCu3IpG5ezd9VlQ==
=weB6
-----END PGP SIGNATURE-----

--Sig_/eOd0DIfTyV7kvaKrSrv+R8x--
