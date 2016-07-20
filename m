From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 01/12] pinctrl: dt-bindings: Add documentation for
 Aspeed pin controllers
Date: Thu, 21 Jul 2016 08:43:36 +0930
Message-ID: <1469056416.954.107.camel@aj.id.au>
References: <1468994313-13538-1-git-send-email-andrew@aj.id.au>
	 <1468994313-13538-2-git-send-email-andrew@aj.id.au>
	 <20160720190519.GA9190@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-s2CDfcZXpKCDwm76E1cs"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160720190519.GA9190@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org, Jeremy Kerr <jk@ozlabs.org>
List-Id: devicetree@vger.kernel.org


--=-s2CDfcZXpKCDwm76E1cs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-07-20 at 14:05 -0500, Rob Herring wrote:
> On Wed, Jul 20, 2016 at 03:28:22PM +0930, Andrew Jeffery wrote:
> >=20
> > Outline expectations on the pin controller's relationship with the
> > System Control Unit (SCU) IP through syscon, and document the compatibl=
e
> > strings for 4th and 5th generation Aspeed SoC pin controllers.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0.../devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 45 +++++++++=
+++++++++++++
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01 +
> > =C2=A02 files changed, 46 insertions(+)
> > =C2=A0create mode 100644 Documentation/devicetree/bindings/pinctrl/pinc=
trl-aspeed.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.t=
xt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> > new file mode 100644
> > index 000000000000..5aac6a0a2e89
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> > @@ -0,0 +1,45 @@
> > +Aspeed Pin Controllers
> > +----------------------
> > +
> > +The Aspeed SoCs vary in functionality inside a generation but have a c=
ommon mux
> > +device register layout.
> > +
> > +Required properties:
> > +- compatible: should be one of the following:
> > +	"aspeed,g4-pinctrl";
> > +	"aspeed,g5-pinctrl"
> > +
> > +The pin controller node should be a child of a syscon node with the re=
quired
> > +property:
> > +- compatible: "syscon", "simple-mfd"
> > +
> > +Refer to the the bindings described in
> > +Documentation/devicetree/bindings/mfd/syscon.txt
> > +
> > +Subnode format:
> > +
> > +Please refer to pinctrl-bindings.txt in this directory for details of =
the
> > +common pinctrl bindings used by client devices.
> > +
> > +The required properties of child nodes are (as defined in pinctrl-bind=
ings):
> > +- function
> > +- groups
> > +
> > +Each function has only one associated pin group. Each group is named b=
y its
> > +function.
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
> > +		pinctrl_i2c3_default: i2c3_default {
> > +			function =3D "I2C3";
> > +			groups =3D "I2C3";
> All these strings need to be documented.

Right! Will do.

Cheers,

Andrew
--=-s2CDfcZXpKCDwm76E1cs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXkAWgAAoJEJ0dnzgO5LT5cLAP/2Mm7OwQI4hgwTjwqMVET8QP
Yyw5n+ameEAKy9/Sclebn2gVhk7bPbqH98pMwrZvc6HhQDtG8Pl1m+UwVAj5Qaqf
i7W4XqICZS8lpZ0ASenV7BSHWZQkCNfjY2ahlUsBA1bnKb3Sp01EAVj1BiCUztDz
34WdKmB4zEZXKwojFRMYT5Y09yhd5Y9gykoAkS74ARnV6kNmsPSNfIIYPo++qHwL
rfQZQ0kO9P3qLjGFGHTcVzczjBwv6hrr5BG4FXhvYtg1iI2Xxp/oPCG/iYRfeMnN
+KWixsXCQNGBa51oJix3qJjmehquvn7BHoT/9PDddB9glCv/P0DChifXBS6CxMUw
2BWKswOwTjGrUDsE/CRjw100pSjWHQPWLlIDsJNNP7d7vDDpetGpe6DtWwAOOvAM
PRGvimeSLBgsbplpVU8FUoCJLgAVISEREuV0tuGLY+Aaq2TwfEivCQo81jPtecxt
Z00mH0SfZxqWCxW7h1iNp+suAOobl+0PlzxoD1wxm6yPDTyl92XlqESkcZZldQlK
Jo51Uv5NkKcDvvxPsXPyzQV/TaZy4ffsJ0SlMfuKaQwZaVTAJGuxAJx30Xj7dfDu
T8z9W4i4yfPw5xuZb39Ka6qVAPAY+qGZ0VwbrhMJJ/GyaeHmkEvjZdbTcQvyTi8g
VhK4lCu2QdqBL/tg8mbu
=kn1Y
-----END PGP SIGNATURE-----

--=-s2CDfcZXpKCDwm76E1cs--

