From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 4/6] pinctrl: aspeed: Read and write bits in LPCHC
 and GFX controllers
Date: Thu, 10 Nov 2016 10:20:16 +1030
Message-ID: <1478735416.6206.10.camel@aj.id.au>
References: <1478097481-14895-1-git-send-email-andrew@aj.id.au>
         <1478097481-14895-5-git-send-email-andrew@aj.id.au>
         <20161109182632.etsvezgfu7nhtl55@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-RkBzIy0S9LKstNLrgLeV"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161109182632.etsvezgfu7nhtl55@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--=-RkBzIy0S9LKstNLrgLeV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-11-09 at 12:26 -0600, Rob Herring wrote:
> On Thu, Nov 03, 2016 at 01:07:59AM +1030, Andrew Jeffery wrote:
> > The System Control Unit IP block in the Aspeed SoCs is typically where
> > the pinmux configuration is found, but not always. A number of pins
> > depend on state in one of LPC Host Control (LPCHC) or SoC Display
> > Controller (GFX) IP blocks, so the Aspeed pinmux drivers should have th=
e
> > means to adjust these as necessary.
> >=20
> > We use syscon to cast a regmap over the GFX and LPCHCR blocks, which is
> > used as an arbitration layer between the relevant driver and the pinctr=
l
> > subsystem. The regmaps are then exposed to the SoC-specific pinctrl
> > drivers by phandles in the devicetree, and are selected during a mux
> > request by querying a new 'ip' member in struct aspeed_sig_desc.
> >=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > Since v1:
> >=20
> > The change is now proactive: instead of reporting that we need to flip =
bits in
> > controllers we can't access, the patch provides access via regmaps for =
the
> > relevant controllers. The implementation also splits out the IP block I=
D into
> > its own variable rather than packing the value into the upper bits of t=
he reg
> > member of struct aspeed_sig_desc. This drives some churn in the diff, b=
ut I've
> > tried to minimise it.
> >=20
> > =C2=A0.../devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 50 +++++++++=
++++---
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 18 +++---
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 39 ++++++++++---
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 66 +++++++++++++---------
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 32 ++++++++---
> > =C2=A05 files changed, 144 insertions(+), 61 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.t=
xt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> > index 2ad18c4ea55c..115b0cce6c1c 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> > @@ -4,12 +4,19 @@ Aspeed Pin Controllers
> > =C2=A0The Aspeed SoCs vary in functionality inside a generation but hav=
e a common mux
> > =C2=A0device register layout.
> > =C2=A0
> > -Required properties:
> > -- compatible : Should be any one of the following:
> > -		"aspeed,ast2400-pinctrl"
> > -		"aspeed,g4-pinctrl"
> > -		"aspeed,ast2500-pinctrl"
> > -		"aspeed,g5-pinctrl"
> > +Required properties for g4:
> > +- compatible :=C2=A0			Should be any one of the following:
> > +				"aspeed,ast2400-pinctrl"
> > +				"aspeed,g4-pinctrl"
> > +
> > +Required properties for g5:
> > +- compatible :=C2=A0			Should be any one of the following:
> > +				"aspeed,ast2500-pinctrl"
> > +				"aspeed,g5-pinctrl"
> > +
> > +- aspeed,external-nodes:	A cell of phandles to external controller nod=
es:
> > +				0: compatible with "aspeed,ast2500-gfx", "syscon"
> > +				1: compatible with "aspeed,ast2500-lpchc", "syscon"
> > =C2=A0
> > =C2=A0The pin controller node should be a child of a syscon node with t=
he required
> > =C2=A0property:
> > @@ -47,7 +54,7 @@ RGMII1 RGMII2 RMII1 RMII2 SD1 SPI1 SPI1DEBUG SPI1PASS=
THRU TIMER4 TIMER5 TIMER6
> > =C2=A0TIMER7 TIMER8 VGABIOSROM
> > =C2=A0
> > =C2=A0
> > -Examples:
> > +g4 Example:
> > =C2=A0
> > =C2=A0syscon: scu@1e6e2000 {
> > =C2=A0	compatible =3D "syscon", "simple-mfd";
> > @@ -63,5 +70,34 @@ syscon: scu@1e6e2000 {
> > =C2=A0	};
> > =C2=A0};
> > =C2=A0
> > +g5 Example:
> > +
> > +apb {
> > +	gfx: display@1e6e6000 {
> > +		compatible =3D "aspeed,ast2500-gfx", "syscon";
> > +		reg =3D <0x1e6e6000 0x1000>;
> > +	};
> > +
> > +	lpchc: lpchc@1e7890a0 {
> > +		compatible =3D "aspeed,ast2500-lpchc", "syscon";
> > +		reg =3D <0x1e7890a0 0xc4>;
> > +	};
> > +
> > +	syscon: scu@1e6e2000 {
> > +		compatible =3D "syscon", "simple-mfd";
> > +		reg =3D <0x1e6e2000 0x1a8>;
> > +
> > +		pinctrl: pinctrl {
>=20
> Why the single child node here? Doesn't look like any reason for it in=C2=
=A0
> the example.=C2=A0

The SCU contains other miscellaneous functionality besides pinctrl
registers, but that's not relevant for the pinctrl bindings. This is an
example for the g5 SoCs demonstrating use of the aspeed,external-nodes
property, which isn't required for the g4 and is why I split the
examples.

Maybe I should split out the bindings for each SoC generation into
separate files?

>=20
> > +			compatible =3D "aspeed,g5-pinctrl";
> > +			aspeed,external-nodes =3D <&gfx, &lpchc>;

You didn't comment on my approach here, but I'm interested in feedback.
 I've gone the route of fixed ordering of the phandles, but there are
two other approaches:

1. Relax the fixed ordering requirement by adding an "aspeed,external-
node-names" property and requiring correlated indices between them
2. Using separate properties for each required external node

Approach 1 seems pretty idiomatic and only crossed my mind after I'd
sent the patch. Approach 2 seems a bit ugly as the number of properties
scales with the number of controllers participating in the pinmux
configuration.

Something that also wasn't clear to me was whether I need the "aspeed"
prefix on the property name. What's the convention here? Do I need it
in this case?

Cheers,

Andrew

> > +
> > > > +			pinctrl_i2c3_default: i2c3_default {
> > > > +				function =3D "I2C3";
> > > > +				groups =3D "I2C3";
> > > > +			};
> > > > +		};
> > > > +	};
> > +};
> > +
> > =C2=A0Please refer to pinctrl-bindings.txt in this directory for detail=
s of the
> > =C2=A0common pinctrl bindings used by client devices.
--=-RkBzIy0S9LKstNLrgLeV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYI7Y4AAoJEJ0dnzgO5LT5Z3UP/15q4VHuVMo7RqBR2owlVspN
Cg2qn5w1k4QOFyCWfrUQXuFhUZ47PmROEPIBFrfGqdTZY+/sH7WNO8XA+D8GjcKg
p25zaJrDixNQ/jj+Wb3yUvD/Qc1guUDMVfzgvPVCOWClHrYewyp0U1NsnBVAW+Gb
64LfxWlpMirg9cD9jAddgOxzSmdBsufsZZx3qQL15PsOoDolP7SberTallX9fsRM
FckoNTxCkPMYjBo9uADzslbV5wDWu+93QfF0AC/PXO8hJ65LX/CBQjhBaD+u5H2p
ZCmz7zEmydp7kgHuM1Sq4o5mgRx7LfP2Q84i3BWGyYX8xt52Tj0sYhHN+4030MO7
MJj9e8xQK7QkP3lrd7RppSGEEz0FUeoKQpkvM8Kg/sR+tQfLbcp9V9KIH+sSQxS5
8zPOB1GD39R78ZY+W44ZuroDpcjSLDDlZ+wfcsX8dilTL3CAgghu5DPM8icMsndJ
vRI0hRoRfzSjlpHE2ByKdAT0Wb05soA3yOpUnAlG9WmkJt6H5QJwckDpVEkQLByu
0VkDPtNwc8bPGxc6a0diT0Wf0T+NjDrOrxpLz49WLZ9tnBliLuRAtV65AwOQaJNm
Zz38DAbEvgpba6gairQFwpWYR+GM4pgqWuPEiXzQlcqIqJMDvGxrS8xY2K7L088T
UPjW7mp5IzXVFWTm3Ip5
=A6TW
-----END PGP SIGNATURE-----

--=-RkBzIy0S9LKstNLrgLeV--
