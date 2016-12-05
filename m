From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v12 0/4] dtc: Dynamic DT support
Date: Mon,  5 Dec 2016 19:05:21 +0200
Message-ID: <1480957528-8367-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds Dynamic DT support in the DTC compiler
as used in a number of boards like the beaglebone/rpi/chip and others.

The first patch documents the internals of overlay generation, while
the second one adds dynamic object/overlay support proper.

The third patch adds a test method that can is used by the subsequent
patch which adds a few overlay tests verifying operation.

The following 3 patches add support for the syntactic sugar version
of &foo { }; in a similar manner.

This patchset is against DTC mainline and is also available for a pull
request from https://github.com/pantoniou/dtc/tree/overlays

Regards

-- Pantelis

Changes since v11:
* Syntax and grammatical fixes to the documentation.
* Renamed options and internal variables controlling generation of symbols
and fixups.
* Rename version flags to specify that they refer to DTS version.
* Made sure that no symbols/fixup nodes are only generated if they contain
entries.

Changes since v10:
* Split out the syntactic sugar version of &foo { }; into a different
patches to make things clearer.
* Reworked a bit the arguments passed to fixup node generation method
making things simpler and utilize common methodology.
* Avoid string parsing the full path using the node walking instead for
local fixup generation.
* Added an option to suppress generation of fixup nodes on base trees.
* Added automatic generation of symbols and fixups when compiling a
plugin.
* Minor rework according to maintainer requests.

Changes since v9:
* Reversed -M switch to by default use new DTBO magic value.
* Removed global versionflags in the parser by using inherited
attributes.
* build_node instead of malloc at add_orphan_node().
* Do not use escape for path copy
* Do not generate /plugin/ when generating a dts file even when
the plugin flag is set..

Changes since v8:
* Removed extra member of boot_info in each node; passing boot_info
parameter to the check methods instead.
* Reworked yacc syntax that supports both old and new plugin syntax
* Added handling for new magic number (enabled by 'M' switch).
* Dropped dtbo/asmo formats.
* Added overlay testsuite.
* Addressed last version maintainer comments.

Changes since v7:
* Dropped xasprintf & backward compatibility patch
* Rebased against dgibson's overlay branch
* Minor doc wording fixes.

Changes since v6:
* Introduced xasprintf
* Added append_to_property and used it
* Changed some die()'s to assert
* Reordered node generation to respect sort
* Addressed remaining maintainer changes from v6

Changes since v5:
* Rebase to latest dtc version.
* Addressed all the maintainer requested changes from v5
* Added new magic value for dynamic objects and new format

Changes since v4:
* Rebase to latest dtc version.
* Completely redesigned the generation of resolution data.
Now instead of being generated as part of blob generation
they are created in the live tree.
* Consequently the patchset is much smaller.
* Added -A auto-label alias generation option.
* Addressed maintainer comments.
* Added syntactic sugar for overlays in the form of .dtsi
* Added /dts-v1/ /plugin/ preferred plugin form and deprecate
the previous form (although still works for backward compatibility)

Changes since v3:
* Rebase to latest dtc version.

Changes since v2:
* Split single patch to a patchset.
* Updated to dtc mainline.
* Changed __local_fixups__ format
* Clean up for better legibility.


Pantelis Antoniou (7):
  dtc: Document the dynamic plugin internals
  dtc: Plugin and fixup support
  tests: Add check_path test
  tests: Add overlay tests
  overlay: Documentation for the overlay sugar syntax
  overlay: Add syntactic sugar version of overlays
  tests: Add a test for overlays syntactic sugar

 Documentation/dt-object-internal.txt | 324 +++++++++++++++++++++++++++++++++++
 Documentation/manual.txt             |  29 +++-
 checks.c                             |   8 +-
 dtc-lexer.l                          |   5 +
 dtc-parser.y                         |  49 +++++-
 dtc.c                                |  54 +++++-
 dtc.h                                |  22 ++-
 fdtdump.c                            |   2 +-
 flattree.c                           |  18 +-
 fstree.c                             |   2 +-
 libfdt/fdt.c                         |   2 +-
 libfdt/fdt.h                         |   3 +-
 livetree.c                           | 291 ++++++++++++++++++++++++++++++-
 tests/.gitignore                     |   1 +
 tests/Makefile.tests                 |   3 +-
 tests/check_path.c                   |  82 +++++++++
 tests/mangle-layout.c                |   7 +-
 tests/overlay_base_fixups.dts        |  22 +++
 tests/overlay_overlay_dtc.dts        |   4 +-
 tests/overlay_overlay_simple.dts     |  12 ++
 tests/run_tests.sh                   |  55 ++++++
 21 files changed, 962 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/dt-object-internal.txt
 create mode 100644 tests/check_path.c
 create mode 100644 tests/overlay_base_fixups.dts
 create mode 100644 tests/overlay_overlay_simple.dts

-- 
2.1.4
