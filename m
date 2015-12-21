From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/9] ARM: mvebu: kirkwood: Add compatible property to "partitions" node
Date: Mon, 21 Dec 2015 11:33:46 +0100
Message-ID: <1450694033-27717-3-git-send-email-geert+renesas@glider.be>
References: <1450694033-27717-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450694033-27717-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Alex Smith <alex.smith@imgtec.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, linux-mips@linux-mips.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

As of commit e488ca9f8d4f62c2 ("doc: dt: mtd: partitions: add compatible
property to "partitions" node"), the "partitions" subnode of an SPI
FLASH device node must have a compatible property. The partitions are no
longer detected if it is not present.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts b/arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts
index 1db6f2c506cce320..8082d64266a37c33 100644
--- a/arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts
+++ b/arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts
@@ -131,6 +131,7 @@
 	chip-delay = <40>;
 	status = "okay";
 	partitions {
+		compatible = "fixed-partitions";
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-- 
1.9.1
