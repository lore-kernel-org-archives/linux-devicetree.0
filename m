From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 5/8] pinctrl: aspeed: Enable capture of off-SCU pinmux
 state
Date: Mon, 24 Oct 2016 10:59:45 +1030
Message-ID: <1477268985.6373.39.camel@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
         <a266046d34009e6e92c4c76699c550c2ba44bd5c.1474986045.git-series.andrew@aj.id.au>
         <CACPK8Xc7y3GtcJCVYYs-JKTqBZvqVeZaz5MUk=UX151SX1xEFw@mail.gmail.com>
         <CACRpkdazJzE=Oa-0-FEYTvUk=-kPLojHY3afZKX5cpmzrUZHGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-6ArfvvSUPVXLfWYtgBwi"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdazJzE=Oa-0-FEYTvUk=-kPLojHY3afZKX5cpmzrUZHGQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org


--=-6ArfvvSUPVXLfWYtgBwi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-10-24 at 00:20 +0200, Linus Walleij wrote:
> On Thu, Sep 29, 2016 at 8:45 AM, Joel Stanley <joel@jms.id.au> wrote:
> >=20
> > On Wed, Sep 28, 2016 at 12:20 AM, Andrew Jeffery <andrew@aj.id.au> wrot=
e:
> >=20
> > >=20
> > > On the AST2400 and AST2500 a number of pins depend on state in one of
> > > the SIO, LPC or GFX IP blocks, so add support to at least capture wha=
t
> > > that state is. The pinctrl engine for the Aspeed SoCs doesn't try to
> > > inspect or modify the state of the off-SCU IP blocks. Instead, it log=
s
> > > the state requirement with the expectation that the platform
> > > designer/maintainer arranges for the appropriate configuration to be
> > > applied through the associated drivers.
> (...)
> >=20
> >=20
> > This is unfortunate.
> >=20
> > This patch kicks the can down the road, but doesn't solve the problem
> > for a user who wants to configure some functionality that depends on
> > the non-SCU bits. Because of this I'm not sure if we want to put it in
> > the tree.
> >=20
> > However, I'm not sure what a proper solution would look like. Perhaps
> > Linus can point out another SoC that has a similar problem?
> If I could only understand it.
>=20
> Don't you actually want to go and read a few registers on another
> IO range?

Yes. I guess the hesitation was whether we should also write those
registers so we can apply the requested function.

>=20
> What we generally do when pin control is spread out in a system is try
> to consolidate it, meaning expose the necessary registers on the remote
> end using syscon (drivers/mfd/syscon) so that we can easily get a handle
> on these registers withe regmap MMIO.
>=20
> Since regmap handles atomic access to the registers, that way we
> protect from disasters and keep the state in the hardware.

This seems like the reasonable approach if we want to read/write those
registers. The affected IO ranges correspond to:

* SuperIO Controller (SIO)
* SOC Display Controller (GFX)
* LPC Controller (LPC)

SIO and LPC both perform a mishmash of functions and so likely would
use the mfd subsystem anyway. I don't yet have any arguments against
doing it for the GFX IO space. Joel?

>=20
> I don't know if this is helpful. For a normal peripheral you may not want
> to put a regmap over all its registers but you prefer to ioremap it, and =
then
> we get the spaghetti of accessor functions to peek and poke into another
> peripherals I/O space, and that is undesireable.

I briefly experimented with the idea of accessing the other IO spaces
but it felt dirty precisely for what would have become accessor
spaghetti. So I wound up with the lame approach in this patch, which
just punts on the problem. I think the mfd/syscon approach would work
well though.

It looks like the rockchip pinctrl bindings are doing something along
the lines of what we need with the rockchip,pmu phandle property. Is it
acceptable to create three properties, a phandle to grab each regmap
for the IO spaces above?

>=20
> Maybe this is completely not understanding what you want to do, so
> sorry, please elaborate.=20

No, seems you have understood what we need to do.

> I am afraid the two of you are the only people on
> the planet who actually understand what is going on here.
>=20
> Also the hardware engineer who wrote the Aspeed pin controller, I would
> like to read this persons design specification, I am pretty sure it is ve=
ry
> interesting.

Well, presumably this engineer knows too :) And yes, I'd like to know
what constraints existed that forced this design as a solution. I'd
like my sanity back.

>=20
> >=20
> > >=20
> > > -=C2=A0=C2=A0* @reg: The register offset from base in bytes
> > > +=C2=A0=C2=A0* @reg: Split into three fields:
> > > +=C2=A0=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A031:24: IP sel=
ector
> > > +=C2=A0=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A023:12: Reserv=
ed
> > > +=C2=A0=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A011:0: Registe=
r offset
> That seems like unnecessary shoehorning. Is it reflecting the register la=
yout
> of the hardware or are you trying to save bits? For the latter, let it
> go and instead
> have one member for offset and one member for selector.

It doesn't represent the register layout. But saving bits also wasn't
the motivation, more avoiding a lot of code churn in the g4/g5 drivers
to populate a new member. Maybe that's a bad motivation. I'll have more
of a think about it.

Thanks for the feedback,

Andrew

--=-6ArfvvSUPVXLfWYtgBwi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYDVX6AAoJEJ0dnzgO5LT5SZoP/1fW9CZZuc2Z1LE8Q+LahaSp
7Iwyks6nfuWOHzqqxmio6A8zJ2nI9P2I9J0hiYK/zqgU/QEyP0U9Jd9G6BERjkyK
bGzX/jVPUhcXS0YEqy8YJRusSYjpoq2Q4Y54fYeuB+Lfsj8MCC0d4hcYMeYa+RUQ
3k9qZzdZC9KXCX5CRvJdVuOpXzXvdx8kYL+boXhHD+YM1atyK61wPyXf1Hybatf0
3xrl5Z23UCO2koHDSyGzGPG5sUrMupi9bfXD3P7axO9O3agyjGWg/HiTSoULZi3N
4vEuOyz2jxFK8xxpqOFghlQPGoZiaQCPQ8oAClsZxeL6x4ih1H5WNaEzSud2BJMt
eFp9pzP38BHo42XaBlS5QFaa/y5wiY/55lbz1RaeuqbBYldL4EtlxiUojSy45qBt
+dyrviQfARP4Yt201qg7WcFCychA72bPp1qx4RyCPAqDjRqAY5Ig2qIKzdLD1Wyu
Mdx1QZYWhdnxQglst52irLqj4cifHHDTWaXJbKBtaubwj7TwNN26hv+n3J74IpTo
DSeH5+lVXSzozPdY/bDGxmkK4Ifm3RFpLTp55DCZt4ozJQQm+tOOQgnDdDlFpK7J
WxyQd4lam0OOE7sEmzZ3ounco+ASZovjqXUKKOAXa+W0frUkC27LPtMrDOETYr/l
NcyBCT6suGEwowa419o6
=XjTZ
-----END PGP SIGNATURE-----

--=-6ArfvvSUPVXLfWYtgBwi--
