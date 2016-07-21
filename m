From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 07/12] syscon: dt-bindings: Add documentation for Aspeed
 system control units
Date: Thu, 21 Jul 2016 10:34:40 +0930
Message-ID: <1469063080.954.109.camel@aj.id.au>
References: <1468994313-13538-1-git-send-email-andrew@aj.id.au>
	 <1468994313-13538-8-git-send-email-andrew@aj.id.au>
	 <20160720190901.GA11147@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-8WBvbCmfS2pW6k2UH5Jt"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160720190901.GA11147@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org, Jeremy Kerr <jk@ozlabs.org>
List-Id: devicetree@vger.kernel.org


--=-8WBvbCmfS2pW6k2UH5Jt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-07-20 at 14:09 -0500, Rob Herring wrote:
> On Wed, Jul 20, 2016 at 03:28:28PM +0930, Andrew Jeffery wrote:
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0Documentation/devicetree/bindings/mfd/aspeed-scu.txt | 16 +++++++=
+++++++++
> > =C2=A01 file changed, 16 insertions(+)
> > =C2=A0create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-s=
cu.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt b/Doc=
umentation/devicetree/bindings/mfd/aspeed-scu.txt
> > new file mode 100644
> > index 000000000000..4df798799101
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
> > @@ -0,0 +1,16 @@
> > +The Aspeed System Control Unit manages the global behaviour of the SoC=
,
> > +configuring elements such as clocks, pinmux, and reset.
> > +
> > +Required properties:
> > +- compatible:	One of:
> > +		"aspeed,g4-scu", "syscon", "simple-mfd"
> > +		"aspeed,g5-scu", "syscon", "simple-mfd"
> These (and the pinctrl probably) really need SoC specific compatible=C2=
=A0
> strings. You can keep these as fallbacks though. These are the parts of=
=C2=A0
> SoCs that really vary chip to chip.

I'll add the SoC-specific compatible strings.

Cheers,

Andrew
--=-8WBvbCmfS2pW6k2UH5Jt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXkB+oAAoJEJ0dnzgO5LT5vxUP/2Dx8GaIpMweeGpvXspe76bx
TpKHdwYrReT6skORIh3M64WZfyunkw/ER9jR1MwGOSBYEQj/TPw9/JN8S2uKKAAN
LmWUL+yzYCyWmRi/DLEI+iD137YrRLcETUm4yTQQra+/OZs9T090LM/NtZizFcCq
JuszVmwEwqMO6NFD/9/0RxC8z8RSGsZG5jP8pNrSh3Cfp41U3Kw636Z+2q848j85
0aUxoGdKYs/ok5UwKDCIBZAXQI9BzDcXDMetq/vJYjpnOLHCzP7m0kteRD62x4xN
/RJqEN9jPkn8LsDV54GiYYMAhd5JzmI06yboZ289Xthz/TBFqQ8DtCW2AerC+3S7
fqqvyVot08yxTafYKSkU7k1dR6qK5lgRdmxm9HJxK6ppZpBk3M/VKFI9tYMxNs9G
kFjqN7/74mUIio/L23DfBW+YO3ld+8EWmPcXqV10cVYhQabTQDTqvsJZ6L3JP1ZV
XJ3i8CZo14THPq2Jo9P261/CovvrzchSOEwKHmiIoHSvnv+5sUqjKkgc+2t0grkx
Mkf8YnzWLM+2+Ba56fp1DiFmFQj40Qz4rG2SOMJcGe687FBQqDlfVCf6cMc7Dlf7
Ru5O+67hUtfR3NVYWhw+YCPoJ4Uc/lx0vvrC8L6BxCWAjzP5hx2wzk9sarroILjA
pTh2iS1T+le5hVRBIQSf
=zTJI
-----END PGP SIGNATURE-----

--=-8WBvbCmfS2pW6k2UH5Jt--
