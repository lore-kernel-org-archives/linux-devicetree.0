From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 4/4] regulator: core: Balance coupled regulators
 voltages
Date: Fri, 15 Dec 2017 15:19:58 +0000
Message-ID: <20171215151958.GH1827@finisterre>
References: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
 <CGME20171207094754eucas1p1528c6c30135124430a5c703eb81de8d2@eucas1p1.samsung.com>
 <1512639975-22241-5-git-send-email-m.purski@samsung.com>
 <20171212115427.GG16323@sirena.org.uk>
 <0bca0d20-1ca8-be4c-a60e-bbc0c640ae41@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4LFBTxd4L5NLO6ly"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0bca0d20-1ca8-be4c-a60e-bbc0c640ae41@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org


--4LFBTxd4L5NLO6ly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 13, 2017 at 10:25:00AM +0100, Maciej Purski wrote:

> > shared.  To that end I'd adjust the code so that we always have a
> > coupling descriptor and then handle the case where there's only one
> > regulator described in there.

> Do you have any suggestion, how should I implement that path? The thing which
> makes it more complicated is locking, because set_voltage_unlocked is done
> under one regulator's mutex and its suppliers, while balance procedure locks
> every coupled regulator without its suppliers. The suppliers for a single
> regulator are locked when setting a single regulator's voltage takes place.

We only really need to lock the supplies when doing the actual mechanics
of voltage changes so I'm not sure I see a big issue here - if we always
go through balancing first then voltage setting it should be fine.  If
everything is always balancing (even uncoupled regulators) then part of
the transition should be moving some if not all of the data updates to
balancing.

--4LFBTxd4L5NLO6ly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAloz6B4ACgkQJNaLcl1U
h9CsVgf/dTktVvRl2r58h6mNhkqDuihv9tHvH3uXpSncIc/gYpF0VhuREaL1hSTI
mLR3GnlGEpC/6PzuxZ01tfUJVa4c38a44rEax3rsRGJsxiRgB2PMqWo6EB+myDfD
lJnQluf12wLbE0gGk2tJ3AYu87XHQA3Zmx+MsIIjYRHTFMtI4kaIsbV4TygFQV2r
qFoKKyivjW4SPryzx5JK6NGZHweuEld58nICAWkedQcPTep63+xaAaQQPN2uUp/X
6X4FdeBpTeta/WiwwHPKOqP3/6VHjzvxJfaOzOwkOt1pX43JkO8KMv8Z0E11u+gY
4Qz0QuA+X5BHpPV7nIQA52lW656rpQ==
=05kB
-----END PGP SIGNATURE-----

--4LFBTxd4L5NLO6ly--
