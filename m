From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 2/3] ARM: dts: add Netronix E60K02 board common file
Date: Mon, 7 Oct 2019 07:48:13 +0200
Message-ID: <20191007074813.235869db@kemnade.info>
References: <20190930194332.12246-1-andreas@kemnade.info>
        <20190930194332.12246-3-andreas@kemnade.info>
        <20191006223848.GE19803@latitude>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aB.pTc2IuOjACzyPfRof4hD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191006223848.GE19803@latitude>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com, marex@denx.de, angus@akkea.ca, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Marco Felsch <m.felsch@pengutronix.de>
List-Id: devicetree@vger.kernel.org

--Sig_/aB.pTc2IuOjACzyPfRof4hD
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Mon, 7 Oct 2019 00:38:48 +0200
Jonathan Neusch=E4fer <j.neuschaefer@gmx.net> wrote:

> Thanks for CCing me on this patchset. Nice to see more e-book reader
> related work!
>=20
> A few comments and questions below.
>=20
> On Mon, Sep 30, 2019 at 09:43:31PM +0200, Andreas Kemnade wrote:
> > The Netronix board E60K02 can be found some several Ebook-Readers,
> > at least the Kobo Clara HD and the Tolino Shine 3. The board
> > is equipped with different SoCs requiring different pinmuxes. =20
>=20
> Do I understand it correctly that i.MX6SL and i.MX6SLL are pin-
> compatible so we can use the same pin numbers and GPIO handles in the
> DT?
>=20
Yes, for that purpose yes, The i.MX6SL has more functions than the i.MX6SLL,
which you will of course not find on the SLL pins.

> > +	leds {
> > +		compatible =3D "gpio-leds";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_led>;
> > +
> > +		GLED { =20
>=20
> What does "GLED" mean? It's not obvious to me.
> What user-visible purpose does this LED have, or where is it on the
> board?
>=20
It is on the power key. So probably we could have "power" in its name.
GLED is just the name in vendors uboot and kernel.

I use that led also as an output in uboot to have multiboot between
vendor system, vendor kernel +debian system and patched mainline + debian s=
ystem.

> > +			gpios =3D <&gpio5 7 GPIO_ACTIVE_LOW>;
> > +			linux,default-trigger =3D "timer";
> > +		};
> > +	};
> > +
> > +	memory {
> > +		reg =3D <0x80000000 0x80000000>; =20
>=20
> 2 GiB of memory?
>=20
Well, 512MByte. Seems that uboot overwrites that. But we should use the cor=
rect
value here.

> > +			/* Core3_3V3 */ =20
>=20
> What are these labels (Core3_3V3, Core4_1V2, etc.)?
>
I have taken then from the tolino board file. Probably they are netnames
of the pcb but not the names of the regulators in the pmic.
=20
> > +			dcdc2_reg: DCDC2 {
> > +				regulator-name =3D "DCDC2";
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +					regulator-suspend-max-microvolt =3D <3300000>;
> > +					regulator-suspend-min-microvolt =3D <3300000>;
> > +				};
> > +			}; =20
>=20
Regards,
Andreas

--Sig_/aB.pTc2IuOjACzyPfRof4hD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl2a0Z0ACgkQl4jFM1s/
ye9dKA//aQgaIGzJry4yT7el+FH8/B/V78b24pRmCx3wnBuRsc9CBxYsAEpYGJTo
iBXpJUHUpy3J28ZQxSjk6docvx918lE0R1l9VQlqzP3mw1uFGQmtIYG7W6kbZkom
dXSb9g/Tql+r7zTuEKodK99mz4xPupf3Ay36sLecNKddfGTgXQy96blU3x+Degrb
MMIKEKZFi+E5e3Q+FLkwNhRMVbAbpVVtqQrmZqN5ImbhD72pFKgbQt+CIPAQZYp7
b+0CdDnnvHOMvh6QT+Ij4Od3NGfGhqa/+qHqSmztx6X3XZFK57z5RKe83EIw2vBg
aBYwzfQL5kTE8FKAWXURk2a/NbJk4WWT3BBQZt8HzTmkdgfHsgCimjzQNKgBw7AN
2d1FrGgNk9EuwZjbrtJmLoSTQ9tieUk67jLhsgj1S8gRrrV4YPoYE8RrXKmYGEGe
FUJPpcrd7fPDUpPvchZI1jVlPzL+S2W0L3U/KSwhWGey119FgktRVX4ljjquX+iP
3zxaFIGO9K5vIG/pzxFCDZ9R6gCWBdryPU3q/+a0wZWNLclZROAQd939ekFBY4lD
ZEta6trdhOkVRkgHU27BdikvJRgzFrZBnm6YUomelezQM3XjT0yeK9OT60EOWNx5
upg8mHnodGcUdxzUtnzzV3tVvtunAYFGpw/zuwff5B0p16nJKqU=
=8lWk
-----END PGP SIGNATURE-----

--Sig_/aB.pTc2IuOjACzyPfRof4hD--
