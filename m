From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 1/3] dtc: Symbol and local fixup generation support
Date: Thu, 5 Mar 2015 10:06:40 +1100
Message-ID: <20150304230640.GI18072@voom.fritz.box>
References: <1425063346-14554-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1425063346-14554-2-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/GPgYEyhnw15BExa"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425063346-14554-2-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--/GPgYEyhnw15BExa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2015 at 08:55:44PM +0200, Pantelis Antoniou wrote:
> Enable the generation of symbols & local fixup information
> for trees compiled with the -@ (--symbols) option.
>=20
> Using this patch labels in the tree and their users emit information
> in __symbols__ and __local_fixups__ nodes. Using this information
> it is possible to implement run time dynamic tree loading.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/manual.txt |   5 ++
>  checks.c                 |  61 +++++++++++++++++++++
>  dtc.c                    |   9 ++-
>  dtc.h                    |  28 ++++++++++
>  flattree.c               | 139 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 240 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 398de32..4359958 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -119,6 +119,11 @@ Options:
>  	Make space for <number> reserve map entries
>  	Relevant for dtb and asm output only.
> =20
> +    -@
> +        Generates a __symbols__ node at the root node of the resulting b=
lob
> +	for any node labels used, and for any local references using phandles
> +	it also generates a __local_fixups__ node that tracks them.
> +
>      -S <bytes>
>  	Ensure the blob at least <bytes> long, adding additional
>  	space if needed.
> diff --git a/checks.c b/checks.c
> index e81a8c7..103ca52 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -458,6 +458,7 @@ static void fixup_phandle_references(struct check *c,=
 struct node *dt,
>  				     struct node *node, struct property *prop)
>  {
>  	struct marker *m =3D prop->val.markers;
> +	struct fixup_entry *fe, **fep;
>  	struct node *refnode;
>  	cell_t phandle;
> =20
> @@ -471,9 +472,28 @@ static void fixup_phandle_references(struct check *c=
, struct node *dt,
>  			continue;
>  		}
> =20
> +		/* if it's a local reference, we need to record it */
> +		if (symbol_fixup_support) {
> +
> +			/* allocate a new local fixup entry */
> +			fe =3D xmalloc(sizeof(*fe));
> +
> +			fe->node =3D node;
> +			fe->prop =3D prop;
> +			fe->offset =3D m->offset;
> +			fe->next =3D NULL;

You're not initializing the local_fixup_generated field.

> +
> +			/* append it to the local fixups */
> +			fep =3D &dt->local_fixups;
> +			while (*fep)
> +				fep =3D &(*fep)->next;
> +			*fep =3D fe;
> +		}
> +
>  		phandle =3D get_node_phandle(dt, refnode);
>  		*((cell_t *)(prop->val.val + m->offset)) =3D cpu_to_fdt32(phandle);
>  	}
> +
>  }
>  ERROR(phandle_references, NULL, NULL, fixup_phandle_references, NULL,
>        &duplicate_node_names, &explicit_phandles);
> @@ -652,6 +672,45 @@ static void check_obsolete_chosen_interrupt_controll=
er(struct check *c,
>  }
>  TREE_WARNING(obsolete_chosen_interrupt_controller, NULL);
> =20
> +static void check_auto_label_phandles(struct check *c, struct node *dt,
> +				       struct node *node)

This should be called fixup_<something>.  The naming convention is to
distinguish checks that actually check something, from fixups which
use the check infrastructure to traverse the tree and adjust things
but don't actually check anything.

> +{
> +	struct label *l;
> +	struct symbol *s, **sp;
> +	int has_label;
> +
> +	if (!symbol_fixup_support)
> +		return;
> +
> +	has_label =3D 0;
> +	for_each_label(node->labels, l) {
> +		has_label =3D 1;
> +		break;
> +	}
> +
> +	if (!has_label)
> +		return;
> +
> +	/* force allocation of a phandle for this node */
> +	(void)get_node_phandle(dt, node);
> +
> +	/* add the symbol */
> +	for_each_label(node->labels, l) {
> +
> +		s =3D xmalloc(sizeof(*s));
> +		s->label =3D l;
> +		s->node =3D node;
> +		s->next =3D NULL;
> +
> +		/* add it to the symbols list */
> +		sp =3D &dt->symbols;
> +		while (*sp)
> +			sp =3D &((*sp)->next);
> +		*sp =3D s;
> +	}
> +}
> +NODE_WARNING(auto_label_phandles, NULL);

This almost certainly should have some prereq checks/fixups.

>  static struct check *check_table[] =3D {
>  	&duplicate_node_names, &duplicate_property_names,
>  	&node_name_chars, &node_name_format, &property_name_chars,
> @@ -670,6 +729,8 @@ static struct check *check_table[] =3D {
>  	&avoid_default_addr_size,
>  	&obsolete_chosen_interrupt_controller,
> =20
> +	&auto_label_phandles,
> +
>  	&always_fail,
>  };
> =20
> diff --git a/dtc.c b/dtc.c
> index 8c4add6..91e91e7 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -29,6 +29,7 @@ int reservenum;		/* Number of memory reservation slots =
*/
>  int minsize;		/* Minimum blob size */
>  int padsize;		/* Additional padding to blob */
>  int phandle_format =3D PHANDLE_BOTH;	/* Use linux,phandle or phandle pro=
perties */
> +int symbol_fixup_support =3D 0;
> =20
>  static void fill_fullpaths(struct node *tree, const char *prefix)
>  {
> @@ -51,7 +52,7 @@ static void fill_fullpaths(struct node *tree, const cha=
r *prefix)
>  #define FDT_VERSION(version)	_FDT_VERSION(version)
>  #define _FDT_VERSION(version)	#version
>  static const char usage_synopsis[] =3D "dtc [options] <input file>";
> -static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:h=
v";
> +static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:@=
hv";
>  static struct option const usage_long_opts[] =3D {
>  	{"quiet",            no_argument, NULL, 'q'},
>  	{"in-format",         a_argument, NULL, 'I'},
> @@ -69,6 +70,7 @@ static struct option const usage_long_opts[] =3D {
>  	{"phandle",           a_argument, NULL, 'H'},
>  	{"warning",           a_argument, NULL, 'W'},
>  	{"error",             a_argument, NULL, 'E'},
> +	{"symbols",	     no_argument, NULL, '@'},
>  	{"help",             no_argument, NULL, 'h'},
>  	{"version",          no_argument, NULL, 'v'},
>  	{NULL,               no_argument, NULL, 0x0},
> @@ -99,6 +101,7 @@ static const char * const usage_opts_help[] =3D {
>  	 "\t\tboth   - Both \"linux,phandle\" and \"phandle\" properties",
>  	"\n\tEnable/disable warnings (prefix with \"no-\")",
>  	"\n\tEnable/disable errors (prefix with \"no-\")",
> +	"\n\tEnable symbols/fixup support",
>  	"\n\tPrint this help and exit",
>  	"\n\tPrint version and exit",
>  	NULL,
> @@ -186,7 +189,9 @@ int main(int argc, char *argv[])
>  		case 'E':
>  			parse_checks_option(false, true, optarg);
>  			break;
> -
> +		case '@':
> +			symbol_fixup_support =3D 1;
> +			break;
>  		case 'h':
>  			usage(NULL);
>  		default:
> diff --git a/dtc.h b/dtc.h
> index 56212c8..16354fa 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -54,6 +54,7 @@ extern int reservenum;		/* Number of memory reservation=
 slots */
>  extern int minsize;		/* Minimum blob size */
>  extern int padsize;		/* Additional padding to blob */
>  extern int phandle_format;	/* Use linux,phandle or phandle properties */
> +extern int symbol_fixup_support;/* enable symbols & fixup support */
> =20
>  #define PHANDLE_LEGACY	0x1
>  #define PHANDLE_EPAPR	0x2
> @@ -132,6 +133,20 @@ struct label {
>  	struct label *next;
>  };
> =20
> +struct fixup_entry {
> +	int offset;
> +	struct node *node;
> +	struct property *prop;
> +	struct fixup_entry *next;
> +	bool local_fixup_generated;
> +};
> +
> +struct symbol {
> +	struct label *label;
> +	struct node *node;
> +	struct symbol *next;
> +};
> +
>  struct property {
>  	bool deleted;
>  	char *name;
> @@ -158,6 +173,10 @@ struct node {
>  	int addr_cells, size_cells;
> =20
>  	struct label *labels;
> +
> +	struct symbol *symbols;
> +	struct fixup_entry *local_fixups;

You've put these fields in the structure for every node, but you're
only using them on the root node.

> +	bool emit_local_fixup_node;
>  };
> =20
>  #define for_each_label_withdel(l0, l) \
> @@ -181,6 +200,15 @@ struct node {
>  	for_each_child_withdel(n, c) \
>  		if (!(c)->deleted)
> =20
> +#define for_each_fixup_entry(f, fe) \
> +	for ((fe) =3D (f)->entries; (fe); (fe) =3D (fe)->next)

This macro is never used.

> +#define for_each_symbol(n, s) \
> +	for ((s) =3D (n)->symbols; (s); (s) =3D (s)->next)
> +
> +#define for_each_local_fixup_entry(n, fe) \
> +	for ((fe) =3D (n)->local_fixups; (fe); (fe) =3D (fe)->next)
> +
>  void add_label(struct label **labels, char *label);
>  void delete_labels(struct label **labels);
> =20
> diff --git a/flattree.c b/flattree.c
> index bd99fa2..3a58949 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -255,6 +255,142 @@ static int stringtable_insert(struct data *d, const=
 char *str)
>  	return i;
>  }
> =20
> +static void emit_local_fixups(struct node *tree, struct emitter *emit,
> +		void *etarget, struct data *strbuf, struct version_info *vi,
> +		struct node *node)

Constructing these nodes during the emit code in flattree.c makes life
unnecessarily difficult, and means they'll be missing from -O dts
output.  Instead you should construct the fixup nodes in the live
tree, then emit them in the usual way.

> +{
> +	struct fixup_entry *fe, *fen;
> +	struct node *child;
> +	int nameoff, count;
> +	cell_t *buf;
> +	struct data d;
> +
> +	if (node->emit_local_fixup_node) {
> +
> +		/* emit the external fixups (do not emit /) */
> +		if (node !=3D tree) {
> +			emit->beginnode(etarget, NULL);
> +			emit->string(etarget, node->name, 0);
> +			emit->align(etarget, sizeof(cell_t));
> +		}
> +
> +		for_each_local_fixup_entry(tree, fe) {
> +			if (fe->node !=3D node || fe->local_fixup_generated)
> +				continue;
> +
> +			/* count the number of fixup entries */
> +			count =3D 0;
> +			for_each_local_fixup_entry(tree, fen) {
> +				if (fen->prop !=3D fe->prop)
> +					continue;
> +				fen->local_fixup_generated =3D true;
> +				count++;
> +			}
> +
> +			/* allocate buffer */
> +			buf =3D xmalloc(count * sizeof(cell_t));
> +
> +			/* collect all the offsets in buffer */
> +			count =3D 0;
> +			for_each_local_fixup_entry(tree, fen) {
> +				if (fen->prop !=3D fe->prop)
> +					continue;
> +				fen->local_fixup_generated =3D true;
> +				buf[count++] =3D cpu_to_fdt32(fen->offset);
> +			}
> +			d =3D empty_data;
> +			d.len =3D count * sizeof(cell_t);
> +			d.val =3D (char *)buf;
> +
> +			nameoff =3D stringtable_insert(strbuf, fe->prop->name);
> +			emit->property(etarget, fe->prop->labels);
> +			emit->cell(etarget, count * sizeof(cell_t));
> +			emit->cell(etarget, nameoff);
> +
> +			if ((vi->flags & FTF_VARALIGN) &&
> +					(count * sizeof(cell_t)) >=3D 8)
> +				emit->align(etarget, 8);
> +
> +			emit->data(etarget, d);
> +			emit->align(etarget, sizeof(cell_t));
> +
> +			free(buf);
> +		}
> +	}
> +
> +	for_each_child(node, child)
> +		emit_local_fixups(tree, emit, etarget, strbuf, vi, child);
> +
> +	if (node->emit_local_fixup_node && node !=3D tree)
> +		emit->endnode(etarget, tree->labels);
> +}
> +
> +static void emit_symbols_node(struct node *tree, struct emitter *emit,
> +			      void *etarget, struct data *strbuf,
> +			      struct version_info *vi)
> +{
> +	struct symbol *sym;
> +	int nameoff, vallen;
> +
> +	/* do nothing if no symbols */
> +	if (!tree->symbols)
> +		return;
> +
> +	emit->beginnode(etarget, NULL);
> +	emit->string(etarget, "__symbols__", 0);
> +	emit->align(etarget, sizeof(cell_t));
> +
> +	for_each_symbol(tree, sym) {
> +
> +		vallen =3D strlen(sym->node->fullpath);
> +
> +		nameoff =3D stringtable_insert(strbuf, sym->label->label);
> +
> +		emit->property(etarget, NULL);
> +		emit->cell(etarget, vallen + 1);
> +		emit->cell(etarget, nameoff);
> +
> +		if ((vi->flags & FTF_VARALIGN) && vallen >=3D 8)
> +			emit->align(etarget, 8);
> +
> +		emit->string(etarget, sym->node->fullpath,
> +				strlen(sym->node->fullpath));
> +		emit->align(etarget, sizeof(cell_t));
> +	}
> +
> +	emit->endnode(etarget, NULL);
> +}
> +
> +static void emit_local_fixups_node(struct node *tree, struct emitter *em=
it,
> +				   void *etarget, struct data *strbuf,
> +				   struct version_info *vi)
> +{
> +	struct fixup_entry *fe;
> +	struct node *node;
> +
> +	/* do nothing if no local fixups */
> +	if (!tree->local_fixups)
> +		return;
> +
> +	/* mark all nodes that need a local fixup generated (and parents) */
> +	for_each_local_fixup_entry(tree, fe) {
> +		node =3D fe->node;
> +		while (node !=3D NULL && !node->emit_local_fixup_node) {
> +			node->emit_local_fixup_node =3D true;
> +			node =3D node->parent;
> +		}
> +	}
> +
> +	/* emit the local fixups node now */
> +	emit->beginnode(etarget, NULL);
> +	emit->string(etarget, "__local_fixups__", 0);
> +	emit->align(etarget, sizeof(cell_t));
> +
> +	emit_local_fixups(tree, emit, etarget, strbuf, vi, tree);
> +
> +	emit->endnode(etarget, tree->labels);
> +}
> +
>  static void flatten_tree(struct node *tree, struct emitter *emit,
>  			 void *etarget, struct data *strbuf,
>  			 struct version_info *vi)
> @@ -310,6 +446,9 @@ static void flatten_tree(struct node *tree, struct em=
itter *emit,
>  		flatten_tree(child, emit, etarget, strbuf, vi);
>  	}
> =20
> +	emit_symbols_node(tree, emit, etarget, strbuf, vi);
> +	emit_local_fixups_node(tree, emit, etarget, strbuf, vi);
> +
>  	emit->endnode(etarget, tree->labels);
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/GPgYEyhnw15BExa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU95AAAAoJEGw4ysog2bOSHN8P/1ncqw5HkFPbmDe6Zj8m0+Oz
a2c35QGkb0Pbh69bDQdVgdjhDwTn7Bv9wPa9wf43OCqoHehqViFdOniTVdDWxuh2
bFbDLNjl31hRQuwB1iVstAHKEjdhxFKCX6baMHuwdB5GMyZT7fg5m0lGGb37LLL0
CChy/tIjPoJXbAsKkc0nROWRsuOINzyNx5Yq3PrsTNamgQ87EQKTyeJ5bcmYWxUb
/gTUv2qs5zQFgb1nxiiNo2oNCf73qDZ57PWLnJPpIaSnEkjMdHqKGP664kxEcua0
slXnoZNPc0KkegW6sQH/Jpaj5TjBNECM8DkGgwPIBf5w8i7sLtmjH5+G/L5+99Dm
4joY8tbUc6zVTe0ZSIX0YFwTkgv9RqmYEh56ctszpBf8gfV6UoViEDMu+DxsVqll
MZ8bd4S1qBg1DaLBbzJOHKEOANtvyHYZsC41kJWPUSAfsHvcggS89dGoKNukHjvk
MbKwYFVUHkoPZJZ6/Rkoj8Nw1kEVAAEuM616z3io6cB3Oo2BSxQdrKYsw0m/7GZu
4YDWaMVBJHfy4jrbgriCnN7YBPNxg1cOVDRpEtiGQH7WS3EyZ8nccOaRDg1CIBvi
q4XCbc8AYLhvfjivXlvQoq6jmq0pWot1aYHXeP1kMrMWre+W4rUkh8+Q+f8PUaxH
oqSEvG5hJ+r5OLBNEGH1
=ZUoV
-----END PGP SIGNATURE-----

--/GPgYEyhnw15BExa--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
