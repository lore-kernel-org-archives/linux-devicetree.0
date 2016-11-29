From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v11 2/7] dtc: Plugin and fixup support
Date: Tue, 29 Nov 2016 13:38:48 +1100
Message-ID: <20161129023848.GE13307@umbus.fritz.box>
References: <1480349141-14145-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480349141-14145-3-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480349141-14145-3-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 06:05:36PM +0200, Pantelis Antoniou wrote:
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
> While there is a new magic number for dynamic device tree/overlays blobs
> it is by default enabled. Remember to use -M to generate compatible
> blobs.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  Documentation/manual.txt |  29 ++++++-
>  checks.c                 |   8 +-
>  dtc-lexer.l              |   5 ++
>  dtc-parser.y             |  29 ++++++-
>  dtc.c                    |  51 +++++++++++-
>  dtc.h                    |  21 ++++-
>  fdtdump.c                |   2 +-
>  flattree.c               |  17 ++--
>  fstree.c                 |   2 +-
>  libfdt/fdt.c             |   2 +-
>  libfdt/fdt.h             |   3 +-
>  livetree.c               | 208 +++++++++++++++++++++++++++++++++++++++++=
+++++-
>  tests/mangle-layout.c    |   7 +-
>  13 files changed, 357 insertions(+), 27 deletions(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 398de32..92a4966 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -119,6 +119,28 @@ Options:
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
> +    -M
> +	Generate blobs with the old FDT magic number for device tree objects.
> +	By default blobs use the DTBO FDT magic number instead.
> +
> +    -F
> +        Suppress generation of fixups when -@ is used. This is useful fo=
r generating
> +	a base tree with symbols but without fixups that take some amount of sp=
ace.

Urgh, yet another option?

Can you give me more details on how __fixups__ is useful in a base tree?

>      -S <bytes>
>  	Ensure the blob at least <bytes> long, adding additional
>  	space if needed.
> @@ -146,13 +168,18 @@ Additionally, dtc performs various sanity checks on=
 the tree.
>  Here is a very rough overview of the layout of a DTS source file:
> =20
> =20
> -    sourcefile:   list_of_memreserve devicetree
> +    sourcefile:   versioninfo plugindecl list_of_memreserve devicetree
> =20
>      memreserve:   label 'memreserve' ADDR ADDR ';'
>  		| label 'memreserve' ADDR '-' ADDR ';'
> =20
>      devicetree:   '/' nodedef
> =20
> +    versioninfo:  '/' 'dts-v1' '/' ';'
> +
> +    plugindecl:   '/' 'plugin' '/' ';'
> +                | /* empty */
> +
>      nodedef:      '{' list_of_property list_of_subnode '}' ';'
> =20
>      property:     label PROPNAME '=3D' propdata ';'
> diff --git a/checks.c b/checks.c
> index 2bd27a4..4292f4b 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -487,8 +487,12 @@ static void fixup_phandle_references(struct check *c=
, struct boot_info *bi,
> =20
>  			refnode =3D get_node_by_ref(dt, m->ref);
>  			if (! refnode) {
> -				FAIL(c, "Reference to non-existent node or label \"%s\"\n",
> -				     m->ref);
> +				if (!(bi->versionflags & VF_PLUGIN))
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
> index 14aaf2e..ad3dbe2 100644
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
> +	unsigned int flags;
>  }
> =20
>  %token DT_V1
> +%token DT_PLUGIN
>  %token DT_MEMRESERVE
>  %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
>  %token DT_BITS
> @@ -71,6 +74,8 @@ extern bool treesource_error;
> =20
>  %type <data> propdata
>  %type <data> propdataprefix
> +%type <flags> versioninfo
> +%type <flags> plugindecl
>  %type <re> memreserve
>  %type <re> memreserves
>  %type <array> arrayprefix
> @@ -101,16 +106,34 @@ extern bool treesource_error;
>  %%
> =20
>  sourcefile:
> -	  v1tag memreserves devicetree
> +	  versioninfo plugindecl memreserves devicetree
>  		{
> -			the_boot_info =3D build_boot_info($2, $3,
> -							guess_boot_cpuid($3));
> +			the_boot_info =3D build_boot_info($1 | $2, $3, $4,
> +							guess_boot_cpuid($4));
> +		}
> +	;
> +
> +versioninfo:
> +	v1tag
> +		{
> +			$$ =3D VF_DT_V1;
>  		}
>  	;
> =20
>  v1tag:
>  	  DT_V1 ';'
> +	| DT_V1
>  	| DT_V1 ';' v1tag
> +
> +plugindecl:
> +	DT_PLUGIN ';'
> +		{
> +			$$ =3D VF_PLUGIN;
> +		}
> +	| /* empty */
> +		{
> +			$$ =3D 0;
> +		}
>  	;
> =20
>  memreserves:
> diff --git a/dtc.c b/dtc.c
> index 9dcf640..947d082 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -32,6 +32,10 @@ int minsize;		/* Minimum blob size */
>  int padsize;		/* Additional padding to blob */
>  int alignsize;		/* Additional padding to blob accroding to the alignsize=
 */
>  int phandle_format =3D PHANDLE_BOTH;	/* Use linux,phandle or phandle pro=
perties */
> +int symbol_fixup_support;	/* enable symbols & fixup support */
> +int auto_label_aliases;		/* auto generate labels -> aliases */
> +int no_dtbo_magic;		/* use old FDT magic values for objects */
> +int suppress_fixups;		/* suppress generation of fixups on symbol support=
 */

The symbol_fixup_support and suppress_fixups flags semantics are
starting to confuse me.  I think rework these to 'generate_symbols'
and 'generate_fixups' which should have clearer logic.

Note that - for now - I'm just suggesting a change in the internal
variables, they can still be set appropriately based on the existing
semantics of the command line options.

>  static int is_power_of_2(int x)
>  {
> @@ -59,7 +63,7 @@ static void fill_fullpaths(struct node *tree, const cha=
r *prefix)
>  #define FDT_VERSION(version)	_FDT_VERSION(version)
>  #define _FDT_VERSION(version)	#version
>  static const char usage_synopsis[] =3D "dtc [options] <input file>";
> -static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E=
:hv";
> +static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E=
:@AMFhv";
>  static struct option const usage_long_opts[] =3D {
>  	{"quiet",            no_argument, NULL, 'q'},
>  	{"in-format",         a_argument, NULL, 'I'},
> @@ -78,6 +82,10 @@ static struct option const usage_long_opts[] =3D {
>  	{"phandle",           a_argument, NULL, 'H'},
>  	{"warning",           a_argument, NULL, 'W'},
>  	{"error",             a_argument, NULL, 'E'},
> +	{"symbols",	     no_argument, NULL, '@'},
> +	{"auto-alias",       no_argument, NULL, 'A'},
> +	{"no-dtbo-magic",    no_argument, NULL, 'M'},
> +	{"suppress-fixups",  no_argument, NULL, 'F'},
>  	{"help",             no_argument, NULL, 'h'},
>  	{"version",          no_argument, NULL, 'v'},
>  	{NULL,               no_argument, NULL, 0x0},
> @@ -109,6 +117,10 @@ static const char * const usage_opts_help[] =3D {
>  	 "\t\tboth   - Both \"linux,phandle\" and \"phandle\" properties",
>  	"\n\tEnable/disable warnings (prefix with \"no-\")",
>  	"\n\tEnable/disable errors (prefix with \"no-\")",
> +	"\n\tEnable symbols/fixup support",
> +	"\n\tEnable auto-alias of labels",
> +	"\n\tDo not use DTBO magic value for plugin objects",
> +	"\n\tSuppress generation of fixups when symbol support enabled",
>  	"\n\tPrint this help and exit",
>  	"\n\tPrint version and exit",
>  	NULL,
> @@ -153,7 +165,7 @@ static const char *guess_input_format(const char *fna=
me, const char *fallback)
>  	fclose(f);
> =20
>  	magic =3D fdt32_to_cpu(magic);
> -	if (magic =3D=3D FDT_MAGIC)
> +	if (magic =3D=3D FDT_MAGIC || magic =3D=3D FDT_MAGIC_DTBO)
>  		return "dtb";
> =20
>  	return guess_type_by_name(fname, fallback);
> @@ -172,6 +184,7 @@ int main(int argc, char *argv[])
>  	FILE *outf =3D NULL;
>  	int outversion =3D DEFAULT_FDT_VERSION;
>  	long long cmdline_boot_cpuid =3D -1;
> +	fdt32_t out_magic =3D FDT_MAGIC;
> =20
>  	quiet      =3D 0;
>  	reservenum =3D 0;
> @@ -249,6 +262,19 @@ int main(int argc, char *argv[])
>  			parse_checks_option(false, true, optarg);
>  			break;
> =20
> +		case '@':
> +			symbol_fixup_support =3D 1;
> +			break;
> +		case 'A':
> +			auto_label_aliases =3D 1;
> +			break;
> +		case 'M':
> +			no_dtbo_magic =3D 1;
> +			break;
> +		case 'F':
> +			suppress_fixups =3D 1;
> +			break;
> +
>  		case 'h':
>  			usage(NULL);
>  		default:
> @@ -306,6 +332,20 @@ int main(int argc, char *argv[])
>  	fill_fullpaths(bi->dt, "");
>  	process_checks(force, bi);
> =20
> +	if (auto_label_aliases)
> +		generate_label_tree(bi, "aliases", false);
> +
> +	/* symbol support or plugin is detected */
> +	if (symbol_fixup_support || (bi->versionflags & VF_PLUGIN))
> +		generate_label_tree(bi, "__symbols__", true);
> +
> +	/* plugin or symbol support and fixups are not suppressed */
> +	if ((bi->versionflags & VF_PLUGIN) ||
> +			(symbol_fixup_support && !suppress_fixups)) {
> +		generate_fixups_tree(bi, "__fixups__");
> +		generate_local_fixups_tree(bi, "__local_fixups__");
> +	}


Elaborating on the suggestion above, I'd like to see this just be:
	if (generate_symbols)
		generate_label_tree(...);
	if (generate_fixups) {
		generate_fixups_tree(..);
		generate_local_fixups_tree(...);
	}

With the two option flags set earlier according to the command line
options + /plugin/ tag.

>  	if (sort)
>  		sort_tree(bi);
> =20
> @@ -318,12 +358,15 @@ int main(int argc, char *argv[])
>  			    outname, strerror(errno));
>  	}
> =20
> +	if (!no_dtbo_magic && (bi->versionflags & VF_PLUGIN))
> +		out_magic =3D FDT_MAGIC_DTBO;
> +
>  	if (streq(outform, "dts")) {
>  		dt_to_source(outf, bi);
>  	} else if (streq(outform, "dtb")) {
> -		dt_to_blob(outf, bi, outversion);
> +		dt_to_blob(outf, bi, out_magic, outversion);
>  	} else if (streq(outform, "asm")) {
> -		dt_to_asm(outf, bi, outversion);
> +		dt_to_asm(outf, bi, out_magic, outversion);
>  	} else if (streq(outform, "null")) {
>  		/* do nothing */
>  	} else {
> diff --git a/dtc.h b/dtc.h
> index 32009bc..4da5a37 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -55,6 +55,10 @@ extern int minsize;		/* Minimum blob size */
>  extern int padsize;		/* Additional padding to blob */
>  extern int alignsize;		/* Additional padding to blob accroding to the al=
ignsize */
>  extern int phandle_format;	/* Use linux,phandle or phandle properties */
> +extern int symbol_fixup_support;/* enable symbols & fixup support */
> +extern int auto_label_aliases;	/* auto generate labels -> aliases */
> +extern int no_dtbo_magic;	/* use old FDT magic values for objects */
> +extern int suppress_fixups;	/* suppress generation of fixups on symbol s=
upport */
> =20
>  #define PHANDLE_LEGACY	0x1
>  #define PHANDLE_EPAPR	0x2
> @@ -202,6 +206,8 @@ void delete_property(struct property *prop);
>  void add_child(struct node *parent, struct node *child);
>  void delete_node_by_name(struct node *parent, char *name);
>  void delete_node(struct node *node);
> +void append_to_property(struct node *node,
> +			char *name, const void *data, int len);
> =20
>  const char *get_unitname(struct node *node);
>  struct property *get_property(struct node *node, const char *propname);
> @@ -237,14 +243,23 @@ struct reserve_info *add_reserve_entry(struct reser=
ve_info *list,
> =20
> =20
>  struct boot_info {
> +	unsigned int versionflags;
>  	struct reserve_info *reservelist;
>  	struct node *dt;		/* the device tree */
>  	uint32_t boot_cpuid_phys;
>  };
> =20
> -struct boot_info *build_boot_info(struct reserve_info *reservelist,
> +/* version flags definitions */
> +#define VF_DT_V1	0x0001	/* /dts-v1/ */
> +#define VF_PLUGIN	0x0002	/* /plugin/ */


Hm, sorry, didn't mention this minor nit before.  Can you rename
versionflags and the associated constants to make it clear these are
about the *dts* version, since we also have entirely different
versioning info for the *dtb* version.

> +struct boot_info *build_boot_info(unsigned int versionflags,
> +				  struct reserve_info *reservelist,
>  				  struct node *tree, uint32_t boot_cpuid_phys);
>  void sort_tree(struct boot_info *bi);
> +void generate_label_tree(struct boot_info *bi, char *name, bool allocph);
> +void generate_fixups_tree(struct boot_info *bi, char *name);
> +void generate_local_fixups_tree(struct boot_info *bi, char *name);
> =20
>  /* Checks */
> =20
> @@ -253,8 +268,8 @@ void process_checks(bool force, struct boot_info *bi);
> =20
>  /* Flattened trees */
> =20
> -void dt_to_blob(FILE *f, struct boot_info *bi, int version);
> -void dt_to_asm(FILE *f, struct boot_info *bi, int version);
> +void dt_to_blob(FILE *f, struct boot_info *bi, fdt32_t magic, int versio=
n);
> +void dt_to_asm(FILE *f, struct boot_info *bi, fdt32_t magic, int version=
);
> =20
>  struct boot_info *dt_from_blob(const char *fname);
> =20
> diff --git a/fdtdump.c b/fdtdump.c
> index a9a2484..dd63ac2 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -201,7 +201,7 @@ int main(int argc, char *argv[])
>  			p =3D memchr(p, smagic[0], endp - p - FDT_MAGIC_SIZE);
>  			if (!p)
>  				break;
> -			if (fdt_magic(p) =3D=3D FDT_MAGIC) {
> +			if (fdt_magic(p) =3D=3D FDT_MAGIC || fdt_magic(p) =3D=3D FDT_MAGIC_DT=
BO) {
>  				/* try and validate the main struct */
>  				off_t this_len =3D endp - p;
>  				fdt32_t max_version =3D 17;
> diff --git a/flattree.c b/flattree.c
> index a9d9520..57d76cf 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -335,6 +335,7 @@ static struct data flatten_reserve_list(struct reserv=
e_info *reservelist,
>  }
> =20
>  static void make_fdt_header(struct fdt_header *fdt,
> +			    fdt32_t magic,
>  			    struct version_info *vi,
>  			    int reservesize, int dtsize, int strsize,
>  			    int boot_cpuid_phys)
> @@ -345,7 +346,7 @@ static void make_fdt_header(struct fdt_header *fdt,
> =20
>  	memset(fdt, 0xff, sizeof(*fdt));
> =20
> -	fdt->magic =3D cpu_to_fdt32(FDT_MAGIC);
> +	fdt->magic =3D cpu_to_fdt32(magic);
>  	fdt->version =3D cpu_to_fdt32(vi->version);
>  	fdt->last_comp_version =3D cpu_to_fdt32(vi->last_comp_version);
> =20
> @@ -366,7 +367,7 @@ static void make_fdt_header(struct fdt_header *fdt,
>  		fdt->size_dt_struct =3D cpu_to_fdt32(dtsize);
>  }
> =20
> -void dt_to_blob(FILE *f, struct boot_info *bi, int version)
> +void dt_to_blob(FILE *f, struct boot_info *bi, fdt32_t magic, int versio=
n)
>  {
>  	struct version_info *vi =3D NULL;
>  	int i;
> @@ -390,7 +391,7 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int ve=
rsion)
>  	reservebuf =3D flatten_reserve_list(bi->reservelist, vi);
> =20
>  	/* Make header */
> -	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
> +	make_fdt_header(&fdt, magic, vi, reservebuf.len, dtbuf.len, strbuf.len,
>  			bi->boot_cpuid_phys);
> =20
>  	/*
> @@ -467,7 +468,7 @@ static void dump_stringtable_asm(FILE *f, struct data=
 strbuf)
>  	}
>  }
> =20
> -void dt_to_asm(FILE *f, struct boot_info *bi, int version)
> +void dt_to_asm(FILE *f, struct boot_info *bi, fdt32_t magic, int version)
>  {
>  	struct version_info *vi =3D NULL;
>  	int i;
> @@ -830,6 +831,7 @@ struct boot_info *dt_from_blob(const char *fname)
>  	struct node *tree;
>  	uint32_t val;
>  	int flags =3D 0;
> +	unsigned int versionflags =3D VF_DT_V1;

Especially here calling this just 'versionflags' is potentially
confusing, since it's not related to the dtb version that we're also
dealing with in this vicinity.

>  	f =3D srcfile_relative_open(fname, NULL);
> =20
> @@ -845,9 +847,12 @@ struct boot_info *dt_from_blob(const char *fname)
>  	}
> =20
>  	magic =3D fdt32_to_cpu(magic);
> -	if (magic !=3D FDT_MAGIC)
> +	if (magic !=3D FDT_MAGIC && magic !=3D FDT_MAGIC_DTBO)
>  		die("Blob has incorrect magic number\n");
> =20
> +	if (magic =3D=3D FDT_MAGIC_DTBO)
> +		versionflags |=3D VF_PLUGIN;
> +
>  	rc =3D fread(&totalsize, sizeof(totalsize), 1, f);
>  	if (ferror(f))
>  		die("Error reading DT blob size: %s\n", strerror(errno));
> @@ -942,5 +947,5 @@ struct boot_info *dt_from_blob(const char *fname)
> =20
>  	fclose(f);
> =20
> -	return build_boot_info(reservelist, tree, boot_cpuid_phys);
> +	return build_boot_info(versionflags, reservelist, tree, boot_cpuid_phys=
);
>  }
> diff --git a/fstree.c b/fstree.c
> index 6d1beec..54f520b 100644
> --- a/fstree.c
> +++ b/fstree.c
> @@ -86,6 +86,6 @@ struct boot_info *dt_from_fs(const char *dirname)
>  	tree =3D read_fstree(dirname);
>  	tree =3D name_node(tree, "");
> =20
> -	return build_boot_info(NULL, tree, guess_boot_cpuid(tree));
> +	return build_boot_info(VF_DT_V1, NULL, tree, guess_boot_cpuid(tree));
>  }
> =20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 22286a1..28d422c 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -57,7 +57,7 @@
> =20
>  int fdt_check_header(const void *fdt)
>  {
> -	if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
> +	if (fdt_magic(fdt) =3D=3D FDT_MAGIC || fdt_magic(fdt) =3D=3D FDT_MAGIC_=
DTBO) {
>  		/* Complete tree */
>  		if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
>  			return -FDT_ERR_BADVERSION;
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index 526aedb..493cd55 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -55,7 +55,7 @@
>  #ifndef __ASSEMBLY__
> =20
>  struct fdt_header {
> -	fdt32_t magic;			 /* magic word FDT_MAGIC */
> +	fdt32_t magic;			 /* magic word FDT_MAGIC[|_DTBO] */
>  	fdt32_t totalsize;		 /* total size of DT block */
>  	fdt32_t off_dt_struct;		 /* offset to structure */
>  	fdt32_t off_dt_strings;		 /* offset to strings */
> @@ -93,6 +93,7 @@ struct fdt_property {
>  #endif /* !__ASSEMBLY */
> =20
>  #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
> +#define FDT_MAGIC_DTBO	0xd00dfdb0	/* DTBO magic */
>  #define FDT_TAGSIZE	sizeof(fdt32_t)
> =20
>  #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
> diff --git a/livetree.c b/livetree.c
> index 3dc7559..17f8310 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -296,6 +296,23 @@ void delete_node(struct node *node)
>  	delete_labels(&node->labels);
>  }
> =20
> +void append_to_property(struct node *node,
> +				    char *name, const void *data, int len)
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
> +}
> +
>  struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
>  {
>  	struct reserve_info *new =3D xmalloc(sizeof(*new));
> @@ -335,12 +352,14 @@ struct reserve_info *add_reserve_entry(struct reser=
ve_info *list,
>  	return list;
>  }
> =20
> -struct boot_info *build_boot_info(struct reserve_info *reservelist,
> +struct boot_info *build_boot_info(unsigned int versionflags,
> +				  struct reserve_info *reservelist,
>  				  struct node *tree, uint32_t boot_cpuid_phys)
>  {
>  	struct boot_info *bi;
> =20
>  	bi =3D xmalloc(sizeof(*bi));
> +	bi->versionflags =3D versionflags;
>  	bi->reservelist =3D reservelist;
>  	bi->dt =3D tree;
>  	bi->boot_cpuid_phys =3D boot_cpuid_phys;
> @@ -709,3 +728,190 @@ void sort_tree(struct boot_info *bi)
>  	sort_reserve_entries(bi);
>  	sort_node(bi->dt);
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
> +static void generate_label_tree_internal(struct boot_info *bi,
> +					 struct node *an,
> +					 struct node *node,
> +					 bool allocph)
> +{
> +	struct node *dt =3D bi->dt;
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
> +				data_copy_mem(node->fullpath,
> +						strlen(node->fullpath) + 1));
> +			add_property(an, p);
> +		}
> +
> +		/* force allocation of a phandle for this node */
> +		if (allocph)
> +			(void)get_node_phandle(dt, node);
> +	}
> +
> +	for_each_child(node, c)
> +		generate_label_tree_internal(bi, an, c, allocph);
> +}
> +
> +static void add_fixup_entry(struct boot_info *bi, struct node *fn,
> +			    struct node *node, struct property *prop,
> +			    struct marker *m)
> +{
> +	char *entry;
> +
> +	/* m->ref can only be a REF_PHANDLE, but check anyway */
> +	assert(m->type =3D=3D REF_PHANDLE);
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
> +static void generate_fixups_tree_internal(struct boot_info *bi,
> +					  struct node *fn,
> +					  struct node *node)
> +{
> +	struct node *dt =3D bi->dt;
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
> +				add_fixup_entry(bi, fn, node, prop, m);
> +		}
> +	}
> +
> +	for_each_child(node, c)
> +		generate_fixups_tree_internal(bi, fn, c);
> +}
> +
> +static void add_local_fixup_entry(struct boot_info *bi,
> +		struct node *lfn, struct node *node,
> +		struct property *prop, struct marker *m,
> +		struct node *refnode)
> +{
> +	struct node *wn, *nwn;	/* local fixup node, walk node, new */
> +	uint32_t value_32;
> +	char **compp;
> +	int i, depth;
> +
> +	/* walk back retreiving depth */
> +	depth =3D 0;
> +	for (wn =3D node; wn; wn =3D wn->parent)
> +		depth++;
> +
> +	/* allocate name array */
> +	compp =3D xmalloc(sizeof(*compp) * depth);
> +
> +	/* store names in the array */
> +	for (wn =3D node, i =3D depth - 1; wn; wn =3D wn->parent, i--)
> +		compp[i] =3D wn->name;
> +
> +	/* walk the path components creating nodes if they don't exist */
> +	for (wn =3D lfn, i =3D 1; i < depth; i++, wn =3D nwn) {
> +		/* if no node exists, create it */
> +		nwn =3D get_subnode(wn, compp[i]);
> +		if (!nwn)
> +			nwn =3D build_and_name_child_node(wn, compp[i]);
> +	}
> +
> +	free(compp);
> +
> +	value_32 =3D cpu_to_fdt32(m->offset);
> +	append_to_property(wn, prop->name, &value_32, sizeof(value_32));
> +}
> +
> +static void generate_local_fixups_tree_internal(struct boot_info *bi,
> +						struct node *lfn,
> +						struct node *node)
> +{
> +	struct node *dt =3D bi->dt;
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
> +				continue;
> +			add_local_fixup_entry(bi, lfn, node, prop, m, refnode);
> +		}
> +	}
> +
> +	for_each_child(node, c)
> +		generate_local_fixups_tree_internal(bi, lfn, c);
> +}
> +
> +static struct node *build_root_node(struct node *dt, char *name)
> +{
> +	struct node *an;
> +
> +	for_each_child(dt, an)
> +		if (streq(name, an->name))
> +			break;
> +
> +	if (!an)
> +		an =3D build_and_name_child_node(dt, name);
> +
> +	if (!an)
> +		die("Could not build root node /%s\n", name);
> +
> +	return an;
> +}
> +
> +void generate_label_tree(struct boot_info *bi, char *name, bool allocph)
> +{
> +	generate_label_tree_internal(bi, build_root_node(bi->dt, name),
> +				     bi->dt, allocph);
> +}
> +
> +void generate_fixups_tree(struct boot_info *bi, char *name)
> +{
> +	generate_fixups_tree_internal(bi, build_root_node(bi->dt, name),
> +				      bi->dt);
> +}
> +
> +void generate_local_fixups_tree(struct boot_info *bi, char *name)
> +{
> +	generate_local_fixups_tree_internal(bi, build_root_node(bi->dt, name),
> +					    bi->dt);
> +}
> diff --git a/tests/mangle-layout.c b/tests/mangle-layout.c
> index a76e51e..d29ebc6 100644
> --- a/tests/mangle-layout.c
> +++ b/tests/mangle-layout.c
> @@ -42,7 +42,8 @@ static void expand_buf(struct bufstate *buf, int newsiz=
e)
>  	buf->size =3D newsize;
>  }
> =20
> -static void new_header(struct bufstate *buf, int version, const void *fd=
t)
> +static void new_header(struct bufstate *buf, fdt32_t magic, int version,
> +		       const void *fdt)
>  {
>  	int hdrsize;
> =20
> @@ -56,7 +57,7 @@ static void new_header(struct bufstate *buf, int versio=
n, const void *fdt)
>  	expand_buf(buf, hdrsize);
>  	memset(buf->buf, 0, hdrsize);
> =20
> -	fdt_set_magic(buf->buf, FDT_MAGIC);
> +	fdt_set_magic(buf->buf, magic);
>  	fdt_set_version(buf->buf, version);
>  	fdt_set_last_comp_version(buf->buf, 16);
>  	fdt_set_boot_cpuid_phys(buf->buf, fdt_boot_cpuid_phys(fdt));
> @@ -145,7 +146,7 @@ int main(int argc, char *argv[])
>  	if (fdt_version(fdt) < 17)
>  		CONFIG("Input tree must be v17");
> =20
> -	new_header(&buf, version, fdt);
> +	new_header(&buf, FDT_MAGIC, version, fdt);
> =20
>  	while (*blockorder) {
>  		add_block(&buf, version, *blockorder, fdt);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYPOo2AAoJEGw4ysog2bOSDu8QANxdi78ZbY21snzxFOsq1hen
KD5Fh2mmHhBWGww6iwJs4D76sCzvsHmYn4LWGw3yAmWoS+i8Rr0ZcN/4XGlqA4k/
xgN1seuaWHakm5Ju1cw2i9MIaAOZ4LVb33e3F1iJjZL7HSi5z4KgKNTZlRwK3ClQ
QACxWuKrEc6D56R+TxkblYm9gnUxCMuqLqoEK0skwrKoSxBjdJLRCsNdisFLupzM
uWfEhbGojTWMpQayTKlcCewHP1/RwMiyO9tJXwQS/qkRtRxpaCD7vw3ehYZgpWUL
VFY6ljaEUQ8NwBg6FmeJbOl8nYyrYQ2Z9ZSdqFAy6EVe40Vfj2dUSKki0uybkEzV
1jYeymcbb6BJLklc1ix9K10B1rOmTWTZUeL2ka+WKgQniL+fqxdPqN16MtaruvW4
cbShRTAIk6IhMzqle9wpeI08vbwjGMz8WcL5kZn7UQ92SjF6snEI+MSG5KtpgMvO
YVWpmRFPK21EYsxeeUcT9BQ4m/COyl+tCeoLDcpNscYCraSl0RFgM/bYf8EgY9mG
abyOk38+AFJ58DgoVsNtW9Ay89n2EDBPKYicpuDqa2/GK7xIGom7iJtD4Bu4j9bn
sBT250k/+KLxWmEfDZcQIJTqQ01okb2hWT7kecFounFqLcgHm28B0VomznpPI7FR
phpZ81bJglZdBVXpNQNi
=AeVJ
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
