From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH 0/3] Fix SMC layout register for sama5d2
Date: Tue, 11 Jul 2017 09:40:12 +0200
Message-ID: <20170711074015.30440-1-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, lee.jones@linaro.org, nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, boris.brezillon@free-electrons.com, computersforpeace@gmail.com, Ludovic Desroches <ludovic.desroches@microchip.com>
List-Id: devicetree@vger.kernel.org

Hi,

The offset of some registers of the SMC is different between sama5d3/sama5d4
and sama5d2. An helper function has been added to retrieve the correct layout
with the help of a new compatible string for sama5d2. The atmel-ebi device will
store the register layout to allow the nand controller to setup correctly the
data interface.

Ludovic Desroches (3):
  mfd: syscon: update Atmel SMC binding doc
  mfd: syscon: atmel-smc: add helper to retrieve register layout
  ARM: dts: at91: sama5d2: use sama5d2 compatible string for SMC

 .../devicetree/bindings/mfd/atmel-smc.txt          |  1 +
 arch/arm/boot/dts/sama5d2.dtsi                     |  2 +-
 drivers/memory/atmel-ebi.c                         | 13 +++--
 drivers/mfd/atmel-smc.c                            | 67 +++++++++++++++++-----
 drivers/mtd/nand/atmel/nand-controller.c           | 10 +++-
 include/linux/mfd/syscon/atmel-smc.h               | 32 ++++++++---
 6 files changed, 94 insertions(+), 31 deletions(-)

-- 
2.12.2
