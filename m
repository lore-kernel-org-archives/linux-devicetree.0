From: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] powerpc/sequoia: fix NAND partitions not to overlap
Date: Sun, 2 Apr 2017 12:05:36 +0200
Message-ID: <20170402100535.GA18340@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sr-ynQEQJNshbs@public.gmane.org, jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Fix overlapping NAND partitions.

Signed-off-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>

diff --git a/arch/powerpc/boot/dts/sequoia.dts b/arch/powerpc/boot/dts/sequ=
oia.dts
index b1d3292..e41b88a 100644
--- a/arch/powerpc/boot/dts/sequoia.dts
+++ b/arch/powerpc/boot/dts/sequoia.dts
@@ -229,7 +229,7 @@
 						};
 						partition@84000 {
 							label =3D "user";
-							reg =3D <0x00000000 0x01f7c000>;
+							reg =3D <0x00084000 0x01f7c000>;
 						};
 					};
 				};



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljgzO8ACgkQMOfwapXb+vKEZgCfVRsMI8C5xK/R4J8IZxqMTax3
eO4An2eRzivAtre0Jf3x2C8/79dSlR83
=15XD
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
