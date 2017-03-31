From: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 0/2] mtd: spi-nor: add stm32 qspi driver
Date: Fri, 31 Mar 2017 19:02:02 +0200
Message-ID: <1490979724-10905-1-git-send-email-ludovic.Barre@st.com>
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

Marek, Cyrille
How do you wish process? 
If this patch set is OK for you, I agree for the merge
Cyrille, I working on rebase 
[PATCH v5 0/6] mtd: spi-nor: parse SFDP tables to setup (Q)SPI memories
I could send a patch for stm32 as soon as possible, like this you could add my
controller into your patchset. I would be glad to be your stm32 tester :-)

Changes in v2:
-awful construct: s/u32/u8
-add define for timeout
-Use a helper variable
-add comment on "stm32 qspi controller fsize issue"

Ludovic Barre (2):
  dt-bindings: Document the STM32 QSPI bindings
  mtd: spi-nor: add driver for STM32 quad spi flash controller

 .../devicetree/bindings/mtd/stm32-quadspi.txt      |  45 ++
 drivers/mtd/spi-nor/Kconfig                        |   7 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/stm32-quadspi.c                | 690 +++++++++++++++++++++
 4 files changed, 743 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
 create mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
