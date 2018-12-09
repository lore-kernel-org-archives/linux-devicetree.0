From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH v3] ARM: dts: Add support for Liebherr's BK4 device
 (vf610 based)
Date: Sun, 9 Dec 2018 23:20:11 +0100
Message-ID: <20181209232011.715a32c0@jawa>
References: <20180921152726.31742-1-lukma@denx.de>
        <20181009105028.17971-1-lukma@denx.de>
        <CAOMZO5BN5KJ+s6F9CJXQPX=Ta0Ow0PaV_AmFHYSDNr78jLjziQ@mail.gmail.com>
        <20181206092255.2359f7e6@jawa>
        <CAOMZO5CE2ei-Pu-85zpYHTg-MamMT3DahLxBHNFjX4uLEi1XWg@mail.gmail.com>
        <20181206140840.53d49cd6@jawa>
        <CAOMZO5CUfN7uLf7bsw6Xg4+TNrRYodw11Ekg5ypqyXU6q-UFtg@mail.gmail.com>
        <20181207102950.68796cf0@jawa>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tIsFC8=e+p_Q2_86C7zLMgM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207102950.68796cf0@jawa>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

--Sig_/tIsFC8=e+p_Q2_86C7zLMgM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Fabio,
>=20
> > Hi Lukasz,
> >=20
> > On Thu, Dec 6, 2018 at 11:08 AM Lukasz Majewski <lukma@denx.de>
> > wrote:=20
> > > I will check this latter this week...   =20
> >=20
> > Reading the spi dt-binding it states that the spi slave node is
> > optional.
> >=20
> > If I remove it like this, then the warning is gone: =20
>=20
> Unfortunately, the "slave" node is necessary - the "lwn,bk4"
> compatible causes the spidev driver to be bound.=20
>=20
> Use space applications on this system use it to perform SPI
> transmission.
>=20
> IMHO, removing the node is not a solution - we shall discover why on
> current next we do see such errors.

It seems like those errors were present earlier:

https://www.lkml.org/lkml/2018/9/20/106

and=20

https://www.lkml.org/lkml/2018/9/20/669

It seems like the commit: 5a2ecf0de0d3d7a79e21397ad530904a72b903bb
seems to fix the issue.

But I don't know why it doesn't work in this case.

>=20
> >=20
> > --- a/arch/arm/boot/dts/vf610-bk4.dts
> > +++ b/arch/arm/boot/dts/vf610-bk4.dts
> > @@ -109,12 +109,6 @@
> >         bus-num =3D <3>;
> >         status =3D "okay";
> >         spi-slave;
> > -
> > -       slave@0 {
> > -               compatible =3D "lwn,bk4";
> > -               spi-max-frequency =3D <30000000>;
> > -               reg =3D <0>;
> > -       };
> >  };
> >=20
> >  &edma0 {
> >=20
> > Does spi slave still work without it? =20
>=20
>=20
> Best regards,
>=20
> Lukasz Majewski
>=20
> --
>=20
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> lukma@denx.de




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/tIsFC8=e+p_Q2_86C7zLMgM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlwNlRsACgkQAR8vZIA0
zr3TKwf/XIc3zzc87BV7eEiUqLiYWK3uQOCnO+wNoP6NF4U0d8CLzKPNd09gBUw8
TVf2NXKsvfIf8xZnERTYhwf+Cwo7aW/1JpH4+76yVcZdA2zZ90vpiUMyqNH0Vup8
SzuDghi9N0fvkTqiH2Fm7hStjMPbstnw68UEbLPLipWPHQyo6WMsAU54NFVo9XJ+
5Hp2GScz5ziQRwjL4y/TdxokUMarKaEzPDM6j4pLBxJTYq7kwi645vXXOjbj2Ri1
pK/bHunfkEESw2YoXaYrxxH+GxUYNR8ylLBPPQOH1Ik6wxRLG5srmUlZ2ddQnUjs
nUUl+3thrFEioEquVAO83+Iwu4X2mA==
=srFS
-----END PGP SIGNATURE-----

--Sig_/tIsFC8=e+p_Q2_86C7zLMgM--
