From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 0/2] of: change overlay apply input data from EDT to FDT
Date: Sun, 28 Jan 2018 18:53:32 -0800
Message-ID: <1517194414-19932-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Move duplicating and unflattening of an overlay flattened devicetree
(FDT) into the overlay application code.  To accomplish this,
of_overlay_apply() is replaced by of_overlay_fdt_apply().

The copy of the FDT (aka "duplicate FDT") now belongs to devicetree
code, which is thus responsible for freeing the duplicate FDT.  The
caller of of_overlay_fdt_apply() remains responsible for freeing the
original FDT.

The unflattened device tree (aka expanded device tree, EDT) now
belongs to devicetree code, which is thus responsible for freeing
the EDT.

These ownership changes prevent early freeing of the duplicated FDT
or the EDT, which could result in use after free errors.

These changes led to migrating some unittest overlay data into
their own devicetree source files, and then converting most of
them to use sugar syntax instead of hand coding fragments.

Frank Rowand (2):
  of: change overlay apply input data from EDT to FDT
  of: convert unittest overlay devicetree source to sugar syntax

 drivers/of/of_private.h                          |   1 +
 drivers/of/overlay.c                             | 124 +++++++++-
 drivers/of/resolver.c                            |   6 -
 drivers/of/unittest-data/Makefile                |  16 ++
 drivers/of/unittest-data/overlay.dts             | 101 ++++----
 drivers/of/unittest-data/overlay_0.dts           |  14 ++
 drivers/of/unittest-data/overlay_1.dts           |  14 ++
 drivers/of/unittest-data/overlay_10.dts          |  27 +++
 drivers/of/unittest-data/overlay_11.dts          |  28 +++
 drivers/of/unittest-data/overlay_12.dts          |  14 ++
 drivers/of/unittest-data/overlay_13.dts          |  14 ++
 drivers/of/unittest-data/overlay_15.dts          |  30 +++
 drivers/of/unittest-data/overlay_2.dts           |   9 +
 drivers/of/unittest-data/overlay_3.dts           |   9 +
 drivers/of/unittest-data/overlay_4.dts           |  18 ++
 drivers/of/unittest-data/overlay_5.dts           |   9 +
 drivers/of/unittest-data/overlay_6.dts           |  10 +
 drivers/of/unittest-data/overlay_7.dts           |  10 +
 drivers/of/unittest-data/overlay_8.dts           |  10 +
 drivers/of/unittest-data/overlay_9.dts           |  10 +
 drivers/of/unittest-data/overlay_bad_phandle.dts |  23 +-
 drivers/of/unittest-data/overlay_bad_symbol.dts  |  27 +--
 drivers/of/unittest-data/tests-overlay.dtsi      | 217 +----------------
 drivers/of/unittest.c                            | 296 +++++++++++------------
 include/linux/of.h                               |   7 -
 25 files changed, 564 insertions(+), 480 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay_0.dts
 create mode 100644 drivers/of/unittest-data/overlay_1.dts
 create mode 100644 drivers/of/unittest-data/overlay_10.dts
 create mode 100644 drivers/of/unittest-data/overlay_11.dts
 create mode 100644 drivers/of/unittest-data/overlay_12.dts
 create mode 100644 drivers/of/unittest-data/overlay_13.dts
 create mode 100644 drivers/of/unittest-data/overlay_15.dts
 create mode 100644 drivers/of/unittest-data/overlay_2.dts
 create mode 100644 drivers/of/unittest-data/overlay_3.dts
 create mode 100644 drivers/of/unittest-data/overlay_4.dts
 create mode 100644 drivers/of/unittest-data/overlay_5.dts
 create mode 100644 drivers/of/unittest-data/overlay_6.dts
 create mode 100644 drivers/of/unittest-data/overlay_7.dts
 create mode 100644 drivers/of/unittest-data/overlay_8.dts
 create mode 100644 drivers/of/unittest-data/overlay_9.dts

-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
