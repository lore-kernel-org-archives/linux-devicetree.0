From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 2/4] dtc: Plugin and fixup support
Date: Tue, 24 May 2016 17:04:18 +0300
Message-ID: <33D5A973-4123-4B51-84D0-D0A5A70DA1A2@konsulko.com>
References: <1462477724-8092-1-git-send-email-pantelis.antoniou@konsulko.com> <1462477724-8092-3-git-send-email-pantelis.antoniou@konsulko.com> <20160524103907.GB17226@voom.fritz.box>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160524103907.GB17226-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

> On May 24, 2016, at 13:39 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org=
> wrote:
>=20
> On Thu, May 05, 2016 at 10:48:42PM +0300, Pantelis Antoniou wrote:
>> This patch enable the generation of symbols & local fixup informatio=
n
>> for trees compiled with the -@ (--symbols) option.
>>=20
>> Using this patch labels in the tree and their users emit information
>> in __symbols__ and __local_fixups__ nodes.
>>=20
>> The __fixups__ node make possible the dynamic resolution of phandle
>> references which are present in the plugin tree but lie in the
>> tree that are applying the overlay against.
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> ---
>> Documentation/manual.txt |  16 ++++
>> checks.c                 |   8 +-
>> dtc-lexer.l              |   5 ++
>> dtc-parser.y             |  42 +++++++--
>> dtc.c                    |  23 ++++-
>> dtc.h                    |  28 +++++-
>> flattree.c               |   2 +-
>> fstree.c                 |   2 +-
>> livetree.c               | 217 +++++++++++++++++++++++++++++++++++++=
+++++++++-
>> 9 files changed, 329 insertions(+), 14 deletions(-)
>>=20
>> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
>> index 398de32..3e16c24 100644
>> --- a/Documentation/manual.txt
>> +++ b/Documentation/manual.txt
>> @@ -119,6 +119,20 @@ Options:
>> 	Make space for <number> reserve map entries
>> 	Relevant for dtb and asm output only.
>>=20
>> +    -@
>> +	Generates a __symbols__ node at the root node of the resulting blo=
b
>> +	for any node labels used, and for any local references using phand=
les
>> +	it also generates a __local_fixups__ node that tracks them.
>> +
>> +	When using the /plugin/ tag all unresolved label references to
>> +	be tracked in the __fixups__ node, making dynamic resolution possi=
ble.
>> +
>> +    -A
>> +	Generate automatically aliases for all node labels. This is simila=
r to
>> +	the -@ option (the __symbols__ node contain identical information)=
 but
>> +	the semantics are slightly different since no phandles are automat=
ically
>> +	generated for labeled nodes.
>> +
>>     -S <bytes>
>> 	Ensure the blob at least <bytes> long, adding additional
>> 	space if needed.
>> @@ -153,6 +167,8 @@ Here is a very rough overview of the layout of a=
 DTS source file:
>>=20
>>     devicetree:   '/' nodedef
>>=20
>> +    plugindecl:   '/' 'plugin' '/' ';'
>=20
> You added the new non-terminal definitiom, but didn't use it anywhere=
=2E
>=20

plugindecl is used by the referenced in versioninfo so it=E2=80=99s use=
d implicitly.

>>     nodedef:      '{' list_of_property list_of_subnode '}' ';'
>>=20
>>     property:     label PROPNAME '=3D' propdata ';'
>> diff --git a/checks.c b/checks.c
>> index 386f956..3d4c3c6 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -490,8 +490,12 @@ static void fixup_phandle_references(struct che=
ck *c, struct node *dt,
>>=20
>> 		refnode =3D get_node_by_ref(dt, m->ref);
>> 		if (! refnode) {
>> -			FAIL(c, "Reference to non-existent node or label \"%s\"\n",
>> -			     m->ref);
>> +			if (!(tree_get_versionflags(dt) & VF_PLUGIN))
>> +				FAIL(c, "Reference to non-existent node or "
>> +						"label \"%s\"\n", m->ref);
>> +			else /* mark the entry as unresolved */
>> +				*((cell_t *)(prop->val.val + m->offset)) =3D
>> +					cpu_to_fdt32(0xffffffff);
>> 			continue;
>> 		}
>>=20
>> diff --git a/dtc-lexer.l b/dtc-lexer.l
>> index 790fbf6..40bbc87 100644
>> --- a/dtc-lexer.l
>> +++ b/dtc-lexer.l
>> @@ -121,6 +121,11 @@ static void lexical_error(const char *fmt, ...)=
;
>> 			return DT_V1;
>> 		}
>>=20
>> +<*>"/plugin/"	{
>> +			DPRINT("Keyword: /plugin/\n");
>> +			return DT_PLUGIN;
>> +		}
>> +
>> <*>"/memreserve/"	{
>> 			DPRINT("Keyword: /memreserve/\n");
>> 			BEGIN_DEFAULT();
>> diff --git a/dtc-parser.y b/dtc-parser.y
>> index 000873f..2d3399e 100644
>> --- a/dtc-parser.y
>> +++ b/dtc-parser.y
>> @@ -19,6 +19,7 @@
>>  */
>> %{
>> #include <stdio.h>
>> +#include <inttypes.h>
>>=20
>> #include "dtc.h"
>> #include "srcpos.h"
>> @@ -52,9 +53,11 @@ extern bool treesource_error;
>> 	struct node *nodelist;
>> 	struct reserve_info *re;
>> 	uint64_t integer;
>> +	unsigned int flags;
>> }
>>=20
>> %token DT_V1
>> +%token DT_PLUGIN
>> %token DT_MEMRESERVE
>> %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
>> %token DT_BITS
>> @@ -71,6 +74,8 @@ extern bool treesource_error;
>>=20
>> %type <data> propdata
>> %type <data> propdataprefix
>> +%type <flags> versioninfo
>> +%type <flags> plugindecl
>> %type <re> memreserve
>> %type <re> memreserves
>> %type <array> arrayprefix
>> @@ -101,13 +106,31 @@ extern bool treesource_error;
>> %%
>>=20
>> sourcefile:
>> -	  DT_V1 ';' memreserves devicetree
>> +	  versioninfo ';' memreserves devicetree
>> 		{
>> -			the_boot_info =3D build_boot_info($3, $4,
>> +			the_boot_info =3D build_boot_info($1, $3, $4,
>> 							guess_boot_cpuid($4));
>> 		}
>> 	;
>>=20
>> +versioninfo:
>> +	DT_V1 plugindecl
>> +		{
>> +			$$ =3D VF_DT_V1 | $2;
>> +		}
>> +	;
>> +
>> +plugindecl:
>> +	DT_PLUGIN
>> +		{
>> +			$$ =3D VF_PLUGIN;
>> +		}
>> +	| /* empty */
>> +		{
>> +			$$ =3D 0;
>> +		}
>> +	;
>> +
>> memreserves:
>> 	  /* empty */
>> 		{
>> @@ -156,10 +179,14 @@ devicetree:
>> 		{
>> 			struct node *target =3D get_node_by_ref($1, $2);
>>=20
>> -			if (target)
>> +			if (target) {
>> 				merge_nodes(target, $3);
>> -			else
>> -				ERROR(&@2, "Label or path %s not found", $2);
>> +			} else {
>> +				if (symbol_fixup_support)
>=20
> Surely this should depend on the /plugin/ tag, rather than the -@ opt=
ion..?
>=20

the_boot_info is not yet initialized at this point. The only way to acc=
ess it would
be to have version flags as a global. Is that OK?


>> +					add_orphan_node($1, $3, $2);
>> +				else
>> +					ERROR(&@2, "Label or path %s not found", $2);
>> +			}
>> 			$$ =3D $1;
>> 		}
>> 	| devicetree DT_DEL_NODE DT_REF ';'
>> @@ -174,6 +201,11 @@ devicetree:
>>=20
>> 			$$ =3D $1;
>> 		}
>> +	| /* empty */
>> +		{
>> +			/* build empty node */
>> +			$$ =3D name_node(build_node(NULL, NULL), "");
>> +		}
>> 	;
>>=20
>> nodedef:
>> diff --git a/dtc.c b/dtc.c
>> index 5fa23c4..f8277fb 100644
>> --- a/dtc.c
>> +++ b/dtc.c
>> @@ -31,6 +31,8 @@ int reservenum;		/* Number of memory reservation s=
lots */
>> int minsize;		/* Minimum blob size */
>> int padsize;		/* Additional padding to blob */
>> int phandle_format =3D PHANDLE_BOTH;	/* Use linux,phandle or phandle=
 properties */
>> +int symbol_fixup_support;
>> +int auto_label_aliases;
>>=20
>> static void fill_fullpaths(struct node *tree, const char *prefix)
>> {
>> @@ -53,7 +55,7 @@ static void fill_fullpaths(struct node *tree, cons=
t char *prefix)
>> #define FDT_VERSION(version)	_FDT_VERSION(version)
>> #define _FDT_VERSION(version)	#version
>> static const char usage_synopsis[] =3D "dtc [options] <input file>";
>> -static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:fb:i:H:s=
W:E:hv";
>> +static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:fb:i:H:s=
W:E:@Ahv";
>> static struct option const usage_long_opts[] =3D {
>> 	{"quiet",            no_argument, NULL, 'q'},
>> 	{"in-format",         a_argument, NULL, 'I'},
>> @@ -71,6 +73,8 @@ static struct option const usage_long_opts[] =3D {
>> 	{"phandle",           a_argument, NULL, 'H'},
>> 	{"warning",           a_argument, NULL, 'W'},
>> 	{"error",             a_argument, NULL, 'E'},
>> +	{"symbols",	     no_argument, NULL, '@'},
>> +	{"auto-alias",       no_argument, NULL, 'A'},
>> 	{"help",             no_argument, NULL, 'h'},
>> 	{"version",          no_argument, NULL, 'v'},
>> 	{NULL,               no_argument, NULL, 0x0},
>> @@ -101,6 +105,8 @@ static const char * const usage_opts_help[] =3D =
{
>> 	 "\t\tboth   - Both \"linux,phandle\" and \"phandle\" properties",
>> 	"\n\tEnable/disable warnings (prefix with \"no-\")",
>> 	"\n\tEnable/disable errors (prefix with \"no-\")",
>> +	"\n\tEnable symbols/fixup support",
>> +	"\n\tEnable auto-alias of labels",
>> 	"\n\tPrint this help and exit",
>> 	"\n\tPrint version and exit",
>> 	NULL,
>> @@ -233,7 +239,12 @@ int main(int argc, char *argv[])
>> 		case 'E':
>> 			parse_checks_option(false, true, optarg);
>> 			break;
>> -
>> +		case '@':
>> +			symbol_fixup_support =3D 1;
>> +			break;
>> +		case 'A':
>> +			auto_label_aliases =3D 1;
>> +			break;
>> 		case 'h':
>> 			usage(NULL);
>> 		default:
>> @@ -294,6 +305,14 @@ int main(int argc, char *argv[])
>> 	if (sort)
>> 		sort_tree(bi);
>>=20
>> +	if (auto_label_aliases)
>> +		generate_label_tree(bi->dt, "aliases", false);
>> +
>> +	if (symbol_fixup_support) {
>> +		generate_label_tree(bi->dt, "__symbols__", true);
>> +		generate_fixups_tree(bi->dt);
>> +	}
>> +
>=20
> These should go before the sort_tree() - since they add nodes, they
> could result in something that *isn't* sorted when that was requested=
=2E
>=20

OK

>> 	if (streq(outname, "-")) {
>> 		outf =3D stdout;
>> 	} else {
>> diff --git a/dtc.h b/dtc.h
>> index 56212c8..68cb109 100644
>> --- a/dtc.h
>> +++ b/dtc.h
>> @@ -20,7 +20,6 @@
>>  *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-=
1307
>>  *                                                                  =
 USA
>>  */
>> -
>=20
> Unrelated whitespace change.
>=20

OK

>> #include <stdio.h>
>> #include <string.h>
>> #include <stdlib.h>
>> @@ -54,6 +53,12 @@ extern int reservenum;		/* Number of memory reser=
vation slots */
>> extern int minsize;		/* Minimum blob size */
>> extern int padsize;		/* Additional padding to blob */
>> extern int phandle_format;	/* Use linux,phandle or phandle propertie=
s */
>> +extern int symbol_fixup_support;/* enable symbols & fixup support *=
/
>> +extern int auto_label_aliases;	/* auto generate labels -> aliases *=
/
>> +
>> +/*
>> + * Tree source globals
>> + */
>>=20
>> #define PHANDLE_LEGACY	0x1
>> #define PHANDLE_EPAPR	0x2
>> @@ -158,6 +163,9 @@ struct node {
>> 	int addr_cells, size_cells;
>>=20
>> 	struct label *labels;
>> +
>> +	/* only for the root (parent =3D=3D NULL) */
>> +	struct boot_info *bi;
>=20
> Ugh.. I hate creating circular references unless we really can't avoi=
d
> them.
>=20

Either it=E2=80=99s here, or we pass boot_info to every method.
Need access to the version flags.

>> };
>>=20
>> #define for_each_label_withdel(l0, l) \
>> @@ -194,6 +202,7 @@ struct node *build_node_delete(void);
>> struct node *name_node(struct node *node, char *name);
>> struct node *chain_node(struct node *first, struct node *list);
>> struct node *merge_nodes(struct node *old_node, struct node *new_nod=
e);
>> +void add_orphan_node(struct node *old_node, struct node *new_node, =
char *ref);
>>=20
>> void add_property(struct node *node, struct property *prop);
>> void delete_property_by_name(struct node *node, char *name);
>> @@ -236,14 +245,29 @@ struct reserve_info *add_reserve_entry(struct =
reserve_info *list,
>>=20
>>=20
>> struct boot_info {
>> +	unsigned int versionflags;
>> 	struct reserve_info *reservelist;
>> 	struct node *dt;		/* the device tree */
>> 	uint32_t boot_cpuid_phys;
>> };
>>=20
>> -struct boot_info *build_boot_info(struct reserve_info *reservelist,
>> +/* version flags definitions */
>> +#define VF_DT_V1	0x0001	/* /dts-v1/ */
>=20
> Is there any point to this, since dtc doesn't support v0 dts files an=
y
> more anyway?
>=20

Completeness. I can take it out.

>> +#define VF_PLUGIN	0x0002	/* /plugin/ */
>> +
>> +static inline unsigned int tree_get_versionflags(struct node *dt)
>> +{
>> +	if (!dt || !dt->bi)
>> +		return 0;
>> +	return dt->bi->versionflags;
>> +}
>> +
>> +struct boot_info *build_boot_info(unsigned int versionflags,
>> +				  struct reserve_info *reservelist,
>> 				  struct node *tree, uint32_t boot_cpuid_phys);
>> void sort_tree(struct boot_info *bi);
>> +void generate_label_tree(struct node *dt, char *gen_node_name, bool=
 allocph);
>> +void generate_fixups_tree(struct node *dt);
>>=20
>> /* Checks */
>>=20
>> diff --git a/flattree.c b/flattree.c
>> index ec14954..5dde832 100644
>> --- a/flattree.c
>> +++ b/flattree.c
>> @@ -929,5 +929,5 @@ struct boot_info *dt_from_blob(const char *fname=
)
>>=20
>> 	fclose(f);
>>=20
>> -	return build_boot_info(reservelist, tree, boot_cpuid_phys);
>> +	return build_boot_info(VF_DT_V1, reservelist, tree, boot_cpuid_phy=
s);
>> }
>> diff --git a/fstree.c b/fstree.c
>> index 6d1beec..54f520b 100644
>> --- a/fstree.c
>> +++ b/fstree.c
>> @@ -86,6 +86,6 @@ struct boot_info *dt_from_fs(const char *dirname)
>> 	tree =3D read_fstree(dirname);
>> 	tree =3D name_node(tree, "");
>>=20
>> -	return build_boot_info(NULL, tree, guess_boot_cpuid(tree));
>> +	return build_boot_info(VF_DT_V1, NULL, tree, guess_boot_cpuid(tree=
));
>> }
>>=20
>> diff --git a/livetree.c b/livetree.c
>> index e229b84..e7d0fe5 100644
>> --- a/livetree.c
>> +++ b/livetree.c
>> @@ -18,6 +18,7 @@
>>  *                                                                  =
 USA
>>  */
>>=20
>> +#define _GNU_SOURCE
>=20
> Ugh.  I mean, I know the work I did to get dtc working on BSD has
> bitrotted already, but can we avoid gratuitously introducing
> non-portability.
>=20

It was your suggestion last time, remember? :)

>> #include "dtc.h"
>>=20
>> /*
>> @@ -216,6 +217,34 @@ struct node *merge_nodes(struct node *old_node,=
 struct node *new_node)
>> 	return old_node;
>> }
>>=20
>> +void add_orphan_node(struct node *dt, struct node *new_node, char *=
ref)
>> +{
>> +	static unsigned int next_orphan_fragment =3D 0;
>> +	struct node *node =3D xmalloc(sizeof(*node));
>> +	struct property *p;
>> +	struct data d =3D empty_data;
>> +	char *name;
>> +	int ret;
>> +
>> +	memset(node, 0, sizeof(*node));
>> +
>> +	d =3D data_add_marker(d, REF_PHANDLE, ref);
>> +	d =3D data_append_integer(d, 0xffffffff, 32);
>> +
>> +	p =3D build_property("target", d);
>> +	add_property(node, p);
>> +
>> +	ret =3D asprintf(&name, "fragment@%u",
>> +			next_orphan_fragment++);
>> +	if (ret =3D=3D -1)
>> +		die("asprintf() failed\n");
>> +	name_node(node, name);
>> +	name_node(new_node, "__overlay__");
>> +
>> +	add_child(dt, node);
>> +	add_child(node, new_node);
>> +}
>=20
>=20
>=20
>=20
>> struct node *chain_node(struct node *first, struct node *list)
>> {
>> 	assert(first->next_sibling =3D=3D NULL);
>> @@ -335,15 +364,19 @@ struct reserve_info *add_reserve_entry(struct =
reserve_info *list,
>> 	return list;
>> }
>>=20
>> -struct boot_info *build_boot_info(struct reserve_info *reservelist,
>> +struct boot_info *build_boot_info(unsigned int versionflags,
>> +				  struct reserve_info *reservelist,
>> 				  struct node *tree, uint32_t boot_cpuid_phys)
>> {
>> 	struct boot_info *bi;
>>=20
>> 	bi =3D xmalloc(sizeof(*bi));
>> +	bi->versionflags =3D versionflags;
>> 	bi->reservelist =3D reservelist;
>> 	bi->dt =3D tree;
>> 	bi->boot_cpuid_phys =3D boot_cpuid_phys;
>> +	/* link back */
>> +	tree->bi =3D bi;
>>=20
>> 	return bi;
>> }
>> @@ -709,3 +742,185 @@ void sort_tree(struct boot_info *bi)
>> 	sort_reserve_entries(bi);
>> 	sort_node(bi->dt);
>> }
>> +
>> +/* utility helper to avoid code duplication */
>> +static struct node *build_and_name_child_node(struct node *parent, =
char *name)
>> +{
>> +	struct node *node;
>> +
>> +	node =3D build_node(NULL, NULL);
>> +	name_node(node, xstrdup(name));
>> +	add_child(parent, node);
>> +
>> +	return node;
>> +}
>> +
>> +static void generate_label_tree_internal(struct node *dt, struct no=
de *node,
>> +					 char *gen_node_name, bool allocph)
>> +{
>> +	struct node *c, *an;
>> +	struct property *p;
>> +	struct label *l;
>> +
>> +	/* if if there are labels */
>> +	if (node->labels) {
>> +		/* an is the aliases/__symbols__ node */
>> +		an =3D get_subnode(dt, gen_node_name);
>=20
> You can factor this out to the caller and just pass 'an' in.
>=20

OK

>> +		/* if no node exists, create it */
>=20
> Comment does not match the code
>=20

Ugh.

>> +		if (!an)
>> +			die("Could not get label node\n");
>> +
>> +		/* now add the label in the node */
>> +		for_each_label(node->labels, l) {
>> +			/* check whether the label already exists */
>> +			p =3D get_property(an, l->label);
>> +			if (p) {
>> +				fprintf(stderr, "WARNING: label %s already"
>> +					" exists in /%s", l->label,
>> +					gen_node_name);
>> +				continue;
>> +			}
>> +
>> +			/* insert it */
>> +			p =3D build_property(l->label,
>> +				data_copy_escape_string(node->fullpath,
>> +						strlen(node->fullpath)));
>> +			add_property(an, p);
>> +		}
>> +
>> +		/* force allocation of a phandle for this node */
>> +		if (allocph)
>> +			(void)get_node_phandle(dt, node);
>> +	}
>> +
>> +	for_each_child(node, c)
>> +		generate_label_tree_internal(dt, c, gen_node_name, allocph);
>> +}
>> +
>> +void generate_label_tree(struct node *dt, char *gen_node_name, bool=
 allocph)
>> +{
>> +	build_and_name_child_node(dt, gen_node_name);
>> +	generate_label_tree_internal(dt, dt, gen_node_name, allocph);
>> +}
>> +
>> +static char *fixups_name =3D "__fixups__";
>> +static char *local_fixups_name =3D "__local_fixups__";
>> +
>> +static void add_fixup_entry(struct node *dt, struct node *node,
>> +		struct property *prop, struct marker *m)
>> +{
>> +	struct node *fn;	/* local fixup node */
>=20
> Comment is misleading since this is __fixups__ rather than
> __local_fixups__.
>=20

OK

>> +	struct property *p;
>> +	struct data d;
>> +	char *entry;
>> +	int ret;
>> +
>> +	/* m->ref can only be a REF_PHANDLE, but check anyway */
>> +	if (m->type !=3D REF_PHANDLE)
>> +		die("Fixup entry can only be a ref to a phandle\n");
>=20
> If it's not a REF_PHANDLE, that indicates a bug elsewhere, yes?  In
> which case assert() would be more appropriate.
>=20

OK

>> +	/* fn is the node we're putting entries in */
>> +	fn =3D get_subnode(dt, fixups_name);
>> +	if (!fn)
>> +		die("Can't get fixups node\n");
>=20
> Again, assert() would be better.
>=20

OK

>> +	/* there shouldn't be any ':' in the arguments */
>> +	if (strchr(node->fullpath, ':') || strchr(prop->name, ':'))
>> +		die("arguments should not contain ':'\n");
>> +
>> +	ret =3D asprintf(&entry, "%s:%s:%u",
>> +			node->fullpath, prop->name, m->offset);
>> +	if (ret =3D=3D -1)
>> +		die("asprintf() failed\n");
>=20
> Looks like we really should put in an xasprintf() utility function,
> both to address the BSD portability, and avoid clunky checks for
> allocation failures.
>=20

No worries, I=E2=80=99ll add it in a separate patch.

>> +	p =3D get_property(fn, m->ref);
>> +	if (p) {
>> +		d =3D data_append_data(p->val, entry, strlen(entry) + 1);
>> +		p->val =3D d;
>> +	} else {
>> +		d =3D data_append_data(empty_data, entry, strlen(entry) + 1);
>> +		add_property(fn, build_property(m->ref, d));
>> +	}
>> +}
>> +
>> +static void add_local_fixup_entry(struct node *dt, struct node *nod=
e,
>> +		struct property *prop, struct marker *m,
>> +		struct node *refnode)
>> +{
>> +	struct node *lfn, *wn, *nwn;	/* local fixup node, walk node, new *=
/
>> +	struct property *p;
>> +	struct data d;
>> +	char *s, *e, *comp;
>> +	int len;
>> +
>> +	/* fn is the node we're putting entries in */
>> +	lfn =3D get_subnode(dt, local_fixups_name);
>> +	if (!lfn)
>> +		die("Can't get local fixups node\n");
>=20
> Again, assert().
>=20
>> +	/* walk the path components creating nodes if they don't exist */
>> +	comp =3D xmalloc(strlen(node->fullpath) + 1);
>> +	/* start skipping the first / */
>> +	s =3D node->fullpath + 1;
>> +	wn =3D lfn;
>> +	while (*s) {
>=20
> Given the break; below is the loop condition redundant?
>=20

Sanity check if fullpath is empty. Could assert instead.

>> +		/* retrieve path component */
>> +		e =3D strchr(s, '/');
>> +		if (e =3D=3D NULL)
>> +			e =3D s + strlen(s);
>> +		len =3D e - s;
>> +		memcpy(comp, s, len);
>> +		comp[len] =3D '\0';
>> +
>> +		/* if no node exists, create it */
>> +		nwn =3D get_subnode(wn, comp);
>> +		if (!nwn)
>> +			nwn =3D build_and_name_child_node(wn, comp);
>> +		wn =3D nwn;
>> +
>> +		/* last path component */
>> +		if (!*e)
>> +			break;
>> +
>> +		/* next path component */
>> +		s =3D e + 1;
>> +	}
>> +	free(comp);
>> +
>> +	p =3D get_property(wn, prop->name);
>> +	d =3D data_append_cell(p ? p->val : empty_data, (cell_t)m->offset)=
;
>> +	if (!p)
>> +		add_property(wn, build_property(prop->name, d));
>> +	else
>> +		p->val =3D d;
>=20
> Hmm.. am append_to_property helper would simplify both this and the
> other fixup function.
>=20

OK

>> +}
>> +
>> +static void generate_fixups_tree_internal(struct node *dt, struct n=
ode *node)
>> +{
>> +	struct node *c;
>> +	struct property *prop;
>> +	struct marker *m;
>> +	struct node *refnode;
>> +
>> +	for_each_property(node, prop) {
>> +		m =3D prop->val.markers;
>> +		for_each_marker_of_type(m, REF_PHANDLE) {
>> +			refnode =3D get_node_by_ref(dt, m->ref);
>> +			if (!refnode)
>> +				add_fixup_entry(dt, node, prop, m);
>> +			else
>> +				add_local_fixup_entry(dt, node, prop, m,
>> +						refnode);
>> +		}
>> +	}
>> +
>> +	for_each_child(node, c)
>> +		generate_fixups_tree_internal(dt, c);
>> +}
>> +
>> +void generate_fixups_tree(struct node *dt)
>> +{
>> +	build_and_name_child_node(dt, fixups_name);
>> +	build_and_name_child_node(dt, local_fixups_name);
>> +	generate_fixups_tree_internal(dt, dt);
>> +}
>=20
> --=20
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _o=
ther_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson
