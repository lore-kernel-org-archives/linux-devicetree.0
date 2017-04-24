From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 0/2] of: Add unit tests for applying overlays
Date: Sun, 23 Apr 2017 22:43:13 -0700
Message-ID: <1493012595-696-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Existing overlay unit tests examine individual pieces of the overlay
code.  The new tests target the entire process of applying an overlay.

Frank Rowand (2):
  of: add support of dtc compiler flags for device tree overlays
  of: Add unit tests for applying overlays.

 drivers/of/fdt.c                            |  45 +++++
 drivers/of/of_private.h                     |   2 +
 drivers/of/unittest-data/Makefile           |  17 +-
 drivers/of/unittest-data/ot.dts             |  53 ++++++
 drivers/of/unittest-data/ot_bad_phandle.dts |  20 +++
 drivers/of/unittest-data/ot_base.dts        |  71 ++++++++
 drivers/of/unittest.c                       | 264 ++++++++++++++++++++++++++++
 scripts/Makefile.lib                        |   2 +
 8 files changed, 471 insertions(+), 3 deletions(-)
 create mode 100644 drivers/of/unittest-data/ot.dts
 create mode 100644 drivers/of/unittest-data/ot_bad_phandle.dts
 create mode 100644 drivers/of/unittest-data/ot_base.dts

-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
