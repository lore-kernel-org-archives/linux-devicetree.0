From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] ARM: DTS: vybrid: Update qspi node description for
 VF610 BK4 board
Date: Tue, 30 Jul 2019 17:53:36 +0200
Message-ID: <20190730175336.382d833c@jawa>
References: <20190730150552.24927-1-lukma@denx.de>
        <CAOMZO5AxPHHobQQhq30fjLVeSroLdvdT0+GqCWi8it1ejhDONA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Hls2KDiiZhS_2XwqOwjo/0W"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5AxPHHobQQhq30fjLVeSroLdvdT0+GqCWi8it1ejhDONA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

--Sig_/Hls2KDiiZhS_2XwqOwjo/0W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Lukasz,
>=20
> Subject line could be improved:
>=20
> ARM: dts: vf610-bk4: Fix qspi node description
>=20
> On Tue, Jul 30, 2019 at 12:06 PM Lukasz Majewski <lukma@denx.de>
> wrote:
> >
> > Before this change the device tree description of qspi node for
> > second memory on BK4 board was wrong (applicable to old, in-house
> > tunned fsl-quadspi.c driver).
> >
> > As a result this memory was not recognized correctly when used
> > with the new spi-fsl-qspi.c driver.
> >
> > From the dt-bindings:
> >
> > "Required SPI slave node properties:
> >   - reg: There are two buses (A and B) with two chip selects each.
> > This encodes to which bus and CS the flash is connected:
> > <0>: Bus A, CS 0
> > <1>: Bus A, CS 1
> > <2>: Bus B, CS 0
> > <3>: Bus B, CS 1"
> >
> > According to above with new driver the second SPI-NOR memory shall
> > have reg=3D<2> as it is connected to Bus B, CS 0. =20
>=20
> I am glad you got it working!
>=20
> This looks very familiar with the suggestion I sent yesterday:
> http://lists.infradead.org/pipermail/linux-mtd/2019-July/090655.html
>=20

Yes, indeed. Deepest apologizes for not adding credits. I will fix it
in v2.

> It is a good practice to give some credit to someone who has helped in
> finding the solution of your problem.
>=20
> Adding a Suggested-by: Fabio Estevam <festevam@gmail.com> would be
> nice here.
>=20
> This also needs a Fixes tag.

Shall I refer to the original commit (which added this DTS)? Or the
original issue posted to linux-mtd [1] ?

Note:

[1] - https://www.spinics.net/lists/linux-mtd/msg08114.html

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/Hls2KDiiZhS_2XwqOwjo/0W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl1AaAAACgkQAR8vZIA0
zr36MQgA4Oorheiqhn9obaiAQFJhr++QNaJEtm0Bs+T2h6ZblLVgYbPqys8+6biN
oLxpS3COrCwo3B8xFK4MxWze3qqyDYKPuse2NqFEW02qIIPPjPKfMNiEY8YIy+p7
5Yas3dvZar13iUmiyVuoTRk2kC7zFHRzv39YM0RHfYbIx+V+IcQTDnAbwkBj4iT/
oSDBq54OR5R7q+CvR1xncl7HzfXP1QwYw8MhEEWsOhhMWQ6sEJp56oz1gnNW5KF/
2Tah7fpuzhsUw+ysmqB3V7lXwvc3BQYIzQhtHWFFYLWjunrqN6kyUH+VXfv5cswV
M5vvDYesZAOADYr1KfN/DCX7JwdLmg==
=WzwS
-----END PGP SIGNATURE-----

--Sig_/Hls2KDiiZhS_2XwqOwjo/0W--
