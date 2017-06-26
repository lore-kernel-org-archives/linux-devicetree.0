From: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: [PATCH 0/3] Altera Quadspi Controller Version 2
Date: Mon, 26 Jun 2017 09:13:36 -0700
Message-ID: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

Hi Everyone,

This patch set adds support for Version 2 of the Altera
Quadspi Controller.  Version 1 of the Altera Quadspi
Controller only supported 1 byte of flash id instead of
the 3 bytes required for a JEDEC ID.  As such the driver
for Version 1 was rejected.  Please see 
https://patchwork.kernel.org/patch/7025681

Patch 1: add device tree bindings document for platform driver

Patch 2: add core code for driver

Patch 3: add platform driver

Matthew Gerlach (3):
  ARM: dts: Bindings for Altera Quadspi Controller Version 2
  mtd: spi-nor: core code for the Altera Quadspi Flash Controller v2
  mtd: spi-nor: Altera Quadspi Flash Controller v2 Platform driver

 .../devicetree/bindings/mtd/altera-quadspi-v2.txt  |  37 ++
 MAINTAINERS                                        |   8 +
 drivers/mtd/spi-nor/Kconfig                        |  10 +
 drivers/mtd/spi-nor/Makefile                       |   5 +-
 drivers/mtd/spi-nor/altera-quadspi-platform.c      | 137 +++++
 drivers/mtd/spi-nor/altera-quadspi.c               | 676 +++++++++++++++++++++
 include/linux/mtd/altera-quadspi.h                 |  28 +
 7 files changed, 900 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
 create mode 100644 drivers/mtd/spi-nor/altera-quadspi-platform.c
 create mode 100644 drivers/mtd/spi-nor/altera-quadspi.c
 create mode 100644 include/linux/mtd/altera-quadspi.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
