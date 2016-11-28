From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v10 1/4] checks: Pass boot_info instead of root node
Date: Mon, 28 Nov 2016 14:53:23 +1100
Message-ID: <20161128035323.GI30927@umbus.fritz.box>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480077131-14526-2-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BOmey7/79ja+7F5w"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480077131-14526-2-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--BOmey7/79ja+7F5w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2016 at 02:32:08PM +0200, Pantelis Antoniou wrote:
> As preparation for overlay support we need to pass the boot info
> parameter instead of the root node to each check method.
>=20
> The root node can be retrieved by accessing boot info's dt member.
>=20
> No other functional changes are made.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

I've applied this preliminary patch to the master branch.  I think
I'll also apply (an updated version of) my patch to rename 'boot_info'
to something a bit less silly.  But I'll hold off for now to avoid
creating extra conflicts with your patches.

> ---
>  checks.c | 78 ++++++++++++++++++++++++++++++++++------------------------=
------
>  1 file changed, 42 insertions(+), 36 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 0381c98..2bd27a4 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -40,7 +40,7 @@ enum checkstatus {
> =20
>  struct check;
> =20
> -typedef void (*check_fn)(struct check *c, struct node *dt, struct node *=
node);
> +typedef void (*check_fn)(struct check *c, struct boot_info *bi, struct n=
ode *node);
> =20
>  struct check {
>  	const char *name;
> @@ -97,20 +97,21 @@ static inline void check_msg(struct check *c, const c=
har *fmt, ...)
>  		check_msg((c), __VA_ARGS__); \
>  	} while (0)
> =20
> -static void check_nodes_props(struct check *c, struct node *dt, struct n=
ode *node)
> +static void check_nodes_props(struct check *c, struct boot_info *bi, str=
uct node *node)
>  {
>  	struct node *child;
> =20
>  	TRACE(c, "%s", node->fullpath);
>  	if (c->fn)
> -		c->fn(c, dt, node);
> +		c->fn(c, bi, node);
> =20
>  	for_each_child(node, child)
> -		check_nodes_props(c, dt, child);
> +		check_nodes_props(c, bi, child);
>  }
> =20
> -static bool run_check(struct check *c, struct node *dt)
> +static bool run_check(struct check *c, struct boot_info *bi)
>  {
> +	struct node *dt =3D bi->dt;
>  	bool error =3D false;
>  	int i;
> =20
> @@ -123,7 +124,7 @@ static bool run_check(struct check *c, struct node *d=
t)
> =20
>  	for (i =3D 0; i < c->num_prereqs; i++) {
>  		struct check *prq =3D c->prereq[i];
> -		error =3D error || run_check(prq, dt);
> +		error =3D error || run_check(prq, bi);
>  		if (prq->status !=3D PASSED) {
>  			c->status =3D PREREQ;
>  			check_msg(c, "Failed prerequisite '%s'",
> @@ -134,7 +135,7 @@ static bool run_check(struct check *c, struct node *d=
t)
>  	if (c->status !=3D UNCHECKED)
>  		goto out;
> =20
> -	check_nodes_props(c, dt, dt);
> +	check_nodes_props(c, bi, dt);
> =20
>  	if (c->status =3D=3D UNCHECKED)
>  		c->status =3D PASSED;
> @@ -153,14 +154,14 @@ out:
>   */
> =20
>  /* A check which always fails, for testing purposes only */
> -static inline void check_always_fail(struct check *c, struct node *dt,
> +static inline void check_always_fail(struct check *c, struct boot_info *=
bi,
>  				     struct node *node)
>  {
>  	FAIL(c, "always_fail check");
>  }
>  CHECK(always_fail, check_always_fail, NULL);
> =20
> -static void check_is_string(struct check *c, struct node *root,
> +static void check_is_string(struct check *c, struct boot_info *bi,
>  			    struct node *node)
>  {
>  	struct property *prop;
> @@ -179,7 +180,7 @@ static void check_is_string(struct check *c, struct n=
ode *root,
>  #define ERROR_IF_NOT_STRING(nm, propname) \
>  	ERROR(nm, check_is_string, (propname))
> =20
> -static void check_is_cell(struct check *c, struct node *root,
> +static void check_is_cell(struct check *c, struct boot_info *bi,
>  			  struct node *node)
>  {
>  	struct property *prop;
> @@ -202,7 +203,7 @@ static void check_is_cell(struct check *c, struct nod=
e *root,
>   * Structural check functions
>   */
> =20
> -static void check_duplicate_node_names(struct check *c, struct node *dt,
> +static void check_duplicate_node_names(struct check *c, struct boot_info=
 *bi,
>  				       struct node *node)
>  {
>  	struct node *child, *child2;
> @@ -217,7 +218,7 @@ static void check_duplicate_node_names(struct check *=
c, struct node *dt,
>  }
>  ERROR(duplicate_node_names, check_duplicate_node_names, NULL);
> =20
> -static void check_duplicate_property_names(struct check *c, struct node =
*dt,
> +static void check_duplicate_property_names(struct check *c, struct boot_=
info *bi,
>  					   struct node *node)
>  {
>  	struct property *prop, *prop2;
> @@ -239,7 +240,7 @@ ERROR(duplicate_property_names, check_duplicate_prope=
rty_names, NULL);
>  #define DIGITS		"0123456789"
>  #define PROPNODECHARS	LOWERCASE UPPERCASE DIGITS ",._+*#?-"
> =20
> -static void check_node_name_chars(struct check *c, struct node *dt,
> +static void check_node_name_chars(struct check *c, struct boot_info *bi,
>  				  struct node *node)
>  {
>  	int n =3D strspn(node->name, c->data);
> @@ -250,7 +251,7 @@ static void check_node_name_chars(struct check *c, st=
ruct node *dt,
>  }
>  ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
> =20
> -static void check_node_name_format(struct check *c, struct node *dt,
> +static void check_node_name_format(struct check *c, struct boot_info *bi,
>  				   struct node *node)
>  {
>  	if (strchr(get_unitname(node), '@'))
> @@ -259,8 +260,8 @@ static void check_node_name_format(struct check *c, s=
truct node *dt,
>  }
>  ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
> =20
> -static void check_unit_address_vs_reg(struct check *c, struct node *dt,
> -			     struct node *node)
> +static void check_unit_address_vs_reg(struct check *c, struct boot_info =
*bi,
> +				      struct node *node)
>  {
>  	const char *unitname =3D get_unitname(node);
>  	struct property *prop =3D get_property(node, "reg");
> @@ -283,7 +284,7 @@ static void check_unit_address_vs_reg(struct check *c=
, struct node *dt,
>  }
>  WARNING(unit_address_vs_reg, check_unit_address_vs_reg, NULL);
> =20
> -static void check_property_name_chars(struct check *c, struct node *dt,
> +static void check_property_name_chars(struct check *c, struct boot_info =
*bi,
>  				      struct node *node)
>  {
>  	struct property *prop;
> @@ -305,10 +306,11 @@ ERROR(property_name_chars, check_property_name_char=
s, PROPNODECHARS);
>  	((prop) ? (prop)->name : ""), \
>  	((prop) ? "' in " : ""), (node)->fullpath
> =20
> -static void check_duplicate_label(struct check *c, struct node *dt,
> +static void check_duplicate_label(struct check *c, struct boot_info *bi,
>  				  const char *label, struct node *node,
>  				  struct property *prop, struct marker *mark)
>  {
> +	struct node *dt =3D bi->dt;
>  	struct node *othernode =3D NULL;
>  	struct property *otherprop =3D NULL;
>  	struct marker *othermark =3D NULL;
> @@ -331,30 +333,31 @@ static void check_duplicate_label(struct check *c, =
struct node *dt,
>  		     DESCLABEL_ARGS(othernode, otherprop, othermark));
>  }
> =20
> -static void check_duplicate_label_node(struct check *c, struct node *dt,
> +static void check_duplicate_label_node(struct check *c, struct boot_info=
 *bi,
>  				       struct node *node)
>  {
>  	struct label *l;
>  	struct property *prop;
> =20
>  	for_each_label(node->labels, l)
> -		check_duplicate_label(c, dt, l->label, node, NULL, NULL);
> +		check_duplicate_label(c, bi, l->label, node, NULL, NULL);
> =20
>  	for_each_property(node, prop) {
>  		struct marker *m =3D prop->val.markers;
> =20
>  		for_each_label(prop->labels, l)
> -			check_duplicate_label(c, dt, l->label, node, prop, NULL);
> +			check_duplicate_label(c, bi, l->label, node, prop, NULL);
> =20
>  		for_each_marker_of_type(m, LABEL)
> -			check_duplicate_label(c, dt, m->ref, node, prop, m);
> +			check_duplicate_label(c, bi, m->ref, node, prop, m);
>  	}
>  }
>  ERROR(duplicate_label, check_duplicate_label_node, NULL);
> =20
> -static cell_t check_phandle_prop(struct check *c, struct node *root,
> +static cell_t check_phandle_prop(struct check *c, struct boot_info *bi,
>  				 struct node *node, const char *propname)
>  {
> +	struct node *root =3D bi->dt;
>  	struct property *prop;
>  	struct marker *m;
>  	cell_t phandle;
> @@ -398,18 +401,19 @@ static cell_t check_phandle_prop(struct check *c, s=
truct node *root,
>  	return phandle;
>  }
> =20
> -static void check_explicit_phandles(struct check *c, struct node *root,
> +static void check_explicit_phandles(struct check *c, struct boot_info *b=
i,
>  				    struct node *node)
>  {
> +	struct node *root =3D bi->dt;
>  	struct node *other;
>  	cell_t phandle, linux_phandle;
> =20
>  	/* Nothing should have assigned phandles yet */
>  	assert(!node->phandle);
> =20
> -	phandle =3D check_phandle_prop(c, root, node, "phandle");
> +	phandle =3D check_phandle_prop(c, bi, node, "phandle");
> =20
> -	linux_phandle =3D check_phandle_prop(c, root, node, "linux,phandle");
> +	linux_phandle =3D check_phandle_prop(c, bi, node, "linux,phandle");
> =20
>  	if (!phandle && !linux_phandle)
>  		/* No valid phandles; nothing further to check */
> @@ -433,7 +437,7 @@ static void check_explicit_phandles(struct check *c, =
struct node *root,
>  }
>  ERROR(explicit_phandles, check_explicit_phandles, NULL);
> =20
> -static void check_name_properties(struct check *c, struct node *root,
> +static void check_name_properties(struct check *c, struct boot_info *bi,
>  				  struct node *node)
>  {
>  	struct property **pp, *prop =3D NULL;
> @@ -467,9 +471,10 @@ ERROR(name_properties, check_name_properties, NULL, =
&name_is_string);
>   * Reference fixup functions
>   */
> =20
> -static void fixup_phandle_references(struct check *c, struct node *dt,
> +static void fixup_phandle_references(struct check *c, struct boot_info *=
bi,
>  				     struct node *node)
>  {
> +	struct node *dt =3D bi->dt;
>  	struct property *prop;
> =20
>  	for_each_property(node, prop) {
> @@ -495,9 +500,10 @@ static void fixup_phandle_references(struct check *c=
, struct node *dt,
>  ERROR(phandle_references, fixup_phandle_references, NULL,
>        &duplicate_node_names, &explicit_phandles);
> =20
> -static void fixup_path_references(struct check *c, struct node *dt,
> +static void fixup_path_references(struct check *c, struct boot_info *bi,
>  				  struct node *node)
>  {
> +	struct node *dt =3D bi->dt;
>  	struct property *prop;
> =20
>  	for_each_property(node, prop) {
> @@ -534,7 +540,7 @@ WARNING_IF_NOT_STRING(device_type_is_string, "device_=
type");
>  WARNING_IF_NOT_STRING(model_is_string, "model");
>  WARNING_IF_NOT_STRING(status_is_string, "status");
> =20
> -static void fixup_addr_size_cells(struct check *c, struct node *dt,
> +static void fixup_addr_size_cells(struct check *c, struct boot_info *bi,
>  				  struct node *node)
>  {
>  	struct property *prop;
> @@ -558,7 +564,7 @@ WARNING(addr_size_cells, fixup_addr_size_cells, NULL,
>  #define node_size_cells(n) \
>  	(((n)->size_cells =3D=3D -1) ? 1 : (n)->size_cells)
> =20
> -static void check_reg_format(struct check *c, struct node *dt,
> +static void check_reg_format(struct check *c, struct boot_info *bi,
>  			     struct node *node)
>  {
>  	struct property *prop;
> @@ -587,7 +593,7 @@ static void check_reg_format(struct check *c, struct =
node *dt,
>  }
>  WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
> =20
> -static void check_ranges_format(struct check *c, struct node *dt,
> +static void check_ranges_format(struct check *c, struct boot_info *bi,
>  				struct node *node)
>  {
>  	struct property *prop;
> @@ -631,7 +637,7 @@ WARNING(ranges_format, check_ranges_format, NULL, &ad=
dr_size_cells);
>  /*
>   * Style checks
>   */
> -static void check_avoid_default_addr_size(struct check *c, struct node *=
dt,
> +static void check_avoid_default_addr_size(struct check *c, struct boot_i=
nfo *bi,
>  					  struct node *node)
>  {
>  	struct property *reg, *ranges;
> @@ -657,9 +663,10 @@ WARNING(avoid_default_addr_size, check_avoid_default=
_addr_size, NULL,
>  	&addr_size_cells);
> =20
>  static void check_obsolete_chosen_interrupt_controller(struct check *c,
> -						       struct node *dt,
> +						       struct boot_info *bi,
>  						       struct node *node)
>  {
> +	struct node *dt =3D bi->dt;
>  	struct node *chosen;
>  	struct property *prop;
> =20
> @@ -765,7 +772,6 @@ void parse_checks_option(bool warn, bool error, const=
 char *arg)
> =20
>  void process_checks(bool force, struct boot_info *bi)
>  {
> -	struct node *dt =3D bi->dt;
>  	int i;
>  	int error =3D 0;
> =20
> @@ -773,7 +779,7 @@ void process_checks(bool force, struct boot_info *bi)
>  		struct check *c =3D check_table[i];
> =20
>  		if (c->warn || c->error)
> -			error =3D error || run_check(c, dt);
> +			error =3D error || run_check(c, bi);
>  	}
> =20
>  	if (error) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BOmey7/79ja+7F5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYO6oxAAoJEGw4ysog2bOSlfEP/RhA/NBVBH8gZ9ZkVrPWeHCJ
QIeRojRvDVvsBAvjAyE6fPKRvf1GPgBB5z8PciTJinIf+wgs3/FOMXcFC0itnLKQ
jn1YedqvikqGfY/tRMy2BrfF+wDHTMVcOTld9NmzBvufsFr1Sq5tOb7H4GML6gJM
WocPWoycatmTkHK8OQIheu0QhP5+lmUtScRR4vY9hB5wXzlQBZZr6O3sgMe8QZCM
x9ecTrRJEEtiefuSWbMUVUmzGNHDeOAkZHpblwviUK1rVRuqC3zE16S9QO0Ka/fF
/kZdSWph6dFcKdeK1JxZBXRoyDiejJZ5HmhYam+sef463FG5omXaN/QVajnQ4YB9
fy8sTiXAZTEb3l7WQuR7hMIaQOCXdPtNIHBPs/j0Hwwd0CDwHKQMkWZsRyodsGPZ
+Zi9XUFxG4gwKWRs8s14nSGoRF2aI17CWqQWWk3syskvNYHUm+5RpIhCgqM1gFLR
LXjAxSI0s+MUi8/Tw+KcYXxO2wIk6prBfpnrIelRvcwYEw6VTTnXBzTC8R4olHkO
+hrE88Ac+msOMGquWAyDYK031Zs641i5ofu3/buNIjt8yt8Jj7oB8nSc91FMJRHV
qAbmalVAT1dMx0PZq6kamEtPxDNo/eeGJZ7S607OwF89cGbkR/ngZY5ARJ5P1OGe
+nE9Nwb58CqCURejv7Jg
=tdTn
-----END PGP SIGNATURE-----

--BOmey7/79ja+7F5w--
