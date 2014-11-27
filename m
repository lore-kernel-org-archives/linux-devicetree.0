From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 0/3] of: support passing console options with stdout-path
Date: Thu, 27 Nov 2014 17:56:04 +0000
Message-ID: <1417110967-16284-1-git-send-email-leif.lindholm@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, ijc-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This set started its life as a small, self-contained, patch enabling
specifying console options in the stdout-path property, but then
grew into a mahoosive behemoth with one of the patches taking 1m42s
for get_maintainer to process. It has now once again reverted to a
smaller, more pleasant, state of being.

Changes since v2:
- Revert the invasive bit, creating a replacement wrapper function
  for of_get_node_by_path() callers.
- Make the of_get_node_opts_by_path() function return a const pointer
  to the argument.
- Added binding for /chosen node, with a description of stdout-path.

Changes since v1:
- Change interface of of_get_node_by_path() to take an additional
  argument, and update all of its callers to keep working.
- Rework original patch to use this interface.

Leif Lindholm (3):
  devicetree: of: Add bindings for chosen node, stdout-path
  of: add optional options parameter to of_find_node_by_path()
  of: support passing console options with stdout-path

 Documentation/devicetree/bindings/chosen.txt |   42 ++++++++++++++++++++++++++
 drivers/of/base.c                            |   30 ++++++++++++++----
 drivers/of/selftest.c                        |   12 ++++++++
 include/linux/of.h                           |   14 ++++++++-
 4 files changed, 91 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/chosen.txt

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
