From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v9 1/4] checks: Pass boot_info to the check methods
Date: Fri, 25 Nov 2016 09:58:35 +1100
Message-ID: <20161124225835.GI23872@umbus.fritz.box>
References: <1479990693-14260-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1479990693-14260-2-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uJWb33pM2TcUAXIl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479990693-14260-2-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--uJWb33pM2TcUAXIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2016 at 02:31:30PM +0200, Pantelis Antoniou wrote:
> As preparation for overlay support we need to pass boot info
> as an extra boot_info parameter to each check method.
>=20
> No other functional changes are made.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

You don't really need to pass both bi and dt, since bi->dt will get
you the same thing.

> ---
>  checks.c | 113 +++++++++++++++++++++++++++++++++------------------------=
------
>  1 file changed, 59 insertions(+), 54 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 0381c98..609975a 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -40,7 +40,8 @@ enum checkstatus {
> =20
>  struct check;
> =20
> -typedef void (*check_fn)(struct check *c, struct node *dt, struct node *=
node);
> +typedef void (*check_fn)(struct check *c, struct boot_info *bi,
> +			 struct node *dt, struct node *node);
> =20
>  struct check {
>  	const char *name;
> @@ -97,19 +98,20 @@ static inline void check_msg(struct check *c, const c=
har *fmt, ...)
>  		check_msg((c), __VA_ARGS__); \
>  	} while (0)
> =20
> -static void check_nodes_props(struct check *c, struct node *dt, struct n=
ode *node)
> +static void check_nodes_props(struct check *c, struct boot_info *bi,
> +			      struct node *dt, struct node *node)
>  {
>  	struct node *child;
> =20
>  	TRACE(c, "%s", node->fullpath);
>  	if (c->fn)
> -		c->fn(c, dt, node);
> +		c->fn(c, bi, dt, node);
> =20
>  	for_each_child(node, child)
> -		check_nodes_props(c, dt, child);
> +		check_nodes_props(c, bi, dt, child);
>  }
> =20
> -static bool run_check(struct check *c, struct node *dt)
> +static bool run_check(struct check *c, struct boot_info *bi, struct node=
 *dt)
>  {
>  	bool error =3D false;
>  	int i;
> @@ -123,7 +125,7 @@ static bool run_check(struct check *c, struct node *d=
t)
> =20
>  	for (i =3D 0; i < c->num_prereqs; i++) {
>  		struct check *prq =3D c->prereq[i];
> -		error =3D error || run_check(prq, dt);
> +		error =3D error || run_check(prq, bi, dt);
>  		if (prq->status !=3D PASSED) {
>  			c->status =3D PREREQ;
>  			check_msg(c, "Failed prerequisite '%s'",
> @@ -134,7 +136,7 @@ static bool run_check(struct check *c, struct node *d=
t)
>  	if (c->status !=3D UNCHECKED)
>  		goto out;
> =20
> -	check_nodes_props(c, dt, dt);
> +	check_nodes_props(c, bi, dt, dt);
> =20
>  	if (c->status =3D=3D UNCHECKED)
>  		c->status =3D PASSED;
> @@ -153,15 +155,15 @@ out:
>   */
> =20
>  /* A check which always fails, for testing purposes only */
> -static inline void check_always_fail(struct check *c, struct node *dt,
> -				     struct node *node)
> +static inline void check_always_fail(struct check *c, struct boot_info *=
bi,
> +				     struct node *dt, struct node *node)
>  {
>  	FAIL(c, "always_fail check");
>  }
>  CHECK(always_fail, check_always_fail, NULL);
> =20
> -static void check_is_string(struct check *c, struct node *root,
> -			    struct node *node)
> +static void check_is_string(struct check *c, struct boot_info *bi,
> +			    struct node *root, struct node *node)
>  {
>  	struct property *prop;
>  	char *propname =3D c->data;
> @@ -179,8 +181,8 @@ static void check_is_string(struct check *c, struct n=
ode *root,
>  #define ERROR_IF_NOT_STRING(nm, propname) \
>  	ERROR(nm, check_is_string, (propname))
> =20
> -static void check_is_cell(struct check *c, struct node *root,
> -			  struct node *node)
> +static void check_is_cell(struct check *c, struct boot_info *bi,
> +			  struct node *root, struct node *node)
>  {
>  	struct property *prop;
>  	char *propname =3D c->data;
> @@ -202,8 +204,8 @@ static void check_is_cell(struct check *c, struct nod=
e *root,
>   * Structural check functions
>   */
> =20
> -static void check_duplicate_node_names(struct check *c, struct node *dt,
> -				       struct node *node)
> +static void check_duplicate_node_names(struct check *c, struct boot_info=
 *bi,
> +				       struct node *dt, struct node *node)
>  {
>  	struct node *child, *child2;
> =20
> @@ -217,8 +219,8 @@ static void check_duplicate_node_names(struct check *=
c, struct node *dt,
>  }
>  ERROR(duplicate_node_names, check_duplicate_node_names, NULL);
> =20
> -static void check_duplicate_property_names(struct check *c, struct node =
*dt,
> -					   struct node *node)
> +static void check_duplicate_property_names(struct check *c, struct boot_=
info *bi,
> +					   struct node *dt, struct node *node)
>  {
>  	struct property *prop, *prop2;
> =20
> @@ -239,8 +241,8 @@ ERROR(duplicate_property_names, check_duplicate_prope=
rty_names, NULL);
>  #define DIGITS		"0123456789"
>  #define PROPNODECHARS	LOWERCASE UPPERCASE DIGITS ",._+*#?-"
> =20
> -static void check_node_name_chars(struct check *c, struct node *dt,
> -				  struct node *node)
> +static void check_node_name_chars(struct check *c, struct boot_info *bi,
> +				  struct node *dt, struct node *node)
>  {
>  	int n =3D strspn(node->name, c->data);
> =20
> @@ -250,8 +252,8 @@ static void check_node_name_chars(struct check *c, st=
ruct node *dt,
>  }
>  ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
> =20
> -static void check_node_name_format(struct check *c, struct node *dt,
> -				   struct node *node)
> +static void check_node_name_format(struct check *c, struct boot_info *bi,
> +				   struct node *dt, struct node *node)
>  {
>  	if (strchr(get_unitname(node), '@'))
>  		FAIL(c, "Node %s has multiple '@' characters in name",
> @@ -259,8 +261,8 @@ static void check_node_name_format(struct check *c, s=
truct node *dt,
>  }
>  ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
> =20
> -static void check_unit_address_vs_reg(struct check *c, struct node *dt,
> -			     struct node *node)
> +static void check_unit_address_vs_reg(struct check *c, struct boot_info =
*bi,
> +				      struct node *dt, struct node *node)
>  {
>  	const char *unitname =3D get_unitname(node);
>  	struct property *prop =3D get_property(node, "reg");
> @@ -283,8 +285,8 @@ static void check_unit_address_vs_reg(struct check *c=
, struct node *dt,
>  }
>  WARNING(unit_address_vs_reg, check_unit_address_vs_reg, NULL);
> =20
> -static void check_property_name_chars(struct check *c, struct node *dt,
> -				      struct node *node)
> +static void check_property_name_chars(struct check *c, struct boot_info =
*bi,
> +				      struct node *dt, struct node *node)
>  {
>  	struct property *prop;
> =20
> @@ -305,9 +307,10 @@ ERROR(property_name_chars, check_property_name_chars=
, PROPNODECHARS);
>  	((prop) ? (prop)->name : ""), \
>  	((prop) ? "' in " : ""), (node)->fullpath
> =20
> -static void check_duplicate_label(struct check *c, struct node *dt,
> -				  const char *label, struct node *node,
> -				  struct property *prop, struct marker *mark)
> +static void check_duplicate_label(struct check *c, struct boot_info *bi,
> +				  struct node *dt, const char *label,
> +				  struct node *node, struct property *prop,
> +				  struct marker *mark)
>  {
>  	struct node *othernode =3D NULL;
>  	struct property *otherprop =3D NULL;
> @@ -331,29 +334,30 @@ static void check_duplicate_label(struct check *c, =
struct node *dt,
>  		     DESCLABEL_ARGS(othernode, otherprop, othermark));
>  }
> =20
> -static void check_duplicate_label_node(struct check *c, struct node *dt,
> -				       struct node *node)
> +static void check_duplicate_label_node(struct check *c, struct boot_info=
 *bi,
> +				       struct node *dt, struct node *node)
>  {
>  	struct label *l;
>  	struct property *prop;
> =20
>  	for_each_label(node->labels, l)
> -		check_duplicate_label(c, dt, l->label, node, NULL, NULL);
> +		check_duplicate_label(c, bi, dt, l->label, node, NULL, NULL);
> =20
>  	for_each_property(node, prop) {
>  		struct marker *m =3D prop->val.markers;
> =20
>  		for_each_label(prop->labels, l)
> -			check_duplicate_label(c, dt, l->label, node, prop, NULL);
> +			check_duplicate_label(c, bi, dt, l->label, node, prop, NULL);
> =20
>  		for_each_marker_of_type(m, LABEL)
> -			check_duplicate_label(c, dt, m->ref, node, prop, m);
> +			check_duplicate_label(c, bi, dt, m->ref, node, prop, m);
>  	}
>  }
>  ERROR(duplicate_label, check_duplicate_label_node, NULL);
> =20
> -static cell_t check_phandle_prop(struct check *c, struct node *root,
> -				 struct node *node, const char *propname)
> +static cell_t check_phandle_prop(struct check *c, struct boot_info *bi,
> +				 struct node *root, struct node *node,
> +				 const char *propname)
>  {
>  	struct property *prop;
>  	struct marker *m;
> @@ -398,8 +402,8 @@ static cell_t check_phandle_prop(struct check *c, str=
uct node *root,
>  	return phandle;
>  }
> =20
> -static void check_explicit_phandles(struct check *c, struct node *root,
> -				    struct node *node)
> +static void check_explicit_phandles(struct check *c, struct boot_info *b=
i,
> +				    struct node *root, struct node *node)
>  {
>  	struct node *other;
>  	cell_t phandle, linux_phandle;
> @@ -407,9 +411,9 @@ static void check_explicit_phandles(struct check *c, =
struct node *root,
>  	/* Nothing should have assigned phandles yet */
>  	assert(!node->phandle);
> =20
> -	phandle =3D check_phandle_prop(c, root, node, "phandle");
> +	phandle =3D check_phandle_prop(c, bi, root, node, "phandle");
> =20
> -	linux_phandle =3D check_phandle_prop(c, root, node, "linux,phandle");
> +	linux_phandle =3D check_phandle_prop(c, bi, root, node, "linux,phandle"=
);
> =20
>  	if (!phandle && !linux_phandle)
>  		/* No valid phandles; nothing further to check */
> @@ -433,8 +437,8 @@ static void check_explicit_phandles(struct check *c, =
struct node *root,
>  }
>  ERROR(explicit_phandles, check_explicit_phandles, NULL);
> =20
> -static void check_name_properties(struct check *c, struct node *root,
> -				  struct node *node)
> +static void check_name_properties(struct check *c, struct boot_info *bi,
> +				  struct node *root, struct node *node)
>  {
>  	struct property **pp, *prop =3D NULL;
> =20
> @@ -467,8 +471,8 @@ ERROR(name_properties, check_name_properties, NULL, &=
name_is_string);
>   * Reference fixup functions
>   */
> =20
> -static void fixup_phandle_references(struct check *c, struct node *dt,
> -				     struct node *node)
> +static void fixup_phandle_references(struct check *c, struct boot_info *=
bi,
> +				     struct node *dt, struct node *node)
>  {
>  	struct property *prop;
> =20
> @@ -495,8 +499,8 @@ static void fixup_phandle_references(struct check *c,=
 struct node *dt,
>  ERROR(phandle_references, fixup_phandle_references, NULL,
>        &duplicate_node_names, &explicit_phandles);
> =20
> -static void fixup_path_references(struct check *c, struct node *dt,
> -				  struct node *node)
> +static void fixup_path_references(struct check *c, struct boot_info *bi,
> +				  struct node *dt, struct node *node)
>  {
>  	struct property *prop;
> =20
> @@ -534,8 +538,8 @@ WARNING_IF_NOT_STRING(device_type_is_string, "device_=
type");
>  WARNING_IF_NOT_STRING(model_is_string, "model");
>  WARNING_IF_NOT_STRING(status_is_string, "status");
> =20
> -static void fixup_addr_size_cells(struct check *c, struct node *dt,
> -				  struct node *node)
> +static void fixup_addr_size_cells(struct check *c, struct boot_info *bi,
> +				  struct node *dt, struct node *node)
>  {
>  	struct property *prop;
> =20
> @@ -558,8 +562,8 @@ WARNING(addr_size_cells, fixup_addr_size_cells, NULL,
>  #define node_size_cells(n) \
>  	(((n)->size_cells =3D=3D -1) ? 1 : (n)->size_cells)
> =20
> -static void check_reg_format(struct check *c, struct node *dt,
> -			     struct node *node)
> +static void check_reg_format(struct check *c, struct boot_info *bi,
> +			     struct node *dt, struct node *node)
>  {
>  	struct property *prop;
>  	int addr_cells, size_cells, entrylen;
> @@ -587,8 +591,8 @@ static void check_reg_format(struct check *c, struct =
node *dt,
>  }
>  WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
> =20
> -static void check_ranges_format(struct check *c, struct node *dt,
> -				struct node *node)
> +static void check_ranges_format(struct check *c, struct boot_info *bi,
> +				struct node *dt, struct node *node)
>  {
>  	struct property *prop;
>  	int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen;
> @@ -631,8 +635,8 @@ WARNING(ranges_format, check_ranges_format, NULL, &ad=
dr_size_cells);
>  /*
>   * Style checks
>   */
> -static void check_avoid_default_addr_size(struct check *c, struct node *=
dt,
> -					  struct node *node)
> +static void check_avoid_default_addr_size(struct check *c, struct boot_i=
nfo *bi,
> +					  struct node *dt, struct node *node)
>  {
>  	struct property *reg, *ranges;
> =20
> @@ -657,6 +661,7 @@ WARNING(avoid_default_addr_size, check_avoid_default_=
addr_size, NULL,
>  	&addr_size_cells);
> =20
>  static void check_obsolete_chosen_interrupt_controller(struct check *c,
> +						       struct boot_info *bi,
>  						       struct node *dt,
>  						       struct node *node)
>  {
> @@ -773,7 +778,7 @@ void process_checks(bool force, struct boot_info *bi)
>  		struct check *c =3D check_table[i];
> =20
>  		if (c->warn || c->error)
> -			error =3D error || run_check(c, dt);
> +			error =3D error || run_check(c, bi, dt);
>  	}
> =20
>  	if (error) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uJWb33pM2TcUAXIl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYN3CbAAoJEGw4ysog2bOScAAP/jkA0EbU9uoLjqQX5Py+h5gQ
hEpanSFYpABddwWrkDHCr7DPBSu3TnHmj6ObLKxbm2JNGoTRmoQNX4rwv821Sgsp
wy0jiROPZIwuPnJ7gXL2gZ1XBrZ+QD1+e1DYfYF+h5oQnL6SrwodCUHGkHrZFH+3
RIo0wTYmAjlLGzBsxjVXyl+GX3pWObNsUSklBbJRlOlXFOXlyL7bb7+Q8KnaDzcc
MTVgAM2sAo7D0LUtgrgdB2knUbKeQQN9FhzpJAZxgwRJ9XfCBRHyeXHtlF5fUUuA
Hpss/DYNvwoBPwQGhWkgh/LlkPoOlAw/iTKpORyZ5RR8HAlhMiyYw0kTEJfYZC4F
F70WnyRo3NVBDJn5xUqkcNqTZiLnHFJHs76LYhbw4cwrA9QcpA2iyxTQ/RtjqcJj
7qKmTQgww4lt8Vjh2AKGe2n97WTI35H0AeqB8AO8QIOL/yfJE/8d5tAtuBFpbGtm
lx127k4SqILBlOl+Ahu7c70ycFrYWXHZAJMBfC+2xeViHv8g0+1/qK9Q3Er2Mp2Y
Ww7NCh8sqINqn2k0YjNLC76Bu9j931b6GsRP3U10O1beFHWNqFlD/m80DlUfCQU+
qaImvMKSA4M9qtH6nT37qhzjD+KBegv3qttsUxgJqs9EP72cn73hy/Xoea9lhydX
F98xqoIzvGmPUlZIhgUm
=VqDx
-----END PGP SIGNATURE-----

--uJWb33pM2TcUAXIl--
