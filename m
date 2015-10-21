From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 1/2] dtc: Plugin and fixup support
Date: Wed, 21 Oct 2015 13:29:03 +1100
Message-ID: <20151021022903.GB15881@voom.fritz.box>
References: <1440614674-7055-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1440614674-7055-2-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440614674-7055-2-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 09:44:33PM +0300, Pantelis Antoniou wrote:
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
> panto: The original alternative syntax patch required the use of an empty=
 node
> which is no longer required.
> Numbering of fragments in sequence was also implemented.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Sorry it's taken me so very long to look at this.  I've been a bit
swamped by critical bugs in my day job.

As I've said before (and say several times below), I don't much like
the fixups/symbols format, but it's in use so I guess we're stuck with
it.

So, the concept and behaviour of this patch seems mostly fine to me.
I've made a number of comments below.  Some are just trivial nits, but
a few are important implementation problems that could lead to nasty
behaviour in edge cases.

> ---
>  Documentation/manual.txt |  16 ++++
>  checks.c                 |  18 ++++-
>  dtc-lexer.l              |   5 ++
>  dtc-parser.y             |  54 +++++++++++--
>  dtc.c                    |  21 ++++-
>  dtc.h                    |  13 ++-
>  livetree.c               | 202 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  treesource.c             |   3 +
>  8 files changed, 321 insertions(+), 11 deletions(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 398de32..29682df 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -119,6 +119,20 @@ Options:
>  	Make space for <number> reserve map entries
>  	Relevant for dtb and asm output only.
> =20
> +    -@
> +        Generates a __symbols__ node at the root node of the resulting b=
lob

Nit: indentation error here.

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
> @@ -153,6 +167,8 @@ Here is a very rough overview of the layout of a DTS =
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
> index 0c03ac9..65bf6fd 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -466,8 +466,12 @@ static void fixup_phandle_references(struct check *c=
, struct node *dt,
> =20
>  		refnode =3D get_node_by_ref(dt, m->ref);
>  		if (! refnode) {
> -			FAIL(c, "Reference to non-existent node or label \"%s\"\n",
> -			     m->ref);
> +			if (!source_is_plugin)
> +				FAIL(c, "Reference to non-existent node or "
> +						"label \"%s\"\n", m->ref);
> +			else /* mark the entry as unresolved */
> +				*((cell_t *)(prop->val.val + m->offset)) =3D
> +					cpu_to_fdt32(0xffffffff);
>  			continue;
>  		}
> =20
> @@ -652,6 +656,15 @@ static void check_obsolete_chosen_interrupt_controll=
er(struct check *c,
>  }
>  TREE_WARNING(obsolete_chosen_interrupt_controller, NULL);
> =20
> +static void check_deprecated_plugin_syntax(struct check *c,
> +					   struct node *dt)
> +{
> +	if (deprecated_plugin_syntax_warning)
> +		FAIL(c, "Use '/dts-v1/ /plugin/'; syntax. /dts-v1/; /plugin/; "
> +				"is going to be removed in next versions");

Better to put this warning directly where the bad syntax is detected
in the parser (using ERROR), transferring it to here with the global
is pretty ugly.

The checks infrastructure isn't meant to handle all possible error
conditions - just those that are related to the tree's semantic
content, rather than pars

Plus.. the old syntax was never committed upstream, so I'm inclined to
just drop it now, making this irrelevant.

> +}
> +TREE_WARNING(deprecated_plugin_syntax, NULL);
> +
>  static struct check *check_table[] =3D {
>  	&duplicate_node_names, &duplicate_property_names,
>  	&node_name_chars, &node_name_format, &property_name_chars,
> @@ -669,6 +682,7 @@ static struct check *check_table[] =3D {
> =20
>  	&avoid_default_addr_size,
>  	&obsolete_chosen_interrupt_controller,
> +	&deprecated_plugin_syntax,
> =20
>  	&always_fail,
>  };
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
> +		}
> +
>  <*>"/memreserve/"	{
>  			DPRINT("Keyword: /memreserve/\n");
>  			BEGIN_DEFAULT();
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 5a897e3..accccba 100644
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
> @@ -101,10 +105,39 @@ extern bool treesource_error;
>  %%
> =20
>  sourcefile:
> -	  DT_V1 ';' memreserves devicetree
> +	    basesource
> +	  | pluginsource
> +	  ;
> +
> +basesource:
> +	  DT_V1 ';' plugindecl memreserves devicetree
> +		{
> +			source_is_plugin =3D $3;
> +			if (source_is_plugin)
> +				deprecated_plugin_syntax_warning =3D true;
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
> +		}
> +	;
> +
> +pluginsource:
> +	DT_V1 DT_PLUGIN ';' memreserves devicetree
>  		{
> -			the_boot_info =3D build_boot_info($3, $4,
> -							guess_boot_cpuid($4));
> +			source_is_plugin =3D true;
> +			deprecated_plugin_syntax_warning =3D false;
> +			the_boot_info =3D build_boot_info($4, $5,
> +							guess_boot_cpuid($5));
>  		}

I think the above will be clearer if you make a new non-terminal, say
'versioninfo', that incorporates the DT_V1 and (optionally) the
/plugin/ tag.  We can extend that with other global flags if we ever
need them.

>  	;
> =20
> @@ -156,10 +189,14 @@ devicetree:
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
> @@ -174,6 +211,11 @@ devicetree:
> =20
>  			$$ =3D $1;
>  		}
> +	| /* empty */
> +		{
> +			/* build empty node */
> +			$$ =3D name_node(build_node(NULL, NULL), "");
> +		}
>  	;

What's the importance of this new rule?  It's connection to plugins
isn't obvious to me.

> =20
>  nodedef:
> diff --git a/dtc.c b/dtc.c
> index 5fa23c4..ee37be9 100644
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
> @@ -53,7 +55,7 @@ static void fill_fullpaths(struct node *tree, const cha=
r *prefix)
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
> @@ -71,6 +73,8 @@ static struct option const usage_long_opts[] =3D {
>  	{"phandle",           a_argument, NULL, 'H'},
>  	{"warning",           a_argument, NULL, 'W'},
>  	{"error",             a_argument, NULL, 'E'},
> +	{"symbols",	     no_argument, NULL, '@'},
> +	{"auto-alias",       no_argument, NULL, 'A'},
>  	{"help",             no_argument, NULL, 'h'},
>  	{"version",          no_argument, NULL, 'v'},
>  	{NULL,               no_argument, NULL, 0x0},
> @@ -101,6 +105,8 @@ static const char * const usage_opts_help[] =3D {
>  	 "\t\tboth   - Both \"linux,phandle\" and \"phandle\" properties",
>  	"\n\tEnable/disable warnings (prefix with \"no-\")",
>  	"\n\tEnable/disable errors (prefix with \"no-\")",
> +	"\n\tEnable symbols/fixup support",
> +	"\n\tEnable auto-alias of labels",
>  	"\n\tPrint this help and exit",
>  	"\n\tPrint version and exit",
>  	NULL,
> @@ -233,7 +239,12 @@ int main(int argc, char *argv[])
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
> @@ -294,6 +305,12 @@ int main(int argc, char *argv[])
>  	if (sort)
>  		sort_tree(bi);
> =20
> +	if (symbol_fixup_support || auto_label_aliases)
> +		generate_label_node(bi->dt, bi->dt);
> +
> +	if (symbol_fixup_support)
> +		generate_fixups_node(bi->dt, bi->dt);
> +
>  	if (streq(outname, "-")) {
>  		outf =3D stdout;
>  	} else {
> diff --git a/dtc.h b/dtc.h
> index 56212c8..d025111 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -20,7 +20,7 @@
>   *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
>   *                                                                   USA
>   */
> -
> +#define _GNU_SOURCE

Ugh.. I'm at least trying to keep dtc compilable on FreeBSD, so I'd
prefer to avoid using GNU extensions.  What's the feature you needed
this for?

>  #include <stdio.h>
>  #include <string.h>
>  #include <stdlib.h>
> @@ -54,6 +54,14 @@ extern int reservenum;		/* Number of memory reservatio=
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
> +extern bool source_is_plugin;

I think it makes sense to put this flag into the_boot_info, rather
than adding a new global.

> +extern bool deprecated_plugin_syntax_warning;

And as noted above, I don't think you need this one at all.

>  #define PHANDLE_LEGACY	0x1
>  #define PHANDLE_EPAPR	0x2
> @@ -194,6 +202,7 @@ struct node *build_node_delete(void);
>  struct node *name_node(struct node *node, char *name);
>  struct node *chain_node(struct node *first, struct node *list);
>  struct node *merge_nodes(struct node *old_node, struct node *new_node);
> +void add_orphan_node(struct node *old_node, struct node *new_node, char =
*ref);
> =20
>  void add_property(struct node *node, struct property *prop);
>  void delete_property_by_name(struct node *node, char *name);
> @@ -244,6 +253,8 @@ struct boot_info {
>  struct boot_info *build_boot_info(struct reserve_info *reservelist,
>  				  struct node *tree, uint32_t boot_cpuid_phys);
>  void sort_tree(struct boot_info *bi);
> +void generate_label_node(struct node *node, struct node *dt);
> +void generate_fixups_node(struct node *node, struct node *dt);
> =20
>  /* Checks */
> =20
> diff --git a/livetree.c b/livetree.c
> index e229b84..1ef9fc4 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -216,6 +216,34 @@ struct node *merge_nodes(struct node *old_node, stru=
ct node *new_node)
>  	return old_node;
>  }
> =20
> +void add_orphan_node(struct node *dt, struct node *new_node, char *ref)
> +{
> +	static unsigned int next_orphan_fragment =3D 0;
> +	struct node *ovl =3D xmalloc(sizeof(*ovl));
> +	struct property *p;
> +	struct data d =3D empty_data;
> +	char *name;
> +	int ret;
> +
> +	memset(ovl, 0, sizeof(*ovl));
> +
> +	d =3D data_add_marker(d, REF_PHANDLE, ref);
> +	d =3D data_append_integer(d, 0xffffffff, 32);
> +	p =3D build_property("target", d);
> +	add_property(ovl, p);

Hmm, using a phandle (which has to be later mangled) rather than a
string ref directly in the target property seems an unnecessarily
difficult way of doing things, but I guess the format's in use so we
can't fix that now.

> +	ret =3D asprintf(&name, "fragment@%u",
> +			next_orphan_fragment++);
> +	if (ret =3D=3D -1)
> +		die("asprintf() failed\n");
> +	name_node(ovl, name);
> +	name_node(new_node, "__overlay__");

It's a bit confusing to me that it's the original node, not 'ovl'
which gets the name "__overlay__".  Maybe a different variable name.

This could produce some confusing results if a plugin source contains
a "base" tree construction.

> +	add_child(dt, ovl);
> +	add_child(ovl, new_node);
> +}
> +
>  struct node *chain_node(struct node *first, struct node *list)
>  {
>  	assert(first->next_sibling =3D=3D NULL);
> @@ -709,3 +737,177 @@ void sort_tree(struct boot_info *bi)
>  	sort_reserve_entries(bi);
>  	sort_node(bi->dt);
>  }
> +
> +void generate_label_node(struct node *node, struct node *dt)

I prefer to put "context" parameters before more specific parameters,
so I'd like to see dt then node.  Also, maybe call it 'tree', since
that seems to be the more common name in livetree.c.

> +{
> +	struct node *c, *an;
> +	struct property *p;
> +	struct label *l;
> +	int has_label;
> +	char *gen_node_name;
> +
> +	if (auto_label_aliases)
> +		gen_node_name =3D "aliases";
> +	else
> +		gen_node_name =3D "__symbols__";

Doing just one or the other here also seems dubious to me, as does
referencing the global here.  I'd prefer to see this as a parameter,
which the main function can pass in.  That way you can also better
handle the case of using both -A and -@ at the same time.

I also think it would be nice to construct the alias/symbols node just
once for the tree then pass the reference to the recursive call.


> +
> +	/* Make sure the label isn't already there */

Comment doesn't match the code, this just tests if the node has a
label at all.  For which 'if (node-labels)' would suffice.

> +	has_label =3D 0;
> +	for_each_label(node->labels, l) {
> +		has_label =3D 1;
> +		break;
> +	}
> +
> +	if (has_label) {
> +

Nit: extraneous blank line.

> +		/* an is the aliases/__symbols__ node */
> +		an =3D get_subnode(dt, gen_node_name);
> +		/* if no node exists, create it */
> +		if (!an) {
> +			an =3D build_node(NULL, NULL);
> +			name_node(an, gen_node_name);
> +			add_child(dt, an);
> +		}
> +
> +		/* now add the label in the node */
> +		for_each_label(node->labels, l) {
> +			/* check whether the label already exists */
> +			p =3D get_property(an, l->label);
> +			if (p) {
> +				fprintf(stderr, "WARNING: label %s already"
> +					" exists in /%s", l->label,
> +					gen_node_name);
> +				continue;
> +			}
> +
> +			/* insert it */
> +			p =3D build_property(l->label,
> +				data_copy_escape_string(node->fullpath,
> +						strlen(node->fullpath)));

fullpath should not contain escape characters, and if it does you
shouldn't be unescaping them, so data_copy_escape_string() is the
wrong tool for this job.

> +			add_property(an, p);
> +		}
> +
> +		/* force allocation of a phandle for this node */
> +		if (symbol_fixup_support)
> +			(void)get_node_phandle(dt, node);

Again, I'd prefer to see a parameter rather than referencing the global.

> +	}
> +
> +	for_each_child(node, c)
> +		generate_label_node(c, dt);
> +}
> +
> +static void add_fixup_entry(struct node *dt, struct node *node,
> +		struct property *prop, struct marker *m)
> +{
> +	struct node *fn;	/* local fixup node */
> +	struct property *p;
> +	char *fixups_name =3D "__fixups__";
> +	struct data d;
> +	char *entry;
> +	int ret;
> +
> +	/* fn is the node we're putting entries in */
> +	fn =3D get_subnode(dt, fixups_name);
> +	/* if no node exists, create it */
> +	if (!fn) {
> +		fn =3D build_node(NULL, NULL);
> +		name_node(fn, fixups_name);
> +		add_child(dt, fn);
> +	}

Again, I'd prefer to see construction and location of the fixups node
factored out.

> +
> +	ret =3D asprintf(&entry, "%s:%s:%u",
> +			node->fullpath, prop->name, m->offset);

I hate this encoding of things into a string that will have to be
parsed, rather than using the existing mechanisms we have for
structure in the tree.  But, again, the format is in use so I guess
we're stuck with it.

I would at least like to see this throw an error if the path or the
property name include ':' characters that will mess this up.


> +	if (ret =3D=3D -1)
> +		die("asprintf() failed\n");

Hrm.  We should put an xasprintf function in util.  That also lets us
supply our own implementation when necessary and avoid relying on the
gnu extension.

> +
> +	p =3D get_property(fn, m->ref);

This doesn't handle the case where m->ref is a path rather than a
label.  It will lead to creating a property with '/' in the name
below, which you really don't want.

> +	d =3D data_append_data(p ? p->val : empty_data, entry, strlen(entry) + =
1);
> +	if (!p)
> +		add_property(fn, build_property(m->ref, d));
> +	else
> +		p->val =3D d;

I think this would be clearer with just a single if, rather than an if
and the parallel conditional expression.

> +}
> +
> +static void add_local_fixup_entry(struct node *dt, struct node *node,
> +		struct property *prop, struct marker *m,
> +		struct node *refnode)
> +{
> +	struct node *lfn, *wn, *nwn;	/* local fixup node, walk node, new */
> +	struct property *p;
> +	struct data d;
> +	char *local_fixups_name =3D "__local_fixups__";
> +	char *s, *e, *comp;
> +	int len;
> +
> +	/* fn is the node we're putting entries in */
> +	lfn =3D get_subnode(dt, local_fixups_name);
> +	/* if no node exists, create it */
> +	if (!lfn) {
> +		lfn =3D build_node(NULL, NULL);
> +		name_node(lfn, local_fixups_name);
> +		add_child(dt, lfn);
> +	}

Again, please factor the node creation.

> +
> +	/* walk the path components creating nodes if they don't exist */

Might be worth making a helper function for this operation.  As it is,
it somewhat obscures the fixup logic that this function is actually
about.

It also seems absurd to me that the local fixups take such a
completely different format from the non-local fixups.  But, yet
again, stuck with it.

> +	comp =3D NULL;
> +	/* start skipping the first / */
> +	s =3D node->fullpath + 1;
> +	wn =3D lfn;
> +	while (*s) {
> +		/* retrieve path component */
> +		e =3D strchr(s, '/');
> +		if (e =3D=3D NULL)
> +			e =3D s + strlen(s);
> +		len =3D e - s;
> +		comp =3D xrealloc(comp, len + 1);

You can just allocate comp with strlen(fullpath) bytes in the first
place, rather than realloc()ing on every iteration.

> +		memcpy(comp, s, len);
> +		comp[len] =3D '\0';
> +
> +		/* if no node exists, create it */
> +		nwn =3D get_subnode(wn, comp);
> +		if (!nwn) {
> +			nwn =3D build_node(NULL, NULL);
> +			name_node(nwn, strdup(comp));
> +			add_child(wn, nwn);

This build/name/add tuple appears in a bunch of places in your code,
might be worth a helper function for that too.

> +		}
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
> +	p =3D get_property(wn, prop->name);
> +	d =3D data_append_cell(p ? p->val : empty_data, (cell_t)m->offset);
> +	if (!p)
> +		add_property(wn, build_property(prop->name, d));
> +	else
> +		p->val =3D d;
> +}
> +
> +void generate_fixups_node(struct node *node, struct node *dt)
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

Do you need to consider REF_PATH fixups?

> +		}
> +	}
> +
> +	for_each_child(node, c)
> +		generate_fixups_node(c, dt);
> +}
> diff --git a/treesource.c b/treesource.c
> index a55d1d1..e1d6657 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -28,6 +28,9 @@ extern YYLTYPE yylloc;
>  struct boot_info *the_boot_info;
>  bool treesource_error;
> =20
> +bool source_is_plugin;
> +bool deprecated_plugin_syntax_warning;
> +
>  struct boot_info *dt_from_source(const char *fname)
>  {
>  	the_boot_info =3D NULL;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWJvhvAAoJEGw4ysog2bOS4CcP/ikDWUZcS2+fQLhl+sL95Pg4
uUbwGAl6MiWnKUBIkLVCrKSczVR3Qb0loi/G4JHqB5NSNZwWPnqBUyZ6WgdY5V1o
cgA0334amiKiDfcuzOxztQPmX0WbqtzXP1/uDLbeqMNOTIVcwCxgW7OKcHJW88H4
ZO+61TcMuNfMCfCSJKnjtmeZeM5bAXPoRLoDDpwrGMi98tjwLD6BThBggWDVuhp7
JqIhpUvgztjitn7TPPBgF5I7TvYzzYZvwtcBhw/eUeDw2uxthwoVnT28K3PuaKrI
Vte5uRHWDLnFwtzkICXOV7dFB4ecnKTw2YMr0csSvz/JfvppKcH6m9K5/lIv38Rr
r9bNB3S1x6VpzaydP+yoUuxh1Ii4XbQI6LPwilfdtvWGUJUaHpQRqM8ycfjOaBNc
lPD4rJ5pc0ELIdbOlx9R3mdqsL05L74aVAxpTY8YQ3EfgZU22IRqv8AT0ZciTBdj
rLuM1FwL4wGPriy/rY3hjDbepIXDb5ut1xGEnqV6CEQNQy3wLoPYXv7pgPy1ggWn
iMAHDnZkmZX1RGVKOI7wPeQND1gI5+G3AZNd8J9GgPjFlEovQna4wItJDyeE9q6Z
SI2mcVSUzSdtmWgzNBpC224cjriG04tC3jEnkxYI0f5g6koyDYz2Wj1PQF/XWYdA
0W4WH1gonvKyUFjJR1wM
=zgqY
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
