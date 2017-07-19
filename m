From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v4 0/3] of: overlay: load overlay symbols into live device tree
Date: Wed, 19 Jul 2017 09:25:19 -0700
Message-ID: <1500481523-31083-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Symbols in a loaded overlay are not currently available to subsequently
loaded overlays because the properties in the overlay's __symbols__
node are not loaded into the live device tree.

Patch 1 is unittests to test patches 2 and 3.

Patch 2 fixes a problem discovered while developing patch 3.  If
a node name in an overlay has a unit-address then the overlay
code does not correctly match the node name against an existing
node in the live tree.

Patch 3 adds the properties in an overlay's __symbol__ node to
the overlay changeset.

changes since v3:
  - fix make W=2 warnings in overlay_base.dts and overlay.dts
  - update the test results in the patch comments to match the
    .dts changes

changes since v2:
  - test on 4.13-rc1
  - remove redundant comments from patch headers of patch 0 and patch 1
  - guard make of overlay .dtb files with CONFIG_OF_OVERLAY
  - guard unittest.c references to overlay .dtb files with
    CONFIG_OF_OVERLAY

changes since v1:
  - patch 2: Use for_each_child_of_node() instead of open coding,
    which allowed removing the new function child_by_full_name().



Frank Rowand (3):
  of: overlay: add overlay unittest data for node names and symbols
  of: overlay: correctly apply overlay node with unit-address
  of: overlay: add overlay symbols to live device tree

 drivers/of/overlay.c                            | 121 ++++++++++++++++++++++--
 drivers/of/unittest-data/Makefile               |  19 +++-
 drivers/of/unittest-data/overlay.dts            |  25 ++++-
 drivers/of/unittest-data/overlay_bad_symbol.dts |  22 +++++
 drivers/of/unittest-data/overlay_base.dts       |  11 +++
 drivers/of/unittest.c                           |  10 +-
 6 files changed, 190 insertions(+), 18 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay_bad_symbol.dts

-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
