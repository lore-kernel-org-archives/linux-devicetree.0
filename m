From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 04/10] util_version: new helper for displaying version info
Date: Mon, 22 Apr 2013 11:54:06 -0400
Message-ID: <201304221154.08100.vapier@gentoo.org>
References: <1366078397-14889-1-git-send-email-vapier@gentoo.org>
 <201304212025.47665.vapier@gentoo.org> <E1UUIno-0004Ox-Dd@jdl.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3255741390937044697=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <E1UUIno-0004Ox-Dd-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============3255741390937044697==
Content-Type: multipart/signed;
  boundary="nextPart2098417.ygRZLkGhAC";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2098417.ygRZLkGhAC
Content-Type: multipart/mixed;
  boundary="Boundary-01=_f0VdRrHueQF7xCF"
Content-Transfer-Encoding: 7bit


--Boundary-01=_f0VdRrHueQF7xCF
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 22 April 2013 11:37:12 Jon Loeliger wrote:
> > hmm, looks like patch #2 (utilfdt_read and handling of the len argument)
> > was taken from the first patch series rather than the 3rd ?
> >=20
> > i'd suggest reverting it and applying instead the one from this series
> > ... Message-Id: <1366078397-14889-3-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
>=20
> Please send me the version you want applied.

attached
=2Dmike

--Boundary-01=_f0VdRrHueQF7xCF
Content-Type: text/x-patch;
  charset="utf-8";
  name="0001-utilfdt_read-pass-back-up-the-length-of-data-read.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
	filename="0001-utilfdt_read-pass-back-up-the-length-of-data-read.patch"

=46rom 7a0e8d370b62b902ccf3defb41e9af2d3d34e177 Mon Sep 17 00:00:00 2001
=46rom: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Date: Mon, 8 Apr 2013 00:56:54 -0400
Subject: [PATCH] utilfdt_read: pass back up the length of data read

=46or a follow up commit, we want to be able to scan the buffer that was
returned to us.  In order to do that safely, we need to know how big
the buffer actually is, so create a new set of funcs to pass that back.

Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
=2D--
 util.c | 19 ++++++++++++++++---
 util.h | 13 +++++++++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/util.c b/util.c
index 12f0614..0367df6 100644
=2D-- a/util.c
+++ b/util.c
@@ -197,7 +197,7 @@ char get_escape_char(const char *s, int *i)
 	return val;
 }
=20
=2Dint utilfdt_read_err(const char *filename, char **buffp)
+int utilfdt_read_err_len(const char *filename, char **buffp, off_t *len)
 {
 	int fd =3D 0;	/* assume stdin */
 	char *buf =3D NULL;
@@ -238,13 +238,20 @@ int utilfdt_read_err(const char *filename, char **buf=
fp)
 		free(buf);
 	else
 		*buffp =3D buf;
+	*len =3D bufsize;
 	return ret;
 }
=20
=2Dchar *utilfdt_read(const char *filename)
+int utilfdt_read_err(const char *filename, char **buffp)
+{
+	off_t len;
+	return utilfdt_read_err_len(filename, buffp, &len);
+}
+
+char *utilfdt_read_len(const char *filename, off_t *len)
 {
 	char *buff;
=2D	int ret =3D utilfdt_read_err(filename, &buff);
+	int ret =3D utilfdt_read_err_len(filename, &buff, len);
=20
 	if (ret) {
 		fprintf(stderr, "Couldn't open blob from '%s': %s\n", filename,
@@ -255,6 +262,12 @@ char *utilfdt_read(const char *filename)
 	return buff;
 }
=20
+char *utilfdt_read(const char *filename)
+{
+	off_t len;
+	return utilfdt_read_len(filename, &len);
+}
+
 int utilfdt_write_err(const char *filename, const void *blob)
 {
 	int fd =3D 1;	/* assume stdout */
diff --git a/util.h b/util.h
index 543a173..1f0ef47 100644
=2D-- a/util.h
+++ b/util.h
@@ -85,6 +85,13 @@ char get_escape_char(const char *s, int *i);
 char *utilfdt_read(const char *filename);
=20
 /**
+ * Like utilfdt_read(), but also passes back the size of the file read.
+ *
+ * @param len		If non-NULL, the amount of data we managed to read
+ */
+char *utilfdt_read_len(const char *filename, off_t *len);
+
+/**
  * Read a device tree file into a buffer. Does not report errors, but only
  * returns them. The value returned can be passed to strerror() to obtain
  * an error message for the user.
@@ -95,6 +102,12 @@ char *utilfdt_read(const char *filename);
  */
 int utilfdt_read_err(const char *filename, char **buffp);
=20
+/**
+ * Like utilfdt_read_err(), but also passes back the size of the file read.
+ *
+ * @param len		If non-NULL, the amount of data we managed to read
+ */
+int utilfdt_read_err_len(const char *filename, char **buffp, off_t *len);
=20
 /**
  * Write a device tree buffer to a file. This will report any errors on
=2D-=20
1.8.2.1


--Boundary-01=_f0VdRrHueQF7xCF--

--nextPart2098417.ygRZLkGhAC
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRdV0fAAoJEEFjO5/oN/WB5EEP/iUzoyrkcxr/C8rRghf95jji
jyJMfzeq2CmEqiHBpf3UQ9h6U0OYzKKCVQ0wwPZ9x1UZDP6e04V1w1fTs8ggnXsQ
lbzWjb/FUpUNYjp+J5YDR6PQq5e5V2pTWtZ+C/f+cgHiJ7sSiGF4QWiawkSfGzn0
4f8dcXw9RO31C7fHw+CZsNhZpKr9n/aBGa+oI6zxi9rsgqrcdZbkHomwZLeuRDw1
qRlo4sTkektxvesezUO0Jr04PoxhYzpFHYgQQG6aKJcD8C7PnDgvxTtkL9RPq8Wv
FclUx1u4MH/dgYwjeIFZGe6hCcUayg3G1Xbps1CPLcwZkSoyawXJ5hhOXs80Ymdm
jDn4CSY4lDiEVwk0NhW5v6PQRMTAo0qexzwC2fNXqBsA6fGACT4VOPyDfoDaNrhv
zxhAxk4R/VvhN0uBNURfRqOEb5Sk1UkbN5BKEMrMPjNUjGqWGp/ijRMW9BrO+azs
z9vCSYdEyYw3pfie37qce86WVB241JSiS/e70z7f87QDKcYdnJHI5MUA4MV12Kgb
M/PCTAEqJ/K1PTXJsCjuMWWZnb9qzcfyoy+UTBR3RSNbQ+5Jgdmy1FLatLpRAE8s
XzlZU7lp3QMZ0xJA6ye8Ks+lxiaSm4u0EF6KT7CsKfVa9wXct6lKNuy7koOpDWbs
mpqEdN5OxTWS7rfwPAIB
=FHl0
-----END PGP SIGNATURE-----

--nextPart2098417.ygRZLkGhAC--

--===============3255741390937044697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3255741390937044697==--
