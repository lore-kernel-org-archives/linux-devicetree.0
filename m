From: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v3 0/2] mtd: spi-nor: add stm32 qspi driver
Date: Wed, 12 Apr 2017 19:06:23 +0200
Message-ID: <1492016785-24976-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>

This patch set adds a SPI-NOR driver for stm32 QSPI controller.
It is a specialized SPI interface for serial Flash devices.
It supports 1 or 2 Flash device with single, dual and quad SPI Flash memories.

It can operate in any of the following modes:
-indirect mode: all the operations are performed using the quadspi
  registers
-read memory-mapped mode: the external Flash memory is mapped to the
  microcontroller address space and is seen by the system as if it was
  an internal memory

Changes in v3:
-dt-bindings: qspi_mm not optional
-dt-bindings: see ../spi/spi-bus.txt
-dt-bindings: spi@...
-cmd flat struct
-ratelimit
-macro to avoid hard value "25"

Changes in v2:
-awful construct: s/u32/u8
-add define for timeout
-Use a helper variable
-add comment on "stm32 qspi controller fsize issue

Ludovic Barre (2):
  dt-bindings: Document the STM32 QSPI bindings
  mtd: spi-nor: add driver for STM32 quad spi flash controller

 .../devicetree/bindings/mtd/stm32-quadspi.txt      |  43 ++
 drivers/mtd/spi-nor/Kconfig                        |   7 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/stm32-quadspi.c                | 693 +++++++++++++++++++++
 4 files changed, 744 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
 create mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
