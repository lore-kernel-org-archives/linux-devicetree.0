From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 1/4] pinctrl: aspeed: Read and write bits in LPC and
 GFX controllers
Date: Tue, 13 Dec 2016 16:42:23 +1030
Message-ID: <1481609543.3112.34.camel@aj.id.au>
References: <20161206031152.3004-1-andrew@aj.id.au>
         <20161206031152.3004-2-andrew@aj.id.au>
         <20161212162712.u2uypxkqhh6cinsp@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-f3iCXhLQAwHBUwKpIjVm"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20161212162712.u2uypxkqhh6cinsp@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--=-f3iCXhLQAwHBUwKpIjVm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-12-12 at 10:27 -0600, Rob Herring wrote:
> On Tue, Dec 06, 2016 at 02:11:49PM +1100, Andrew Jeffery wrote:
> > The System Control Unit IP block in the Aspeed SoCs is typically where
> > the pinmux configuration is found, but not always. A number of pins
> > depend on state in one of LPC Host Control (LHC) or SoC Display
> > Controller (GFX) IP blocks, so the Aspeed pinmux drivers should have th=
e
> > means to adjust these as necessary.
> >=20
> > We use syscon to cast a regmap over the GFX and LPC blocks, which is
> > used as an arbitration layer between the relevant driver and the pinctr=
l
> > subsystem. The regmaps are then exposed to the SoC-specific pinctrl
> > drivers by phandles in the devicetree, and are selected during a mux
> > request by querying a new 'ip' member in struct aspeed_sig_desc.
> >=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0.../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |=C2=A0=C2=A05=
0 ++++++-
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A018 +--
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A048 ++++--
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 161 +++++++++++++--------
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A032 ++--
> > =C2=A05 files changed, 214 insertions(+), 95 deletions(-)
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
> > > > -		"aspeed,ast2400-pinctrl"
> > > > -		"aspeed,g4-pinctrl"
> > > > -		"aspeed,ast2500-pinctrl"
> > > > -		"aspeed,g5-pinctrl"
> > +Required properties for g4:
> > > > +- compatible :=C2=A0			Should be any one of the following:
> > > > +				"aspeed,ast2400-pinctrl"
> > > > +				"aspeed,g4-pinctrl"
> > +
> > +Required properties for g5:
> > > > +- compatible :=C2=A0			Should be any one of the following:
> > > > +				"aspeed,ast2500-pinctrl"
> > > > +				"aspeed,g5-pinctrl"
> > +
> > > > +- aspeed,external-nodes:	A cell of phandles to external controller=
 nodes:
> > > > +				0: compatible with "aspeed,ast2500-gfx", "syscon"
> > > > +				1: compatible with "aspeed,ast2500-lpchc", "syscon"
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
> > > > =C2=A0syscon: scu@1e6e2000 {
> > > > =C2=A0	compatible =3D "syscon", "simple-mfd";
> > > > @@ -63,5 +70,34 @@ syscon: scu@1e6e2000 {
> > > > =C2=A0	};
> > =C2=A0};
> > =C2=A0
> > +g5 Example:
> > +
> > +apb {
> > > > > > +	gfx: display@1e6e6000 {
> > > > +		compatible =3D "aspeed,ast2500-gfx", "syscon";
> > > > +		reg =3D <0x1e6e6000 0x1000>;
> > > > +	};
> > +
> > > > > > +	lpchc: lpchc@1e7890a0 {
> > > > +		compatible =3D "aspeed,ast2500-lpchc", "syscon";
> > > > +		reg =3D <0x1e7890a0 0xc4>;
> > > > +	};
> > +
> > > > > > +	syscon: scu@1e6e2000 {
> > +		compatible =3D "syscon", "simple-mfd";
>=20
> I must have missed this the first time, but "syscon" should be used with=
=C2=A0
> a specific compatible. Though, the scu binding does define one.

Yes, the example should be fixed.

>=20
> > > > +		reg =3D <0x1e6e2000 0x1a8>;
> > +
> > +		pinctrl: pinctrl {
>=20
> Is this the only child?=C2=A0

No. A incomplete list of other functions in the SCU includes:

* An RNG
* Power management
* PCI configuration
* System reset
* Clock configuration

>=20
> > +			compatible =3D "aspeed,g5-pinctrl";
>=20
> There's no register range for pinctrl?

This may be a mistake on my part; when I wrote this I had no experience
with writing devicetree bindings (and still don't have a lot).

The SCU does have register regions for pinctrl but on reflection I feel
neither the mfd nor syscon bindings describe how children's resources
should be treated in general. The example in the mfd bindings is for
hardware that is register-bit-led,compatible, whose bindings use the
'offset' property rather than 'reg', which still describes where, but
not using the reg property. Given my uncertainty with reg in an mfd
child, I wrote the pinctrl/pinmux driver using offsets from the base of
the SCU's syscon rather than describing the exact region(s) of the
syscon that should be used.

The issue you raise here occurred to me when writing the LPC Host
Controller bindings, but there I wasn't convinced using the ranges
property to give offsets was the right thing to do either.

Regardless, whilst there are two dedicated regions of pinmux registers,
the mux state also depends on bits in SCU registers outside of these
regions. Assuming we define an appropriate ranges property for the SCU
syscon the pinctrl reg property would look like:

    reg =3D <0x2c 0x1>, <0x3c 0x1>, <0x48 0x1>, <0x70 0x1>, <0x7c 0x1>, <0x=
80 0x18>, <0xa0 0x10>, <0xd0 0x1>;

This is the list of registers affecting the mux taken from the pinctrl-
aspeed.h.

What action do you recommend here? The pinctrl dts patches for the
Aspeed SoCs are yet to be applied, so changing the bindings to require
a reg property can't break any existing in-tree users as there are
none. The pinctrl driver can be patched to respect the reg property
after the fact, though actually using the region descriptions might be
interesting.

>=20
> > +			aspeed,external-nodes =3D <&gfx, &lpchc>;

Did you have feedback on this approach? I queried you about it in the
previous revision, but never received a reply:

https://marc.info/?l=3Ddevicetree&m=3D147873554311535&w=3D4

Thanks,

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
--=-f3iCXhLQAwHBUwKpIjVm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYT5FHAAoJEJ0dnzgO5LT55T8QAIYva9WRU2WhdCj2sa/541FK
4RhuEQdeZdvpVpKohYIxqXgVybCZMcKeTLWmxtzUd2Nr833HTpstIUu7BxODoenN
sBS4MfJNvsjfwdOLEQUIpKsBET0d4FXBkK8q8OfsKtnyZwGZ79hXz5RgVEOJRpgR
LzZjZPxKnI3QRJV8Nn29kNyljRtXR/a8GTare8FgEFmJ6XqI/1dR22oLlYcCzKhJ
xPwan3R4fe+T6NidYcyoR6rwv07dNPKviIusQQYNQ02E56BY4hzqEbaItgYEqAV7
UjJlDkddy1fXGuExmB4hvTRvde5hvzqZXmTXl3BbwrkGivA+vEbjYOqugILorWAI
br4KxczSH4V+eDtrj74N03qGMvng4s97hbLDirWh0L8lEyylJKBKHdJ3Av3fQ5SC
hEYM+LOd53nuhLxEETbU1N2JIgjZtfMxRHO89nz6ALoCerDX0VN27r3VkEqVGFvR
XjBbUis/LfO1MUYQbO0aZbfsqf50BRyre0MBqu8sJhq2vNRujTMeVlAPtvGT2wLy
ajJWJU+/gjxoTqtHFcQoTKzUbjW1LSip6wWoYPz03clJpJLHyFN2kKJ16idks/qK
jFdALeIaevVumS1bMCrZjp5udCBgIwotcNJN2R//q9hefb+TxRenl0jsTalMuuQR
uEHzIhoIp9hCvcPFUxMR
=Vnyn
-----END PGP SIGNATURE-----

--=-f3iCXhLQAwHBUwKpIjVm--

