From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 3/8] pinctrl: dt-bindings: Add documentation for
 Aspeed pin controllers
Date: Wed, 24 Aug 2016 09:36:17 +0930
Message-ID: <1471997177.5707.91.camel@aj.id.au>
References: <20160819124414.24242-1-andrew@aj.id.au>
         <20160819124414.24242-4-andrew@aj.id.au>
         <20160823172327.GA11209@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-SbmA76hatuemTVkjnE90"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160823172327.GA11209@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--=-SbmA76hatuemTVkjnE90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-08-23 at 12:23 -0500, Rob Herring wrote:
> On Fri, Aug 19, 2016 at 10:14:09PM +0930, Andrew Jeffery wrote:
> >=20
> > Outline expectations on the pin controller's relationship with the
> > System Control Unit (SCU) IP through syscon, and document the compatibl=
e
> > strings for 4th and 5th generation Aspeed SoC pin controllers.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >=20
> > Since v1:
> >=20
> > * Add SoC-specific compatible strings
> > * Document available function and group property values
> >=20
> > =C2=A0.../devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 65 +++++++++=
+++++++++++++
> > =C2=A01 file changed, 65 insertions(+)
> > =C2=A0create mode 100644 Documentation/devicetree/bindings/pinctrl/pinc=
trl-aspeed.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.t=
xt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> > new file mode 100644
> > index 000000000000..bfd81be4383b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> > @@ -0,0 +1,65 @@
> > +Aspeed Pin Controllers
> > +----------------------
> > +
> > +The Aspeed SoCs vary in functionality inside a generation but have a c=
ommon mux
> > +device register layout.
> > +
> > +Required properties:
> > +- compatible : Should be any one of the following:
> > +		"aspeed,ast2400-pinctrl"
> > +		"aspeed,g4-pinctrl"
> > +		"aspeed,ast2500-pinctrl"
> > +		"aspeed,g5-pinctrl"
> > +
> > +The pin controller node should be a child of a syscon node with the re=
quired
> > +property:
> > +- compatible: "syscon", "simple-mfd"
> > +
> > +Refer to the the bindings described in
> > +Documentation/devicetree/bindings/mfd/syscon.txt
> > +
> > +Subnode Format
> > +--------------
> > +
> > +The required properties of child nodes are (as defined in pinctrl-bind=
ings):
> > +- function
> > +- groups
> > +
> > +Each function has only one associated pin group. Each group is named b=
y its
> > +function. The following values for the function and groups properties =
are
> > +supported:
> > +
> > +aspeed,ast2400-pinctrl, aspeed,g4-pinctrl:
> > +
> > +ACPI BMCINT DDCCLK DDCDAT FLACK FLBUSY FLWP GPID0 GPIE0 GPIE2 GPIE4 GP=
IE6 I2C10
> > +I2C11 I2C12 I2C13 I2C3 I2C4 I2C5 I2C6 I2C7 I2C8 I2C9 LPCPD LPCPME LPCS=
MI MDIO1
> > +MDIO2 NCTS1 NCTS3 NCTS4 NDCD1 NDCD3 NDCD4 NDSR1 NDSR3 NDTR1 NDTR3 NRI1=
 NRI3
> > +NRI4 NRTS1 NRTS3 PWM0 PWM1 PWM2 PWM3 PWM4 PWM5 PWM6 PWM7 RGMII1 RMII1 =
ROM16
> > +ROM8 ROMCS1 ROMCS2 ROMCS3 ROMCS4 RXD1 RXD3 RXD4 SD1 SGPMI SIOPBI SIOPB=
O TIMER3
> > +TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD3 TXD4 UART6 VGAHS VGAVS VPI18 VPI=
24 VPI30
> > +VPO12 VPO24
> > +
> > +aspeed,ast2500-pinctrl, aspeed,g5-pinctrl:
> > +
> > +GPID0 GPID2 GPIE0 I2C10 I2C11 I2C12 I2C13 I2C14 I2C3 I2C4 I2C5 I2C6 I2=
C7 I2C8
> > +I2C9 MAC1LINK MDIO1 MDIO2 OSCCLK PEWAKE PWM0 PWM1 PWM2 PWM3 PWM4 PWM5 =
PWM6 PWM7
> > +RGMII1 RGMII2 RMII1 RMII2 SD1 SPI1 TIMER4 TIMER5 TIMER6 TIMER7 TIMER8
> > +
> > +Examples:
> > +
> > +syscon: scu@1e6e2000 {
> > +	compatible =3D "syscon", "simple-mfd";
> > +	reg =3D <0x1e6e2000 0x1a8>;
> > +
> > +	pinctrl: pinctrl@1e6e2000 {
> > +		compatible =3D "aspeed,g4-pinctrl";
> > +
> This node needs a reg property or the unit address should be dropped.=C2=
=A0

Yes, the unit address should be dropped in this case.

> With that:
>=20
> Acked-by: Rob Herring <robh@kernel.org>

Thanks,

Andrew
--=-SbmA76hatuemTVkjnE90
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXvOT5AAoJEJ0dnzgO5LT5ANEP/A7vLWF8EeWJbPyFDzVShDcG
pVS/N5Xy91u7QXkz0CjARyhETHnFB7SdcxKfEKLGKGhYtcPtm+PhxKqGNPJCO7Nt
HnerCCKNefGGNe8IfoiIsLNZ+CHN4nZU8OJIAvOLz1MViFEMtaSKDmhGq7KXfFbJ
/o+Rq8vFwf97OY3tEEIW8JLtcya9oYAemvTgFaK1AZbH78bNdQkg66hAZj/1kWxy
Mat57lKvC8AY8HMx6BGd7CcAzKGYNv/FHPGv8jTo92mFKmlZ3YUQ5SwK7yUpt03b
bpPL0zIXhzV4to0XvlyAnaCw7u+J5ilnj1lnkIpfMRmjf+r7RdHiNlM2RfKr0tqj
wRX/2AXURoKnKf5p3LcrvwvW3ZKsBSl9XmA3aHuvrGFtHXjGFEBznPhBz9AzyBB3
ANEZWE0fk1rO8sPH07TB9zvSJYnEBteZ7EOHdcO/oAN2ORBIF0xh5lemhBRvYSNl
ZaTxEh3jrvh9CzH6z6q6ArgLwwuRQhidp4PjGp7GqIJiPo5lQ4V7X2LMpOw8PjHr
76QdQjpXVdTvqKOd+sXEh+jxptwt3pIRxQn1KjL4/iWJqwimK6+MfeJQPAm+odLm
eCdna4GWtWLiQmhtFLPVw/c9TqfWMGmnh4XiE3duzFD+Cu2m0EnC31aiexz/Kc76
/mnyCw4OLPNgjdbjc6JO
=sgcd
-----END PGP SIGNATURE-----

--=-SbmA76hatuemTVkjnE90--

