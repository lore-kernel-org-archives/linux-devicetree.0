From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] dt-bindings: pinctrl: Document the i.MX50 IOMUXC binding
Date: Fri, 8 Feb 2019 16:47:48 +0100
Message-ID: <20190208154748.GA2061@latitude>
References: <20190129165530.7606-1-j.neuschaefer@gmx.net>
 <CAOMZO5ABy+uDXMhQy95vuY8Yz2a8Wr0Q0+fUq=2Xkm2NSCdQGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5ABy+uDXMhQy95vuY8Yz2a8Wr0Q0+fUq=2Xkm2NSCdQGQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Dong Aisheng <dong.aisheng@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 08, 2019 at 09:57:04AM -0200, Fabio Estevam wrote:
> Hi Jonathan,
>=20
> On Tue, Jan 29, 2019 at 2:55 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> >
> > AFAICS from the i.MX50 Reference Manual, the i.MX50 IOMUXC works the
> > same as the one in i.MX51, so I copied fsl,imx51-pinctrl.txt and changed
> > the text to imx50.
> >
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > Cc: Dong Aisheng <dong.aisheng@linaro.org>
> > Cc: Shawn Guo <shawn.guo@linaro.org>
>=20
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks!

> > +Required properties:
> > +- compatible: "fsl,imx50-iomuxc"
> > +- fsl,pins: two integers array, represents a group of pins mux and con=
fig
> > +  setting. The format is fsl,pins =3D <PIN_FUNC_ID CONFIG>, PIN_FUNC_I=
D is a
> > +  pin working on a specific function, CONFIG is the pad setting value =
like
> > +  pull-up for this pin. Please refer to imx50 datasheet for the valid =
pad
>=20
> Nit: It is the i.MX50 Reference Manual, not its datasheet that
> describes the pad settings values.

Indeed, good catch.

> I noticed that all the bindings say datasheet though, so I will send a
> patch to fix this.

Thanks!


Jonathan Neusch=C3=A4fer

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAlxdpJwACgkQCDBEmo7z
X9uHfBAAqJchn+W1yJ7iqKTAb0yWuwNzGIpW7u2RQoY89GyT+YHWfcYm4+v10ph1
KGYdJ6xARGyOZGYS6NTS6kokjST5/aZNND00UXmhnK7T2TFU/G0w/ULkPtjpSgvI
dPTKvssIS6XnxJPO41y6LO+IZOzFk5s5d5osvsvLnzky5DHivkPEYyi3Od+cC5J9
m3u71BOIOPJAdph///p504Skk9LYd0GGgCNXaXfEN4RdZ/6Mtx8M/YLagOaPpU09
EIcqXhln2TWF3rEAFTUtOhbJLdOblmCe1ybEF2RN2dNAbsHZPps0Nusip70aMoDw
EiYR9e/hWB897SIhbRAhofsDw73fvzTzwD4e1R1iigwOkMFLuRkDuhBCebU6QTOz
CHebJ98WQaq5d0z7La91XvLrGGjLQPMcngUKPAYCoFN03HQY8WvxZeMu+J2MVFGQ
hI9teS3o06khZIB/ELOzO0q6zWBbU2Ngl3b9roj/OBjdXitl0fTVwh0lmipsMMz2
IoOdgM4GAtYyCneYin17LHEzMA59ffv43qh8zkOIL2Rz/V3kqy/Omu3OVP2DI7Xv
sA3Kjan12S2KZ5X267/jw7/gU/7dE4ZocBzWD4SH1Fw9E1OPb6QXZB/EOrCaCZGy
n0ZcgB/p+/BpzNgNdzd/6kKyzYhpXhYf3G3X6bZZ22vDXmGDQ1Y=
=oF7H
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
