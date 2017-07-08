From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 0/3] of: overlay: load overlay symbols into live device tree
Date: Fri,  7 Jul 2017 17:28:42 -0700
Message-ID: <1499473725-13361-1-git-send-email-frowand.list@gmail.com>
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

This patch set was created on top of v4.12, with Rob's pull request
for 4.13 added (https://lkml.org/lkml/2017/7/6/691).  Thus this
series should apply on 4.13-rc1 when that becomes available.  I will
re-test on 4.13-rc1.


Frank Rowand (3):
  of: overlay: add overlay unittest data for node names and symbols
  of: overlay: correctly apply overlay node with unit-address
  of: overlay: add overlay symbols to live device tree

 drivers/of/overlay.c                            | 136 ++++++++++++++++++++++--
 drivers/of/unittest-data/Makefile               |   3 +
 drivers/of/unittest-data/overlay.dts            |  19 +++-
 drivers/of/unittest-data/overlay_bad_symbol.dts |  22 ++++
 drivers/of/unittest-data/overlay_base.dts       |   7 ++
 drivers/of/unittest.c                           |   6 ++
 6 files changed, 182 insertions(+), 11 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay_bad_symbol.dts

-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
