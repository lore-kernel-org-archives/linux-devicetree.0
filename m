From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 1/8] ARM: dts: aspeed: Move pinctrl subnodes to improve
 readability
Date: Wed, 04 Oct 2017 14:00:22 +1030
Message-ID: <1507087822.5452.1.camel@aj.id.au>
References: <20170928075149.8154-1-joel@jms.id.au>
         <20170928075149.8154-2-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-NOye16VdEtBp6zZ3Ctex"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928075149.8154-2-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rick Altherr <raltherr@google.com>, Brendan Higgins <brendanhiggins@google.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--=-NOye16VdEtBp6zZ3Ctex
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-28 at 17:21 +0930, Joel Stanley wrote:
> > From: Andrew Jeffery <andrew@aj.id.au>
>=20
> Moving the subnodes out of the pinctrl node declaration to a reference
> allows easier access to the remaining parts of the devicetree.
>=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > Reviewed-by: Xo Wang <xow@google.com>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi | 1483 ++++++++++++++++++---------=
---------
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 1549 +++++++++++++++++++--------=
-----------
> =C2=A02 files changed, 1518 insertions(+), 1514 deletions(-)

I hate the way the diff came out for the g5, it's almost impossible to
read. Also not sure how useful it is to ack my own patch, but given the
rebasing it has suffered:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

Cheers,

Andrew
--=-NOye16VdEtBp6zZ3Ctex
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1FXOAAoJEJ0dnzgO5LT5vccP/jyEjsye7Y9FXfEE4ThAhCMM
TinaPzEuk62IzMVBkqJT+oxPRQDTj+dLFe6+1W9OhDKunHYUarCmnEvJciXF5IFx
i0q4+7Wi07oip5in615H8nlpswJSUY9t6yjLgi+6Rrjr7cRcqvGiySpmbPOQd0Qx
RS25yuodmJHFAAZN5nxzTWGcNrFCVOd4uZUaY7rhmeBY1Am0Pu6OfYY1uIszTZnP
0z2OxMpHDcOp7BuoB+jRhg3nJgC0rysMHwREe+mjuakhjkAXz3z6BvFuN3vmEJiB
Dxjjc0QpoTpH5zajRHLLcznmlA56klxuYkFT5ksT8EO/ppPWI5FIIC1cOZla5W9g
T6KtzZzxDwEZepwLeCFrjwfHRgW/YTeLB7kJAOYp7jJm38nQ+H/9maNt6ybM8XqA
7GWkI7+5hmbeayJpSVA7Sn/tNmLgZQPD1phBNUuQpX+P+g7vObxkmbsXXwSzOaPD
qHGbLkZjm4Dg1eCc8dT+XkQeNni5DXnDpRW4Ass5vdKWezaS+KJMQv30086olFzG
EXORGSKtIiYv+QG+EYCdQzoDMYVtSbbXYcAkHM22ixlVsFhb+6p6In0yl8nz1hR4
USwtjtZdWM9bAyJSoXGKTGwdXRCbdWdJXPEfBvu/62KNm6oPH0XwTB6zJ/uxT0mN
WM8BheczGHqkHP1HieNV
=kwPr
-----END PGP SIGNATURE-----

--=-NOye16VdEtBp6zZ3Ctex--
