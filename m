From: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: [PATCH 0/4] Altera Partial Reconfiguration IP
Date: Wed, 15 Feb 2017 13:10:34 -0800
Message-ID: <1487193038-3490-1-git-send-email-matthew.gerlach@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

This set of patches implements a fpga-mgr driver for the Altera Partial 
Reconfiguration IP.  The driver depends on a patch from Alan Tull that
adds a config complete timeout.  The driver code itself is divided into
core functions and functions to implement a platform driver. It is 
expected that drivers for other buses like PCIe would also use the core
functions.

Alan Tull (1):
  fpga: add config complete timeout

Matthew Gerlach (3):
  fpga pr ip: Core driver support for Altera Partial Reconfiguration IP.
  fpga dt: bindings for Altera Partial Reconfiguraion IP.
  fpga pr ip: Platform driver for Altera Partial Reconfiguration IP.

 .../devicetree/bindings/fpga/altera-pr-ip.txt      |  12 ++
 drivers/fpga/Kconfig                               |  12 ++
 drivers/fpga/Makefile                              |   2 +
 drivers/fpga/altera-pr-ip-core-plat.c              |  65 ++++++
 drivers/fpga/altera-pr-ip-core.c                   | 217 +++++++++++++++++++++
 drivers/fpga/altera-pr-ip-core.h                   |  29 +++
 drivers/fpga/fpga-region.c                         |   3 +
 include/linux/fpga/fpga-mgr.h                      |   3 +
 8 files changed, 343 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
 create mode 100644 drivers/fpga/altera-pr-ip-core-plat.c
 create mode 100644 drivers/fpga/altera-pr-ip-core.c
 create mode 100644 drivers/fpga/altera-pr-ip-core.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
