From: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 4/4] ARM: dts: at91: sama5d4_xplained: even nand memory partitions
Date: Tue, 2 Oct 2018 16:20:38 +0300
Message-ID: <20181002132038.27189-5-tudor.ambarus@microchip.com>
References: <20181002132038.27189-1-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002132038.27189-1-tudor.ambarus@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, ludovic.desroches@microchip.com, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
List-Id: devicetree@vger.kernel.org

sama5d4_xplained, ssam9x5cm, sama5d2_ptc_ek and sama5d3_xplained nand
flashes have a common memory map. Even the nand memory partitions to
match our NAND flash map available at:

http://www.at91.com/linux4sam/pub/Linux4SAM/SambaSubsections//demo_nandflash_map_lnx4sam5x.png

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 arch/arm/boot/dts/at91-sama5d4_xplained.dts | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sama5d4_xplained.dts b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
index 7d554b9ab27f..43aef56ac74a 100644
--- a/arch/arm/boot/dts/at91-sama5d4_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
@@ -232,12 +232,17 @@
 
 						bootloader@40000 {
 							label = "bootloader";
-							reg = <0x40000 0x80000>;
+							reg = <0x40000 0xc0000>;
 						};
 
-						bootloaderenv@c0000 {
+						bootloaderenvred@100000 {
+							label = "bootloader env redundant";
+							reg = <0x100000 0x40000>;
+						};
+
+						bootloaderenv@140000 {
 							label = "bootloader env";
-							reg = <0xc0000 0xc0000>;
+							reg = <0x140000 0x40000>;
 						};
 
 						dtb@180000 {
-- 
2.9.4
