From: Pavel Machek <pavel@ucw.cz>
Subject: Consistent capitalization of "device tree"?
Date: Mon, 7 Jan 2019 19:37:11 +0100
Message-ID: <20190107183711.GA5671@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, corbet@lwn.net, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Is it "Device Tree" or "device tree"?
   =20
 pavel@duo:/data/l/k/Documentation$ grep -r "Device Tree"  | wc -l
 235
 pavel@duo:/data/l/k/Documentation$ grep -r "device tree"  | wc -l
 595
   =20
I guess it would be nice to make it consistent. I guess "device tree"
is preffered?

Should we do something like this?
								Pavel

Signed-off-by: Pavel Machek <pavel@ucw.cz>
   =20
diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/dev=
icetree/overlay-notes.txt
index 725fb8d..cc5f507 100644
--- a/Documentation/devicetree/overlay-notes.txt
+++ b/Documentation/devicetree/overlay-notes.txt
@@ -8,7 +8,7 @@ companion document to Documentation/devicetree/dynamic-reso=
lution-notes.txt[1]
 How overlays work
 -----------------
=20
-A Device Tree's overlay purpose is to modify the kernel's live tree, and
+A device tree's overlay purpose is to modify the kernel's live tree, and
 have the modification affecting the state of the kernel in a way that
 is reflecting the changes.
 Since the kernel mainly deals with devices, any new device node that result

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwznFcACgkQMOfwapXb+vIgYwCfTmcj844BEmwus3pL2tHXVvih
hKwAn3Q//DngNjgqZmiFNmNlFCYcuUey
=aXsV
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
