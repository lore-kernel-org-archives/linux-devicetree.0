From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Linux-3.14-rc2: Order of serial node compatibles in DTS files.
Date: Wed, 12 Feb 2014 13:28:16 +0800
Message-ID: <20140212052816.GA15434@pek-khao-d1.corp.ad.wrs.com>
References: <alpine.LRH.2.00.1402071348380.10318@ra8135-ec1.am.freescale.net>
 <20140210110342.GA15806@visitor2.iram.es>
 <alpine.LRH.2.00.1402101056410.10318@ra8135-ec1.am.freescale.net>
 <20140211072606.GA26514@visitor2.iram.es>
 <OF6F6A0029.3B20EF5B-ONCA257C7C.0071BFDA-CA257C7C.00732AD3@csc.com>
 <63AEBD99-AA87-4FD7-BBDA-0CE419959F14@kernel.crashing.org>
 <52FAA97F.4060600@gmail.com>
 <1392162080.6733.404.camel@snotra.buserror.net>
 <52FAB65C.4090201@gmail.com>
 <OF9BA019D5.46DA1E29-ONCA257C7D.000089EA-CA257C7D.00020333@csc.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <OF9BA019D5.46DA1E29-ONCA257C7D.000089EA-CA257C7D.00020333-SmukeSwxQOQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2014 at 10:21:58AM +1000, Stephen N Chivers wrote:
> But, the Interrupt Controller (MPIC)
> goes AWOL and it is down hill from there.
>=20
> The MPIC is specified in the DTS as:
>=20
>         mpic: pic@40000 {
>                         interrupt-controller;
>                         #address-cells =3D <0>;
>                         #interrupt-cells =3D <2>;
>                         reg =3D <0x40000 0x40000>;
>                         compatible =3D "chrp,open-pic";
>                         device_type =3D "open-pic";
>                         big-endian;
>                 };
>=20
> The board support file has the standard mechanism for allocating
> the PIC:
>=20
>         struct mpic *mpic;
>=20
>         mpic =3D mpic_alloc(NULL, 0, 0, 0, 256, " OpenPIC  ");
>         BUG_ON(mpic =3D=3D NULL);
>=20
>         mpic_init(mpic);
>=20
> I checked for damage in applying the patch and it has applied
> correctly.

How about the following fix?

diff --git a/drivers/of/base.c b/drivers/of/base.c
index ff85450d5683..ca91984d3c4b 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -730,32 +730,40 @@ out:
 }
 EXPORT_SYMBOL(of_find_node_with_property);
=20
+static int of_match_type_name(const struct device_node *node,
+				const struct of_device_id *m)
+{
+	int match =3D 1;
+
+	if (m->name[0])
+		match &=3D node->name && !strcmp(m->name, node->name);
+
+	if (m->type[0])
+		match &=3D node->type && !strcmp(m->type, node->type);
+
+	return match;
+}
+
 static
 const struct of_device_id *__of_match_node(const struct of_device_id *matc=
hes,
 					   const struct device_node *node)
 {
 	const char *cp;
 	int cplen, l;
+	const struct of_device_id *m;
+	int match;
=20
 	if (!matches)
 		return NULL;
=20
 	cp =3D __of_get_property(node, "compatible", &cplen);
 	do {
-		const struct of_device_id *m =3D matches;
+		m =3D matches;
=20
 		/* Check against matches with current compatible string */
-		while (m->name[0] || m->type[0] || m->compatible[0]) {
-			int match =3D 1;
-			if (m->name[0])
-				match &=3D node->name
-					&& !strcmp(m->name, node->name);
-			if (m->type[0])
-				match &=3D node->type
-					&& !strcmp(m->type, node->type);
-			if (m->compatible[0])
-				match &=3D cp
-					&& !of_compat_cmp(m->compatible, cp,
+		while (m->compatible[0]) {
+			match =3D of_match_type_name(node, m);
+			match &=3D cp && !of_compat_cmp(m->compatible, cp,
 							strlen(m->compatible));
 			if (match)
 				return m;
@@ -770,6 +778,15 @@ const struct of_device_id *__of_match_node(const struc=
t of_device_id *matches,
 		}
 	} while (cp && (cplen > 0));
=20
+	/* Check against matches without compatible string */
+	m =3D matches;
+	while (!m->compatible[0] && (m->name[0] || m->type[0])) {
+		match =3D of_match_type_name(node, m);
+		if (match)
+			return m;
+		m++;
+	}
+
 	return NULL;
 }


Thanks,
Kevin
>=20
> Stephen Chivers,
> CSC Australia Pty. Ltd.
>=20
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJS+wZwAAoJEJNY7TDerrFxwe0H/if5TJun5BPaDp8Y0ucE+KRA
KQTILVanHPf6iUzp3u0UAkPWKvZXdQ/+1JzfPayk3fP6I0EERybXLkNPKGWKfgpm
tv5VGGQ4l6GUxN9XIvNgn2uauvUzLx2uJFvQL8HXNDuQ3ihL4HQ5SAn7Crx8++/G
9f9tw0UzVN1AC1pptw2PvrNuVplw9hVxVHGFrEzgL9e/9IR948yTibyYMYP4tVTF
6X2zQBb4U0Jt2wGYenvY8SeYE2jVVPjbq0eHI01XegJcKkDlXMZUILrnpv0rjtOk
ZQWMygGlkr9gCJ77jqzysqy36VbA1oSGGZXy0tSFu4jcmalvV5DW+AX8PV9Om/g=
=KyaM
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
