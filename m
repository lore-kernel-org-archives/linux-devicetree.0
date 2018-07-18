From: Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 3/5] ARM: dts: sun8i: a83t: Remove unused address-cells/size-cells of dwmac-sun8i
Date: Wed, 18 Jul 2018 11:40:39 +0000
Message-ID: <1531914041-14751-4-git-send-email-clabbe@baylibre.com>
References: <1531914041-14751-1-git-send-email-clabbe@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531914041-14751-1-git-send-email-clabbe@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, linux@armlinux.org.uk, mark.rutland@arm.com, maxime.ripard@free-electrons.com, robh+dt@kernel.org, wens@csie.org, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-sunxi@googlegroups.com, Corentin Labbe <clabbe@baylibre.com>
List-Id: devicetree@vger.kernel.org

ddress-cells/size-cells is unnecessary for dwmac-sun8i node.
It was in early days, but since a mdio node is used, it could be
removed.

This patch fix the following DT warning:
Warning (avoid_unnecessary_addr_size): /soc/ethernet@1c50000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index b047f05e690d..276c99fcfcc8 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -913,8 +913,6 @@
 			reset-names = "stmmaceth";
 			clocks = <&ccu 27>;
 			clock-names = "stmmaceth";
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 
 			mdio: mdio {
-- 
2.16.4
