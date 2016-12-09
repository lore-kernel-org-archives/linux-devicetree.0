From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v13 0/7] dtc: Dynamic DT support
Date: Fri, 9 Dec 2016 10:16:51 +0200
Message-ID: <3C4DD870-3736-42A7-A110-0975C31E74A4@konsulko.com>
References: <1481114903-8197-1-git-send-email-pantelis.antoniou@konsulko.com> <20161209055709.GP13139@umbus.fritz.box>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161209055709.GP13139-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

> On Dec 9, 2016, at 07:57 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
>=20
> On Wed, Dec 07, 2016 at 02:48:16PM +0200, Pantelis Antoniou wrote:
>> This patchset adds Dynamic DT support in the DTC compiler
>> as used in a number of boards like the beaglebone/rpi/chip and =
others.
>>=20
>> The first patch documents the internals of overlay generation, while
>> the second one adds dynamic object/overlay support proper.
>>=20
>> The third patch adds a test method that can is used by the subsequent
>> patch which adds a few overlay tests verifying operation.
>>=20
>> The following 3 patches add support for the syntactic sugar version
>> of &foo { }; in a similar manner.
>>=20
>> This patchset is against DTC mainline and is also available for a =
pull
>> request from https://github.com/pantoniou/dtc/tree/overlays
>=20
> Ok, I've merged patches 1-4 into mainline, along with a bunch of minor
> fixes of my own on top.  5..7 (the start of the new) I want to hold
> off on for now, to thrash out the details of what we want a new
> cleaner format to look like a bit more thoroughly.
>=20

Thank you.

My git tree contains an updated patchset of the syntactic sugar patches
for reference now.

Regards

=E2=80=94 Pantelis

>>=20
>> Regards
>>=20
>> -- Pantelis
>>=20
>> Changes since v12:
>> * Dropped DTBO magic option completely.
>> * Dropped fixup generation option.
>> * Renamed dstversionflags to dstflags
>> * Drop support for the new style /plugin/ tag.=20
>>=20
>> Changes since v11:
>> * Syntax and grammatical fixes to the documentation.
>> * Renamed options and internal variables controlling generation of =
symbols
>> and fixups.
>> * Rename version flags to specify that they refer to DTS version.
>> * Made sure that no symbols/fixup nodes are only generated if they =
contain
>> entries.
>>=20
>> Changes since v10:
>> * Split out the syntactic sugar version of &foo { }; into a different
>> patches to make things clearer.
>> * Reworked a bit the arguments passed to fixup node generation method
>> making things simpler and utilize common methodology.
>> * Avoid string parsing the full path using the node walking instead =
for
>> local fixup generation.
>> * Added an option to suppress generation of fixup nodes on base =
trees.
>> * Added automatic generation of symbols and fixups when compiling a
>> plugin.
>> * Minor rework according to maintainer requests.
>>=20
>> Changes since v9:
>> * Reversed -M switch to by default use new DTBO magic value.
>> * Removed global versionflags in the parser by using inherited
>> attributes.
>> * build_node instead of malloc at add_orphan_node().
>> * Do not use escape for path copy
>> * Do not generate /plugin/ when generating a dts file even when
>> the plugin flag is set..
>>=20
>> Changes since v8:
>> * Removed extra member of boot_info in each node; passing boot_info
>> parameter to the check methods instead.
>> * Reworked yacc syntax that supports both old and new plugin syntax
>> * Added handling for new magic number (enabled by 'M' switch).
>> * Dropped dtbo/asmo formats.
>> * Added overlay testsuite.
>> * Addressed last version maintainer comments.
>>=20
>> Changes since v7:
>> * Dropped xasprintf & backward compatibility patch
>> * Rebased against dgibson's overlay branch
>> * Minor doc wording fixes.
>>=20
>> Changes since v6:
>> * Introduced xasprintf
>> * Added append_to_property and used it
>> * Changed some die()'s to assert
>> * Reordered node generation to respect sort
>> * Addressed remaining maintainer changes from v6
>>=20
>> Changes since v5:
>> * Rebase to latest dtc version.
>> * Addressed all the maintainer requested changes from v5
>> * Added new magic value for dynamic objects and new format
>>=20
>> Changes since v4:
>> * Rebase to latest dtc version.
>> * Completely redesigned the generation of resolution data.
>> Now instead of being generated as part of blob generation
>> they are created in the live tree.
>> * Consequently the patchset is much smaller.
>> * Added -A auto-label alias generation option.
>> * Addressed maintainer comments.
>> * Added syntactic sugar for overlays in the form of .dtsi
>> * Added /dts-v1/ /plugin/ preferred plugin form and deprecate
>> the previous form (although still works for backward compatibility)
>>=20
>> Changes since v3:
>> * Rebase to latest dtc version.
>>=20
>> Changes since v2:
>> * Split single patch to a patchset.
>> * Updated to dtc mainline.
>> * Changed __local_fixups__ format
>> * Clean up for better legibility.
>> Pantelis Antoniou (7):
>>  dtc: Document the dynamic plugin internals
>>  dtc: Plugin and fixup support
>>  tests: Add check_path test
>>  tests: Add overlay tests
>>  overlay: Documentation for the overlay sugar syntax
>>  overlay: Add syntactic sugar version of overlays
>>  tests: Add a test for overlays syntactic sugar
>>=20
>> Documentation/dt-object-internal.txt | 327 =
+++++++++++++++++++++++++++++++++++
>> Documentation/manual.txt             |  21 ++-
>> checks.c                             |   8 +-
>> dtc-lexer.l                          |   5 +
>> dtc-parser.y                         |  48 ++++-
>> dtc.c                                |  33 +++-
>> dtc.h                                |  17 +-
>> flattree.c                           |   2 +-
>> fstree.c                             |   2 +-
>> livetree.c                           | 291 =
++++++++++++++++++++++++++++++-
>> tests/.gitignore                     |   1 +
>> tests/Makefile.tests                 |   3 +-
>> tests/check_path.c                   |  82 +++++++++
>> tests/overlay_base_fixups.dts        |  22 +++
>> tests/overlay_overlay_dtc.dts        |   1 +
>> tests/overlay_overlay_simple.dts     |  12 ++
>> tests/run_tests.sh                   |  38 ++++
>> 17 files changed, 898 insertions(+), 15 deletions(-)
>> create mode 100644 Documentation/dt-object-internal.txt
>> create mode 100644 tests/check_path.c
>> create mode 100644 tests/overlay_base_fixups.dts
>> create mode 100644 tests/overlay_overlay_simple.dts
>>=20
>=20
> --=20
> David Gibson			| I'll have my music baroque, and my =
code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT =
_the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
