From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 0/7] Add coupled regulators mechanism
Date: Fri, 26 Jan 2018 17:31:28 +0000
Message-ID: <20180126173128.GE32674@sirena.org.uk>
References: <CGME20180122143019eucas1p213b852c98cde3fb8a77b96ab0d372ee6@eucas1p2.samsung.com>
 <1516631412-17542-1-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ep0oHQY+/Gbo/zt0"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1516631412-17542-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org


--ep0oHQY+/Gbo/zt0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2018 at 03:30:05PM +0100, Maciej Purski wrote:

> this patchset adds a new mechanism to the framework - regulators' couplin=
g.

> On Odroid XU3/4 and other Exynos5422 based boards there is a case, that
> different devices on the board are supplied by different regulators
> with non-fixed voltages. If one of these devices temporarily requires=20

I think I'm basically happy with this however it's right before the
merge window so I'll hold off until after that for the majority of the
series, I'll apply some of the refactoring bits now.  I may have more
comments after another pass through but they shouldn't be too big I
think.

--ep0oHQY+/Gbo/zt0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlprZe8ACgkQJNaLcl1U
h9Bs7Af/SqWZj2/W/vdyUCWr/GCNSs17zutsU4IhAXjzHLNF/cd+dFvbDGO2mSK0
IOMURble13FfK2Q47vQ5ZJUaz4fr1mX/s9xss+LsCA0e9xnOFXg6Z3PsWVLergwk
bh9jRkHM6m5sFi0qXxm/XidVUzfQfJ2VzaLugi0VnrwAri57k8QJOIbjqgO3lToo
RyVa1nmu/DohK9RBqPCRMWUaPgDwHbBAX3sUOzFToxT6cznf18bDu9mO/I0KWpXV
qdFGKIfTF49GrCMHKyr1gSkoSPZS/JI3RnCT/9vOpplZRV/duYgB2fNnOVrT1I4T
pkj6pRQScqv2mIsCj3w+w9KKGk4a1A==
=3SVh
-----END PGP SIGNATURE-----

--ep0oHQY+/Gbo/zt0--
