From: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: [PATCH v3 0/2] Altera ASMI Parallel II IP Core
Date: Thu, 19 Oct 2017 15:14:48 -0700
Message-ID: <1508451290-26426-1-git-send-email-matthew.gerlach@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tien.hock.loh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

This patch set adds a spi-nor flash driver for the Altera ASMI Parallel II 
IP Core.  This driver was created based on feedback from Marek Vasut,
Cyrill Pitchen, and Michal Suchanek regarding Version 2 of the Altera
Quadspi Controller: https://lkml.org/lkml/2017/6/26/518

The overall problem with Version 2 of the Altera Quadspi Controller and 
its driver was the fact that there was much duplication of code and logic
with the spi-nor framework.  This new combination of fpga hardware and 
software "gets out of the way" of the spi-nor framework.  The result is a
much simpler driver with the spi-nor framework performing the bulk of the work.

Patch 1 contains the device tree bindings for the driver for
the Altera ASMI-Parallel II IP Core.

Patch 2 contains the driver code for the Altera ASMI-Parallel II IP Core.
This driver supports being configured via a device tree or with platform
data.  In the later case, the memory for the registers has been remapped.

Matthew Gerlach (2):
  dt-bindings: mtd: Altera ASMI Parallel II IP Core
  mtd: spi-nor: Altera ASMI Parallel II IP Core

 .../devicetree/bindings/mtd/altera-asmip2.txt      |  15 +
 MAINTAINERS                                        |   7 +
 drivers/mtd/spi-nor/Kconfig                        |   6 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/altera-asmip2.c                | 494 +++++++++++++++++++++
 include/linux/mtd/altera-asmip2.h                  |  25 ++
 6 files changed, 548 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/altera-asmip2.txt
 create mode 100644 drivers/mtd/spi-nor/altera-asmip2.c
 create mode 100644 include/linux/mtd/altera-asmip2.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
