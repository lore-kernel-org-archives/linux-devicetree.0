From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] NXP SPIFI driver for LPC18xx/43xx familiy
Date: Fri, 29 May 2015 19:50:14 +0200
Message-ID: <1432921816-10765-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, shijie.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set adds a SPI-NOR driver for the NXP SPI Flash (SPIFI)
controller that can be found on newer NXP MCUs. For example on the
LPC18xx and LPC43xx familiy.

NXP SPIFI is a specialized SPI interface for serial Flash devices.
It supports one Flash device with 1-, 2- and 4-bits width in SPI
mode 0 or 3. The controller operates in either command or memory
mode. In memory mode the Flash is accessible from the CPU as
normal memory.

Support for LPC18xx/43xx can found in linux-next now.

Patch against l2-mtd.git master branch.


Joachim Eastwood (2):
  mtd: spi-nor: add driver for NXP SPI Flash Interface (SPIFI)
  doc: dt: add documentation for nxp,lpc1773-spifi

 .../devicetree/bindings/mtd/nxp-spifi.txt          |  56 +++
 drivers/mtd/spi-nor/Kconfig                        |  10 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/nxp-spifi.c                    | 508 +++++++++++++++++++++
 4 files changed, 575 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nxp-spifi.txt
 create mode 100644 drivers/mtd/spi-nor/nxp-spifi.c

-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
