From: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v2 1/2] ARM: dts: at91: sama5d4_xplained: fix addressable nand flash size
Date: Tue, 2 Oct 2018 16:00:35 +0300
Message-ID: <20181002130036.25957-1-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, ludovic.desroches@microchip.com, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
List-Id: devicetree@vger.kernel.org

sama5d4_xplained comes with a 4Gb NAND flash. Increase the rootfs
size to match this limit.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
v2:
- fix typo in subject line
- collect Ludovic's Acked-by

 arch/arm/boot/dts/at91-sama5d4_xplained.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91-sama5d4_xplained.dts b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
index 4b7c762d5f22..7d554b9ab27f 100644
--- a/arch/arm/boot/dts/at91-sama5d4_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
@@ -252,7 +252,7 @@
 
 						rootfs@800000 {
 							label = "rootfs";
-							reg = <0x800000 0x0f800000>;
+							reg = <0x800000 0x1f800000>;
 						};
 					};
 				};
-- 
2.9.4
