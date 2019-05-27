From: Tomasz Maciej Nowak <tmn505@gmail.com>
Subject: [PATCH] arm64: dts: armada-3720-espressobin: correct spi node
Date: Mon, 27 May 2019 13:16:14 +0200
Message-ID: <20190527111614.3694-1-tmn505@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Ellie Reeves <ellierevves@gmail.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The manufacturer of this board, ships it with various SPI NOR chips and
increments U-Boot bootloader version along the time. There is no way to
tell which is placed on the board since no revision bump takes place.
This creates two issues.

The first, cosmetic. Since the NOR chip may differ, there's message on
boot stating that kernel expected w25q32dw and found different one. To
correct this, remove optional device-specific compatible string. Being
here lets replace bogus "spi-flash" compatible string with proper one.

The second is linked to partitions layout, it changed after commit:
81e7251252 ("arm64: mvebu: config: move env to the end of the 4MB boot
device") in Marvells downstream U-Boot fork [1], shifting environment
location to the end of boot device. Since the new boards will have U-Boot
with this change, it'll lead to improper results writing or reading from
these partitions. We can't tell if users will update bootloader to recent
version provided on manufacturer website, so lets drop partitons layout.

1. https://github.com/MarvellEmbeddedProcessors/u-boot-marvell.git

Signed-off-by: Tomasz Maciej Nowak <tmn505@gmail.com>
---
 .../dts/marvell/armada-3720-espressobin.dts    | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
index 6be019e1888e..fbcf03f86c96 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
@@ -95,25 +95,9 @@
 
 	flash@0 {
 		reg = <0>;
-		compatible = "winbond,w25q32dw", "jedec,spi-flash";
+		compatible = "jedec,spi-nor";
 		spi-max-frequency = <104000000>;
 		m25p,fast-read;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			partition@0 {
-				label = "uboot";
-				reg = <0 0x180000>;
-			};
-
-			partition@180000 {
-				label = "ubootenv";
-				reg = <0x180000 0x10000>;
-			};
-		};
 	};
 };
 
-- 
2.21.0
