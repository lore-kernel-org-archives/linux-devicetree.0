From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 2/3] arm64: dts: add the Alpine v2 EVP
Date: Tue, 9 Feb 2016 10:01:31 +0100
Message-ID: <20160209090131.GB5388@kwain>
References: <1454922699-16785-1-git-send-email-antoine.tenart@free-electrons.com>
 <1454922699-16785-3-git-send-email-antoine.tenart@free-electrons.com>
 <56B8B45D.1020902@arm.com>
 <20160209085633.GA5388@kwain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160209085633.GA5388@kwain>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, catalin.marinas@arm.com, will.deacon@arm.com, tsahee@annapurnalabs.com, linux-arm-kernel@lists.infradead.org, rshitrit@annapurnalabs.com, thomas.petazzoni@free-electrons.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Barak Wasserstrom <barak@annapurnalabs.com>
List-Id: devicetree@vger.kernel.org


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2016 at 09:56:33AM +0100, Antoine Tenart wrote:
> Hi Marc,
>=20
> On Mon, Feb 08, 2016 at 03:29:33PM +0000, Marc Zyngier wrote:
> > On 08/02/16 09:11, Antoine Tenart wrote:
> >=20
> > > +		gic: gic@f0100000 {
> > > +			compatible =3D "arm,gic-v3";
> > > +			reg =3D <0x0 0xf0200000 0x0 0x10000>,	/* GIC Dist */
> > > +			      <0x0 0xf0280000 0x0 0x200000>,	/* GICR */
> > > +			      <0x0 0xf0100000 0x0 0x2000>;	/* GICC */
> > > +			interrupt-controller;
> > > +			#interrupt-cells =3D <3>;
> > > +		};
> >=20
> > Something is wrong here. Either you are missing GICH and GICV (assuming
> > you have legacy support), or you have an extra GICC region (which
> > doesn't make sense on its own).
>=20
> I'll add the missing regions.

Hmm, in fact the GICC region shouldn't be there. I'll make some tests
and remove it.

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWuarqAAoJEFxNi8it27zYCbwP/RyPCfgFZ45BON9FjEFyD1fI
hjrRl/pYpEwoF0Et1Xg6poLiC9w+wvrKnU3XzqJhBCxtu+bMKfKWNd4Wwztqbc7g
puBhJ+KkjYczLkgbki+yycMA9s1Z/1YVcF5DtBwX2Km343KHSgoiV6hIiauhp9NV
1Uhp/gttQoe7VDcfuvQqqD0u0L7tS64dafrP5bC/aa+YZgjZPqTmKOY+ffhqMiOi
N9/nMr0lZgbGs+vcb+Qky4hsxcMQ5ChPPLdb/H/kBZBUHRXCE8PB/6uLsRzmif2J
ehYDvjjKBHDu9vjh1eTG5l6K1RXp5k115o9R9xCNEpErqmCwDiwCZFXrgzMT4eh4
d8l4MeYSWVZL1gl3O5RRdSoShPHsLmjGGbidFkugkhCkcV0if3NXcbfuNq0+rXzq
0kDgIV5SVijGZmQLUtWSFY9lTaX9R5Zik48JyL33G21QD1NynBUVKPAO28nkOK1R
HTMM0Z1HnfVkntoqrqdq+Siht1bl4FamDcID+vp2sWNWFJim+0aBhJQFCMzhiyT9
3rnQj5RL2ce0kIQWllZcI7kMp+g09W4FEqARS2ZvtIZHfQGGKpVqUqOvj/owaHdJ
iWHUL2ksMBiZvmBp8aLA+PPYAm2wuY4rWm1ZhUxymnIzb00DrKjywP3js0YQ0OCc
zJh9V1jzaB0oRoZiBO3w
=re3/
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
