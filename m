From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 1/3] gpio: syscon: Add support for a custom get operation
Date: Mon, 23 Sep 2019 15:34:22 +0200
Message-ID: <20190923133422.GB57525@aptenodytes>
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
 <CACRpkdYGCWc007s-9_jvX2aKuZv8fTfV2UX-qBBi7WtePABMVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYGCWc007s-9_jvX2aKuZv8fTfV2UX-qBBi7WtePABMVg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 12 Sep 19, 10:18, Linus Walleij wrote:
> On Tue, Sep 10, 2019 at 4:29 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
>=20
> > Some drivers might need a custom get operation to match custom
> > behavior implemented in the set operation.
> >
> > Add plumbing for supporting that.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>=20
> Looks OK but as noted in the other patch: we are accumulating stuff
> in this driver, possibly this syscon part should just be a library
> used by individual drivers that can be switched on/off with Kconfig.

Looks like adding support for a custom get operation would be good to have
before moving to a library then :)

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2Iyd4ACgkQ3cLmz3+f
v9GTRwf/QMRbnfLKLj5Ype++iShGpT/O1GGoO4kldJ42cfZrNo0mFTnoqV4lxnRN
JZl4o/S2yv1YNbTwbZu3Cz5AsD0PHfkiQqLyN1rJyKH1br3ixAxMKAfH1cIKSxAF
0u5oLcsXJFawlT33d4XAjC8cezdDVnJi4qqIg/CwW3JLuhBU3OPbUz3Ck04eeCu+
ZqH2GaeJX3IyOHimi3d9wOjCMHV7iTTNsEgwlDJYtnLxRX3xEz8p+MYoFI8rharO
FvyR3+tMzbCYbxQrgAuc6DlINUVQK7hVzB04RA29gnlRyBIh+LHSSDhT5nB5niQ7
O9g4NJbCWp8IiI3Ye9fjNpC/WkKaCg==
=pqWT
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
