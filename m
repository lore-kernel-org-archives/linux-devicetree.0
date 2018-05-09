From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH] driver core: make deferring probe forever optional
Date: Wed, 9 May 2018 18:18:16 +0900
Message-ID: <20180509091816.GZ13402@sirena.org.uk>
References: <20180501213114.20183-1-robh@kernel.org>
 <20180507183106.GF2259@tuxbook-pro>
 <CAL_Jsq+PRUR5rCeV820XZuQmQH3gD-X=6a5fNuF-9qVbq5dqFg@mail.gmail.com>
 <20180507223438.GB14924@minitux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x0Bbm7aQwrWvLJ2v"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180507223438.GB14924@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Architecture Mailman List <boot-architecture@lists.linaro.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Alexander Graf <agraf@suse.de>
List-Id: devicetree@vger.kernel.org


--x0Bbm7aQwrWvLJ2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 07, 2018 at 03:34:38PM -0700, Bjorn Andersson wrote:

> And is this really a problem that does not exists in the ACPI world?

Sort of, in that on ACPI systems all devices are expected to live in
glorious isolation and anything they need transparently configured by
the firmware with any information about clock speeds or whatever coming
=66rom proprietary/device specific properties (though that's severely
frowned upon) or the apparently idiomatic technique of hardcoding based
on DMI data which has some scalability issues.  This works great for
systems intended to work in the ACPI model but is not entirely
successful once you get outside of that.

Some of the embedded ACPI people have been importing bits of DT
wholesale into ACPI, for those bits obviously all the DT issues get
imported too.

--x0Bbm7aQwrWvLJ2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlryvNcACgkQJNaLcl1U
h9DA3gf+Iei5ou4tBOVJglGvoZ9igFjOMgHOgHeDUH2v8uKK7n2+aXapXif5Y6ky
wHId+gxnZvk35qkhFCyaDsz8Ay4LSk2JAP92DppH+BgLfaSfJ7aRi4tg6Zh6zGZ8
nb1p2OXP9v/Ai47mDOmPsum4VGWxxXdXUjhnNj0krhFZVPmvjqnQgHf7KMd4a2oZ
ppECMkwnFHpSjRE0hXrepCl+8nVDHVHhfboCY3nK+a5ZRhO5M1KjTsiJfi/+bxJW
4PkbPl8eQ/qHPY9iiebJtq9SGgjlwZSQfdGMBDG5JXMY/elWHBH2DpLvi/CvJFvk
1k1qhttEq3WiQbeNjieLdgNcu6GOBA==
=xcHg
-----END PGP SIGNATURE-----

--x0Bbm7aQwrWvLJ2v--
