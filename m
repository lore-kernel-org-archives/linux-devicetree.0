From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 2/3] dtc: Plugin (object) device tree support.
Date: Thu, 12 Mar 2015 11:37:10 +1100
Message-ID: <20150312003710.GO11973@voom.redhat.com>
References: <1425063346-14554-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1425063346-14554-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20150304233411.GJ18072@voom.fritz.box>
 <1425664514.11054.150.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y9o+fgG4MNl0mnzl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425664514.11054.150.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan =?iso-8859-1?Q?L=FCbbe?= <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Y9o+fgG4MNl0mnzl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2015 at 06:55:14PM +0100, Jan L=FCbbe wrote:
> On Do, 2015-03-05 at 10:34 +1100, David Gibson wrote:
> > On Fri, Feb 27, 2015 at 08:55:45PM +0200, Pantelis Antoniou wrote:
> > > Enables the generation of a __fixups__ node for trees compiled
> > > using the -@ option that are using the /plugin/ tag.
> > >=20
> > > The __fixups__ node make possible the dynamic resolution of phandle
> > > references which are present in the plugin tree but lie in the
> > > tree that are applying the overlay against.
> >=20
> > It seems to me you've really missed an opportunity in designing the
> > plugin syntax.  You have dtc generating the fixups nodes, but you
> > still have to manually lay out your fragments in the right format,
> > and=20
> > manually construct the target properties.  Instead you could re-use
> > the existing dts overlay syntax.  For a plugin tree, you wouldn't need
> > the base tree piece. So, allow something like:
> >=20
> > /dts-v1/ /plugin/;
> >=20
> > &res {
> >         baz_res: baz_res { ... };
> > };
> >=20
> > &ocp {
> >         baz { ... };
> > };
>=20
> During our initial experiments with overlays in Barebox, Sascha Hauer
> did a simple patch to DTC to implement this. I've recently rebased it on
> Pantelis' series. It makes writing overlays much more natural:

Ok, well I'd like to see this merged with the basic patch series

> >From e7082dd7160082c64d242b4ed2ebb9eb0b8aad42 Mon Sep 17 00:00:00 2001
> From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Date: Thu, 8 Aug 2013 23:08:31 +0200
> Subject: [PATCH] dtc: convert unresolved labels into overlay nodes
>=20
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  dtc-parser.y | 10 +++++++---
>  dtc.h        |  3 ++-
>  livetree.c   | 23 +++++++++++++++++++++++
>  3 files changed, 32 insertions(+), 4 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index d23927d99215..f431bdd6e57c 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -172,10 +172,14 @@ devicetree:
>  		{
>  			struct node *target =3D get_node_by_ref($1, $2);
> =20
> -			if (target)
> +			if (target) {
>  				merge_nodes(target, $3);
> -			else
> -				ERROR(&@2, "Label or path %s not found", $2);
> +			} else {
> +				if (symbol_fixup_support)
> +					add_orphan_node($1, $3, $2);
> +				else
> +					ERROR(&@2, "Label or path %s not found", $2);
> +			}
>  			$$ =3D $1;
>  		}
>  	| devicetree DT_DEL_NODE DT_REF ';'
> diff --git a/dtc.h b/dtc.h
> index f163b22b14b8..fc7330e9013e 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -20,7 +20,7 @@
>   *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
>   *                                                                   USA
>   */
> -
> +#define _GNU_SOURCE
>  #include <stdio.h>
>  #include <string.h>
>  #include <stdlib.h>
> @@ -234,6 +234,7 @@ struct node *build_node_delete(void);
>  struct node *name_node(struct node *node, char *name);
>  struct node *chain_node(struct node *first, struct node *list);
>  struct node *merge_nodes(struct node *old_node, struct node *new_node);
> +void add_orphan_node(struct node *old_node, struct node *new_node, char =
*ref);
> =20
>  void add_property(struct node *node, struct property *prop);
>  void delete_property_by_name(struct node *node, char *name);
> diff --git a/livetree.c b/livetree.c
> index e229b84432f9..ed16b8c216f4 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -216,6 +216,29 @@ struct node *merge_nodes(struct node *old_node, stru=
ct node *new_node)
>  	return old_node;
>  }
> =20
> +void add_orphan_node(struct node *dt, struct node *new_node, char *ref)
> +{
> +	struct node *ovl =3D xmalloc(sizeof(*ovl));
> +	struct property *p;
> +	struct data d =3D empty_data;
> +	char *name;
> +
> +	memset(ovl, 0, sizeof(*ovl));
> +
> +	d =3D data_add_marker(d, REF_PHANDLE, ref);
> +	d =3D data_append_integer(d, 0xdeadbeef, 32);
> +
> +	p =3D build_property("target", d);
> +	add_property(ovl, p);
> +
> +	asprintf(&name, "fragment@%s", ref);
> +	name_node(ovl, name);
> +	name_node(new_node, "__overlay__");
> +
> +	add_child(dt, ovl);
> +	add_child(ovl, new_node);
> +}
> +
>  struct node *chain_node(struct node *first, struct node *list)
>  {
>  	assert(first->next_sibling =3D=3D NULL);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Y9o+fgG4MNl0mnzl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVAN+2AAoJEGw4ysog2bOSOE0P/iks/fNTonI6HO4WNYj4THHf
/toDZtp3WrjClFquzu8y/FFsNRfMeEROkdho8QTfpxvkPSXO4SFPU6yWinszqWfT
TkbNR/U952kOql9mKpzvRgHvRKgHWlGG0PDPyxdY/jNaqXNI0220kf//jPOPpCcX
+3EXQ0aRyd5d+45ff6t4f+v9RUKEKbwJOQyXGNn60F7+YnLdBjigsxUdvhw5YMWt
9offl0Mnnqica/lj7t9rf1VL688lxXkkOGKHo1y2/wz1fNcHx/qjfY1ji/RMZfe0
/LC9U8Ikd1SCburDDqQ5AP6CkUUfrs+s7WehJ3jt8zUHKUWdxgScSAFNVu5zgHD9
PvvlSGX3Yj1t9wgXfIbUH68x2fWuO6qlphEUo3sztTCk6jLC3g6aQGs6lFe8ciVA
vDLDqgMqGlezcT5hJSYbGCk80hqnXOUckgS8xJ0hmYMIWcfLay+AmkmYZUL3kEyE
b4/booD3hViwun5SCYkn0Yaq93Xc00IhdqNz1HpNJkqIDx+uh2h93Dz3CztPqzJ2
03wU3+7uUxEHHdhj52XHDXptdoDYi2FIGL+oVW3ufoSjX5QnHgXRb6j4OBu/kEr4
FmGDI7aOTzfUZJHfsCdgPaPVIf+SGT3uMSoIt+oyuzbSiPEDa+Ri3aUDmLR+rEaE
Goz3XdDDPyaluu5wFPaE
=RTB/
-----END PGP SIGNATURE-----

--Y9o+fgG4MNl0mnzl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
