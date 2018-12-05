From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] ARM: dts: Provide support for reading ID code from MVB
 device (BK4)
Date: Wed, 5 Dec 2018 17:40:04 +0100
Message-ID: <20181205174004.71f54042@jawa>
References: <20181113121213.14296-1-lukma@denx.de>
        <20181126143619.GB31334@dragon>
        <20181203103333.111c2463@jawa>
        <CAOMZO5AJPiexbvHUq+vsz5zz6gNwL3O1KJ9ka_XPFotac2Sb=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zBu5tezDSu05=agJwMr.Hrn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5AJPiexbvHUq+vsz5zz6gNwL3O1KJ9ka_XPFotac2Sb=A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

--Sig_/zBu5tezDSu05=agJwMr.Hrn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Lukasz,
>=20
> On Mon, Dec 3, 2018 at 7:33 AM Lukasz Majewski <lukma@denx.de> wrote:
>=20
> > > > +           72xx165@0 { =20
> > >
> > > Please use a generic name for the node. =20
> >
> > This is a bit tricky. =20
>=20
> What about using 'gpio@0' like described in
> Documentation/devicetree/bindings/gpio/gpio-pisosr.txt ?

Seems like a good idea. Thanks.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/zBu5tezDSu05=agJwMr.Hrn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlwH/2QACgkQAR8vZIA0
zr0WLwgAvK6HXDHE6u5f/QF28kmiVcuLqopfyHnLPnGs/EMn/jrcq0Mfpjn9FJ7/
hlmmga8W+4W6bMb7mrdEkfTRRkeORISNn1Y5VXXTnfqFrbRw74L/ooxWcAE+cu0t
KidkntQwMxr6msaLQUy/bJKSHKmDT5YF720dusi3B6lJccmiqckV/23X1v45qE2j
yJL65GpaD3Yyx7eHlYekbipj58GkUYE16s/SxOBr9AyhIkUxWr2ZvtoChohI5ZBp
Xq1uo8mFSqLKmY4Ane1PWQeh3K+6g1jtP5ySa8pNs/VK55xXpkQe/nDuIi5fDT3Y
rYNee+BQ2vaaMbh4O9Hq67GCcx1cRg==
=4+TV
-----END PGP SIGNATURE-----

--Sig_/zBu5tezDSu05=agJwMr.Hrn--
