From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v3 0/2] of: Add unit tests for applying overlays
Date: Tue, 25 Apr 2017 11:30:54 -0700
Message-ID: <1493145056-16442-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmarek-IBi9RG/b67k@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Existing overlay unit tests examine individual pieces of the overlay
code.  The new tests target the entire process of applying an overlay.

Changes from v2:
  - of_private.h: move __unflatten_device_tree() outside
    #ifdef CONFIG_OF_UNITTEST
  - unittest.c: move overlay declaration macros outside #ifdef CONFIG_OF_OVERLAY
  - unittest.c: make overlay_info overlays[] static
  - unittest.c: remove extra blank line

Changes from v1:
  - Move overlay base dtb unflattening into unittest.c.  Call from fdt.c.
  - Clarify file and variable names, 'overlay_test_' instead of 'ot_'
  - Use proper naming convention for node names.
  - A few added comments.
  - Improve error messages in the new tests.

Frank Rowand (2):
  of: support dtc compiler flags for overlays
  of: Add unit tests for applying overlays

 drivers/of/fdt.c                                 |  14 +-
 drivers/of/of_private.h                          |  12 +
 drivers/of/unittest-data/Makefile                |  17 +-
 drivers/of/unittest-data/overlay.dts             |  53 ++++
 drivers/of/unittest-data/overlay_bad_phandle.dts |  20 ++
 drivers/of/unittest-data/overlay_base.dts        |  80 ++++++
 drivers/of/unittest.c                            | 317 +++++++++++++++++++++++
 scripts/Makefile.lib                             |   2 +
 8 files changed, 507 insertions(+), 8 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay.dts
 create mode 100644 drivers/of/unittest-data/overlay_bad_phandle.dts
 create mode 100644 drivers/of/unittest-data/overlay_base.dts

-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
