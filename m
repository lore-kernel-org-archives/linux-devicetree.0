From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: Re: [PATCH 5/7] MIPS: mscc: ocelot: add GPIO4 pinmuxing DT node
Date: Mon, 1 Oct 2018 11:02:27 +0200
Message-ID: <20181001090227.mmcnstxcdfocx3zd@qschulz>
References: <cover.b921b010b6d6bde1c11e69551ae38f3b2818645b.1536916714.git-series.quentin.schulz@bootlin.com>
 <92e37a04e77003f01a67ac5e49e66ae83f87c591.1536916714.git-series.quentin.schulz@bootlin.com>
 <20180914145446.GQ14988@piout.net>
 <20180914162638.fgzzjin2bzgx74de@qschulz>
 <20180914180222.GT14988@piout.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ysacw7np3q4ncps4"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180914180222.GT14988@piout.net>
Sender: netdev-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, andrew@lunn.ch, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, antoine.tenart@bootlin.com
List-Id: devicetree@vger.kernel.org


--ysacw7np3q4ncps4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Fri, Sep 14, 2018 at 08:02:22PM +0200, Alexandre Belloni wrote:
> On 14/09/2018 18:26:38+0200, Quentin Schulz wrote:
> > Hi Alexandre,
> >=20
> > On Fri, Sep 14, 2018 at 04:54:46PM +0200, Alexandre Belloni wrote:
> > > Hi,
> > >=20
> > > On 14/09/2018 11:44:26+0200, Quentin Schulz wrote:
> > > > In order to use GPIO4 as a GPIO, we need to mux it in this mode so =
let's
> > > > declare a new pinctrl DT node for it.
> > > >=20
> > > > Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> > > > ---
> > > >  arch/mips/boot/dts/mscc/ocelot.dtsi | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >=20
> > > > diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/d=
ts/mscc/ocelot.dtsi
> > > > index 8ce317c..b5c4c74 100644
> > > > --- a/arch/mips/boot/dts/mscc/ocelot.dtsi
> > > > +++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
> > > > @@ -182,6 +182,11 @@
> > > >  			interrupts =3D <13>;
> > > >  			#interrupt-cells =3D <2>;
> > > > =20
> > > > +			gpio4: gpio4 {
> > > > +				pins =3D "GPIO_4";
> > > > +				function =3D "gpio";
> > > > +			};
> > > > +
> > >=20
> > > For a GPIO, I would do that in the board dts because it is not used
> > > directly in the dtsi.
> > >=20
> >=20
> > And the day we've two boards using this pinctrl we move it to a dtsi. Is
> > that the plan?
> >=20
>=20
> Not really, at least not for gpios. I've included the pinctrl for the
> uart, i2c and spi because they are the only option if you are to use
> those peripherals. Else, I've would have left the pinctrl to the board
> file. From my point of view, the gpios are too board specific to be in a
> soc dtsi.
>=20

Understood, will move it to the board file.

Thanks,
Quentin

--ysacw7np3q4ncps4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXeEYjDsJh38OoyMzhLiadT7g8aMFAlux4qMACgkQhLiadT7g
8aPhvg/+KCAqXI08qVQU87ghlaA+BByGeMMOIg1WhPtdA6gSQDR6iF/UgzTsGzk9
4R6noEjVGm0nF4FPESZg5wjzD7vyVK57Yhht8xc4iztNGul61+n66F6mQywOl+He
6ehEUyMP9HXTznVt2NPMHeYr0q5DhV3HC1c+giRT+zG5+BlIplpFWFDhB+IXsL/t
E987QydR/4lX7YNNmUc/VNYnJwTuEJH7xhVnYiGmqhBK+j9K2iMAsbKUEYwR2EOX
FCAH85ktMIwVi64oJYIZZjBT2ntIlKl9ayIR0i2Titjf8dnOUBys0gChxquShWYn
AzrotXStMrq7CBSR7GpFu2+XT4DkH3m6qnnbjI/wrKUFJ2V1bUOyeZZSmjueUMdx
zypW4P8L8MHXCJ6dR8p6bgWedBLqXyOIKVnziajs67N4layeE4pU954BYKKoM9vM
PAsjZdIVbk83S5iYLDkX6ItHKC9VoyLiCYZpsL8mp2crG2he2nlsFg60NshDs5xn
iQ13jy9iwyI5aFduvPAWoBYCig0NLhRl+45nqYuNhov0IJ/wUSsm1ucgyzukLFDg
cxgnPBdEShCchrtSy5kPRgje9mh64warP7iZuzH/JFo5f8T7hKPAuBTQ56Egi3nb
mW7lvUDugTcjnwZ8ALaN+/XlU1LVPsQAd2kkIzYdNPS5Z+KaHWI=
=FfTb
-----END PGP SIGNATURE-----

--ysacw7np3q4ncps4--
