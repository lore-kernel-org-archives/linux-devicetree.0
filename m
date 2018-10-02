From: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 0/4] ARM: dts: at91: even nand memory partitions
Date: Tue, 2 Oct 2018 16:20:34 +0300
Message-ID: <20181002132038.27189-1-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, ludovic.desroches@microchip.com, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
List-Id: devicetree@vger.kernel.org

sam9x5cm, sama5d2_ptc_ek, sama5d3_xplained and sama5d4_xplained nand
flashes have a common memory map. Even the nand memory partitions to
match our NAND flash map available at:

http://www.at91.com/linux4sam/pub/Linux4SAM/SambaSubsections//demo_nandflash_map_lnx4sam5x.png

Tudor Ambarus (4):
  ARM: dts: at91: sama5d2_ptc_ek: fix bootloader env offsets
  ARM: dts: at91: at91sam9x5cm: even nand memory partitions
  ARM: dts: at91: sama5d3_xplained: even nand memory partitions
  ARM: dts: at91: sama5d4_xplained: even nand memory partitions

 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts   |  8 ++++----
 arch/arm/boot/dts/at91-sama5d3_xplained.dts | 11 ++++++++---
 arch/arm/boot/dts/at91-sama5d4_xplained.dts | 11 ++++++++---
 arch/arm/boot/dts/at91sam9x5cm.dtsi         | 16 +++++++++++++---
 4 files changed, 33 insertions(+), 13 deletions(-)

-- 
2.9.4
