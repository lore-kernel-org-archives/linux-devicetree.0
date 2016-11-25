From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v9 3/4] dtc: Plugin and fixup support
Date: Fri, 25 Nov 2016 12:55:25 +0200
Message-ID: <B39EF108-E592-4345-A5A7-951883AA099B@konsulko.com>
References: <1479990693-14260-1-git-send-email-pantelis.antoniou@konsulko.com> <1479990693-14260-4-git-send-email-pantelis.antoniou@konsulko.com> <20161125041124.GB12287@umbus.fritz.box>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125041124.GB12287-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

> On Nov 25, 2016, at 06:11 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
>=20
> On Thu, Nov 24, 2016 at 02:31:32PM +0200, Pantelis Antoniou wrote:
>> This patch enable the generation of symbols & local fixup information
>> for trees compiled with the -@ (--symbols) option.
>>=20
>> Using this patch labels in the tree and their users emit information
>> in __symbols__ and __local_fixups__ nodes.
>>=20
>> The __fixups__ node make possible the dynamic resolution of phandle
>> references which are present in the plugin tree but lie in the
>> tree that are applying the overlay against.
>>=20
>> While there is a new magic number for dynamic device tree/overlays =
blobs
>> it is by default disabled. This is in order to give time for DT blob
>> methods to be updated.
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> ---
>> Documentation/manual.txt |  25 +++++-
>> checks.c                 |   8 +-
>> dtc-lexer.l              |   5 ++
>> dtc-parser.y             |  49 +++++++++--
>> dtc.c                    |  39 +++++++-
>> dtc.h                    |  20 ++++-
>> fdtdump.c                |   2 +-
>> flattree.c               |  17 ++--
>> fstree.c                 |   2 +-
>> libfdt/fdt.c             |   2 +-
>> libfdt/fdt.h             |   3 +-
>> livetree.c               | 225 =
++++++++++++++++++++++++++++++++++++++++++++++-
>> tests/mangle-layout.c    |   7 +-
>> treesource.c             |   7 +-
>> 14 files changed, 380 insertions(+), 31 deletions(-)
>>=20
>> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
>> index 398de32..65fbf09 100644
>> --- a/Documentation/manual.txt
>> +++ b/Documentation/manual.txt
>> @@ -119,6 +119,24 @@ Options:
>> 	Make space for <number> reserve map entries
>> 	Relevant for dtb and asm output only.
>>=20
>> +    -@
>> +	Generates a __symbols__ node at the root node of the resulting =
blob
>> +	for any node labels used, and for any local references using =
phandles
>> +	it also generates a __local_fixups__ node that tracks them.
>> +
>> +	When using the /plugin/ tag all unresolved label references to
>> +	be tracked in the __fixups__ node, making dynamic resolution =
possible.
>> +
>> +    -A
>> +	Generate automatically aliases for all node labels. This is =
similar to
>> +	the -@ option (the __symbols__ node contain identical =
information) but
>> +	the semantics are slightly different since no phandles are =
automatically
>> +	generated for labeled nodes.
>> +
>> +    -M
>> +	Generate blobs with the new FDT magic number. By default blobs =
with the
>> +	standard FDT magic number are generated.
>=20
> First, this description is incomplete since -M *only* affects the
> magic number for /plugin/ input, not in other cases.  Second, the
> default is the wrong way around.  If we make old-style the default,
> then new-style will never be used, which defeats the purpose.
>=20

Then we=E2=80=99ll break user-space that has this assumption (i.e. that =
the magic is the same).
I can certainly do it the other way around.

>> +
>>     -S <bytes>
>> 	Ensure the blob at least <bytes> long, adding additional
>> 	space if needed.
>> @@ -146,13 +164,18 @@ Additionally, dtc performs various sanity =
checks on the tree.
>> Here is a very rough overview of the layout of a DTS source file:
>>=20
>>=20
>> -    sourcefile:   list_of_memreserve devicetree
>> +    sourcefile:   versioninfo plugindecl list_of_memreserve =
devicetree
>>=20
>>     memreserve:   label 'memreserve' ADDR ADDR ';'
>> 		| label 'memreserve' ADDR '-' ADDR ';'
>>=20
>>     devicetree:   '/' nodedef
>>=20
>> +    versioninfo:  '/' 'dts-v1' '/' ';'
>> +
>> +    plugindecl:   '/' 'plugin' '/' ';'
>> +                | /* empty */
>> +
>>     nodedef:      '{' list_of_property list_of_subnode '}' ';'
>>=20
>>     property:     label PROPNAME '=3D' propdata ';'
>> diff --git a/checks.c b/checks.c
>> index 609975a..bc03d42 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -486,8 +486,12 @@ static void fixup_phandle_references(struct =
check *c, struct boot_info *bi,
>>=20
>> 			refnode =3D get_node_by_ref(dt, m->ref);
>> 			if (! refnode) {
>> -				FAIL(c, "Reference to non-existent node =
or label \"%s\"\n",
>> -				     m->ref);
>> +				if (!(bi->versionflags & VF_PLUGIN))
>> +					FAIL(c, "Reference to =
non-existent node or "
>> +							"label =
\"%s\"\n", m->ref);
>> +				else /* mark the entry as unresolved */
>> +					*((cell_t *)(prop->val.val + =
m->offset)) =3D
>> +						=
cpu_to_fdt32(0xffffffff);
>> 				continue;
>> 			}
>>=20
>> diff --git a/dtc-lexer.l b/dtc-lexer.l
>> index 790fbf6..40bbc87 100644
>> --- a/dtc-lexer.l
>> +++ b/dtc-lexer.l
>> @@ -121,6 +121,11 @@ static void lexical_error(const char *fmt, ...);
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
>> index 14aaf2e..4afc592 100644
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
>> @@ -33,6 +34,9 @@ extern void yyerror(char const *s);
>>=20
>> extern struct boot_info *the_boot_info;
>> extern bool treesource_error;
>> +
>> +/* temporary while the tree is not built */
>> +static unsigned int the_versionflags;
>=20
> Hrm.  Using a global during parsing is pretty dangerous - it makes
> assumptions about the order in which bison will execute semantic
> actions that may not always be correct.
>=20
> It'll probably work in practice, so I *might* be convinced it's
> adequate for a first cut.  I'm a bit reluctant though, since I suspect
> once merged it will become entrenched.
>=20

We use bison, globals are the way of life. It=E2=80=99s not going to be =
used
anywhere else, it=E2=80=99s static in the parser file.

We could allocate the boot_info earlier (when the v1tag is detected) but
that would be quite a big change for something as trivial.=20

> The correct way to handle this, IMO, is not to ever attempt to apply
> overlays during the parse.  Basically, we'd change the overall
> structure so that the output from the parser is not a single tree, but
> a list of overlays / fragments.  Then, once the parse is complete, so
> versioninfo (which could now become a member of bootinfo) is well
> defined, we either apply the fragments in place (base tree) or encode
> them into the overlay structure (plugin mode).
>=20
> See https://github.com/dgibson/dtc/tree/overlay for some incomplete
> work I did in this direction.
>=20

This tree is pretty stale; last commit was back in march.

I thing there=E2=80=99s a wrong assumption here. The purpose of this =
patch is not
to apply overlays during compile time, is to generate a blob that can be
applied at runtime by another piece of software.

> In addition to not making unsafe assumptions about parser operation, I
> think this will also allow for better error reporting.  It also moves
> more code into plain-old-C instead of potentially hard to follow bison
> code fragments.
>=20

We don=E2=80=99t try to apply overlays during parse, and especially in =
the parse code.
The global is used only for the syntactic sugar method of turning a &ref =
{ };
node into an overlay.

>> %}
>>=20
>> %union {
>> @@ -52,9 +56,11 @@ extern bool treesource_error;
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
>> @@ -71,6 +77,8 @@ extern bool treesource_error;
>>=20
>> %type <data> propdata
>> %type <data> propdataprefix
>> +%type <flags> versioninfo
>> +%type <flags> plugindecl
>> %type <re> memreserve
>> %type <re> memreserves
>> %type <array> arrayprefix
>> @@ -101,16 +109,36 @@ extern bool treesource_error;
>> %%
>>=20
>> sourcefile:
>> -	  v1tag memreserves devicetree
>> +	  versioninfo plugindecl memreserves devicetree
>> +		{
>> +			the_boot_info =3D build_boot_info($1 | $2, $3, =
$4,
>> +							=
guess_boot_cpuid($4));
>> +		}
>> +	;
>> +
>> +versioninfo:
>> +	v1tag
>> 		{
>> -			the_boot_info =3D build_boot_info($2, $3,
>> -							=
guess_boot_cpuid($3));
>> +			the_versionflags |=3D VF_DT_V1;
>> +			$$ =3D the_versionflags;
>> 		}
>> 	;
>>=20
>> v1tag:
>> 	  DT_V1 ';'
>> +	| DT_V1
>> 	| DT_V1 ';' v1tag
>> +
>> +plugindecl:
>> +	DT_PLUGIN ';'
>> +		{
>> +			the_versionflags |=3D VF_PLUGIN;
>> +			$$ =3D VF_PLUGIN;
>> +		}
>> +	| /* empty */
>> +		{
>> +			$$ =3D 0;
>> +		}
>> 	;
>>=20
>> memreserves:
>> @@ -161,10 +189,14 @@ devicetree:
>> 		{
>> 			struct node *target =3D get_node_by_ref($1, $2);
>>=20
>> -			if (target)
>> +			if (target) {
>> 				merge_nodes(target, $3);
>> -			else
>> -				ERROR(&@2, "Label or path %s not found", =
$2);
>> +			} else {
>> +				if (the_versionflags & VF_PLUGIN)
>> +					add_orphan_node($1, $3, $2);
>> +				else
>> +					ERROR(&@2, "Label or path %s not =
found", $2);
>> +			}
>> 			$$ =3D $1;
>> 		}
>> 	| devicetree DT_DEL_NODE DT_REF ';'
>> @@ -179,6 +211,11 @@ devicetree:
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
>> index 9dcf640..a654267 100644
>> --- a/dtc.c
>> +++ b/dtc.c
>> @@ -32,6 +32,9 @@ int minsize;		/* Minimum blob size */
>> int padsize;		/* Additional padding to blob */
>> int alignsize;		/* Additional padding to blob accroding =
to the alignsize */
>> int phandle_format =3D PHANDLE_BOTH;	/* Use linux,phandle or phandle =
properties */
>> +int symbol_fixup_support;	/* enable symbols & fixup support */
>> +int auto_label_aliases;		/* auto generate labels -> =
aliases */
>> +int new_magic;			/* use new FDT magic values for =
objects */
>>=20
>> static int is_power_of_2(int x)
>> {
>> @@ -59,7 +62,7 @@ static void fill_fullpaths(struct node *tree, const =
char *prefix)
>> #define FDT_VERSION(version)	_FDT_VERSION(version)
>> #define _FDT_VERSION(version)	#version
>> static const char usage_synopsis[] =3D "dtc [options] <input file>";
>> -static const char usage_short_opts[] =3D =
"qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:hv";
>> +static const char usage_short_opts[] =3D =
"qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@AMhv";
>> static struct option const usage_long_opts[] =3D {
>> 	{"quiet",            no_argument, NULL, 'q'},
>> 	{"in-format",         a_argument, NULL, 'I'},
>> @@ -78,6 +81,9 @@ static struct option const usage_long_opts[] =3D {
>> 	{"phandle",           a_argument, NULL, 'H'},
>> 	{"warning",           a_argument, NULL, 'W'},
>> 	{"error",             a_argument, NULL, 'E'},
>> +	{"symbols",	     no_argument, NULL, '@'},
>> +	{"auto-alias",       no_argument, NULL, 'A'},
>> +	{"new-magic",        no_argument, NULL, 'M'},
>> 	{"help",             no_argument, NULL, 'h'},
>> 	{"version",          no_argument, NULL, 'v'},
>> 	{NULL,               no_argument, NULL, 0x0},
>> @@ -109,6 +115,9 @@ static const char * const usage_opts_help[] =3D {
>> 	 "\t\tboth   - Both \"linux,phandle\" and \"phandle\" =
properties",
>> 	"\n\tEnable/disable warnings (prefix with \"no-\")",
>> 	"\n\tEnable/disable errors (prefix with \"no-\")",
>> +	"\n\tEnable symbols/fixup support",
>> +	"\n\tEnable auto-alias of labels",
>> +	"\n\tUse new blog magic value",
>> 	"\n\tPrint this help and exit",
>> 	"\n\tPrint version and exit",
>> 	NULL,
>> @@ -153,7 +162,7 @@ static const char *guess_input_format(const char =
*fname, const char *fallback)
>> 	fclose(f);
>>=20
>> 	magic =3D fdt32_to_cpu(magic);
>> -	if (magic =3D=3D FDT_MAGIC)
>> +	if (magic =3D=3D FDT_MAGIC || magic =3D=3D FDT_MAGIC_DTBO)
>> 		return "dtb";
>>=20
>> 	return guess_type_by_name(fname, fallback);
>> @@ -172,6 +181,7 @@ int main(int argc, char *argv[])
>> 	FILE *outf =3D NULL;
>> 	int outversion =3D DEFAULT_FDT_VERSION;
>> 	long long cmdline_boot_cpuid =3D -1;
>> +	fdt32_t out_magic =3D FDT_MAGIC;
>>=20
>> 	quiet      =3D 0;
>> 	reservenum =3D 0;
>> @@ -249,6 +259,16 @@ int main(int argc, char *argv[])
>> 			parse_checks_option(false, true, optarg);
>> 			break;
>>=20
>> +		case '@':
>> +			symbol_fixup_support =3D 1;
>> +			break;
>> +		case 'A':
>> +			auto_label_aliases =3D 1;
>> +			break;
>> +		case 'M':
>> +			new_magic =3D 1;
>> +			break;
>> +
>> 		case 'h':
>> 			usage(NULL);
>> 		default:
>> @@ -306,6 +326,14 @@ int main(int argc, char *argv[])
>> 	fill_fullpaths(bi->dt, "");
>> 	process_checks(force, bi);
>>=20
>> +	if (auto_label_aliases)
>> +		generate_label_tree(bi->dt, "aliases", false);
>> +
>> +	if (symbol_fixup_support) {
>> +		generate_label_tree(bi->dt, "__symbols__", true);
>> +		generate_fixups_tree(bi->dt);
>> +	}
>> +
>> 	if (sort)
>> 		sort_tree(bi);
>>=20
>> @@ -318,12 +346,15 @@ int main(int argc, char *argv[])
>> 			    outname, strerror(errno));
>> 	}
>>=20
>> +	if (new_magic && (bi->versionflags & VF_PLUGIN))
>> +		out_magic =3D FDT_MAGIC_DTBO;
>> +
>> 	if (streq(outform, "dts")) {
>> 		dt_to_source(outf, bi);
>> 	} else if (streq(outform, "dtb")) {
>> -		dt_to_blob(outf, bi, outversion);
>> +		dt_to_blob(outf, bi, out_magic, outversion);
>> 	} else if (streq(outform, "asm")) {
>> -		dt_to_asm(outf, bi, outversion);
>> +		dt_to_asm(outf, bi, out_magic, outversion);
>> 	} else if (streq(outform, "null")) {
>> 		/* do nothing */
>> 	} else {
>> diff --git a/dtc.h b/dtc.h
>> index 32009bc..889b8f8 100644
>> --- a/dtc.h
>> +++ b/dtc.h
>> @@ -55,6 +55,9 @@ extern int minsize;		/* Minimum blob =
size */
>> extern int padsize;		/* Additional padding to blob */
>> extern int alignsize;		/* Additional padding to blob =
accroding to the alignsize */
>> extern int phandle_format;	/* Use linux,phandle or phandle =
properties */
>> +extern int symbol_fixup_support;/* enable symbols & fixup support */
>> +extern int auto_label_aliases;	/* auto generate labels -> =
aliases */
>> +extern int new_magic;		/* use new FDT magic values for =
objects */
>>=20
>> #define PHANDLE_LEGACY	0x1
>> #define PHANDLE_EPAPR	0x2
>> @@ -195,6 +198,7 @@ struct node *build_node_delete(void);
>> struct node *name_node(struct node *node, char *name);
>> struct node *chain_node(struct node *first, struct node *list);
>> struct node *merge_nodes(struct node *old_node, struct node =
*new_node);
>> +void add_orphan_node(struct node *old_node, struct node *new_node, =
char *ref);
>>=20
>> void add_property(struct node *node, struct property *prop);
>> void delete_property_by_name(struct node *node, char *name);
>> @@ -202,6 +206,8 @@ void delete_property(struct property *prop);
>> void add_child(struct node *parent, struct node *child);
>> void delete_node_by_name(struct node *parent, char *name);
>> void delete_node(struct node *node);
>> +void append_to_property(struct node *node,
>> +			char *name, const void *data, int len);
>>=20
>> const char *get_unitname(struct node *node);
>> struct property *get_property(struct node *node, const char =
*propname);
>> @@ -237,14 +243,22 @@ struct reserve_info *add_reserve_entry(struct =
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
>> +#define VF_PLUGIN	0x0002	/* /plugin/ */
>> +
>> +struct boot_info *build_boot_info(unsigned int versionflags,
>> +				  struct reserve_info *reservelist,
>> 				  struct node *tree, uint32_t =
boot_cpuid_phys);
>> void sort_tree(struct boot_info *bi);
>> +void generate_label_tree(struct node *dt, char *gen_node_name, bool =
allocph);
>> +void generate_fixups_tree(struct node *dt);
>>=20
>> /* Checks */
>>=20
>> @@ -253,8 +267,8 @@ void process_checks(bool force, struct boot_info =
*bi);
>>=20
>> /* Flattened trees */
>>=20
>> -void dt_to_blob(FILE *f, struct boot_info *bi, int version);
>> -void dt_to_asm(FILE *f, struct boot_info *bi, int version);
>> +void dt_to_blob(FILE *f, struct boot_info *bi, fdt32_t magic, int =
version);
>> +void dt_to_asm(FILE *f, struct boot_info *bi, fdt32_t magic, int =
version);
>>=20
>> struct boot_info *dt_from_blob(const char *fname);
>>=20
>> diff --git a/fdtdump.c b/fdtdump.c
>> index a9a2484..dd63ac2 100644
>> --- a/fdtdump.c
>> +++ b/fdtdump.c
>> @@ -201,7 +201,7 @@ int main(int argc, char *argv[])
>> 			p =3D memchr(p, smagic[0], endp - p - =
FDT_MAGIC_SIZE);
>> 			if (!p)
>> 				break;
>> -			if (fdt_magic(p) =3D=3D FDT_MAGIC) {
>> +			if (fdt_magic(p) =3D=3D FDT_MAGIC || =
fdt_magic(p) =3D=3D FDT_MAGIC_DTBO) {
>> 				/* try and validate the main struct */
>> 				off_t this_len =3D endp - p;
>> 				fdt32_t max_version =3D 17;
>> diff --git a/flattree.c b/flattree.c
>> index a9d9520..57d76cf 100644
>> --- a/flattree.c
>> +++ b/flattree.c
>> @@ -335,6 +335,7 @@ static struct data flatten_reserve_list(struct =
reserve_info *reservelist,
>> }
>>=20
>> static void make_fdt_header(struct fdt_header *fdt,
>> +			    fdt32_t magic,
>> 			    struct version_info *vi,
>> 			    int reservesize, int dtsize, int strsize,
>> 			    int boot_cpuid_phys)
>> @@ -345,7 +346,7 @@ static void make_fdt_header(struct fdt_header =
*fdt,
>>=20
>> 	memset(fdt, 0xff, sizeof(*fdt));
>>=20
>> -	fdt->magic =3D cpu_to_fdt32(FDT_MAGIC);
>> +	fdt->magic =3D cpu_to_fdt32(magic);
>> 	fdt->version =3D cpu_to_fdt32(vi->version);
>> 	fdt->last_comp_version =3D cpu_to_fdt32(vi->last_comp_version);
>>=20
>> @@ -366,7 +367,7 @@ static void make_fdt_header(struct fdt_header =
*fdt,
>> 		fdt->size_dt_struct =3D cpu_to_fdt32(dtsize);
>> }
>>=20
>> -void dt_to_blob(FILE *f, struct boot_info *bi, int version)
>> +void dt_to_blob(FILE *f, struct boot_info *bi, fdt32_t magic, int =
version)
>> {
>> 	struct version_info *vi =3D NULL;
>> 	int i;
>> @@ -390,7 +391,7 @@ void dt_to_blob(FILE *f, struct boot_info *bi, =
int version)
>> 	reservebuf =3D flatten_reserve_list(bi->reservelist, vi);
>>=20
>> 	/* Make header */
>> -	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
>> +	make_fdt_header(&fdt, magic, vi, reservebuf.len, dtbuf.len, =
strbuf.len,
>> 			bi->boot_cpuid_phys);
>>=20
>> 	/*
>> @@ -467,7 +468,7 @@ static void dump_stringtable_asm(FILE *f, struct =
data strbuf)
>> 	}
>> }
>>=20
>> -void dt_to_asm(FILE *f, struct boot_info *bi, int version)
>> +void dt_to_asm(FILE *f, struct boot_info *bi, fdt32_t magic, int =
version)
>> {
>> 	struct version_info *vi =3D NULL;
>> 	int i;
>> @@ -830,6 +831,7 @@ struct boot_info *dt_from_blob(const char *fname)
>> 	struct node *tree;
>> 	uint32_t val;
>> 	int flags =3D 0;
>> +	unsigned int versionflags =3D VF_DT_V1;
>>=20
>> 	f =3D srcfile_relative_open(fname, NULL);
>>=20
>> @@ -845,9 +847,12 @@ struct boot_info *dt_from_blob(const char =
*fname)
>> 	}
>>=20
>> 	magic =3D fdt32_to_cpu(magic);
>> -	if (magic !=3D FDT_MAGIC)
>> +	if (magic !=3D FDT_MAGIC && magic !=3D FDT_MAGIC_DTBO)
>> 		die("Blob has incorrect magic number\n");
>>=20
>> +	if (magic =3D=3D FDT_MAGIC_DTBO)
>> +		versionflags |=3D VF_PLUGIN;
>> +
>> 	rc =3D fread(&totalsize, sizeof(totalsize), 1, f);
>> 	if (ferror(f))
>> 		die("Error reading DT blob size: %s\n", =
strerror(errno));
>> @@ -942,5 +947,5 @@ struct boot_info *dt_from_blob(const char *fname)
>>=20
>> 	fclose(f);
>>=20
>> -	return build_boot_info(reservelist, tree, boot_cpuid_phys);
>> +	return build_boot_info(versionflags, reservelist, tree, =
boot_cpuid_phys);
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
>> +	return build_boot_info(VF_DT_V1, NULL, tree, =
guess_boot_cpuid(tree));
>> }
>>=20
>> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
>> index 22286a1..28d422c 100644
>> --- a/libfdt/fdt.c
>> +++ b/libfdt/fdt.c
>> @@ -57,7 +57,7 @@
>>=20
>> int fdt_check_header(const void *fdt)
>> {
>> -	if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
>> +	if (fdt_magic(fdt) =3D=3D FDT_MAGIC || fdt_magic(fdt) =3D=3D =
FDT_MAGIC_DTBO) {
>> 		/* Complete tree */
>> 		if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
>> 			return -FDT_ERR_BADVERSION;
>> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
>> index 526aedb..493cd55 100644
>> --- a/libfdt/fdt.h
>> +++ b/libfdt/fdt.h
>> @@ -55,7 +55,7 @@
>> #ifndef __ASSEMBLY__
>>=20
>> struct fdt_header {
>> -	fdt32_t magic;			 /* magic word FDT_MAGIC */
>> +	fdt32_t magic;			 /* magic word FDT_MAGIC[|_DTBO] =
*/
>> 	fdt32_t totalsize;		 /* total size of DT block */
>> 	fdt32_t off_dt_struct;		 /* offset to structure */
>> 	fdt32_t off_dt_strings;		 /* offset to strings */
>> @@ -93,6 +93,7 @@ struct fdt_property {
>> #endif /* !__ASSEMBLY */
>>=20
>> #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
>> +#define FDT_MAGIC_DTBO	0xd00dfdb0	/* DTBO magic */
>> #define FDT_TAGSIZE	sizeof(fdt32_t)
>>=20
>> #define FDT_BEGIN_NODE	0x1		/* Start node: full name =
*/
>> diff --git a/livetree.c b/livetree.c
>> index 3dc7559..1a2f4b1 100644
>> --- a/livetree.c
>> +++ b/livetree.c
>> @@ -216,6 +216,31 @@ struct node *merge_nodes(struct node *old_node, =
struct node *new_node)
>> 	return old_node;
>> }
>>=20
>> +void add_orphan_node(struct node *dt, struct node *new_node, char =
*ref)
>> +{
>> +	static unsigned int next_orphan_fragment =3D 0;
>> +	struct node *node =3D xmalloc(sizeof(*node));
>=20
> You shouldn't use a bare malloc() for a node.  Use build_node() =
instead.
>=20

OK.

>> +	struct property *p;
>> +	struct data d =3D empty_data;
>> +	char *name;
>> +
>> +	memset(node, 0, sizeof(*node));
>> +
>> +	d =3D data_add_marker(d, REF_PHANDLE, ref);
>> +	d =3D data_append_integer(d, 0xffffffff, 32);
>> +
>> +	p =3D build_property("target", d);
>> +	add_property(node, p);
>> +
>> +	xasprintf(&name, "fragment@%u",
>> +			next_orphan_fragment++);
>> +	name_node(node, name);
>> +	name_node(new_node, "__overlay__");
>> +
>> +	add_child(dt, node);
>> +	add_child(node, new_node);
>> +}
>> +
>> struct node *chain_node(struct node *first, struct node *list)
>> {
>> 	assert(first->next_sibling =3D=3D NULL);
>> @@ -296,6 +321,23 @@ void delete_node(struct node *node)
>> 	delete_labels(&node->labels);
>> }
>>=20
>> +void append_to_property(struct node *node,
>> +				    char *name, const void *data, int =
len)
>> +{
>> +	struct data d;
>> +	struct property *p;
>> +
>> +	p =3D get_property(node, name);
>> +	if (p) {
>> +		d =3D data_append_data(p->val, data, len);
>> +		p->val =3D d;
>> +	} else {
>> +		d =3D data_append_data(empty_data, data, len);
>> +		p =3D build_property(name, d);
>> +		add_property(node, p);
>> +	}
>> +}
>> +
>> struct reserve_info *build_reserve_entry(uint64_t address, uint64_t =
size)
>> {
>> 	struct reserve_info *new =3D xmalloc(sizeof(*new));
>> @@ -335,12 +377,14 @@ struct reserve_info *add_reserve_entry(struct =
reserve_info *list,
>> 	return list;
>> }
>>=20
>> -struct boot_info *build_boot_info(struct reserve_info *reservelist,
>> +struct boot_info *build_boot_info(unsigned int versionflags,
>> +				  struct reserve_info *reservelist,
>> 				  struct node *tree, uint32_t =
boot_cpuid_phys)
>> {
>> 	struct boot_info *bi;
>>=20
>> 	bi =3D xmalloc(sizeof(*bi));
>> +	bi->versionflags =3D versionflags;
>> 	bi->reservelist =3D reservelist;
>> 	bi->dt =3D tree;
>> 	bi->boot_cpuid_phys =3D boot_cpuid_phys;
>> @@ -709,3 +753,182 @@ void sort_tree(struct boot_info *bi)
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
>> +static void generate_label_tree_internal(struct node *dt, struct =
node *node,
>> +					 struct node *an, bool allocph)
>> +{
>> +	struct node *c;
>> +	struct property *p;
>> +	struct label *l;
>> +
>> +	/* if if there are labels */
>> +	if (node->labels) {
>> +		/* now add the label in the node */
>> +		for_each_label(node->labels, l) {
>> +			/* check whether the label already exists */
>> +			p =3D get_property(an, l->label);
>> +			if (p) {
>> +				fprintf(stderr, "WARNING: label %s =
already"
>> +					" exists in /%s", l->label,
>> +					an->name);
>> +				continue;
>> +			}
>> +
>> +			/* insert it */
>> +			p =3D build_property(l->label,
>> +				data_copy_escape_string(node->fullpath,
>> +						=
strlen(node->fullpath)));
>=20
> Um.. what?  The node path should absolutely not be an escape string.
> It shouldn't contain escapes to begin with, and if it does, we
> absolutely shouldn't be turning them into special characters here.
>=20

OK, trivial enough to do. I tried to play it safe here but this is an =
overkill.

>> +			add_property(an, p);
>> +		}
>> +
>> +		/* force allocation of a phandle for this node */
>> +		if (allocph)
>> +			(void)get_node_phandle(dt, node);
>> +	}
>> +
>> +	for_each_child(node, c)
>> +		generate_label_tree_internal(dt, c, an, allocph);
>> +}
>> +
>> +void generate_label_tree(struct node *dt, char *gen_node_name, bool =
allocph)
>> +{
>> +	struct node *an;
>> +
>> +	for_each_child(dt, an)
>> +		if (streq(gen_node_name, an->name))
>> +			break;
>> +
>> +	if (!an)
>> +		an =3D build_and_name_child_node(dt, gen_node_name);
>> +	if (!an)
>> +		die("Could not build label node /%s\n", gen_node_name);
>> +
>> +	generate_label_tree_internal(dt, dt, an, allocph);
>> +}
>> +
>> +static char *fixups_name =3D "__fixups__";
>> +static char *local_fixups_name =3D "__local_fixups__";
>=20
> I'd actually prefer #defines for these, and all-caps names, so it's
> more obvious when they're used that these are global constants.
>=20

OK.

>> +
>> +static void add_fixup_entry(struct node *dt, struct node *node,
>> +		struct property *prop, struct marker *m)
>> +{
>> +	struct node *fn;	/* fixup node */
>> +	char *entry;
>> +
>> +	/* m->ref can only be a REF_PHANDLE, but check anyway */
>> +	assert(m->type =3D=3D REF_PHANDLE);
>> +
>> +	/* fn is the node we're putting entries in */
>> +	fn =3D get_subnode(dt, fixups_name);
>> +	assert(fn !=3D NULL);
>> +
>> +	/* there shouldn't be any ':' in the arguments */
>> +	if (strchr(node->fullpath, ':') || strchr(prop->name, ':'))
>> +		die("arguments should not contain ':'\n");
>> +
>> +	xasprintf(&entry, "%s:%s:%u",
>> +			node->fullpath, prop->name, m->offset);
>> +	append_to_property(fn, m->ref, entry, strlen(entry) + 1);
>> +}
>> +
>> +static void add_local_fixup_entry(struct node *dt, struct node =
*node,
>> +		struct property *prop, struct marker *m,
>> +		struct node *refnode)
>> +{
>> +	struct node *lfn, *wn, *nwn;	/* local fixup node, walk node, =
new */
>> +	uint32_t value_32;
>> +	char *s, *e, *comp;
>> +	int len;
>> +
>> +	/* fn is the node we're putting entries in */
>> +	lfn =3D get_subnode(dt, local_fixups_name);
>> +	assert(lfn !=3D NULL);
>> +
>> +	/* walk the path components creating nodes if they don't exist =
*/
>> +	comp =3D xmalloc(strlen(node->fullpath) + 1);
>> +	/* start skipping the first / */
>> +	s =3D node->fullpath + 1;
>> +	wn =3D lfn;
>> +	while (*s) {
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
>> +	value_32 =3D cpu_to_fdt32(m->offset);
>> +	append_to_property(wn, prop->name, &value_32, sizeof(value_32));
>> +}
>> +
>> +static void generate_fixups_tree_internal(struct node *dt, struct =
node *node)
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
>> +	struct node *an;
>> +
>> +	for_each_child(dt, an)
>> +		if (streq(fixups_name, an->name))
>> +			break;
>> +
>> +	if (!an)
>> +		build_and_name_child_node(dt, fixups_name);
>> +
>> +	for_each_child(dt, an)
>> +		if (streq(local_fixups_name, an->name))
>> +			break;
>> +
>> +	if (!an)
>> +		build_and_name_child_node(dt, local_fixups_name);
>> +
>> +	generate_fixups_tree_internal(dt, dt);
>> +}
>> diff --git a/tests/mangle-layout.c b/tests/mangle-layout.c
>> index a76e51e..d29ebc6 100644
>> --- a/tests/mangle-layout.c
>> +++ b/tests/mangle-layout.c
>> @@ -42,7 +42,8 @@ static void expand_buf(struct bufstate *buf, int =
newsize)
>> 	buf->size =3D newsize;
>> }
>>=20
>> -static void new_header(struct bufstate *buf, int version, const void =
*fdt)
>> +static void new_header(struct bufstate *buf, fdt32_t magic, int =
version,
>> +		       const void *fdt)
>> {
>> 	int hdrsize;
>>=20
>> @@ -56,7 +57,7 @@ static void new_header(struct bufstate *buf, int =
version, const void *fdt)
>> 	expand_buf(buf, hdrsize);
>> 	memset(buf->buf, 0, hdrsize);
>>=20
>> -	fdt_set_magic(buf->buf, FDT_MAGIC);
>> +	fdt_set_magic(buf->buf, magic);
>> 	fdt_set_version(buf->buf, version);
>> 	fdt_set_last_comp_version(buf->buf, 16);
>> 	fdt_set_boot_cpuid_phys(buf->buf, fdt_boot_cpuid_phys(fdt));
>> @@ -145,7 +146,7 @@ int main(int argc, char *argv[])
>> 	if (fdt_version(fdt) < 17)
>> 		CONFIG("Input tree must be v17");
>>=20
>> -	new_header(&buf, version, fdt);
>> +	new_header(&buf, FDT_MAGIC, version, fdt);
>>=20
>> 	while (*blockorder) {
>> 		add_block(&buf, version, *blockorder, fdt);
>> diff --git a/treesource.c b/treesource.c
>> index a55d1d1..75e920d 100644
>> --- a/treesource.c
>> +++ b/treesource.c
>> @@ -267,7 +267,12 @@ void dt_to_source(FILE *f, struct boot_info *bi)
>> {
>> 	struct reserve_info *re;
>>=20
>> -	fprintf(f, "/dts-v1/;\n\n");
>> +	fprintf(f, "/dts-v1/");
>> +
>> +	if (bi->versionflags & VF_PLUGIN)
>> +		fprintf(f, " /plugin/");
>> +
>> +	fprintf(f, ";\n\n");
>=20
> I'm not sure this really makes sense.  The /plugin/ tag triggers the
> fixup construction and encoding of overlay fragments.  But in an
> incoming dtb, that processing has already been done once, doing it
> again would not make sense.  So I think the output should not have the
> /plugin/ tag, even if the input did.
>=20
> Unless, of course, you parsed the input into an explicit list of
> overlays, then output it here again as a list of overlays, not the
> encoded fragments.  i.e. if this was the original tree:
>=20
> 	/dts-v1/ /plugin/;
>=20
> 	&somwhere {
> 		name =3D "value";
> 	};
>=20
> then legitimately the output of -I dts -O dts could be either:
>=20
> 	/dts-v1/ /plugin/;
>=20
> 	&somwhere {
> 		name =3D "value";
> 	};
>=20
> OR
>=20
> 	/dts-v1/;
>=20
> 	/ {
> 		fragment@0 {
> 			target =3D <0xffffffff>;
> 			__overlay__{
> 				name =3D "value";
> 			};
> 		};
> 		__fixups__ {
> 			somewhere =3D "/fragment@0:target:0";
> 		};
> 	};
>=20
> But it doesn't make sense to combine the two: the second structure
> with the "/plugin/" tag.
>=20

> Another advantage of moving the overlay application out of the parser
> is you can sanely produce either output, both of which could be useful
> in the right circumstances.  You can potentially even produce the
> first output (or something close) from dtb input, with correct parsing
> of the overlay structure on dtb input.
>=20

Yes, this makes sense. For now I=E2=80=99ll remove the plugin tag, but =
if the blob
was compiled with -@ you could conceivably reverse back to a form that =
contains
labels and phandle references correctly.

But this is quite complicated to undertake in this patch series.=20

To re-iterate though there is no overlay application here :)

> --=20
> David Gibson			| I'll have my music baroque, and my =
code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT =
_the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
