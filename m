From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 0/8] Introducing (yet again) Device Tree Overlays
Date: Fri,  4 Apr 2014 15:43:53 +0300
Message-ID: <1396615441-29630-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Georgi Vlaev <georgi.vlaev-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>Pante
List-Id: devicetree@vger.kernel.org

From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>

The following patchset introduces Device Tree overlays, a method
of dynamically altering the kernel's live Device Tree, along with
a generic interface to use it in a board agnostic manner.

It is dependent on Grant Likely's DT kobjectification patches located
in his tree as queued for -next.

It relies on the following previously submitted patches/patchsets:

* OF: Add [__]of_find_node_by_full_name
* OF: Utility helper functions for dynamic nodes

To compile overlays you need the DTC compiler patch

* "dtc: Dynamic symbols & fixup support (v2)"

Changes since V3:
* Added overlay self-tests.
* Fix bug in of_init_overlay_info (wrong sizeof)
* Platform bus handler handles parent_pdev == NULL
* of_resolve fixes according to comments by robh
  + changed if (foo == NULL) to if (!foo)
  + changed if (foo != NULL) to if (foo)
  + drivers/of/Kconfig added dep on OF && !SPARC
  + convert to using be32_to_cpup
  + u32 -> __be32 when modifying property values
  + cosmetic fixes

Changes since V2:
* Use of a configfs board agnostic overlay method
* Use of per bus handlers instead of hardcoded behaviour
* Optional target-path overlay target, which allows one to use standard
DTBs without resolution options.

Changes since V1:

* Removal of any bits related to a specific board (beaglebone).
* Introduced a platform agnostic interface using /proc/device-tree-overlay
* Various bug fixes related to i2c device handling have been squashed in.

Pantelis Antoniou (8):
  OF: Introduce Device Tree resolve support.
  OF: Introduce DT overlay support.
  OF: DT-Overlay configfs interface
  OF: platform: Add overlay bus handler
  of: i2c: Export single device registration method
  OF: i2c: Add overlay bus handler
  OF: spi: Add overlay bus handler
  OF: selftest: Add overlay self-test support.

 .../devicetree/dynamic-resolution-notes.txt        |  25 +
 Documentation/devicetree/overlay-notes.txt         | 187 +++++
 drivers/base/platform.c                            |  98 ++-
 drivers/i2c/i2c-core.c                             | 186 +++--
 drivers/of/Kconfig                                 |  24 +
 drivers/of/Makefile                                |   3 +
 drivers/of/configfs.c                              | 272 +++++++
 drivers/of/overlay.c                               | 895 +++++++++++++++++++++
 drivers/of/resolver.c                              | 368 +++++++++
 drivers/of/selftest.c                              | 368 +++++++++
 drivers/of/testcase-data/testcases.dtsi            |   1 +
 drivers/of/testcase-data/tests-overlay.dtsi        | 125 +++
 drivers/spi/spi.c                                  | 345 +++++---
 include/linux/i2c.h                                |  10 +
 include/linux/of.h                                 | 170 ++++
 15 files changed, 2925 insertions(+), 152 deletions(-)
 create mode 100644 Documentation/devicetree/dynamic-resolution-notes.txt
 create mode 100644 Documentation/devicetree/overlay-notes.txt
 create mode 100644 drivers/of/configfs.c
 create mode 100644 drivers/of/overlay.c
 create mode 100644 drivers/of/resolver.c
 create mode 100644 drivers/of/testcase-data/tests-overlay.dtsi

-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
