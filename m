From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 6/6] mfd: dt: Move syscon bindings to syscon
 subdirectory
Date: Tue, 13 Dec 2016 15:23:13 +1030
Message-ID: <1481604793.3112.32.camel@aj.id.au>
References: <20161206025321.1792-1-andrew@aj.id.au>
         <20161206025321.1792-7-andrew@aj.id.au>
         <20161212153911.drhczoagyyhu7jm4@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-cxXXHkhny37++GJzoGIn"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161212153911.drhczoagyyhu7jm4@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Corey Minyard <minyard@acm.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--=-cxXXHkhny37++GJzoGIn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-12-12 at 09:39 -0600, Rob Herring wrote:
> On Tue, Dec 06, 2016 at 01:53:21PM +1100, Andrew Jeffery wrote:
> > The use of syscons is growing, lets collate them in their own part of
> > the bindings tree.
> >=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0Documentation/devicetree/bindings/mfd/{ =3D> syscon}/aspeed-scu.t=
xt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0
> > =C2=A0Documentation/devicetree/bindings/mfd/{ =3D> syscon}/atmel-gpbr.t=
xt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0
> > =C2=A0Documentation/devicetree/bindings/mfd/{ =3D> syscon}/atmel-matrix=
.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0
> > =C2=A0Documentation/devicetree/bindings/mfd/{ =3D> syscon}/atmel-smc.tx=
t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0
> > =C2=A0Documentation/devicetree/bindings/mfd/{ =3D> syscon}/qcom,tcsr.tx=
t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0
> > =C2=A0Documentation/devicetree/bindings/mfd/{ =3D> syscon}/syscon.txt=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0| 0
> > =C2=A0.../devicetree/bindings/mfd/{ =3D> syscon}/ti-keystone-devctrl.tx=
t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0
> > =C2=A07 files changed, 0 insertions(+), 0 deletions(-)
> > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/aspee=
d-scu.txt (100%)
> > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/atmel=
-gpbr.txt (100%)
> > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/atmel=
-matrix.txt (100%)
> > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/atmel=
-smc.txt (100%)
> > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/qcom,=
tcsr.txt (100%)
> > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/sysco=
n.txt (100%)
> > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/ti-ke=
ystone-devctrl.txt (100%)
>=20
> I'm not so sure this is the right direction. syscon usage is pretty much=
=C2=A0
> spread throughout the tree.

This patch was created based on my interpretation of Lee's feedback
here:

https://lkml.org/lkml/2016/11/18/650

Lee's next email in the chain poked Arnd for an opinion, but Arnd
didn't reply.

I don't mind. I moved these bindings separately so we could just drop
the patch if there was push-back. If we drop the whole idea I'll need
to apply a small fix to patch 5/6 to avoid creating the syscon
subdirectory.

Andrew

>=20
> Rob
--=-cxXXHkhny37++GJzoGIn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYT365AAoJEJ0dnzgO5LT5TXwQALSwwQVD641rIc4oybJUS2tw
uSWwEOPyAcrjnVazMgoF63Ok5r2OXzLa49MelCDO+RsnOVUU+9qDtDvq2WLDtbTJ
+9vVVwCd6dB1TzrCW5Lhesn3pap57wHpeIPXM3zyKufzTb2kI2z0bYJhk+3pgTba
Evt1JA5jGwuWErTWYqK3WGGSbLxtIbjJWAPiR0RwP8dt70ZJesKbRRErcrrcK12h
svMuCP2QHj4Vq72l+t2HqA4O2Kg4EDD0iGdzbzdprzJqJ085iwwmcYO/JM2NU+Uq
UzLZy+axoWvwiCbAISeuf2eTazUXa1/z615jL3ggXO62raoOp/7sX7jjUl9bnhas
hDCUIpxbVoGN2HVu2pzY6p2qTrRWlcuTPDjDyepsnFfjX/enkP8OwVyhdRiGQNHs
v7BWv+zmsWnxGFnI5m5VU/qPylwLzhZa2zQngMjHXP/LHyOpazKhe9dfkyOQCnBu
56LGJXWBafmVSG2DxsE6GEc161+m52gcUlj21XuUQDYCKGBdMHCjT76nzVffFey4
s4wJAXu2tjrsB8AriZFgo8R3CZ2/kXOuY6u+xQqZ9mOifsaDvDdSgNiOlwdj19PN
57Xe4nlxng/HhGFwPusZuk5x6XNJ5sfHlpndl1mxyR4gWdRIWhf+pdACFIB3i2DX
hk2+KGr5w1O3jGfqf0dU
=ZtFX
-----END PGP SIGNATURE-----

--=-cxXXHkhny37++GJzoGIn--
