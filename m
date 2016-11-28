From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v9 3/4] dtc: Plugin and fixup support
Date: Mon, 28 Nov 2016 13:32:52 +1100
Message-ID: <20161128023252.GH30927@umbus.fritz.box>
References: <1479990693-14260-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1479990693-14260-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20161125041124.GB12287@umbus.fritz.box>
 <B39EF108-E592-4345-A5A7-951883AA099B@konsulko.com>
 <20161125112613.GK12287@umbus.fritz.box>
 <AB914E20-1F16-441B-9D7C-5A7298E963A6@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="G3juXO9GfR42w+sw"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AB914E20-1F16-441B-9D7C-5A7298E963A6-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--G3juXO9GfR42w+sw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2016 at 02:44:39PM +0200, Pantelis Antoniou wrote:
> Hi David,
>=20
> > On Nov 25, 2016, at 13:26 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >=20
> > On Fri, Nov 25, 2016 at 12:55:25PM +0200, Pantelis Antoniou wrote:
> >> Hi David,
> >>=20
> >>> On Nov 25, 2016, at 06:11 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org=
> wrote:
> >>>=20
> >>> On Thu, Nov 24, 2016 at 02:31:32PM +0200, Pantelis Antoniou wrote:
> >>>> This patch enable the generation of symbols & local fixup information
> >>>> for trees compiled with the -@ (--symbols) option.
> >>>>=20
> >>>> Using this patch labels in the tree and their users emit information
> >>>> in __symbols__ and __local_fixups__ nodes.
> >>>>=20
> >>>> The __fixups__ node make possible the dynamic resolution of phandle
> >>>> references which are present in the plugin tree but lie in the
> >>>> tree that are applying the overlay against.
> >>>>=20
> >>>> While there is a new magic number for dynamic device tree/overlays b=
lobs
> >>>> it is by default disabled. This is in order to give time for DT blob
> >>>> methods to be updated.
> >>>>=20
> >>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >>>> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >>>> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >>>> ---
> >>>> Documentation/manual.txt |  25 +++++-
> >>>> checks.c                 |   8 +-
> >>>> dtc-lexer.l              |   5 ++
> >>>> dtc-parser.y             |  49 +++++++++--
> >>>> dtc.c                    |  39 +++++++-
> >>>> dtc.h                    |  20 ++++-
> >>>> fdtdump.c                |   2 +-
> >>>> flattree.c               |  17 ++--
> >>>> fstree.c                 |   2 +-
> >>>> libfdt/fdt.c             |   2 +-
> >>>> libfdt/fdt.h             |   3 +-
> >>>> livetree.c               | 225 +++++++++++++++++++++++++++++++++++++=
+++++++++-
> >>>> tests/mangle-layout.c    |   7 +-
> >>>> treesource.c             |   7 +-
> >>>> 14 files changed, 380 insertions(+), 31 deletions(-)
> >>>>=20
> >>>> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> >>>> index 398de32..65fbf09 100644
> >>>> --- a/Documentation/manual.txt
> >>>> +++ b/Documentation/manual.txt
> >>>> @@ -119,6 +119,24 @@ Options:
> >>>> 	Make space for <number> reserve map entries
> >>>> 	Relevant for dtb and asm output only.
> >>>>=20
> >>>> +    -@
> >>>> +	Generates a __symbols__ node at the root node of the resulting blob
> >>>> +	for any node labels used, and for any local references using phand=
les
> >>>> +	it also generates a __local_fixups__ node that tracks them.
> >>>> +
> >>>> +	When using the /plugin/ tag all unresolved label references to
> >>>> +	be tracked in the __fixups__ node, making dynamic resolution possi=
ble.
> >>>> +
> >>>> +    -A
> >>>> +	Generate automatically aliases for all node labels. This is simila=
r to
> >>>> +	the -@ option (the __symbols__ node contain identical information)=
 but
> >>>> +	the semantics are slightly different since no phandles are automat=
ically
> >>>> +	generated for labeled nodes.
> >>>> +
> >>>> +    -M
> >>>> +	Generate blobs with the new FDT magic number. By default blobs wit=
h the
> >>>> +	standard FDT magic number are generated.
> >>>=20
> >>> First, this description is incomplete since -M *only* affects the
> >>> magic number for /plugin/ input, not in other cases.  Second, the
> >>> default is the wrong way around.  If we make old-style the default,
> >>> then new-style will never be used, which defeats the purpose.
> >>=20
> >> Then we=E2=80=99ll break user-space that has this assumption (i.e. tha=
t the magic is the same).
> >> I can certainly do it the other way around.
> >=20
> > Which userspace in particular?
> >=20
>=20
> Kernel unflatteners in various OSes/bootloaders? All those would have to =
be updated since
> they don=E2=80=99t grok the new magic number.

Those will certainly need dtbs with the old magic number as input, but
I don't see how that affects the dtc default.  Using the option
explicitly if you're targetting a bootloader that hasn't been updated
seems reasonable.

> >>>> +
> >>>>    -S <bytes>
> >>>> 	Ensure the blob at least <bytes> long, adding additional
> >>>> 	space if needed.
> >>>> @@ -146,13 +164,18 @@ Additionally, dtc performs various sanity chec=
ks on the tree.
> >>>> Here is a very rough overview of the layout of a DTS source file:
> >>>>=20
> >>>>=20
> >>>> -    sourcefile:   list_of_memreserve devicetree
> >>>> +    sourcefile:   versioninfo plugindecl list_of_memreserve devicet=
ree
> >>>>=20
> >>>>    memreserve:   label 'memreserve' ADDR ADDR ';'
> >>>> 		| label 'memreserve' ADDR '-' ADDR ';'
> >>>>=20
> >>>>    devicetree:   '/' nodedef
> >>>>=20
> >>>> +    versioninfo:  '/' 'dts-v1' '/' ';'
> >>>> +
> >>>> +    plugindecl:   '/' 'plugin' '/' ';'
> >>>> +                | /* empty */
> >>>> +
> >>>>    nodedef:      '{' list_of_property list_of_subnode '}' ';'
> >>>>=20
> >>>>    property:     label PROPNAME '=3D' propdata ';'
> >>>> diff --git a/checks.c b/checks.c
> >>>> index 609975a..bc03d42 100644
> >>>> --- a/checks.c
> >>>> +++ b/checks.c
> >>>> @@ -486,8 +486,12 @@ static void fixup_phandle_references(struct che=
ck *c, struct boot_info *bi,
> >>>>=20
> >>>> 			refnode =3D get_node_by_ref(dt, m->ref);
> >>>> 			if (! refnode) {
> >>>> -				FAIL(c, "Reference to non-existent node or label \"%s\"\n",
> >>>> -				     m->ref);
> >>>> +				if (!(bi->versionflags & VF_PLUGIN))
> >>>> +					FAIL(c, "Reference to non-existent node or "
> >>>> +							"label \"%s\"\n", m->ref);
> >>>> +				else /* mark the entry as unresolved */
> >>>> +					*((cell_t *)(prop->val.val + m->offset)) =3D
> >>>> +						cpu_to_fdt32(0xffffffff);
> >>>> 				continue;
> >>>> 			}
> >>>>=20
> >>>> diff --git a/dtc-lexer.l b/dtc-lexer.l
> >>>> index 790fbf6..40bbc87 100644
> >>>> --- a/dtc-lexer.l
> >>>> +++ b/dtc-lexer.l
> >>>> @@ -121,6 +121,11 @@ static void lexical_error(const char *fmt, ...);
> >>>> 			return DT_V1;
> >>>> 		}
> >>>>=20
> >>>> +<*>"/plugin/"	{
> >>>> +			DPRINT("Keyword: /plugin/\n");
> >>>> +			return DT_PLUGIN;
> >>>> +		}
> >>>> +
> >>>> <*>"/memreserve/"	{
> >>>> 			DPRINT("Keyword: /memreserve/\n");
> >>>> 			BEGIN_DEFAULT();
> >>>> diff --git a/dtc-parser.y b/dtc-parser.y
> >>>> index 14aaf2e..4afc592 100644
> >>>> --- a/dtc-parser.y
> >>>> +++ b/dtc-parser.y
> >>>> @@ -19,6 +19,7 @@
> >>>> */
> >>>> %{
> >>>> #include <stdio.h>
> >>>> +#include <inttypes.h>
> >>>>=20
> >>>> #include "dtc.h"
> >>>> #include "srcpos.h"
> >>>> @@ -33,6 +34,9 @@ extern void yyerror(char const *s);
> >>>>=20
> >>>> extern struct boot_info *the_boot_info;
> >>>> extern bool treesource_error;
> >>>> +
> >>>> +/* temporary while the tree is not built */
> >>>> +static unsigned int the_versionflags;
> >>>=20
> >>> Hrm.  Using a global during parsing is pretty dangerous - it makes
> >>> assumptions about the order in which bison will execute semantic
> >>> actions that may not always be correct.
> >>>=20
> >>> It'll probably work in practice, so I *might* be convinced it's
> >>> adequate for a first cut.  I'm a bit reluctant though, since I suspect
> >>> once merged it will become entrenched.
> >>>=20
> >>=20
> >> We use bison, globals are the way of life. It=E2=80=99s not going to b=
e used
> >> anywhere else, it=E2=80=99s static in the parser file.
> >=20
> > Using globals to communicate the final result is inevitable (well, not
> > without using the whole different re-entrant interface stuff).  That
> > just assumes that the start symbol's semantic action is executed
> > before the parser competes, which is guaranteed.
> >=20
> > This is a different matter - using a global to communicate between
> > different parts of the parser.  More specifically different parts of
> > the parser that are in different arms of the parse tree.  That makes
> > assumptions about the relative order of semantic actions which are
> > *not* guaranteed.  In theory the parser could generate the entire
> > parse tree and semantic action dependency graph, then execute them in
> > an arbitrary order (well, it would have to be a topologically sorted
> > order, but that won't help).
> >=20
>=20
> I=E2=80=99ve given it a little bit more thought and it=E2=80=99s easily f=
ixed by using
> inherited attributes which is safe to do and avoid the global all togethe=
r.

Hmm.. we'll see.

> >> We could allocate the boot_info earlier (when the v1tag is detected) b=
ut
> >> that would be quite a big change for something as trivial.=20
> >=20
> > That wouldn't help.  You still wouldn't have a guarantee on the order
> > between setting the version flags and using the version flags.
> >=20
> >>> The correct way to handle this, IMO, is not to ever attempt to apply
> >>> overlays during the parse.  Basically, we'd change the overall
> >>> structure so that the output from the parser is not a single tree, but
> >>> a list of overlays / fragments.  Then, once the parse is complete, so
> >>> versioninfo (which could now become a member of bootinfo) is well
> >>> defined, we either apply the fragments in place (base tree) or encode
> >>> them into the overlay structure (plugin mode).
> >>>=20
> >>> See https://github.com/dgibson/dtc/tree/overlay for some incomplete
> >>> work I did in this direction.
> >>>=20
> >>=20
> >> This tree is pretty stale; last commit was back in march.
> >=20
> > Yes, it was a while since I worked on it.  It rebased clean, though.
> >=20
> >> I thing there=E2=80=99s a wrong assumption here. The purpose of this p=
atch is not
> >> to apply overlays during compile time, is to generate a blob that can =
be
> >> applied at runtime by another piece of software.
> >=20
> > No, I realise what you're doing.  But the input is in the form of a
> > batch of overlays, regardless.  You then have two modes of operation:
> > for base trees you resolve those overlays during the compile, for
> > plugins you assemble those overlays into a blob which can be applied
> > later.
> >=20
> > Because it wasn't designed with runtime overlays in mind, the current
> > code handles the resolution of those overlays during the parse.  Your
> > patch extends that by rather than resolving them, just putting them
> > together with metadata into the dtbo.
> >=20
> > I'm saying that resolution or assembly should be moved out of the
> > parser.  Instead, the parser output would be an (ordered) list of
> > overlay fragments.  In the main program the two modes of operation
> > become explicit: for base trees we resolve the overlays into a single
> > tree, for plugins we collate the pieces into the dtbo format.
>=20
> The case for building an overlay is only for the syntactic sugar version.

I don't understand what you're saying here.

> This is not the common use case at all. I could easily remove it and then
> there would be no overlays built at all in the parser.

Remove what exactly?  You mean the case with &ref { } when you're not
building a dtbo?  I'm not sure that is so uncommon - dts include files
are basically useless without it.

> In fact the extra fixup nodes are generated now after the parse stage,
> after the check stage and before the sort stage.

Yes.. I'm not talking about the fixup nodes, I'm talking about the
assembly of the tree fragments.

> Perhaps it should be separated out so that we don=E2=80=99t get sidetrack=
ed?

What exactly should be separated out from what?

> >>> In addition to not making unsafe assumptions about parser operation, I
> >>> think this will also allow for better error reporting.  It also moves
> >>> more code into plain-old-C instead of potentially hard to follow bison
> >>> code fragments.
> >>>=20
> >>=20
> >> We don=E2=80=99t try to apply overlays during parse, and especially in=
 the parse code.
> >=20
> > The existing code does this, and you don't change it.  Furthermore you
> > absolutely do do the assembly of the fragments within the parser -
> > that's exactly what add_orphan_node() called directly from semantic
> > actions does.  To verify this, all you need to do is look at the
> > parser output: the boot_info structure has just a single tree, not a
> > list of overlays.
> >=20
>=20
> Only for the un-common case.
>=20
> >> The global is used only for the syntactic sugar method of turning a &r=
ef { };
> >> node into an overlay.
> >=20
> > I'm saying that treating that as mere syntactic sugar is a fundamental
> > error in design.  We could get away with it when the &ref {} stuff was
> > always resolved immediately.  Now that that resolution can be delayed
> > until later, it gets worse.  We should move that resolution outside of
> > the parser.
> >=20
>=20
> The &ref { } stuff is sidetracking us. This is not the core issue.

You haven't convinced me of that.

> In fact out in the community there are not a lot of cases where it
> is used.

I thought it was the standard way to construct a dtbo.

But in any case, regardless of how common it is, it is currently
introducing an order dependency between different parts of the parse
tree that hasn't been adequately handled (in v9, I'll reasses when I
review the v10 patches).

> >>>> diff --git a/treesource.c b/treesource.c
> >>>> index a55d1d1..75e920d 100644
> >>>> --- a/treesource.c
> >>>> +++ b/treesource.c
> >>>> @@ -267,7 +267,12 @@ void dt_to_source(FILE *f, struct boot_info *bi)
> >>>> {
> >>>> 	struct reserve_info *re;
> >>>>=20
> >>>> -	fprintf(f, "/dts-v1/;\n\n");
> >>>> +	fprintf(f, "/dts-v1/");
> >>>> +
> >>>> +	if (bi->versionflags & VF_PLUGIN)
> >>>> +		fprintf(f, " /plugin/");
> >>>> +
> >>>> +	fprintf(f, ";\n\n");
> >>>=20
> >>> I'm not sure this really makes sense.  The /plugin/ tag triggers the
> >>> fixup construction and encoding of overlay fragments.  But in an
> >>> incoming dtb, that processing has already been done once, doing it
> >>> again would not make sense.  So I think the output should not have the
> >>> /plugin/ tag, even if the input did.
> >>>=20
> >>> Unless, of course, you parsed the input into an explicit list of
> >>> overlays, then output it here again as a list of overlays, not the
> >>> encoded fragments.  i.e. if this was the original tree:
> >>>=20
> >>> 	/dts-v1/ /plugin/;
> >>>=20
> >>> 	&somwhere {
> >>> 		name =3D "value";
> >>> 	};
> >>>=20
> >>> then legitimately the output of -I dts -O dts could be either:
> >>>=20
> >>> 	/dts-v1/ /plugin/;
> >>>=20
> >>> 	&somwhere {
> >>> 		name =3D "value";
> >>> 	};
> >>>=20
> >>> OR
> >>>=20
> >>> 	/dts-v1/;
> >>>=20
> >>> 	/ {
> >>> 		fragment@0 {
> >>> 			target =3D <0xffffffff>;
> >>> 			__overlay__{
> >>> 				name =3D "value";
> >>> 			};
> >>> 		};
> >>> 		__fixups__ {
> >>> 			somewhere =3D "/fragment@0:target:0";
> >>> 		};
> >>> 	};
> >>>=20
> >>> But it doesn't make sense to combine the two: the second structure
> >>> with the "/plugin/" tag.
> >>>=20
> >>=20
> >>> Another advantage of moving the overlay application out of the parser
> >>> is you can sanely produce either output, both of which could be useful
> >>> in the right circumstances.  You can potentially even produce the
> >>> first output (or something close) from dtb input, with correct parsing
> >>> of the overlay structure on dtb input.
> >>>=20
> >>=20
> >> Yes, this makes sense. For now I=E2=80=99ll remove the plugin tag, but=
 if the blob
> >> was compiled with -@ you could conceivably reverse back to a form that=
 contains
> >> labels and phandle references correctly.
> >>=20
> >> But this is quite complicated to undertake in this patch series.=20
> >>=20
> >> To re-iterate though there is no overlay application here :)
> >=20
> > Well, I think we've both been a bit sloppy with terminology - does
> > "overlay" refer to a dtbo file, or to one of the &ref { ... }
> > fragments in the source, or to both.
> >=20
> > But whatever the right term is for the &ref { .. } fragments in the
> > source they absolutely *are* applied during compile for the base tree
> > case.  And while they're not resolved fully, they are encoded into
> > part of a larger tree structure for the plugin case.
> >=20
> > The confusion will be reduced if we make these
> > overlays/fragments/whatever first class objects in the "live tree"
> > phase of the compile, and move the resolution and/or assembly of them
> > a stage that's separate from the parse.  In addition, it opens the way
> > for decompiling a dtbo more naturally, though as you say that's a
> > moderate amount of extra work.
>=20
> How about we get the non &ref { } case sorted out and we can talk about
> the syntactic sugar version done?

Uh.. sure.  I'm not really clear on what you mean by that, but I guess
I'll look and see.

>=20
> v10 has been sent out.
>=20
>=20
> Regards
>=20
> =E2=80=94 Pantelis
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--G3juXO9GfR42w+sw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYO5dSAAoJEGw4ysog2bOSwZkQANvzW6VJLtqG/r5ekJ652jmo
HS0Im73G80lt70I+n2Oa9gzypFumK5Ga5CwlJ908hQA79MGABCDmcLnygbBOP+03
ruz+l/NCzMrABbFPJs8GSfCQpWvn0anUd//h9SNCqP5vilH3kRS1YcpEMhocxtK2
A3Z0ywVlVAUvhY7NyLsqfQo4TSvbpqXrb2txPdTb7iAbzkBwq8KX3Vlc/+laZhgw
QIAbt06fkqzj5nDyLCVbb+HfPNYdomzgtJAlYTLbcevcV/qHQiLQZLx1X6WyJbmb
j3PRPik52GrQaaCWrxmHGIdmNVH93UlCRJdfaZ4fLJ3as0xUeDHV4sqt/szVHeZd
2SfdJkJDJqEVIgnkmkdeKsAiZhXm+NKPEb5JVYW4eHP90M8C7Xyf1CrYdtC+G4wL
C1pG4b934aKPLTmQAhPmxAZBH86I/VNA131+YvGFmAyyxYLq6UEAkozW3oX2XeW3
ehIOQ9X9MzJZ77NBhXHrXFYfTZ0VelpcUjoQmCLtZE922vmaCfnvBWSpa+15Wavm
JXTGze2esI/hZIR+k7NtnN6uK900yQ1Ff7ei8lZAsVBR7ajxHfthgdAx4ImUROTs
VCbCfGLV6edK0wvYTYTCCuqLdYY8s/RxVF0tjn49TRLmaCcnNl8p7IDY1XcywxMi
zW5qtA8t5VbeRkISThWz
=sDIs
-----END PGP SIGNATURE-----

--G3juXO9GfR42w+sw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
