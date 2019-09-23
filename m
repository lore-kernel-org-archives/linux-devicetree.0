From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 2/3] dt-bindings: gpio: Add binding document for xylon
 logicvc-gpio
Date: Mon, 23 Sep 2019 15:59:08 +0200
Message-ID: <20190923135908.GC57525@aptenodytes>
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
 <20190910152855.111588-2-paul.kocialkowski@bootlin.com>
 <CACRpkdYrTCnrW6-28+RhdMZ4cB5VcqG6T-5aABvvEgiZ3iri2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYrTCnrW6-28+RhdMZ4cB5VcqG6T-5aABvvEgiZ3iri2Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 12 Sep 19, 10:19, Linus Walleij wrote:
> On Tue, Sep 10, 2019 at 4:29 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
>=20
> > The Xylon LogiCVC display controller exports some GPIOs, which are
> > exposed as a dedicated driver.
> >
> > This introduces the associated device-tree bindings documentation.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> (...)
> > +The controller exposes GPIOs from the display and power control regist=
ers,
> > +which are mapped by the driver as follows:
> > +- GPIO[4:0] (display control) mapped to index 0-4
> > +- EN_BLIGHT (power control) mapped to index 5
> > +- EN_VDD (power control) mapped to index 6
> > +- EN_VEE (power control) mapped to index 7
> > +- V_EN (power control) mapped to index 8
>=20
> This should be reflected in the gpio-line-names in the example
> and in your device trees.

Thanks, I didn't know about it until now!

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2Iz6wACgkQ3cLmz3+f
v9Ge/Qf/V4OjLLSvFC8UlTYdc4Kdoazi93MSGndrpRjnjx6zjgxVIN1iSUOtPUWk
t9JqNHAsIKfhKfVZ3gOosU/q7hSNlAY/3U9F73VxErLqKhyrQRqJO9obel/eITE5
/7ATIkhm+2Ejjn24oHZn9RaqJQhi0JT7IaYmwBGssq0ZYyF2IF+rxUFpDioj4iia
j2Iog14fAHWjP9a4eeNz6rjf7M+RuTgfAQ4c/4r7xkp2t39s5puSYFU3EZ4mOuA+
8OcqcqqF0fGY8mj3dBDe/U7IzpoT2Nk9e1Qj/Zy+PsIgZbUG06kJ5AgNjXGuADi0
qzuNWl1mhPC3VNLXdPqTwLLP+MgE1Q==
=h+JT
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
