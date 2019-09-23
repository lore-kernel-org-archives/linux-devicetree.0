From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 3/3] gpio: syscon: Add support for the Xylon LogiCVC GPIOs
Date: Mon, 23 Sep 2019 15:33:25 +0200
Message-ID: <20190923133325.GA57525@aptenodytes>
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
 <20190910152855.111588-3-paul.kocialkowski@bootlin.com>
 <CACRpkdY40PZc9R-yFwooR4-WMgn3LH7K+yTx00ZNxyq6OOnw6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdY40PZc9R-yFwooR4-WMgn3LH7K+yTx00ZNxyq6OOnw6A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 12 Sep 19, 10:17, Linus Walleij wrote:
> On Tue, Sep 10, 2019 at 4:29 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
>=20
> > The LogiCVC display hardware block comes with GPIO capabilities
> > that must be exposed separately from the main driver (as GPIOs) for
> > use with regulators and panels. A syscon is used to share the same
> > regmap across the two drivers.
> >
> > Since the GPIO capabilities are pretty simple, add them to the syscon
> > GPIO driver.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>=20
> I'm fine with this for now, but the gpio-syscon driver is now growing
> big and when you use it you are getting support for a whole bunch
> of systems you're not running on included in your binary.
>=20
> We need to think about possibly creating drivers/gpio/syscon
> and split subdrivers into separate files and config options
> so that people can slim down to what they actually need.

Thanks for the review!

I understand your concern about more devices getting pulled-in and built
unconditionally. Though I do like the idea of having a single driver for on=
ly
exposing the GPIO part of bigger components instead of specific drivers with
< 100 lines of useful code.

Maybe a first step would be to introduce Kconfig options for each device and
ifdef around in the code, as to solve the "built unconditionally" aspect?

Either way, I'll send v2 still adding my driver to gpio-syscon but feel fre=
e to
have me in the loop when that driver needs to be changed.

> > +       *bit =3D 1 << offset;
>=20
> Please do this:
>=20
> #include <linux/bits.h>
>=20
> *bit =3D BIT(offset);

Sure thing and sorry I missed that, thanks!

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2IyaUACgkQ3cLmz3+f
v9F0nQgAjJ5BXBlS8EuvhntG+VA0UwBa5KB56iTBqjHtJqvSOjtuz/EgGyaGm/fB
pETn2ZUp76AQXEDI7VOdNX5uHmaNepAX0kwtVuwx6vE2hvLoz3WiPq9bgCSIs/iY
fAvRY4tl6ECT2SHJP/jeL1K0C7PKzN+6YIQOsIbz8i5KKSjNJyFAkzZjJ671TA1u
4Nfe6fNGxxU+eUJpCijcLa+t9mNaoS0hY8v5/adLNJxD72RBIbYQAku6Y8o3o7HX
y0fBWFrBnvVJzd24Y3COxoojpc3hjpRJgu0mYgcL2KU05uSt9r7phLIBW+ARJaua
qSpN0ZfQjVfWFhW8qbi6xc29nKA94w==
=Bf8P
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
