From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH 0/2] mtd: spi-nor: add stm32 qspi driver
Date: Mon, 27 Mar 2017 14:54:54 +0200
Message-ID: <1490619296-8168-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch set adds a SPI-NOR driver for stm32 QSPI controller.
It is a specialized SPI interface for serial Flash devices.
It supports 1 or 2 Flash device with single, dual and quad SPI Flash memories.

It can operate in any of the following modes:
-indirect mode: all the operations are performed using the quadspi
 registers
-read memory-mapped mode: the external Flash memory is mapped to the
 microcontroller address space and is seen by the system as if it was
 an internal memory

Ludovic Barre (2):
  dt-bindings: Document the STM32 QSPI bindings
  mtd: spi-nor: add driver for STM32 quad spi flash controller

 .../devicetree/bindings/mtd/stm32-quadspi.txt      |  45 ++
 drivers/mtd/spi-nor/Kconfig                        |   7 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/stm32-quadspi.c                | 679 +++++++++++++++++++++
 4 files changed, 732 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
 create mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c

-- 
2.7.4
