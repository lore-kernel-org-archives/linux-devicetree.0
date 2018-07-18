From: Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 5/5] ARM64: dts: sun50i: a64: Remove unused address-cells/size-cells of dwmac-sun8i
Date: Wed, 18 Jul 2018 11:40:41 +0000
Message-ID: <1531914041-14751-6-git-send-email-clabbe@baylibre.com>
References: <1531914041-14751-1-git-send-email-clabbe@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531914041-14751-1-git-send-email-clabbe@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, linux@armlinux.org.uk, mark.rutland@arm.com, maxime.ripard@free-electrons.com, robh+dt@kernel.org, wens@csie.org, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-sunxi@googlegroups.com, Corentin Labbe <clabbe@baylibre.com>
List-Id: devicetree@vger.kernel.org

address-cells/size-cells is unnecessary for dwmac-sun8i node.
It was in early days, but since a mdio node is used, it could be
removed.

This patch fix the following DT warning:
Warning (avoid_unnecessary_addr_size): /soc/ethernet@1c50000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 91dd5dd9e205..357f6cba00cd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -668,8 +668,6 @@
 			clocks = <&ccu CLK_BUS_EMAC>;
 			clock-names = "stmmaceth";
 			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <0>;
 
 			mdio: mdio {
 				compatible = "snps,dwmac-mdio";
-- 
2.16.4
