From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: [PATCH] of: fix CONFIG_OF=n prototype of of_node_full_name()
Date: Thu, 15 May 2014 14:44:30 +1000
Message-ID: <20140515144430.11ab033b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UxigP4DD7CwC=XUAkFNnrC_"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/UxigP4DD7CwC=XUAkFNnrC_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Make the CONFIG_OF=3Dn prototpe of of_node_full_name() mateh the CONFIG_OF=
=3Dy
version.

Fixes compile warnings like this:

sound/soc/soc-core.c: In function 'soc_check_aux_dev':
sound/soc/soc-core.c:1667:3: warning: passing argument 1 of 'of_node_full_n=
ame' discards 'const' qualifier from pointer target type [enabled by defaul=
t]
   codecname =3D of_node_full_name(aux_dev->codec_of_node);

when CONFIG_OF is not defined.

Signed-off-by: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
---
 include/linux/of.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 3bad8d106e0e..e6f0988c1c68 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -349,7 +349,7 @@ int of_device_is_stdout_path(struct device_node *dn);
=20
 #else /* CONFIG_OF */
=20
-static inline const char* of_node_full_name(struct device_node *np)
+static inline const char* of_node_full_name(const struct device_node *np)
 {
 	return "<no-node>";
 }
--=20
2.0.0.rc2

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org

--Sig_/UxigP4DD7CwC=XUAkFNnrC_
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTdEY0AAoJEMDTa8Ir7ZwV7CgQAJC+DHrbp8juWA80O8To80qS
jkbBBOcL/xH4c3uTcsviSv1KaRsh51nbBiuYAYtYdjrXnuhLYzjG+14TlhIb+b3d
Dy9eK+VKw+EAViEfQMI9jGxiT8AMTh+ZnnPQjmCE5gn1GXTfJEd5dSWoQb7H/tFV
yfVj5CeX/HGQryFciTzRV6VD4Blh3lBE0lgrJJSgcn6As7GG25rQgb+Rq0Sfc9li
6sfcH9wsuoVygpeupMJpROAcj3Jk4/EC8y8jbwBDlh9icYSelUfRjnjWyCd2lkgk
jJubUhchEAMrZN2n5uiuFn5QPc528B6Whv8ztCzrjy2qVEHKKHSD0MB3s0gAsGSY
Gt2FGkKmKI0IgAJIjWd1bU0CZoygFCs+LiJA8IsHH6CnbSXtFZkBZCi4fq/CBCF6
6ZK0ixse49wwcRRsihsIPVk4vs+lTUgXOV4a4fepow4w8PAslHwEzuLijbVlPc4E
c0M1y1vhyyRXazh0POkzGDgE3HIx486RPJVi9hGmD28HaClxTRj+nxxYJ+78TW9w
mJNPW+LJ0GgUG5v+pLdZm9ggkZtzWnyYnV5FliVkDemCocY24PqHv2PTfFeh/ft3
H8MAWxN1aRnDXN7rYUNdWnDkV4k/bcCF7JtTrEorJqcX0n/DHrAvqGAZihdW81Bk
BUvVDICq6qQUdunf6zGC
=SydC
-----END PGP SIGNATURE-----

--Sig_/UxigP4DD7CwC=XUAkFNnrC_--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
