From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v10 0/4] dtc: Dynamic DT support
Date: Fri, 25 Nov 2016 14:32:07 +0200
Message-ID: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds Dynamic DT support in the DTC compiler
as used in a number of boards like the beaglebone/rpi/chip and others.

The first patch passes a boot_info argument instead of the root node
to the check methods.

The second patch documents the internals of overlay generation, while
the third one adds dynamic object/overlay support proper.

The last patch simply adds a few overlay tests verifying operation.

This patchset is against DTC mainline and is also available for a pull
request from https://github.com/pantoniou/dtc/tree/overlays

Regards

-- Pantelis

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

Pantelis Antoniou (4):
  checks: Pass boot_info instead of root node
  dtc: Document the dynamic plugin internals
  dtc: Plugin and fixup support
  tests: Add overlay tests

 Documentation/dt-object-internal.txt | 318 +++++++++++++++++++++++++++++++++++
 Documentation/manual.txt             |  25 ++-
 checks.c                             |  86 +++++-----
 dtc-lexer.l                          |   5 +
 dtc-parser.y                         |  50 +++++-
 dtc.c                                |  39 ++++-
 dtc.h                                |  20 ++-
 fdtdump.c                            |   2 +-
 flattree.c                           |  17 +-
 fstree.c                             |   2 +-
 libfdt/fdt.c                         |   2 +-
 libfdt/fdt.h                         |   3 +-
 livetree.c                           | 225 ++++++++++++++++++++++++-
 tests/mangle-layout.c                |   7 +-
 tests/overlay_overlay_dtc.dts        |  76 +--------
 tests/overlay_overlay_dtc.dtsi       |  83 +++++++++
 tests/overlay_overlay_new_dtc.dts    |  11 ++
 tests/overlay_overlay_simple.dts     |  12 ++
 tests/run_tests.sh                   |  20 +++
 19 files changed, 862 insertions(+), 141 deletions(-)
 create mode 100644 Documentation/dt-object-internal.txt
 create mode 100644 tests/overlay_overlay_dtc.dtsi
 create mode 100644 tests/overlay_overlay_new_dtc.dts
 create mode 100644 tests/overlay_overlay_simple.dts

-- 
2.1.4
