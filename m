From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Wed, 30 Nov 2016 11:00:37 +0200
Message-ID: <4BC5782D-2A69-4EB4-9ABE-E2B3F9334373@konsulko.com>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com> <1480077131-14526-4-git-send-email-pantelis.antoniou@konsulko.com> <20161128041228.GJ30927@umbus.fritz.box> <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A@konsulko.com> <20161129021028.GC13307@umbus.fritz.box> <CC3401F7-9DE7-4913-8FE6-DB1E89E20A3A@konsulko.com> <20161130015007.GG19891@umbus>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161130015007.GG19891@umbus>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

> On Nov 30, 2016, at 03:50 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
>=20
> On Tue, Nov 29, 2016 at 01:09:11PM +0200, Pantelis Antoniou wrote:
>> Hi David,
>>=20
>>> On Nov 29, 2016, at 04:10 , David Gibson =
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>>>=20
>>> On Mon, Nov 28, 2016 at 02:10:35PM +0200, Pantelis Antoniou wrote:
>>>>=20
>>>>> On Nov 28, 2016, at 06:12 , David Gibson =
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>>>>>=20
>>>>> On Fri, Nov 25, 2016 at 02:32:10PM +0200, Pantelis Antoniou wrote:
>>>>>> This patch enable the generation of symbols & local fixup =
information
>>>>>> for trees compiled with the -@ (--symbols) option.
>>>>>>=20
>>>>>> Using this patch labels in the tree and their users emit =
information
>>>>>> in __symbols__ and __local_fixups__ nodes.
>>>>>>=20
>>>>>> The __fixups__ node make possible the dynamic resolution of =
phandle
>>>>>> references which are present in the plugin tree but lie in the
>>>>>> tree that are applying the overlay against.
>>>>>>=20
>>>>>> While there is a new magic number for dynamic device =
tree/overlays blobs
>>>>>> it is by default enabled. Remember to use -M to generate =
compatible
>>>>>> blobs.
>>>>>>=20
>>>>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>>>>> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>>>>> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>>>>> ---
>>>>>> Documentation/manual.txt |  25 +++++-
>>>>>> checks.c                 |   8 +-
>>>>>> dtc-lexer.l              |   5 ++
>>>>>> dtc-parser.y             |  50 +++++++++--
>>>>>> dtc.c                    |  39 +++++++-
>>>>>> dtc.h                    |  20 ++++-
>>>>>> fdtdump.c                |   2 +-
>>>>>> flattree.c               |  17 ++--
>>>>>> fstree.c                 |   2 +-
>>>>>> libfdt/fdt.c             |   2 +-
>>>>>> libfdt/fdt.h             |   3 +-
>>>>>> livetree.c               | 225 =
++++++++++++++++++++++++++++++++++++++++++++++-
>>>>>> tests/mangle-layout.c    |   7 +-
>>>>>> 13 files changed, 375 insertions(+), 30 deletions(-)
>>>>>>=20
>>>>>> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
>>>>>> index 398de32..094893b 100644
>>>>>> --- a/Documentation/manual.txt
>>>>>> +++ b/Documentation/manual.txt
>>>>>> @@ -119,6 +119,24 @@ Options:
>>>>>> 	Make space for <number> reserve map entries
>>>>>> 	Relevant for dtb and asm output only.
>>>>>>=20
>>>>>> +    -@
>>>>>> +	Generates a __symbols__ node at the root node of the =
resulting blob
>>>>>> +	for any node labels used, and for any local references =
using phandles
>>>>>> +	it also generates a __local_fixups__ node that tracks =
them.
>>>>>> +
>>>>>> +	When using the /plugin/ tag all unresolved label =
references to
>>>>>> +	be tracked in the __fixups__ node, making dynamic =
resolution possible.
>>>>>> +
>>>>>> +    -A
>>>>>> +	Generate automatically aliases for all node labels. This =
is similar to
>>>>>> +	the -@ option (the __symbols__ node contain identical =
information) but
>>>>>> +	the semantics are slightly different since no phandles =
are automatically
>>>>>> +	generated for labeled nodes.
>>>>>> +
>>>>>> +    -M
>>>>>> +	Generate blobs with the old FDT magic number for device =
tree objects.
>>>>>> +	By default blobs use the DTBO FDT magic number instead.
>>>>>> +
>>>>>>   -S <bytes>
>>>>>> 	Ensure the blob at least <bytes> long, adding additional
>>>>>> 	space if needed.
>>>>>> @@ -146,13 +164,18 @@ Additionally, dtc performs various sanity =
checks on the tree.
>>>>>> Here is a very rough overview of the layout of a DTS source file:
>>>>>>=20
>>>>>>=20
>>>>>> -    sourcefile:   list_of_memreserve devicetree
>>>>>> +    sourcefile:   versioninfo plugindecl list_of_memreserve =
devicetree
>>>>>>=20
>>>>>>   memreserve:   label 'memreserve' ADDR ADDR ';'
>>>>>> 		| label 'memreserve' ADDR '-' ADDR ';'
>>>>>>=20
>>>>>>   devicetree:   '/' nodedef
>>>>>>=20
>>>>>> +    versioninfo:  '/' 'dts-v1' '/' ';'
>>>>>> +
>>>>>> +    plugindecl:   '/' 'plugin' '/' ';'
>>>>>> +                | /* empty */
>>>>>> +
>>>>>>   nodedef:      '{' list_of_property list_of_subnode '}' ';'
>>>>>>=20
>>>>>>   property:     label PROPNAME '=3D' propdata ';'
>>>>>> diff --git a/checks.c b/checks.c
>>>>>> index 2bd27a4..4292f4b 100644
>>>>>> --- a/checks.c
>>>>>> +++ b/checks.c
>>>>>> @@ -487,8 +487,12 @@ static void fixup_phandle_references(struct =
check *c, struct boot_info *bi,
>>>>>>=20
>>>>>> 			refnode =3D get_node_by_ref(dt, m->ref);
>>>>>> 			if (! refnode) {
>>>>>> -				FAIL(c, "Reference to =
non-existent node or label \"%s\"\n",
>>>>>> -				     m->ref);
>>>>>> +				if (!(bi->versionflags & =
VF_PLUGIN))
>>>>>> +					FAIL(c, "Reference to =
non-existent node or "
>>>>>> +							"label =
\"%s\"\n", m->ref);
>>>>>> +				else /* mark the entry as =
unresolved */
>>>>>> +					*((cell_t =
*)(prop->val.val + m->offset)) =3D
>>>>>> +						=
cpu_to_fdt32(0xffffffff);
>>>>>> 				continue;
>>>>>> 			}
>>>>>>=20
>>>>>> diff --git a/dtc-lexer.l b/dtc-lexer.l
>>>>>> index 790fbf6..40bbc87 100644
>>>>>> --- a/dtc-lexer.l
>>>>>> +++ b/dtc-lexer.l
>>>>>> @@ -121,6 +121,11 @@ static void lexical_error(const char *fmt, =
...);
>>>>>> 			return DT_V1;
>>>>>> 		}
>>>>>>=20
>>>>>> +<*>"/plugin/"	{
>>>>>> +			DPRINT("Keyword: /plugin/\n");
>>>>>> +			return DT_PLUGIN;
>>>>>> +		}
>>>>>> +
>>>>>> <*>"/memreserve/"	{
>>>>>> 			DPRINT("Keyword: /memreserve/\n");
>>>>>> 			BEGIN_DEFAULT();
>>>>>> diff --git a/dtc-parser.y b/dtc-parser.y
>>>>>> index 14aaf2e..1a1f660 100644
>>>>>> --- a/dtc-parser.y
>>>>>> +++ b/dtc-parser.y
>>>>>> @@ -19,6 +19,7 @@
>>>>>> */
>>>>>> %{
>>>>>> #include <stdio.h>
>>>>>> +#include <inttypes.h>
>>>>>>=20
>>>>>> #include "dtc.h"
>>>>>> #include "srcpos.h"
>>>>>> @@ -33,6 +34,7 @@ extern void yyerror(char const *s);
>>>>>>=20
>>>>>> extern struct boot_info *the_boot_info;
>>>>>> extern bool treesource_error;
>>>>>> +
>>>>>=20
>>>>> Extraneous whitespace change here
>>>>>=20
>>>>=20
>>>> OK.
>>>>=20
>>>>>> %}
>>>>>>=20
>>>>>> %union {
>>>>>> @@ -52,9 +54,11 @@ extern bool treesource_error;
>>>>>> 	struct node *nodelist;
>>>>>> 	struct reserve_info *re;
>>>>>> 	uint64_t integer;
>>>>>> +	unsigned int flags;
>>>>>> }
>>>>>>=20
>>>>>> %token DT_V1
>>>>>> +%token DT_PLUGIN
>>>>>> %token DT_MEMRESERVE
>>>>>> %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
>>>>>> %token DT_BITS
>>>>>> @@ -71,6 +75,8 @@ extern bool treesource_error;
>>>>>>=20
>>>>>> %type <data> propdata
>>>>>> %type <data> propdataprefix
>>>>>> +%type <flags> versioninfo
>>>>>> +%type <flags> plugindecl
>>>>>> %type <re> memreserve
>>>>>> %type <re> memreserves
>>>>>> %type <array> arrayprefix
>>>>>> @@ -101,16 +107,34 @@ extern bool treesource_error;
>>>>>> %%
>>>>>>=20
>>>>>> sourcefile:
>>>>>> -	  v1tag memreserves devicetree
>>>>>> +	  versioninfo plugindecl memreserves devicetree
>>>>>> +		{
>>>>>> +			the_boot_info =3D build_boot_info($1 | =
$2, $3, $4,
>>>>>> +							=
guess_boot_cpuid($4));
>>>>>> +		}
>>>>>> +	;
>>>>>> +
>>>>>> +versioninfo:
>>>>>> +	v1tag
>>>>>> 		{
>>>>>> -			the_boot_info =3D build_boot_info($2, =
$3,
>>>>>> -							=
guess_boot_cpuid($3));
>>>>>> +			$$ =3D VF_DT_V1;
>>>>>> 		}
>>>>>> 	;
>>>>>>=20
>>>>>> v1tag:
>>>>>> 	  DT_V1 ';'
>>>>>> +	| DT_V1
>>>>>> 	| DT_V1 ';' v1tag
>>>>>> +
>>>>>> +plugindecl:
>>>>>> +	DT_PLUGIN ';'
>>>>>> +		{
>>>>>> +			$$ =3D VF_PLUGIN;
>>>>>> +		}
>>>>>> +	| /* empty */
>>>>>> +		{
>>>>>> +			$$ =3D 0;
>>>>>> +		}
>>>>>> 	;
>>>>>>=20
>>>>>> memreserves:
>>>>>> @@ -161,10 +185,19 @@ devicetree:
>>>>>> 		{
>>>>>> 			struct node *target =3D get_node_by_ref($1, $2);
>>>>>>=20
>>>>>> -			if (target)
>>>>>> +			if (target) {
>>>>>> 				merge_nodes(target, $3);
>>>>>> -			else
>>>>>> -				ERROR(&@2, "Label or path %s not =
found", $2);
>>>>>> +			} else {
>>>>>> +				/*
>>>>>> +				 * We rely on the rule being =
always:
>>>>>> +				 *   versioninfo plugindecl =
memreserves devicetree
>>>>>> +				 * so $-1 is what we want =
(plugindecl)
>>>>>> +				 */
>>>>>> +				if ($<flags>-1 & VF_PLUGIN)
>>>>>=20
>>>>> o_O... ok.  I've never seen negative value references before.  Can =
you
>>>>> provide a link to some documentation saying this is actually =
supported
>>>>> usage in bison?  I wasn't able to find it when I looked.
>>>>>=20
>>>>=20
>>>> There is a section about inherited attributes in the flex & bison =
book by O=E2=80=99Reily.
>>>>=20
>>>> =
https://books.google.gr/books?id=3D3Sr1V5J9_qMC&lpg=3DPP1&dq=3Dflex%20biso=
n&hl=3Del&pg=3DPP1#v=3Donepage&q=3Dflex%20bison&f=3Dfalse
>>>>=20
>>>> There=E2=80=99s a direct link to the 2nd Edition of lex & yacc:
>>>>=20
>>>> =
https://books.google.gr/books?id=3DfMPxfWfe67EC&lpg=3DPA183&ots=3DRcRSji2N=
AT&dq=3Dyacc%20inherited%20attributes&hl=3Del&pg=3DPA183#v=3Donepage&q=3Dy=
acc%20inherited%20attributes&f=3Dfalse
>>>=20
>>> Thanks for the link.  I still think moving the fragment assembly out
>>> of the parser will be a better idea long term, but this does address
>>> the main concern I had, so it will do for now.
>>>=20
>>>>>> +					add_orphan_node($1, $3, =
$2);
>>>>>> +				else
>>>>>> +					ERROR(&@2, "Label or =
path %s not found", $2);
>>>>>> +			}
>>>>>> 			$$ =3D $1;
>>>>>> 		}
>>>>>> 	| devicetree DT_DEL_NODE DT_REF ';'
>>>>>> @@ -179,6 +212,11 @@ devicetree:
>>>>>>=20
>>>>>> 			$$ =3D $1;
>>>>>> 		}
>>>>>> +	| /* empty */
>>>>>> +		{
>>>>>> +			/* build empty node */
>>>>>> +			$$ =3D name_node(build_node(NULL, NULL), =
"");
>>>>>> +		}
>>>>>> 	;
>>>>>>=20
>>>>>> nodedef:
>>>>>> diff --git a/dtc.c b/dtc.c
>>>>>> index 9dcf640..06e91bc 100644
>>>>>> --- a/dtc.c
>>>>>> +++ b/dtc.c
>>>>>> @@ -32,6 +32,9 @@ int minsize;		/* Minimum blob size */
>>>>>> int padsize;		/* Additional padding to blob */
>>>>>> int alignsize;		/* Additional padding to blob accroding =
to the alignsize */
>>>>>> int phandle_format =3D PHANDLE_BOTH;	/* Use linux,phandle or =
phandle properties */
>>>>>> +int symbol_fixup_support;	/* enable symbols & fixup =
support */
>>>>>> +int auto_label_aliases;		/* auto generate labels -> =
aliases */
>>>>>> +int no_dtbo_magic;		/* use old FDT magic values for =
objects */
>>>>>>=20
>>>>>> static int is_power_of_2(int x)
>>>>>> {
>>>>>> @@ -59,7 +62,7 @@ static void fill_fullpaths(struct node *tree, =
const char *prefix)
>>>>>> #define FDT_VERSION(version)	_FDT_VERSION(version)
>>>>>> #define _FDT_VERSION(version)	#version
>>>>>> static const char usage_synopsis[] =3D "dtc [options] <input =
file>";
>>>>>> -static const char usage_short_opts[] =3D =
"qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:hv";
>>>>>> +static const char usage_short_opts[] =3D =
"qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@AMhv";
>>>>>> static struct option const usage_long_opts[] =3D {
>>>>>> 	{"quiet",            no_argument, NULL, 'q'},
>>>>>> 	{"in-format",         a_argument, NULL, 'I'},
>>>>>> @@ -78,6 +81,9 @@ static struct option const usage_long_opts[] =3D =
{
>>>>>> 	{"phandle",           a_argument, NULL, 'H'},
>>>>>> 	{"warning",           a_argument, NULL, 'W'},
>>>>>> 	{"error",             a_argument, NULL, 'E'},
>>>>>> +	{"symbols",	     no_argument, NULL, '@'},
>>>>>> +	{"auto-alias",       no_argument, NULL, 'A'},
>>>>>> +	{"no-dtbo-magic",    no_argument, NULL, 'M'},
>>>>>> 	{"help",             no_argument, NULL, 'h'},
>>>>>> 	{"version",          no_argument, NULL, 'v'},
>>>>>> 	{NULL,               no_argument, NULL, 0x0},
>>>>>> @@ -109,6 +115,9 @@ static const char * const usage_opts_help[] =3D=
 {
>>>>>> 	 "\t\tboth   - Both \"linux,phandle\" and \"phandle\" =
properties",
>>>>>> 	"\n\tEnable/disable warnings (prefix with \"no-\")",
>>>>>> 	"\n\tEnable/disable errors (prefix with \"no-\")",
>>>>>> +	"\n\tEnable symbols/fixup support",
>>>>>> +	"\n\tEnable auto-alias of labels",
>>>>>> +	"\n\tDo not use DTBO magic value for plugin objects",
>>>>>> 	"\n\tPrint this help and exit",
>>>>>> 	"\n\tPrint version and exit",
>>>>>> 	NULL,
>>>>>> @@ -153,7 +162,7 @@ static const char *guess_input_format(const =
char *fname, const char *fallback)
>>>>>> 	fclose(f);
>>>>>>=20
>>>>>> 	magic =3D fdt32_to_cpu(magic);
>>>>>> -	if (magic =3D=3D FDT_MAGIC)
>>>>>> +	if (magic =3D=3D FDT_MAGIC || magic =3D=3D =
FDT_MAGIC_DTBO)
>>>>>> 		return "dtb";
>>>>>>=20
>>>>>> 	return guess_type_by_name(fname, fallback);
>>>>>> @@ -172,6 +181,7 @@ int main(int argc, char *argv[])
>>>>>> 	FILE *outf =3D NULL;
>>>>>> 	int outversion =3D DEFAULT_FDT_VERSION;
>>>>>> 	long long cmdline_boot_cpuid =3D -1;
>>>>>> +	fdt32_t out_magic =3D FDT_MAGIC;
>>>>>>=20
>>>>>> 	quiet      =3D 0;
>>>>>> 	reservenum =3D 0;
>>>>>> @@ -249,6 +259,16 @@ int main(int argc, char *argv[])
>>>>>> 			parse_checks_option(false, true, optarg);
>>>>>> 			break;
>>>>>>=20
>>>>>> +		case '@':
>>>>>> +			symbol_fixup_support =3D 1;
>>>>>> +			break;
>>>>>> +		case 'A':
>>>>>> +			auto_label_aliases =3D 1;
>>>>>> +			break;
>>>>>> +		case 'M':
>>>>>> +			no_dtbo_magic =3D 1;
>>>>>> +			break;
>>>>>> +
>>>>>> 		case 'h':
>>>>>> 			usage(NULL);
>>>>>> 		default:
>>>>>> @@ -306,6 +326,14 @@ int main(int argc, char *argv[])
>>>>>> 	fill_fullpaths(bi->dt, "");
>>>>>> 	process_checks(force, bi);
>>>>>>=20
>>>>>> +	if (auto_label_aliases)
>>>>>> +		generate_label_tree(bi->dt, "aliases", false);
>>>>>> +
>>>>>> +	if (symbol_fixup_support) {
>>>>>> +		generate_label_tree(bi->dt, "__symbols__", =
true);
>>>>>> +		generate_fixups_tree(bi->dt);
>>>>>=20
>>>>> Hang on.. this doesn't seem right.  I thought -@ controlled the
>>>>> __symbols__ side (i.e. the part upon which we overlay) rather than =
the
>>>>> fixups side (the part which overlays).  A dtbo could certainly =
have
>>>>> both, of course, but for base trees, wouldn't you have symbols =
without
>>>>> fixups?  And should it be illegal to try to build a /plugin/ =
without
>>>>> -@?
>>>>=20
>>>> It does control both for now. For base trees having the fixup nodes
>>>> will allow us to do probe order dependency tracking in the future.
>>>=20
>>> Erm.. how?
>>>=20
>>>> For plugins we need the __symbols__ node to support stacked =
overlays, i.e.
>>>> overlays referring label that were introduced by a previous =
overlay.
>>>=20
>>> Yes, I realise that an overlay may well want __symbols__ as well.  =
But
>>> they still seem conceptually different.  I think -@ should control
>>> __symbols__ whereas /plugin/ should control __fixups__.
>>>=20
>>=20
>> It is easily done. Although using /plugin/ as an auto-magic option =
does both
>> just fine.
>=20
> Sorry, I don't follow what you're saying.
>=20

The last patch uses the /plugin/ tag to turn on the options that are =
required
(both symbols & fixups)

>>>> For plugins there is no requirement for now to actually contain =
references to
>>>> be resolved. It can easily be enforced though.
>>>=20
>>> Sure, but I don't see the relevance of that here.  You could just =
omit
>>> the __fixups__ node if there's nothing to go into them.
>>>=20
>>=20
>> Hmm, yeah.
>>=20
>>=20
>> Regards
>>=20
>> =E2=80=94 Pantelis
>>=20
>=20
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
