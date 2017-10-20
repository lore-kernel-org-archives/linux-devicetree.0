From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH 2/5] gpio: gpiolib: Add OF support for maintaining
 GPIO values on reset
Date: Fri, 20 Oct 2017 17:59:35 +1030
Message-ID: <1508484575.24322.43.camel@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
         <20171020033727.21557-3-andrew@aj.id.au>
         <CACRpkdbxOen3ohwmDc8ZNWkirn3mNHaGiZq1O-6VnOjhvFcw+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-BCytwq9eSiP4jHVTrvre"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbxOen3ohwmDc8ZNWkirn3mNHaGiZq1O-6VnOjhvFcw+w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--=-BCytwq9eSiP4jHVTrvre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-20 at 09:18 +0200, Linus Walleij wrote:
> On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au>
> wrote:
>=C2=A0
> > @@ -32,6 +32,7 @@ enum of_gpio_flags {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OF_GPIO_SINGLE_ENDED =
=3D 0x2,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OF_GPIO_OPEN_DRAIN =3D =
0x4,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OF_GPIO_SLEEP_MAY_LOSE_=
VALUE =3D 0x8,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OF_GPIO_RESET_TOLERANT =3D 0=
x16,
>=C2=A0
> Now you're mixing up decimal and hex.

Ugh. Whoops.
--=-BCytwq9eSiP4jHVTrvre
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6aXfAAoJEJ0dnzgO5LT5CVcP+QEkSzpGSdgHTFWo1m8kUNxl
+aDVPbfR1xNybZrDRtMoiMnAHHqepqMqskRV8khGX6UabnPvUZjHMf1WGoJM1Alu
Q3xxyVUXu788++RsJPP7ByVMfS1Tjju6EYJOeKMbhouflcrArKYakquKkGyd7W/2
4h8sjx9pVICn+Gy0PZKjU/VTfCmQBKymyvJOIs32YXyupCN5LSxSIaeVQ4UJD18a
U0dXN8fa7JyiQdoI9VYqdU1Y8RBX1TjX8XN1iFqojy3J5MOpgN/DaMIFZKwlR3OC
+7TToQXoRHkfZTCf7mJUPpxYxlef8oTqAEC6PrHnnmq4FzfJBamta9km0NWri+4C
wKMLqRQO6btuNkCL3uOIEna1YsdYrA8A884nel8HWb8eP/7xrwT+Srh54bYCGaUo
lFm3ppBT2jG2VOadjxzPJAIlZRfHgDNryr/BO+QLYftIPBOuP77l19iLOVSXHGDS
VVt6CARmXCtWAI9guvgnugHA+2OlnVtoab4qZJISQsjKIRMd3WX1TmMgOlvKwD8y
Y0lNIsa6UpgIUPfoaSEC47APrOsBTId74wd1mUQaLnYpBDQjIuvn5vR/lyXSUPto
5crMFyO0bZBGToIsUKVEx44s4RdbD7wSfz8lDx+XsXOPi1xpI2RiOnW/4vt+Hsw8
hYqxksWxCTYiGYFn5G8l
=xe2g
-----END PGP SIGNATURE-----

--=-BCytwq9eSiP4jHVTrvre--
