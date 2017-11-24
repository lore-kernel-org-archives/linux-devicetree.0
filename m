From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: sunxi: document new
 generic binding
Date: Fri, 24 Nov 2017 11:52:40 +0100
Message-ID: <20171124105240.GB3792@ulmo>
References: <20171113012523.2328-1-andre.przywara@arm.com>
 <20171113012523.2328-2-andre.przywara@arm.com>
 <CACRpkdbpfkM4odz425+4qyUCF5vqPWBQ=F5Yk7AtJL5SqXghpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbpfkM4odz425+4qyUCF5vqPWBQ=F5Yk7AtJL5SqXghpg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Icenowy Zheng <icenowy@aosc.xyz>
List-Id: devicetree@vger.kernel.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2017 at 11:19:52AM +0100, Linus Walleij wrote:
> On Mon, Nov 13, 2017 at 2:25 AM, Andre Przywara <andre.przywara@arm.com> =
wrote:
>=20
> > So far all the Allwinner pinctrl drivers provided a table in the
> > kernel to describe all the pins and the link between the pinctrl functi=
ons
> > names (strings) and their respective mux values (register values).
> >
> > Extend the binding to put those mappings in the DT, so that any SoC can
> > describe its pinctrl and GPIO data fully there instead of relying on
> > tables.
> > This uses a generic compatible name, to be prepended with an SoC
> > specific name in the node.

This seems backwards to me. I'm not sure if Rob has any hard rules on
this, but in the past I've seen a lot of drivers stick this kind of data
into drivers. I personally also prefer that approach because the data is
completely static and there's no way for any specific board to customize
it. So the tables are in fact implied completely by the SoC compatible
string.

Moving all of this data into device tree has a number of disadvantages:

  * Existing boards already use the static tables in the driver, and the
    device trees don't contain any data, so you can't get rid of any of
    the existing tables because it would break ABI.

  * Moving the table into the DT doesn't actually solve anything because
    the driver would have to validate the DT description to make sure it
    contains valid data. And in order to validate DT content, the driver
    would need a copy of the table anyway.

I don't think you're going to do yourself any favours by pushing this. I
also don't see the commit description give any reason why you want to
move the table into device tree. Do you see any advantages in doing so?

Thierry

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloX+fgACgkQ3SOs138+
s6GECA/6AhoheN1vOHn3tsv1of8EzrTButkbflD6wIGdmG0aiZ0isIU8aOvarsTi
YESN5J//BrRpiV0EMfvSnKinYXW0Plptcxqu1ltyB3TXrQlou9k28+v4xSyf7tyF
B5tsC84nubafEF2dmLg2+eCOcAEvzrn+bdUiCD2X0hAbnBvMAhC5p3lD3LTaBueK
dx/o3JsXvkKWxsVKkTZy+ZK8BV2+LY0BOd+4ArTD8G/luEvhL6lg5t/HyL7AjRXi
GuS7ncaMkZtIFlNw3iJtKHM+i0u+8b3w165X9z5P8gcfNhlC25oNFgzz2/dVJktd
8x2+/9DbLPQInv19jNMupHPJN6o3OLpXaXseGp31bYjtrI2T9NTwJwMfnUL/7Lex
It33pO8vWO/DfnTfjZ1xX9id1eQDf7ohpYqCM0QmsJwg5yORxOOwi+mohJC+KaAq
/QPro6/GXo9TMkJCqhZ4qmlmh14DfCbc7t84JJy9YBRBt03wCRcLSRMDqEST3Mth
SRXA6SNZGAznuiaOwBQg2pmFYtVly4ckzQKx8yTKSjIHK1rsVa8GQ+7rEJLpNvAi
sgFuz/YgALV2h1whqFZN5RzRz58sABWgC48BzH4WyJ/jyUCDZCrk/5XKyavzQJm2
ZVGUWySV67FKU1d5IYFW8s3x8EFgZJMvTHpH+409JNDv0gFX1rI=
=f/oA
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
