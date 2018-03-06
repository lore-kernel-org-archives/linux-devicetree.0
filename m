From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Overlay sugar syntax (was: Re: [PATCH v6 3/4] drm: rcar-du: Fix
 legacy DT to create LVDS encoder nodes)
Date: Tue, 6 Mar 2018 14:54:12 +1100
Message-ID: <20180306035412.GU2650@umbus.fritz.box>
References: <CAMuHMdUqvZEKu5v4E29ofjj09sv+Yxk41W4K+FnfqKQ=88AWRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1787769083=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAMuHMdUqvZEKu5v4E29ofjj09sv+Yxk41W4K+FnfqKQ=88AWRA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1787769083==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Chn8nxio6L/4biUD"
Content-Disposition: inline


--Chn8nxio6L/4biUD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2018 at 09:05:24AM +0100, Geert Uytterhoeven wrote:
> Hi Frank,
>=20
> On Fri, Feb 23, 2018 at 3:38 AM, Frank Rowand <frowand.list@gmail.com> wr=
ote:
> > I was hoping to be able to convert the .dts files to use sugar syntax
> > instead of hand coding the fragment nodes, but for this specific set
> > of files I failed, since the labels that would have been required do
> > not already exist in the base .dts files that that overlays would be
> > applied against.
>=20
> Indeed, hence the fixup overlays use "target-path".
>=20
> BTW, is there any specific reason there is no sugar syntax support in dtc
> for absolute target paths? I guess to prevent adding stuff to a random
> existing node, and to encourage people to use a "connector" API defined in
> term of labels?

Only because it hasn't been implemented.  Using &{/whatever} should
IMO generate a target-path and the fact it doesn't is a bug.

> I'm also in the process of converting my collection of DT overlays to sug=
ar
> syntax, and lack of support for "target-path" is the sole thing that holds
> me back from completing this. So for now I use a mix of sugar and
> traditional overlay syntax.
>=20
> In particular, I need "target-path" for two things:
>   1. To refer to the root node, for adding devices that should live at
>      (a board subnode of) the root node, like:
>        - devices connected to GPIO controllers provided by other base or
>          overlay devices (e.g. LEDs, displays, buttons, ...),
>        - clock providers for other overlays devices (e.g. fixed-clock).
>   2. To refer to the aliases node, for adding mandatory serialX aliases.
>=20
> The former is the real blocker for me.
>=20
> The latter doesn't work with plain upstream (hacky patches available), so
> I'm working on getting rid of the serialX requirement in the serial drive=
r.

Below is draft patch adding target-path support.  The pretty minimal
test examples do include a case using &{/}

=46rom 8f1b35f88395adea01ce1100c5faa27dacbc8410 Mon Sep 17 00:00:00 2001
=46rom: David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 6 Mar 2018 13:27:53 +1100
Subject: [PATCH] Correct overlay syntactic sugar for generating target-path
 fragments

We've recently added "syntactic sugar" support to generate runtime dtb
overlays using similar syntax to the compile time overlays we've had for
a while.  This worked with the &label { ... } syntax, adjusting an existing
labelled node, but would fail with the &{/path} { ... } syntax attempting
to adjust an existing node referenced by its path.

The previous code would always try to use the "target" property in the
output overlay, which needs to be fixed up, and __fixups__ can only encode
symbols, not paths, so the result could never work properly.

This adds support for the &{/path} syntax for overlays, translating it into
the "target-path" encoding in the output.  It also changes existing
behaviour a little because we now unconditionally one fragment for each
overlay section in the source.  Previously we would only create a fragment
if we couldn't locally resolve the node referenced.  We need this for
path references, because the path is supposed to be referencing something
in the (not yet known) base tree, rather than the overlay tree we are
working with now.  In particular one useful case for path based overlays
is using &{/} - but the constructed overlay tree will always have a root
node, meaning that without the change that would attempt to resolve the
fragment locally, which is not what we want.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 dtc-parser.y                     | 22 +++++++++---------
 livetree.c                       | 12 +++++++---
 tests/overlay_overlay_bypath.dts | 48 ++++++++++++++++++++++++++++++++++++=
++++
 tests/run_tests.sh               | 12 ++++++++++
 4 files changed, 80 insertions(+), 14 deletions(-)
 create mode 100644 tests/overlay_overlay_bypath.dts

diff --git a/dtc-parser.y b/dtc-parser.y
index 44af170..25e92d6 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -190,18 +190,18 @@ devicetree:
 		}
 	| devicetree DT_REF nodedef
 		{
-			struct node *target =3D get_node_by_ref($1, $2);
-
-			if (target) {
-				merge_nodes(target, $3);
+			/*
+			 * We rely on the rule being always:
+			 *   versioninfo plugindecl memreserves devicetree
+			 * so $-1 is what we want (plugindecl)
+			 */
+			if ($<flags>-1 & DTSF_PLUGIN) {
+				add_orphan_node($1, $3, $2);
 			} else {
-				/*
-				 * We rely on the rule being always:
-				 *   versioninfo plugindecl memreserves devicetree
-				 * so $-1 is what we want (plugindecl)
-				 */
-				if ($<flags>-1 & DTSF_PLUGIN)
-					add_orphan_node($1, $3, $2);
+				struct node *target =3D get_node_by_ref($1, $2);
+
+				if (target)
+					merge_nodes(target, $3);
 				else
 					ERROR(&@2, "Label or path %s not found", $2);
 			}
diff --git a/livetree.c b/livetree.c
index 57b7db2..f691c9b 100644
--- a/livetree.c
+++ b/livetree.c
@@ -224,10 +224,16 @@ struct node * add_orphan_node(struct node *dt, struct=
 node *new_node, char *ref)
 	struct data d =3D empty_data;
 	char *name;
=20
-	d =3D data_add_marker(d, REF_PHANDLE, ref);
-	d =3D data_append_integer(d, 0xffffffff, 32);
+	if (ref[0] =3D=3D '/') {
+		d =3D data_append_data(d, ref, strlen(ref) + 1);
=20
-	p =3D build_property("target", d);
+		p =3D build_property("target-path", d);
+	} else {
+		d =3D data_add_marker(d, REF_PHANDLE, ref);
+		d =3D data_append_integer(d, 0xffffffff, 32);
+
+		p =3D build_property("target", d);
+	}
=20
 	xasprintf(&name, "fragment@%u",
 			next_orphan_fragment++);
diff --git a/tests/overlay_overlay_bypath.dts b/tests/overlay_overlay_bypat=
h.dts
new file mode 100644
index 0000000..f23e7b6
--- /dev/null
+++ b/tests/overlay_overlay_bypath.dts
@@ -0,0 +1,48 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ * Copyright (c) 2016 Konsulko Inc.
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Test that we can change an int by another */
+&{/test-node} {
+	test-int-property =3D <43>;
+};
+
+/* Test that we can replace a string by a longer one */
+&{/test-node} {
+	test-str-property =3D "foobar";
+};
+
+/* Test that we add a new property */
+&{/test-node} {
+	test-str-property-2 =3D "foobar2";
+};
+
+/* Test that we add a new node (by phandle) */
+&{/test-node} {
+	new-node {
+		new-property;
+	};
+};
+
+&{/} {
+	local: new-local-node {
+		new-property;
+	};
+};
+
+&{/} {
+	test-several-phandle =3D <&local>, <&local>;
+};
+
+&{/test-node} {
+	sub-test-node {
+		new-sub-test-property;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 4d944fa..c2ce1e6 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -251,13 +251,25 @@ dtc_overlay_tests () {
     run_test check_path overlay_overlay_nosugar.test.dtb exists "/__fixups=
__"
     run_test check_path overlay_overlay_nosugar.test.dtb exists "/__local_=
fixups__"
=20
+    # Using target-path
+    run_dtc_test -I dts -O dtb -o overlay_overlay_bypath.test.dtb overlay_=
overlay_bypath.dts
+    run_test check_path overlay_overlay_bypath.test.dtb not-exists "/__sym=
bols__"
+    run_test check_path overlay_overlay_bypath.test.dtb not-exists "/__fix=
ups__"
+    run_test check_path overlay_overlay_bypath.test.dtb exists "/__local_f=
ixups__"
+
     # Check building works the same as manual constructions
     run_test dtbs_equal_ordered overlay_overlay.test.dtb overlay_overlay_n=
osugar.test.dtb
=20
     run_dtc_test -I dts -O dtb -o overlay_overlay_manual_fixups.test.dtb o=
verlay_overlay_manual_fixups.dts
     run_test dtbs_equal_ordered overlay_overlay.test.dtb overlay_overlay_m=
anual_fixups.test.dtb
=20
+    run_dtc_test -I dts -O dtb -o overlay_overlay_no_fixups.test.dtb overl=
ay_overlay_no_fixups.dts
+    run_test dtbs_equal_ordered overlay_overlay_bypath.test.dtb overlay_ov=
erlay_no_fixups.test.dtb
+
+    # Check we can actually apply the result
+    run_dtc_test -I dts -O dtb -o overlay_base_no_symbols.test.dtb overlay=
_base.dts
     run_test overlay overlay_base.test.dtb overlay_overlay.test.dtb
+    run_test overlay overlay_base_no_symbols.test.dtb overlay_overlay_bypa=
th.test.dtb
=20
     # test plugin source to dtb and back
     run_dtc_test -I dtb -O dts -o overlay_overlay_decompile.test.dts overl=
ay_overlay.test.dtb
--=20
2.14.3




--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Chn8nxio6L/4biUD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlqeEOEACgkQbDjKyiDZ
s5I+TQ/6A4tgMG+vWqe0bPchkPNzrDF7ITGVwAhAa+YkuC/xjL+w8Ju8Kmn9EIR0
vAnjOHomE4KW/EkOgryDpCHVeDyy3Rcdo8lW1fRSQuJBnKz5vMVXFRYtnncnnlx4
IvylnM7zlHmQWMS7vvjQF2cYfp8qX8/6TaGhXfLlMlOglPzgqUb8RvBfYolk1LXX
02xm0EaWe4IqiMujUlpTQefA0jZH537gngwhngWHblgN0qyQLIuVQpDTVK5UUzU/
0FAnPTeITKlSTZHNBN/gYEDUJXXMSWrrlqhMWjxY03OgiJ11g70aJiyHp7f5MKza
EQz4O5tf8Sh0aig6Qoxjb3jJdBY51z2dHGRjRaLjXyoaTqwBqUvQ4EesKsEQeAO5
XwHtvFjVo0d8kyiJXgSMhnR5KyHozDBR+I3BEdInFDgTbiieabt0t0OQ9tTz4NB3
xZDjvfQJLLi2jQn2IBCaI3gXrbNKAUn8E/2oxAuwGU+JUIJxQ7RpjYe8OnU8DLN5
/XO8KWEB0VN2UNQu3ccCFL9fQk+3i7rdxT7l1yGVWdvUNSq59hDX0Fkr8aGp77lG
O3wRLpqaqlE/b4dzbDiwOK9697lzjMiq2NaPb6QlkvItJ0ADeQhTKxS2D1v0xTIg
2bgaAe6d5nNC3kk1YZXMV1++QrZ0D3SzES2CrJrQlqQwPZkTV1Q=
=2xNc
-----END PGP SIGNATURE-----

--Chn8nxio6L/4biUD--

--===============1787769083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1787769083==--
