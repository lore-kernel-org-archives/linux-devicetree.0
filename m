From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 2/3] dtc: Plugin (object) device tree support.
Date: Thu, 5 Mar 2015 10:34:11 +1100
Message-ID: <20150304233411.GJ18072@voom.fritz.box>
References: <1425063346-14554-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1425063346-14554-3-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z8yxTSU1mh2gsre7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425063346-14554-3-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Z8yxTSU1mh2gsre7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2015 at 08:55:45PM +0200, Pantelis Antoniou wrote:
> Enables the generation of a __fixups__ node for trees compiled
> using the -@ option that are using the /plugin/ tag.
>=20
> The __fixups__ node make possible the dynamic resolution of phandle
> references which are present in the plugin tree but lie in the
> tree that are applying the overlay against.

It seems to me you've really missed an opportunity in designing the
plugin syntax.  You have dtc generating the fixups nodes, but you
still have to manually lay out your fragments in the right format, and=20
manually construct the target properties.  Instead you could re-use
the existing dts overlay syntax.  For a plugin tree, you wouldn't need
the base tree piece. So, allow something like:

/dts-v1/ /plugin/;

&res {
	baz_res: baz_res { ... };
};

&ocp {
	baz { ... };
};

> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/manual.txt |  5 ++++
>  checks.c                 | 45 ++++++++++++++++++++++++++++++++--
>  dtc-lexer.l              |  5 ++++
>  dtc-parser.y             | 22 ++++++++++++++---
>  dtc.h                    | 12 +++++++++
>  flattree.c               | 63 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  6 files changed, 147 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 4359958..18d1333 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -124,6 +124,9 @@ Options:
>  	for any node labels used, and for any local references using phandles
>  	it also generates a __local_fixups__ node that tracks them.
> =20
> +	When using the /plugin/ tag all unresolved label references to
> +	be tracked in the __fixups__ node, making dynamic resolution possible.
> +
>      -S <bytes>
>  	Ensure the blob at least <bytes> long, adding additional
>  	space if needed.
> @@ -158,6 +161,8 @@ Here is a very rough overview of the layout of a DTS =
source file:
> =20
>      devicetree:   '/' nodedef
> =20
> +    plugindecl:   '/' 'plugin' '/' ';'
> +
>      nodedef:      '{' list_of_property list_of_subnode '}' ';'
> =20
>      property:     label PROPNAME '=3D' propdata ';'
> diff --git a/checks.c b/checks.c
> index 103ca52..4be5233 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -458,6 +458,7 @@ static void fixup_phandle_references(struct check *c,=
 struct node *dt,
>  				     struct node *node, struct property *prop)
>  {
>  	struct marker *m =3D prop->val.markers;
> +	struct fixup *f, **fp;
>  	struct fixup_entry *fe, **fep;
>  	struct node *refnode;
>  	cell_t phandle;
> @@ -467,8 +468,48 @@ static void fixup_phandle_references(struct check *c=
, struct node *dt,
> =20
>  		refnode =3D get_node_by_ref(dt, m->ref);
>  		if (! refnode) {
> -			FAIL(c, "Reference to non-existent node or label \"%s\"\n",
> -			     m->ref);
> +			if (!dt->is_plugin) {
> +				FAIL(c, "Reference to non-existent node or label \"%s\"\n",
> +					m->ref);
> +				continue;
> +			}
> +
> +			/* allocate fixup entry */
> +			fe =3D xmalloc(sizeof(*fe));
> +
> +			fe->node =3D node;
> +			fe->prop =3D prop;
> +			fe->offset =3D m->offset;
> +			fe->next =3D NULL;
> +
> +			/* search for an already existing fixup */
> +			for_each_fixup(dt, f)
> +				if (strcmp(f->ref, m->ref) =3D=3D 0)
> +					break;
> +
> +			/* no fixup found, add new */
> +			if (f =3D=3D NULL) {
> +				f =3D xmalloc(sizeof(*f));
> +				f->ref =3D m->ref;
> +				f->entries =3D NULL;
> +				f->next =3D NULL;
> +
> +				/* add it to the tree */
> +				fp =3D &dt->fixups;
> +				while (*fp)
> +					fp =3D &(*fp)->next;
> +				*fp =3D f;
> +			}
> +
> +			/* and now append fixup entry */
> +			fep =3D &f->entries;
> +			while (*fep)
> +				fep =3D &(*fep)->next;
> +			*fep =3D fe;
> +
> +			/* mark the entry as unresolved */
> +			*((cell_t *)(prop->val.val + m->offset)) =3D
> +				cpu_to_fdt32(0xdeadbeef);
>  			continue;
>  		}
> =20
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index 0ee1caf..dd44ba2 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -113,6 +113,11 @@ static void lexical_error(const char *fmt, ...);
>  			return DT_V1;
>  		}
> =20
> +<*>"/plugin/"	{
> +			DPRINT("Keyword: /plugin/\n");
> +			return DT_PLUGIN;

The /plugin/ tag affects how the whole tree is interpreted.  I'd
therefore recommend folding it into the version declaration.  So,
something like

/dts-v1-plugin/;

or

/dts-v1/ /plugin/;

That ensures that this globally relevant tag appears right at the top.

> +		}
> +
>  <*>"/memreserve/"	{
>  			DPRINT("Keyword: /memreserve/\n");
>  			BEGIN_DEFAULT();
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 5a897e3..d23927d 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -19,6 +19,7 @@
>   */
>  %{
>  #include <stdio.h>
> +#include <inttypes.h>
> =20
>  #include "dtc.h"
>  #include "srcpos.h"
> @@ -52,9 +53,11 @@ extern bool treesource_error;
>  	struct node *nodelist;
>  	struct reserve_info *re;
>  	uint64_t integer;
> +	bool is_plugin;
>  }
> =20
>  %token DT_V1
> +%token DT_PLUGIN
>  %token DT_MEMRESERVE
>  %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
>  %token DT_BITS
> @@ -71,6 +74,7 @@ extern bool treesource_error;
> =20
>  %type <data> propdata
>  %type <data> propdataprefix
> +%type <is_plugin> plugindecl
>  %type <re> memreserve
>  %type <re> memreserves
>  %type <array> arrayprefix
> @@ -101,10 +105,22 @@ extern bool treesource_error;
>  %%
> =20
>  sourcefile:
> -	  DT_V1 ';' memreserves devicetree
> +	  DT_V1 ';' plugindecl memreserves devicetree
>  		{
> -			the_boot_info =3D build_boot_info($3, $4,
> -							guess_boot_cpuid($4));
> +			$5->is_plugin =3D $3;
> +			the_boot_info =3D build_boot_info($4, $5,
> +							guess_boot_cpuid($5));
> +		}
> +	;
> +
> +plugindecl:
> +	/* empty */
> +		{
> +			$$ =3D false;
> +		}
> +	| DT_PLUGIN ';'
> +		{
> +			$$ =3D true;
>  		}
>  	;
> =20
> diff --git a/dtc.h b/dtc.h
> index 16354fa..f163b22 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -141,6 +141,12 @@ struct fixup_entry {
>  	bool local_fixup_generated;
>  };
> =20
> +struct fixup {
> +	char *ref;
> +	struct fixup_entry *entries;
> +	struct fixup *next;
> +};
> +
>  struct symbol {
>  	struct label *label;
>  	struct node *node;
> @@ -177,6 +183,9 @@ struct node {
>  	struct symbol *symbols;
>  	struct fixup_entry *local_fixups;
>  	bool emit_local_fixup_node;
> +
> +	bool is_plugin;
> +	struct fixup *fixups;

Again, you've put these fields in every node, but they're only used in
the root node.

>  };
> =20
>  #define for_each_label_withdel(l0, l) \
> @@ -200,6 +209,9 @@ struct node {
>  	for_each_child_withdel(n, c) \
>  		if (!(c)->deleted)
> =20
> +#define for_each_fixup(n, f) \
> +	for ((f) =3D (n)->fixups; (f); (f) =3D (f)->next)
> +
>  #define for_each_fixup_entry(f, fe) \
>  	for ((fe) =3D (f)->entries; (fe); (fe) =3D (fe)->next)
> =20
> diff --git a/flattree.c b/flattree.c
> index 3a58949..2385137 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -391,6 +391,68 @@ static void emit_local_fixups_node(struct node *tree=
, struct emitter *emit,
>  	emit->endnode(etarget, tree->labels);
>  }
> =20
> +static void emit_fixups_node(struct node *tree, struct emitter *emit,
> +			     void *etarget, struct data *strbuf,
> +			     struct version_info *vi)

And again, constructing the node in the flattree code is not the best idea.

> +{
> +	struct fixup *f;
> +	struct fixup_entry *fe;
> +	char *name, *s;
> +	const char *fullpath;
> +	int namesz, nameoff, vallen;
> +
> +	/* do nothing if no fixups */
> +	if (!tree->fixups)
> +		return;
> +
> +	/* emit the external fixups */
> +	emit->beginnode(etarget, NULL);
> +	emit->string(etarget, "__fixups__", 0);
> +	emit->align(etarget, sizeof(cell_t));
> +
> +	for_each_fixup(tree, f) {
> +
> +		namesz =3D 0;
> +		for_each_fixup_entry(f, fe) {
> +			fullpath =3D fe->node->fullpath;
> +			if (fullpath[0] =3D=3D '\0')
> +				fullpath =3D "/";
> +			namesz +=3D strlen(fullpath) + 1;
> +			namesz +=3D strlen(fe->prop->name) + 1;
> +			namesz +=3D 32;	/* space for :<number> + '\0' */
> +		}
> +
> +		name =3D xmalloc(namesz);
> +
> +		s =3D name;
> +		for_each_fixup_entry(f, fe) {
> +			fullpath =3D fe->node->fullpath;
> +			if (fullpath[0] =3D=3D '\0')
> +				fullpath =3D "/";
> +			snprintf(s, name + namesz - s, "%s:%s:%d", fullpath,
> +					fe->prop->name, fe->offset);
> +			s +=3D strlen(s) + 1;
> +		}
> +
> +		nameoff =3D stringtable_insert(strbuf, f->ref);
> +		vallen =3D s - name - 1;
> +
> +		emit->property(etarget, NULL);
> +		emit->cell(etarget, vallen + 1);
> +		emit->cell(etarget, nameoff);
> +
> +		if ((vi->flags & FTF_VARALIGN) && vallen >=3D 8)
> +			emit->align(etarget, 8);
> +
> +		emit->string(etarget, name, vallen);
> +		emit->align(etarget, sizeof(cell_t));
> +
> +		free(name);
> +	}
> +
> +	emit->endnode(etarget, tree->labels);
> +}
> +
>  static void flatten_tree(struct node *tree, struct emitter *emit,
>  			 void *etarget, struct data *strbuf,
>  			 struct version_info *vi)
> @@ -448,6 +510,7 @@ static void flatten_tree(struct node *tree, struct em=
itter *emit,
> =20
>  	emit_symbols_node(tree, emit, etarget, strbuf, vi);
>  	emit_local_fixups_node(tree, emit, etarget, strbuf, vi);
> +	emit_fixups_node(tree, emit, etarget, strbuf, vi);
> =20
>  	emit->endnode(etarget, tree->labels);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Z8yxTSU1mh2gsre7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU95ZzAAoJEGw4ysog2bOSfs8QALg5A2Y/+k6up5ZAJHK7qc/+
MNRMFrjSOc9bnuFae4QXIszu5N/G3r39BwBGwyUCWDvudn76Te0BItreWMkmtzoB
slHU5zWvppIWbGVY2WP9aK1BDPoLnI7UR/QQFqhqVuV6wotJdmlhorTMkxEougSy
LuLo/lC1TaNRN5h2UIqI30HOEjkelUfFwppJn33q8tlEimx2b5TcObEWfTSBOFeo
WGj3h8PWywmKxX1QzwZss0gVzysH9f9f37Q8Be241s1GmhQ2bSEywo2Q9Nnbrk6V
VzsMDMBbGPfEDe56duDcCxJwo6V2ORcf8yVBp/cxqLlvJoiDshH/nFppT7iTsxRg
Dvn11JlD4UtfqVQsDVNfG7TbgxEbKrDgi68+D/ifak9AVCoNXXkJe2lkM34mFG3Y
X2br5MZvd+bCWvMnNeqa5p+RvJXs4eWPofE0AP3rtO6+VHf7nm0DtpR4wPqcEqY+
tO3o01Gr0Og82UJ3IHqlHMZgCDwgu/R4M84CbygObhITUn3zDxhVdrzibU6EDyvn
P+PenfRj2vY59nGT3CD+/m6KZAsztI+rg/9yRt8gIhrzoZcU8+r7KvjoweEVm6Hz
Ge6dRLvCSiz3Lw4b6VmlwiwrSNA5r3ZzkM4C13XRFaX2Lu98lLejvGItiYz7wSoe
0sSvOTTDcmoj8KW3NwB1
=ED74
-----END PGP SIGNATURE-----

--Z8yxTSU1mh2gsre7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
