From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 0/4] dtc: Dynamic DT support
Date: Thu,  5 May 2016 22:48:40 +0300
Message-ID: <1462477724-8092-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The first two patches enabled generation of symbol & fixup
information for use with dynamic DT loading, along with the
documentation about the internal operation.

The third patch enables backward compatibility with already
present overlays out in the wild.

The fourth introduces a new magic number and new output/input
format options marking dynamic objects.

Only the first two patches are required; the last two are
optional.

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
  dtc: Document the dynamic plugin internals
  dtc: Plugin and fixup support
  plugin: Transparently support old style syntax
  DTBO magic and dtbo format options

 Documentation/dt-object-internal.txt | 318 +++++++++++++++++++++++++++++++++++
 Documentation/manual.txt             |  23 +++
 checks.c                             |   8 +-
 dtc-lexer.l                          |   5 +
 dtc-parser.y                         |  56 +++++-
 dtc.c                                |  37 +++-
 dtc.h                                |  32 +++-
 fdtdump.c                            |   2 +-
 flattree.c                           |  13 +-
 fstree.c                             |   2 +-
 libfdt/fdt.c                         |   2 +-
 libfdt/fdt.h                         |   3 +-
 libfdt/libfdt_internal.h             |   1 +
 livetree.c                           | 217 +++++++++++++++++++++++-
 tests/mangle-layout.c                |   7 +-
 15 files changed, 695 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/dt-object-internal.txt

-- 
1.7.12
