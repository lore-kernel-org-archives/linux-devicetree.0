From: Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 4/5] ARM: dts: sun8i: r40: Remove unused address-cells/size-cells of dwmac-sun8i
Date: Wed, 18 Jul 2018 11:40:40 +0000
Message-ID: <1531914041-14751-5-git-send-email-clabbe@baylibre.com>
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
 arch/arm/boot/dts/sun8i-r40.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 38a3e0dbc824..1e680e4fee60 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -576,8 +576,6 @@
 			reset-names = "stmmaceth";
 			clocks = <&ccu CLK_BUS_GMAC>;
 			clock-names = "stmmaceth";
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 
 			gmac_mdio: mdio {
-- 
2.16.4
