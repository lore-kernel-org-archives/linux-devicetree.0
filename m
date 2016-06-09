From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v8 3/3] dtc: Plugin and fixup support
Date: Thu, 9 Jun 2016 14:53:52 +1000
Message-ID: <20160609045352.GL9226@voom.fritz.box>
References: <1464889642-28080-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1464889642-28080-4-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnxXMyWEPIZsopkG"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464889642-28080-4-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--RnxXMyWEPIZsopkG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2016 at 08:47:22PM +0300, Pantelis Antoniou wrote:
> This patch enable the generation of symbols & local fixup information
> for trees compiled with the -@ (--symbols) option.
>=20
> Using this patch labels in the tree and their users emit information
> in __symbols__ and __local_fixups__ nodes.
>=20
> The __fixups__ node make possible the dynamic resolution of phandle
> references which are present in the plugin tree but lie in the
> tree that are applying the overlay against.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  Documentation/manual.txt |  24 +++++-
>  checks.c                 |   8 +-
>  dtc-lexer.l              |   5 ++
>  dtc-parser.y             |  33 ++++++-
>  dtc.c                    |  23 ++++-
>  dtc.h                    |  31 ++++++-
>  flattree.c               |   2 +-
>  fstree.c                 |   2 +-
>  livetree.c               | 219 +++++++++++++++++++++++++++++++++++++++++=
+++++-
>  treesource.c             |   1 +
>  10 files changed, 332 insertions(+), 16 deletions(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 6d2811b..deffcdb 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -127,6 +127,20 @@ Options:
>  	Make space for <number> reserve map entries
>  	Relevant for dtb and asm output only.
> =20
> +    -@
> +	Generates a __symbols__ node at the root node of the resulting blob
> +	for any node labels used, and for any local references using phandles
> +	it also generates a __local_fixups__ node that tracks them.
> +
> +	When using the /plugin/ tag all unresolved label references to
> +	be tracked in the __fixups__ node, making dynamic resolution possible.
> +
> +    -A
> +	Generate automatically aliases for all node labels. This is similar to
> +	the -@ option (the __symbols__ node contain identical information) but
> +	the semantics are slightly different since no phandles are automatically
> +	generated for labeled nodes.
> +
>      -S <bytes>
>  	Ensure the blob at least <bytes> long, adding additional
>  	space if needed.
> @@ -154,12 +168,18 @@ Additionally, dtc performs various sanity checks on=
 the tree.
>  Here is a very rough overview of the layout of a DTS source file:
> =20
> =20
> -    sourcefile:   list_of_memreserve devicetree
> +    sourcefile:   versioninfo plugindecl list_of_memreserve basetree ove=
rlays
> +
> +    versioninfo:  "/dts-v1/"
> +
> +    plugindecl:   "/plugin/"

This still isn't quite right, because it doesn't have the ';'.

> =20
>      memreserve:   label 'memreserve' ADDR ADDR ';'
>  		| label 'memreserve' ADDR '-' ADDR ';'
> =20
> -    devicetree:   '/' nodedef
> +    basetree:   '/' nodedef
> +
> +    overlays:   list_of_overlay_definitions (at compile time)

format of an overlay isn't defined, and this doesn't really look like BNF.

>      nodedef:      '{' list_of_property list_of_subnode '}' ';'
> =20
> diff --git a/checks.c b/checks.c
> index 1829f0e..355bef9 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -482,8 +482,12 @@ static void fixup_phandle_references(struct check *c=
, struct node *dt,
> =20
>  			refnode =3D get_node_by_ref(dt, m->ref);
>  			if (! refnode) {
> -				FAIL(c, "Reference to non-existent node or label \"%s\"\n",
> -				     m->ref);
> +				if (!(tree_get_versionflags(dt) & VF_PLUGIN))
> +					FAIL(c, "Reference to non-existent node or "
> +							"label \"%s\"\n", m->ref);
> +				else /* mark the entry as unresolved */
> +					*((cell_t *)(prop->val.val + m->offset)) =3D
> +						cpu_to_fdt32(0xffffffff);
>  				continue;
>  			}
> =20
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index 790fbf6..40bbc87 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -121,6 +121,11 @@ static void lexical_error(const char *fmt, ...);
>  			return DT_V1;
>  		}
> =20
> +<*>"/plugin/"	{
> +			DPRINT("Keyword: /plugin/\n");
> +			return DT_PLUGIN;
> +		}
> +
>  <*>"/memreserve/"	{
>  			DPRINT("Keyword: /memreserve/\n");
>  			BEGIN_DEFAULT();
> diff --git a/dtc-parser.y b/dtc-parser.y
> index e0d7212..bb89631 100644
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
> @@ -33,6 +34,7 @@ extern void yyerror(char const *s);
> =20
>  extern struct dt_info *parser_output;
>  extern bool treesource_error;
> +extern unsigned int the_versionflags;

You don't need this additional global, you're already putting it into
struct dt_info.

>  %}
> =20
>  %union {
> @@ -54,9 +56,11 @@ extern bool treesource_error;
>  	struct overlay *overlaylist;
>  	struct reserve_info *re;
>  	uint64_t integer;
> +	unsigned int flags;
>  }
> =20
>  %token DT_V1
> +%token DT_PLUGIN
>  %token DT_MEMRESERVE
>  %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
>  %token DT_BITS
> @@ -73,6 +77,8 @@ extern bool treesource_error;
> =20
>  %type <data> propdata
>  %type <data> propdataprefix
> +%type <flags> versioninfo
> +%type <flags> plugindecl
>  %type <re> memreserve
>  %type <re> memreserves
>  %type <array> arrayprefix
> @@ -106,16 +112,37 @@ extern bool treesource_error;
>  %%
> =20
>  sourcefile:
> -	  v1tag memreserves basetree overlays
> +	  versioninfo plugindecl memreserves basetree overlays
>  		{
> -			parser_output =3D build_dt_info($2, $3, $4,
> -						      guess_boot_cpuid($3));
> +			assert(($1 | $2) =3D=3D the_versionflags);
> +			parser_output =3D build_dt_info($1 | $2, $3, $4, $5,
> +							guess_boot_cpuid($4));
> +		}
> +	;
> +
> +versioninfo:
> +	v1tag
> +		{
> +			the_versionflags |=3D VF_DT_V1;
> +			$$ =3D VF_DT_V1;
>  		}
>  	;
> =20
>  v1tag:
>  	  DT_V1 ';'
>  	| DT_V1 ';' v1tag
> +	| DT_V1
> +
> +plugindecl:
> +	DT_PLUGIN ';'
> +		{
> +			the_versionflags |=3D VF_PLUGIN;
> +			$$ =3D the_versionflags;
> +		}
> +	| /* empty */
> +		{
> +			$$ =3D 0;
> +		}
>  	;
> =20
>  memreserves:
> diff --git a/dtc.c b/dtc.c
> index 43ba19d..8b716ad 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -31,6 +31,8 @@ int reservenum;		/* Number of memory reservation slots =
*/
>  int minsize;		/* Minimum blob size */
>  int padsize;		/* Additional padding to blob */
>  int phandle_format =3D PHANDLE_BOTH;	/* Use linux,phandle or phandle pro=
perties */
> +int symbol_fixup_support;
> +int auto_label_aliases;
> =20
>  static void fill_fullpaths(struct node *tree, const char *prefix)
>  {
> @@ -63,7 +65,7 @@ static void resolve_overlays(struct dt_info *dti)
>  #define FDT_VERSION(version)	_FDT_VERSION(version)
>  #define _FDT_VERSION(version)	#version
>  static const char usage_synopsis[] =3D "dtc [options] <input file>";
> -static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:h=
v";
> +static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:@=
Ahv";
>  static struct option const usage_long_opts[] =3D {
>  	{"quiet",            no_argument, NULL, 'q'},
>  	{"in-format",         a_argument, NULL, 'I'},
> @@ -81,6 +83,8 @@ static struct option const usage_long_opts[] =3D {
>  	{"phandle",           a_argument, NULL, 'H'},
>  	{"warning",           a_argument, NULL, 'W'},
>  	{"error",             a_argument, NULL, 'E'},
> +	{"symbols",	     no_argument, NULL, '@'},
> +	{"auto-alias",       no_argument, NULL, 'A'},
>  	{"help",             no_argument, NULL, 'h'},
>  	{"version",          no_argument, NULL, 'v'},
>  	{NULL,               no_argument, NULL, 0x0},
> @@ -111,6 +115,8 @@ static const char * const usage_opts_help[] =3D {
>  	 "\t\tboth   - Both \"linux,phandle\" and \"phandle\" properties",
>  	"\n\tEnable/disable warnings (prefix with \"no-\")",
>  	"\n\tEnable/disable errors (prefix with \"no-\")",
> +	"\n\tEnable symbols/fixup support",
> +	"\n\tEnable auto-alias of labels",
>  	"\n\tPrint this help and exit",
>  	"\n\tPrint version and exit",
>  	NULL,
> @@ -247,7 +253,12 @@ int main(int argc, char *argv[])
>  		case 'E':
>  			parse_checks_option(false, true, optarg);
>  			break;
> -
> +		case '@':
> +			symbol_fixup_support =3D 1;
> +			break;
> +		case 'A':
> +			auto_label_aliases =3D 1;
> +			break;
>  		case 'h':
>  			usage(NULL);
>  		default:
> @@ -308,6 +319,14 @@ int main(int argc, char *argv[])
> =20
>  	process_checks(force, dti);
> =20
> +	if (auto_label_aliases)
> +		generate_label_tree(dti->dt, "aliases", false);
> +
> +	if (symbol_fixup_support) {
> +		generate_label_tree(dti->dt, "__symbols__", true);
> +		generate_fixups_tree(dti->dt);
> +	}
> +
>  	if (sort)
>  		sort_tree(dti);
> =20
> diff --git a/dtc.h b/dtc.h
> index fa66dca..a9fac44 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -54,6 +54,12 @@ extern int reservenum;		/* Number of memory reservatio=
n slots */
>  extern int minsize;		/* Minimum blob size */
>  extern int padsize;		/* Additional padding to blob */
>  extern int phandle_format;	/* Use linux,phandle or phandle properties */
> +extern int symbol_fixup_support;/* enable symbols & fixup support */
> +extern int auto_label_aliases;	/* auto generate labels -> aliases */
> +
> +/*
> + * Tree source globals
> + */
> =20
>  #define PHANDLE_LEGACY	0x1
>  #define PHANDLE_EPAPR	0x2
> @@ -142,6 +148,8 @@ struct property {
>  	struct label *labels;
>  };
> =20
> +struct dt_info;
> +
>  struct node {
>  	bool deleted;
>  	char *name;
> @@ -158,6 +166,9 @@ struct node {
>  	int addr_cells, size_cells;
> =20
>  	struct label *labels;
> +
> +	/* only for the root (parent =3D=3D NULL) */
> +	struct dt_info *dti;

I still don't think you should need this - things which need the
version info should be taking struct dt_info instead of struct node.

>  };
> =20
>  struct overlay {
> @@ -200,6 +211,7 @@ struct node *build_node_delete(void);
>  struct node *name_node(struct node *node, char *name);
>  struct node *chain_node(struct node *first, struct node *list);
>  struct node *merge_nodes(struct node *old_node, struct node *new_node);
> +void add_orphan_node(struct node *old_node, struct node *new_node, char =
*ref);
> =20
>  void add_property(struct node *node, struct property *prop);
>  void delete_property_by_name(struct node *node, char *name);
> @@ -207,6 +219,8 @@ void delete_property(struct property *prop);
>  void add_child(struct node *parent, struct node *child);
>  void delete_node_by_name(struct node *parent, char *name);
>  void delete_node(struct node *node);
> +struct property *append_to_property(struct node *node,
> +				    char *name, const void *data, int len);
> =20
>  struct overlay *build_overlay(char *target, struct node *dt);
>  struct overlay *chain_overlay(struct overlay *first, struct overlay *lis=
t);
> @@ -246,6 +260,7 @@ struct reserve_info *add_reserve_entry(struct reserve=
_info *list,
> =20
> =20
>  struct dt_info {
> +	unsigned int versionflags;
>  	struct reserve_info *reservelist;
>  	uint32_t boot_cpuid_phys;
> =20
> @@ -253,11 +268,25 @@ struct dt_info {
>  	struct overlay *overlays;
>  };
> =20
> -struct dt_info *build_dt_info(struct reserve_info *reservelist,
> +/* version flags definitions */
> +#define VF_DT_V1	0x0001	/* /dts-v1/ */
> +#define VF_PLUGIN	0x0002	/* /plugin/ */
> +
> +static inline unsigned int tree_get_versionflags(struct node *dt)
> +{
> +	if (!dt || !dt->dti)
> +		return 0;
> +	return dt->dti->versionflags;
> +}
> +
> +struct dt_info *build_dt_info(unsigned int versionflags,
> +			      struct reserve_info *reservelist,
>  			      struct node *basetree,
>  			      struct overlay *overlays,
>  			      uint32_t boot_cpuid_phys);
>  void sort_tree(struct dt_info *dti);
> +void generate_label_tree(struct node *dt, char *gen_node_name, bool allo=
cph);
> +void generate_fixups_tree(struct node *dt);
> =20
>  /* Checks */
> =20
> diff --git a/flattree.c b/flattree.c
> index 59bdc7d..b674cbf 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -930,5 +930,5 @@ struct dt_info *dt_from_blob(const char *fname)
> =20
>  	fclose(f);
> =20
> -	return build_dt_info(reservelist, tree, NULL, boot_cpuid_phys);
> +	return build_dt_info(VF_DT_V1, reservelist, tree, NULL, boot_cpuid_phys=
);

Actually, I think this should set the plugin flag in the dt_info based
on the input's magic number.  That doesn't need to be in the first
pass, though.

>  }
> diff --git a/fstree.c b/fstree.c
> index 0ef96a8..4f1a69d 100644
> --- a/fstree.c
> +++ b/fstree.c
> @@ -86,5 +86,5 @@ struct dt_info *dt_from_fs(const char *dirname)
>  	tree =3D read_fstree(dirname);
>  	tree =3D name_node(tree, "");
> =20
> -	return build_dt_info(NULL, tree, NULL, guess_boot_cpuid(tree));
> +	return build_dt_info(VF_DT_V1, NULL, tree, NULL, guess_boot_cpuid(tree)=
);
>  }
> diff --git a/livetree.c b/livetree.c
> index 9a44214..10a81eb 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -216,6 +216,31 @@ struct node *merge_nodes(struct node *old_node, stru=
ct node *new_node)
>  	return old_node;
>  }
> =20
> +void add_orphan_node(struct node *dt, struct node *new_node, char *ref)
> +{
> +	static unsigned int next_orphan_fragment =3D 0;
> +	struct node *node =3D xmalloc(sizeof(*node));
> +	struct property *p;
> +	struct data d =3D empty_data;
> +	char *name;
> +
> +	memset(node, 0, sizeof(*node));
> +
> +	d =3D data_add_marker(d, REF_PHANDLE, ref);
> +	d =3D data_append_integer(d, 0xffffffff, 32);
> +
> +	p =3D build_property("target", d);
> +	add_property(node, p);
> +
> +	xasprintf(&name, "fragment@%u",
> +			next_orphan_fragment++);
> +	name_node(node, name);
> +	name_node(new_node, "__overlay__");
> +
> +	add_child(dt, node);
> +	add_child(node, new_node);
> +}
> +
>  struct node *chain_node(struct node *first, struct node *list)
>  {
>  	assert(first->next_sibling =3D=3D NULL);
> @@ -318,9 +343,14 @@ void apply_overlay(struct node *base, struct overlay=
 *overlay)
>  {
>  	struct node *target =3D get_node_by_ref(base, overlay->target);
> =20
> -	if (!target)
> -		die("Couldn't find label or path %s for overlay\n",
> -		    overlay->target);
> +	if (!target) {
> +		if (base->dti->versionflags & VF_PLUGIN)
> +			add_orphan_node(base, overlay->dt, overlay->target);
> +		else
> +			die("Couldn't find label or path %s for overlay\n",
> +				overlay->target);
> +		return;
> +	}

Hrm.. so rather than making apply_overlay() handle both cases, I was
thinking instead that we have two different paths in main()

    - In the non overlay output case we call resolve_overlays() which
      applies the overlays immediately and fails if it can't
    - In the overlay output case, we call a different function which
      instead coverts each source overlay into a fragment@ node.

The second function would also construct the fixups node - AFAICT that
should always exist in a plugin, even if you don't have a __symbols__ node.

The other thing I have in mind to think about is that I'm looking into
having (some of) the checks run on each overlay individually as well
as on the final combined tree.  That shouldn't directly impact what
you're doing, but might inform some details.

> =20
>  	if (!overlay->dt)
>  		/* Deletion */
> @@ -329,6 +359,24 @@ void apply_overlay(struct node *base, struct overlay=
 *overlay)
>  		merge_nodes(target, overlay->dt);
>  }
> =20
> +struct property *append_to_property(struct node *node,
> +				    char *name, const void *data, int len)

AFAICT none of your callers use the return value.

> +{
> +	struct data d;
> +	struct property *p;
> +
> +	p =3D get_property(node, name);
> +	if (p) {
> +		d =3D data_append_data(p->val, data, len);
> +		p->val =3D d;
> +	} else {
> +		d =3D data_append_data(empty_data, data, len);
> +		p =3D build_property(name, d);
> +		add_property(node, p);
> +	}
> +	return p;
> +}
> +
>  struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
>  {
>  	struct reserve_info *new =3D xmalloc(sizeof(*new));
> @@ -368,7 +416,8 @@ struct reserve_info *add_reserve_entry(struct reserve=
_info *list,
>  	return list;
>  }
> =20
> -struct dt_info *build_dt_info(struct reserve_info *reservelist,
> +struct dt_info *build_dt_info(unsigned int versionflags,
> +			      struct reserve_info *reservelist,
>  			      struct node *basetree,
>  			      struct overlay *overlays,
>  			      uint32_t boot_cpuid_phys)
> @@ -376,10 +425,12 @@ struct dt_info *build_dt_info(struct reserve_info *=
reservelist,
>  	struct dt_info *dti;
> =20
>  	dti =3D xmalloc(sizeof(*dti));
> +	dti->versionflags =3D versionflags;
>  	dti->reservelist =3D reservelist;
>  	dti->boot_cpuid_phys =3D boot_cpuid_phys;
>  	dti->dt =3D basetree;
>  	dti->overlays =3D overlays;
> +	basetree->dti =3D dti;
> =20
>  	return dti;
>  }
> @@ -745,3 +796,163 @@ void sort_tree(struct dt_info *dti)
>  	sort_reserve_entries(dti);
>  	sort_node(dti->dt);
>  }
> +
> +/* utility helper to avoid code duplication */
> +static struct node *build_and_name_child_node(struct node *parent, char =
*name)
> +{
> +	struct node *node;
> +
> +	node =3D build_node(NULL, NULL);
> +	name_node(node, xstrdup(name));
> +	add_child(parent, node);
> +
> +	return node;
> +}
> +
> +static void generate_label_tree_internal(struct node *dt, struct node *n=
ode,
> +					 struct node *an, bool allocph)
> +{
> +	struct node *c;
> +	struct property *p;
> +	struct label *l;
> +
> +	/* if if there are labels */
> +	if (node->labels) {
> +		/* now add the label in the node */
> +		for_each_label(node->labels, l) {
> +			/* check whether the label already exists */
> +			p =3D get_property(an, l->label);
> +			if (p) {
> +				fprintf(stderr, "WARNING: label %s already"
> +					" exists in /%s", l->label,
> +					an->name);
> +				continue;
> +			}
> +
> +			/* insert it */
> +			p =3D build_property(l->label,
> +				data_copy_escape_string(node->fullpath,
> +						strlen(node->fullpath)));
> +			add_property(an, p);
> +		}
> +
> +		/* force allocation of a phandle for this node */
> +		if (allocph)
> +			(void)get_node_phandle(dt, node);
> +	}
> +
> +	for_each_child(node, c)
> +		generate_label_tree_internal(dt, c, an, allocph);
> +}
> +
> +void generate_label_tree(struct node *dt, char *gen_node_name, bool allo=
cph)
> +{
> +	struct node *an;
> +
> +	an =3D build_and_name_child_node(dt, gen_node_name);
> +	if (!an)
> +		die("Could not build label node /%s\n", gen_node_name);
> +
> +	generate_label_tree_internal(dt, dt, an, allocph);
> +}
> +
> +static char *fixups_name =3D "__fixups__";
> +static char *local_fixups_name =3D "__local_fixups__";
> +
> +static void add_fixup_entry(struct node *dt, struct node *node,
> +		struct property *prop, struct marker *m)
> +{
> +	struct node *fn;	/* fixup node */
> +	char *entry;
> +
> +	/* m->ref can only be a REF_PHANDLE, but check anyway */
> +	assert(m->type =3D=3D REF_PHANDLE);
> +
> +	/* fn is the node we're putting entries in */
> +	fn =3D get_subnode(dt, fixups_name);
> +	assert(fn !=3D NULL);
> +
> +	/* there shouldn't be any ':' in the arguments */
> +	if (strchr(node->fullpath, ':') || strchr(prop->name, ':'))
> +		die("arguments should not contain ':'\n");
> +
> +	xasprintf(&entry, "%s:%s:%u",
> +			node->fullpath, prop->name, m->offset);
> +	append_to_property(fn, m->ref, entry, strlen(entry) + 1);
> +}
> +
> +static void add_local_fixup_entry(struct node *dt, struct node *node,
> +		struct property *prop, struct marker *m,
> +		struct node *refnode)
> +{
> +	struct node *lfn, *wn, *nwn;	/* local fixup node, walk node, new */
> +	uint32_t value_32;
> +	char *s, *e, *comp;
> +	int len;
> +
> +	/* fn is the node we're putting entries in */
> +	lfn =3D get_subnode(dt, local_fixups_name);
> +	assert(lfn !=3D NULL);
> +
> +	/* walk the path components creating nodes if they don't exist */
> +	comp =3D xmalloc(strlen(node->fullpath) + 1);
> +	/* start skipping the first / */
> +	s =3D node->fullpath + 1;
> +	wn =3D lfn;
> +	while (*s) {
> +		/* retrieve path component */
> +		e =3D strchr(s, '/');
> +		if (e =3D=3D NULL)
> +			e =3D s + strlen(s);
> +		len =3D e - s;
> +		memcpy(comp, s, len);
> +		comp[len] =3D '\0';
> +
> +		/* if no node exists, create it */
> +		nwn =3D get_subnode(wn, comp);
> +		if (!nwn)
> +			nwn =3D build_and_name_child_node(wn, comp);
> +		wn =3D nwn;
> +
> +		/* last path component */
> +		if (!*e)
> +			break;
> +
> +		/* next path component */
> +		s =3D e + 1;
> +	}
> +	free(comp);
> +
> +	value_32 =3D cpu_to_fdt32(m->offset);
> +	append_to_property(wn, prop->name, &value_32, sizeof(value_32));
> +}
> +
> +static void generate_fixups_tree_internal(struct node *dt, struct node *=
node)
> +{
> +	struct node *c;
> +	struct property *prop;
> +	struct marker *m;
> +	struct node *refnode;
> +
> +	for_each_property(node, prop) {
> +		m =3D prop->val.markers;
> +		for_each_marker_of_type(m, REF_PHANDLE) {
> +			refnode =3D get_node_by_ref(dt, m->ref);
> +			if (!refnode)
> +				add_fixup_entry(dt, node, prop, m);
> +			else
> +				add_local_fixup_entry(dt, node, prop, m,
> +						refnode);
> +		}
> +	}
> +
> +	for_each_child(node, c)
> +		generate_fixups_tree_internal(dt, c);
> +}
> +
> +void generate_fixups_tree(struct node *dt)
> +{
> +	build_and_name_child_node(dt, fixups_name);
> +	build_and_name_child_node(dt, local_fixups_name);
> +	generate_fixups_tree_internal(dt, dt);
> +}
> diff --git a/treesource.c b/treesource.c
> index c9d8967..0c84f02 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -27,6 +27,7 @@ extern YYLTYPE yylloc;
> =20
>  struct dt_info *parser_output;
>  bool treesource_error;
> +unsigned int the_versionflags;
> =20
>  struct dt_info *dt_from_source(const char *fname)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RnxXMyWEPIZsopkG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXWPZgAAoJEGw4ysog2bOS+WgP/j6B6dPnmIzi1SNBDamWyi2H
4yMYtpxsNWkl4XtNvmkYN5FUe9mes5W8yzp1xxl7WfgLvhUmoPLcF/0FyWmKAUmM
524bgs5j6ISsiSbm3y3ubfd30cbDas721uQhnSL5z73kI+bTMra2YZeuYlC6NZK/
ZQfzoAlBSDAJMRxfIjlBUHc0047Ys+aRGWvXeS3/5UdQlpF6lwNFcDPTfPNi2vjk
W6lN32Jn139Idg0dpU7RNYhJM6RfSruj6o82qwdjvcdllsEYEERQ80CzPPteJZ1b
FQNRrq7QhZponsgB5eXqFpfhifQFKITdDJkMR/Dzhp35kv43YmlUvzZ7CcNOSeqw
eK2vz3zB+mMRuXdOb39PFvyq9ozr1xEL03liFhm1I8qz5824d6lxw8iZVSGIodLM
FkIvPxUUAvp9HwHL7yQdvcbjviPkk5splB3NavhVVUtkvGJ0+QW9yNc/KpTtZsDp
GFrrAnq2QohfbnLwIZ4qax0+bjzXH1QOSPQg9WCQTtxAk7w/oKBx30ysMSFDV3nN
CcqZ92riyqtzu/57fW8bnJRN3jRiiYhCamL+6+vDyA46rCIEhfttcjAK4SgOBKai
NZISv3WTWJ+svRid5gXlM5hvsiIUqfLepa2TPlvTNrALGLsOAj5qklzkLpwSUC62
Hz8CYrT5lBMtJYYM5sSX
=4/+Z
-----END PGP SIGNATURE-----

--RnxXMyWEPIZsopkG--
