From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: dtc: New v1.4.1 release, and tarballs now on kernel.org
Date: Wed, 12 Nov 2014 15:11:45 +1100
Message-ID: <20141112041145.GB17562@voom.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello all,

As you probably know, the git tree and mailing lists for dtc have been
hosted on kernel.org for a while now.  However, release tarballs have
not been there.. until now!

WIth jdl.com now shut down, there hasn't actually been anywhere to
download dtc release tarballs recently, but I've now got a directory
set up for this on kernel.org and investigated the mysteries of kup.
dtc release tarballs can now be downloaded from:
    https://www.kernel.org/pub/software/utils/dtc/

In addition, it's been a while since the last dtc release (v1.4.0).
We haven't really developed any interesting new features in that time,
but there have been some important bugfixes, so it's time we rolled a
release.

The new v1.4.1 release has been tagged in git, and has a released
tarball with all the others.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUYt4BAAoJEGw4ysog2bOSk/kQALoigH12T0SAQiMZfXoVvB2e
A4YhxZKIQHVy8icUbzTsDry2hvr1QjDD5Q+FaCp6ZfYSvA7mqa+V24xu3NGcGuj+
6321YXqQLN3qkHt2EKUOIlKdcNLCdsDb9b+dyGGriOPYCpSnKbJamfP+x8TwROhh
TD1zwToZ/Di561IK2HJEojcG+PbZkrnkXt/I3z4FuqaZB7Pejhm5/+Zt0SXm16gB
bZVchkE+Ke4HDtwcciev7afUpGsaNXkcYsltqG7QCzRnCUMdUavWkKCa+Be+vOdq
6Qip1zEi0yfx3tzj1OaQGooJThcamMwAfxO/D2Jkn2/Daj9RhRN31JCfY11C0saG
DHvtgu3n8Zhyu1tigymMdBr/oPmjApjO4adcQW3Q85c5zQKG83Nx6OqQNR6pgkzX
w1eTmpK25/NZ0mafBi8XjROJ5I11JHEz5UFRPdefgEvcQ8EiyD+g7mn3rbS/OXs7
Xe9/muPSsp8V3OOc36/HKMUQ2Kxk7M4cAMJ8eQr3KyIK/wFmblQCuc3/uHBr8mLj
qi29o8RCX7Jp+ooSTYGwkD0ox7z5KNWdYO+YSG19W51bHV5qL+y+JKxSRRSgAoRu
NVPBTMOXgHtJ+zkSM3KvT5qdVbW75GagzEVGeNq8Bw7PJYA6GsuDZVMUK/u1vdfI
7qzoIbNuBQZwsfhfN2rc
=pBVB
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
