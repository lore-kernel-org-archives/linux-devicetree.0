From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/3] mtd: nand: Rework/cleanup the Atmel NAND driver
Date: Mon, 20 Feb 2017 13:28:35 +0100
Message-ID: <1487593718-20752-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Haavard Skinnemoen <hskinnemoen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans-Christian Egtvedt <egtvedt-BrfabpQBY5qlHtIdYg32fQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a complete rewrite of the driver whose main purpose is to
support the new DT representation where the NAND controller node is now
really visible in the DT and appears under the EBI bus. With this new
representation, we can add other devices under the EBI bus without
risking pinmuxing conflicts (the NAND controller is under the EBI
bus logic and as such, share some of its pins with other devices
connected on this bus).

Even though the goal of this rework was not necessarily to add new
features, the new driver has been designed with this in mind. With a
clearer separation between the different blocks and different IP
revisions, adding new functionalities should be easier (we already
have plans to support SMC timing configuration so that we no longer
have to rely on the configuration done by the bootloader/bootstrap).

Also note that we no longer have a custom ->cmdfunc() implementation,
which means we can now benefit from new features added in the core
implementation for free (support for new NAND operations for example).

The last thing that we gain with this rework is support for multi-chips
and multi-dies chips, thanks to the clean NAND controller <-> NAND
devices representation.

This new driver has been tested on several platforms (at91sam9261,
at91sam9g45, at91sam9x5, sama5d3 and sama5d4) to make sure it did not
introduce regressions, and it's worth mentioning that old bindings are
still supported (which partly explain the positive diffstat).

Regards,

Boris

Changes since v1:
- change function/structure prefixes (asked by Nicolas)
- drop applied patches
- use new GPIO helpers
- set ->chip_delay to 40 as done in the old driver (reported by Nicolas)
- rework read_page to improve perfs
- add a better commit message to patch 2

Boris Brezillon (3):
  mtd: nand: Cleanup/rework the atmel_nand driver
  mtd: nand: atmel: Document the new DT bindings
  mtd: nand: Remove unused chip->write_page() hook

 .../devicetree/bindings/mtd/atmel-nand.txt         |  107 +-
 MAINTAINERS                                        |    2 +-
 drivers/mtd/nand/Makefile                          |    2 +-
 drivers/mtd/nand/atmel/Makefile                    |    4 +
 drivers/mtd/nand/atmel/nand-controller.c           | 2269 ++++++++++++++++++
 drivers/mtd/nand/atmel/pmecc.c                     | 1020 ++++++++
 drivers/mtd/nand/atmel/pmecc.h                     |   73 +
 drivers/mtd/nand/atmel_nand.c                      | 2479 --------------------
 drivers/mtd/nand/atmel_nand_ecc.h                  |  163 --
 drivers/mtd/nand/atmel_nand_nfc.h                  |  103 -
 drivers/mtd/nand/nand_base.c                       |   10 +-
 include/linux/mtd/nand.h                           |    4 -
 12 files changed, 3478 insertions(+), 2758 deletions(-)
 create mode 100644 drivers/mtd/nand/atmel/Makefile
 create mode 100644 drivers/mtd/nand/atmel/nand-controller.c
 create mode 100644 drivers/mtd/nand/atmel/pmecc.c
 create mode 100644 drivers/mtd/nand/atmel/pmecc.h
 delete mode 100644 drivers/mtd/nand/atmel_nand.c
 delete mode 100644 drivers/mtd/nand/atmel_nand_ecc.h
 delete mode 100644 drivers/mtd/nand/atmel_nand_nfc.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
