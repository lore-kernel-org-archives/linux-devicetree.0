From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 4/8] gpio: dt-bindings: Add documentation for Aspeed
 GPIO controllers
Date: Mon, 22 Aug 2016 09:46:00 +0930
Message-ID: <1471824960.5707.3.camel@aj.id.au>
References: <20160819124414.24242-1-andrew@aj.id.au>
         <20160819124414.24242-5-andrew@aj.id.au>
         <20160819143641.GA19513@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-oOuNSQ4nXhWxghMvDaki"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160819143641.GA19513@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--=-oOuNSQ4nXhWxghMvDaki
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-08-19 at 09:36 -0500, Rob Herring wrote:
> On Fri, Aug 19, 2016 at 10:14:10PM +0930, Andrew Jeffery wrote:
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >=20
> > Since v1:
> >=20
> > Rob: I haven't added your Acked-by here as I've made the following chan=
ges and
> > wanted to get your input:
> >=20
> > * Remove interrupt-controller as an optional property
> > * Defer to interrupt-controller bindings document for sub-node properti=
es
> >=20
> > I had a discussion with Joel about whether the interrupt-controller cap=
ability
> > should be optional and the conclusion was that it should always be conf=
igured
> > by the driver. This makes an optional interrupt-controller property fee=
l
> > redundant (and possibly inaccurate if left out) so I've removed it.
> I don't follow. What do you mean byt "configured by the driver". If the=
=C2=A0
> block supports interrupts, then it should be marked as an=C2=A0
> interrupt-controller. It never should have been optional. The OS can=C2=
=A0
> ignore the interrupt properties if it chooses.=C2=A0

Right, clearly there was some confusion on my part. I will fix that up.
Thanks for clarifying.

Andrew

--=-oOuNSQ4nXhWxghMvDaki
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXukRAAAoJEJ0dnzgO5LT5GQwP/1ZUW8Ey1pnU9o5AQOfwj0P8
ghc0xKXXpAKX7mXcR3kOdlesAnrZtL6ZP3WK7xFuDLFU2qf6kuQoxItqWkwKvihN
mwNjN+AQ8WQ22tildGIC4gL+bHOZ5aIpy7LJ3Ec1RX/i55zKXDNzeF98ALg0Jz2L
iMPKIYNrg9zmIYAUzUIv6sewI0DVyo7Dp+Y+YoU87SzKVxZ33DuNOmC8Ij0yEvJb
5twIHT2nCVPyzBMXSS6ZPqYK8B1g13NoR5CGyeV21c2tmfO0vaiUSok0spEFv0dt
rxXypQ52RNtHXVEw/Q81CkxJC1MPpPjRLp1nLMlOCQDB9UqKYOUTaUvw/6mhv85h
9uRbQ4fn4fv6h63hDL3ed7uYP2MdPdOa7jS0w2PA+2qVGga6helJmo7w1JrEaxIh
ED0yF/4eUeEE/V4dKm7MRcmxd+dr1wm2U2XTerpsfThraM0e67cVZFUGZPD3OFQd
shixEic7WgNfdvjZA4zCc29uUqJKWWJ+IOlbf61P60ljA+ZmsprIaMCn0AB/n8Re
XVQzMTQVZI64AkhFyudtD1llQw5LECK+K8PMbyX4x0ppQvG8euGo/Nk/76Akh+4V
WEHWrmtbQbb11sGB+jOSYeMnNtkYll31T4f+1kZhJWayWq5CHm40hsyg4K8zGhOw
+mG/CSQ48VpQK0RJKtp9
=0Fri
-----END PGP SIGNATURE-----

--=-oOuNSQ4nXhWxghMvDaki--
