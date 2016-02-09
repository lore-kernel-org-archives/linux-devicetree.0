From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 2/3] arm64: dts: add the Alpine v2 EVP
Date: Tue, 9 Feb 2016 09:56:33 +0100
Message-ID: <20160209085633.GA5388@kwain>
References: <1454922699-16785-1-git-send-email-antoine.tenart@free-electrons.com>
 <1454922699-16785-3-git-send-email-antoine.tenart@free-electrons.com>
 <56B8B45D.1020902@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56B8B45D.1020902@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, catalin.marinas@arm.com, will.deacon@arm.com, tsahee@annapurnalabs.com, linux-arm-kernel@lists.infradead.org, rshitrit@annapurnalabs.com, thomas.petazzoni@free-electrons.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Barak Wasserstrom <barak@annapurnalabs.com>
List-Id: devicetree@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marc,

On Mon, Feb 08, 2016 at 03:29:33PM +0000, Marc Zyngier wrote:
> On 08/02/16 09:11, Antoine Tenart wrote:
>=20
> > +		gic: gic@f0100000 {
> > +			compatible =3D "arm,gic-v3";
> > +			reg =3D <0x0 0xf0200000 0x0 0x10000>,	/* GIC Dist */
> > +			      <0x0 0xf0280000 0x0 0x200000>,	/* GICR */
> > +			      <0x0 0xf0100000 0x0 0x2000>;	/* GICC */
> > +			interrupt-controller;
> > +			#interrupt-cells =3D <3>;
> > +		};
>=20
> Something is wrong here. Either you are missing GICH and GICV (assuming
> you have legacy support), or you have an extra GICC region (which
> doesn't make sense on its own).
>=20
> You're also missing the maintenance interrupt.
>=20
> Has Anapurna really built a GICv3 without an ITS?

I documented myself and Annapurna's GIC really doesn't have an ITS.

I'll add the missing regions.

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWuam9AAoJEFxNi8it27zYNNoP/1l9L+lsTF2o/+4Cic1xK1f/
FdxG8KReE+poGrzMlBXUpi3LInPvYLzuGMhh2jhcA0Dc5o9t1LOg3HvTD6iLGc2P
b8QqhLDo1J8FlV8OqTUbyqOGWBEUNV/sxWO1uKJys8I8xviPUar6juecYxWShqd4
sVVqO4BqftCoeZAkpm0REsneLKedMYOpYPNqlgIZV2H3Cw2BMkmq8+pPYXl2O8pk
BtTDAPL/dWJRsM9mnChUTn+SGcwKFawj1n8CNgEkbt3nMyBsr3yV9G8VoaZguDZ4
0Ui+51tdSBO51souD4vYuOWdKE4fgNTFAgn4SUG8xo8ktYwCUHxYXuiM0o055YXo
Vs/ZWsliqaYfDLLPzdKEcqBh7bWqIL0jTUNH8bluaqObUJM0kElIyLVM7XB0TS7w
UhRrGSUcavAY7RMtKApuCJyNTzGt1Ru/zC6Qe4mMquyjrFGi/bkTZfbCgUfgIjGP
/6UD2hLVw6V0gMMuT/Bx4FFL+864f4WYnbyRDzv0PHOJY6ULckF9mFWrE2aqKQpB
qYN8gKvDE53/CTeYQGp7WKKTX1xVsld2U99Nkk6CrIv5fvFLptLHKeT2Z24+HK6L
UycklKBICO1x4Yj1FTaXX01GSe9n0mEhVENKJ36RdvYkK1ssw+4SELL78LWgvZ+0
csyAA9RkXuByJmKAEyyu
=H10j
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
