From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH RFC 2/5] dtc: livetree: Add more tree parsing helpers
Date: Sun, 9 Mar 2014 23:03:56 +1100
Message-ID: <20140309120355.GG20356@voom.redhat.com>
References: <1392919611-10746-1-git-send-email-t.figa@samsung.com>
 <1392919611-10746-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5Mfx4RzfBqgnTE/w"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392919611-10746-3-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5Mfx4RzfBqgnTE/w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2014 at 07:06:48PM +0100, Tomasz Figa wrote:
> This patch extends the set of parsing helpers available in dtc with
> string and phandle parsing.
>=20
> Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  dtc.h      |  28 ++++++++
>  livetree.c | 230 +++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 258 insertions(+)
>=20
> diff --git a/dtc.h b/dtc.h
> index e95bed7..9ce9d12 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -163,6 +163,13 @@ struct node {
>  	struct label *labels;
>  };
> =20
> +#define MAX_PHANDLE_ARGS 16
> +struct of_phandle_args {
> +	struct node *np;
> +	int args_count;
> +	uint32_t args[MAX_PHANDLE_ARGS];
> +};
> +
>  #define for_each_label_withdel(l0, l) \
>  	for ((l) =3D (l0); (l); (l) =3D (l)->next)
> =20
> @@ -184,6 +191,11 @@ struct node {
>  	for_each_child_withdel(n, c) \
>  		if (!(c)->deleted)
> =20
> +#define for_each_propval_string(p, s)	\
> +	for (s =3D propval_next_string(p, NULL);		\
> +		s;					\
> +		s =3D propval_next_string(p, s))
> +
>  void add_label(struct label **labels, char *label);
>  void delete_labels(struct label **labels);
> =20
> @@ -208,6 +220,22 @@ void delete_node(struct node *node);
>  const char *get_unitname(struct node *node);
>  struct property *get_property(struct node *node, const char *propname);
>  cell_t propval_cell(struct property *prop);
> +int propval_string_count(struct node *np, struct property *prop);
> +const char *propval_next_string(struct property *prop, const char *cur);
> +int propval_match_string(struct property *prop, const char *string);
> +struct node *propval_parse_phandle(struct node *root,
> +				     struct property *prop, int index);
> +int propval_parse_phandle_with_args(struct node *root,
> +				    struct property *prop,
> +				    const char *cells_name, int index,
> +				    struct of_phandle_args *out_args);
> +int propval_parse_phandle_with_fixed_args(struct node *root,
> +					  struct property *prop, int cell_count,
> +					  int index,
> +					  struct of_phandle_args *out_args);
> +int propval_count_phandle_with_args(struct node *root,
> +				    struct property *prop,
> +				    const char *cells_name);
>  struct property *get_property_by_label(struct node *tree, const char *la=
bel,
>  				       struct node **node);
>  struct marker *get_marker_label(struct node *tree, const char *label,
> diff --git a/livetree.c b/livetree.c
> index b61465f..015ed06 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -377,6 +377,230 @@ cell_t propval_cell(struct property *prop)
>  	return fdt32_to_cpu(*((cell_t *)prop->val.val));
>  }
> =20
> +int propval_string_count(struct node *np, struct property *prop)
> +{
> +	int i =3D 0;
> +	size_t l =3D 0, total =3D 0;
> +	const char *p;
> +
> +	if (!prop)
> +		return -EINVAL;

1) using Unix error codes as return values is a convention which is
not currently used anywhere in dtc.  Introducing it in the middle of
other changes is not a good idea.

2) Surely calling this on a NULL property is a bug in the caller, so
it should be an assert().


> +	if (!prop->val.val)
> +		return -ENODATA;

An empty property is a valid stringlist with 0 entries, so this should
return 0 not an error.

> +	if (strnlen(prop->val.val, prop->val.len) >=3D prop->val.len)
> +		return -EILSEQ;
> +
> +	p =3D prop->val.val;
> +
> +	for (i =3D 0; total < prop->val.len; total +=3D l, p +=3D l, i++)
> +		l =3D strlen(p) + 1;
> +
> +	return i;
> +}
> +
> +const char *propval_next_string(struct property *prop, const char *cur)
> +{
> +	const char *curv =3D cur;
> +
> +	if (!prop)
> +		return NULL;
> +
> +	if (!cur)
> +		return prop->val.val;
> +
> +	curv +=3D strlen(cur) + 1;
> +	if (curv >=3D prop->val.val + prop->val.len)
> +		return NULL;
> +
> +	return curv;
> +}
> +
> +int propval_match_string(struct property *prop, const char *string)
> +{
> +	size_t l;
> +	int i;
> +	const char *p, *end;
> +
> +	if (!prop)
> +		return -EINVAL;
> +	if (!prop->val.val)
> +		return -ENODATA;
> +
> +	p =3D prop->val.val;
> +	end =3D p + prop->val.len;
> +
> +	for (i =3D 0; p < end; i++, p +=3D l) {
> +		l =3D strlen(p) + 1;
> +		if (p + l > end)
> +			return -EILSEQ;
> +		if (strcmp(string, p) =3D=3D 0)
> +			return i; /* Found it; return index */
> +	}
> +	return -ENODATA;
> +}
> +
> +static int parse_phandle_with_args(struct node *root,
> +					struct property *prop,
> +					const char *cells_name,
> +					int cell_count, int index,
> +					struct of_phandle_args *out_args)
> +{
> +	const cell_t *list, *list_end;
> +	int rc =3D 0, size, cur_index =3D 0;
> +	uint32_t count =3D 0;
> +	struct node *node =3D NULL;
> +	cell_t phandle;
> +
> +	/* Retrieve the phandle list property */
> +	size =3D prop->val.len;
> +	list =3D (const cell_t *)prop->val.val;
> +	if (!list)
> +		return -ENOENT;
> +	list_end =3D list + size / sizeof(*list);
> +
> +	/* Loop over the phandles until all the requested entry is found */
> +	while (list < list_end) {
> +		rc =3D -EINVAL;
> +		count =3D 0;
> +
> +		/*
> +		 * If phandle is 0, then it is an empty entry with no
> +		 * arguments.  Skip forward to the next entry.
> +		 */
> +		phandle =3D fdt32_to_cpu(*list++);
> +		if (phandle) {

Using continue would avoid extraneous indentation and make this easier
to read.

> +			/*
> +			 * Find the provider node and parse the #*-cells
> +			 * property to determine the argument length.
> +			 *
> +			 * This is not needed if the cell count is hard-coded
> +			 * (i.e. cells_name not set, but cell_count is set),
> +			 * except when we're going to return the found node
> +			 * below.
> +			 */
> +			if (cells_name || cur_index =3D=3D index) {
> +				node =3D get_node_by_phandle(root, phandle);
> +				if (!node) {
> +					pr_err("could not find phandle %u\n",
> +						phandle);
> +					goto err;
> +				}
> +			}
> +
> +			if (cells_name) {
> +				struct property *cells_prop;
> +
> +				cells_prop =3D get_property(node, cells_name);
> +				if (!cells_prop) {
> +					pr_err("could not get %s for %s\n",
> +						cells_name,
> +						node->fullpath);
> +					goto err;
> +				}
> +
> +				count =3D propval_cell(cells_prop);
> +			} else {
> +				count =3D cell_count;
> +			}
> +
> +			/*
> +			 * Make sure that the arguments actually fit in the
> +			 * remaining property data length
> +			 */
> +			if (list + count > list_end) {
> +				pr_err("arguments longer than property\n");
> +				goto err;
> +			}
> +		}
> +
> +		/*
> +		 * All of the error cases above bail out of the loop, so at
> +		 * this point, the parsing is successful. If the requested
> +		 * index matches, then fill the out_args structure and return,
> +		 * or return -ENOENT for an empty entry.
> +		 */
> +		rc =3D -ENOENT;
> +		if (cur_index =3D=3D index) {
> +			if (!phandle)
> +				goto err;
> +
> +			if (out_args) {
> +				int i;
> +				if (count > MAX_PHANDLE_ARGS) {
> +					pr_warn("argument count higher than MAX_PHANDLE_ARGS\n");
> +					count =3D MAX_PHANDLE_ARGS;

That's more than a warn.  If you've run out of space here that pretty
much has to be a fatal error.

> +				}
> +				out_args->np =3D node;
> +				out_args->args_count =3D count;
> +				for (i =3D 0; i < count; i++)
> +					out_args->args[i] =3D fdt32_to_cpu(*list++);
> +			}
> +
> +			/* Found it! return success */
> +			return 0;
> +		}
> +
> +		node =3D NULL;
> +		list +=3D count;
> +		cur_index++;
> +	}
> +
> +	/*
> +	 * Unlock node before returning result; will be one of:

Hrm... looks like a comment suffering from copy/paste without updating
for the new context.


> +	 * -ENOENT : index is for empty phandle
> +	 * -EINVAL : parsing error on data
> +	 * [1..n]  : Number of phandle (count mode; when index =3D -1)
> +	 */
> +	rc =3D index < 0 ? cur_index : -ENOENT;
> + err:
> +	return rc;
> +}
> +
> +struct node *propval_parse_phandle(struct node *root,
> +				     struct property *prop, int index)
> +{
> +	struct of_phandle_args args;
> +
> +	if (index < 0)
> +		return NULL;

Again, this is a bug in the caller; should be an assert().

> +
> +	if (parse_phandle_with_args(root, prop, NULL, 0,
> +					 index, &args))
> +		return NULL;
> +
> +	return args.np;
> +}
> +
> +int propval_parse_phandle_with_args(struct node *root,
> +				    struct property *prop,
> +				    const char *cells_name, int index,
> +				    struct of_phandle_args *out_args)
> +{
> +	if (index < 0)
> +		return -EINVAL;
> +	return parse_phandle_with_args(root, prop, cells_name, 0,
> +						index, out_args);
> +}
> +
> +int propval_parse_phandle_with_fixed_args(struct node *root,
> +					  struct property *prop, int cell_count,
> +					  int index,
> +					  struct of_phandle_args *out_args)
> +{
> +	if (index < 0)
> +		return -EINVAL;
> +	return parse_phandle_with_args(root, prop, NULL, cell_count,
> +					   index, out_args);
> +}
> +
> +int propval_count_phandle_with_args(struct node *root,
> +				    struct property *prop,
> +				    const char *cells_name)
> +{
> +	return parse_phandle_with_args(root, prop, cells_name, 0, -1,
> +						NULL);
> +}
> +
>  struct property *get_property_by_label(struct node *tree, const char *la=
bel,
>  				       struct node **node)
>  {
> @@ -456,6 +680,12 @@ struct node *get_node_by_path(struct node *tree, con=
st char *path)
>  	while (path[0] =3D=3D '/')
>  		path++;
> =20
> +	if (!(*path)) {
> +		if (tree->deleted)
> +			return NULL;
> +		return tree;
> +	}

This change needs a justification.

>  	p =3D strchr(path, '/');
> =20
>  	for_each_child(tree, child) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5Mfx4RzfBqgnTE/w
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTHFirAAoJEGw4ysog2bOSWhAQAM04pv+/cKHmptAt08sC0uKy
e6WRSmrcHop3jiPS/YxAmIe2TkIqy796uiVLQpTSqmNZfUQTXZcxttZuz5YGhW3Z
MtLoXEeF8UXoRa6Yn58hkqEpbOvidZL40Zfd25jmqaaMN3ucXL+Z4/bWwoe8ZpXH
CWcNGwCRmBD6HK2He4zJp+XBHZdrw9koSkp/wvDc9xERHj/CPTLy3IinCERpvjI1
0Gzq6ilBsbKiqwym7qQiQS1y+497ey3a/AJDi705HU3/POFrFiHVt3me8CT6jkAQ
mDapJQEvsFu+li+2tA67uawKF4vj5erJ7KY1brffGvcIGbnHwQ7ldy1hL2FuRhz3
KdDJq/6iHwHHJrowiYgiKhnwPgQXxw+wVBvsmTjHtMC63fuv0D271Vq2AaeFdJD5
Y6pNGvYvzGNJXnXfanr9PGvw0Rl6wS2EYClqL5rqn2ZZSdbnJ7nlbCjk336dKxxA
ylvweLdPsshjjOvb2c+dzTKih8O3SGSBR0loL6txb+kUvEmHyw7R9pisV/OM2lV/
+5HSyuckQdnhLjnigDwDl265LkUi5ILnc6TDOOblEQqrDSSHz2JCJquD/HZAlSpI
X0+anYjuHPVMBQgDEa+AwGSTyejJ6L9b8ksTmkoDu/KR1tICpv7/KYJYGHYC0O43
a4PhmHtxtZa8yKXtp7+B
=GhI/
-----END PGP SIGNATURE-----

--5Mfx4RzfBqgnTE/w--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
