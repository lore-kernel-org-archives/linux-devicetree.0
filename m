From: Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] ARM: dts: sunxi: Remove unused address-cells/size-cells of
 dwmac-sun8i
Date: Sun, 15 Jul 2018 11:55:49 +0000
Message-ID: <1531655749-14063-1-git-send-email-clabbe@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: catalin.marinas@arm.com, linux@armlinux.org.uk, mark.rutland@arm.com, maxime.ripard@free-electrons.com, robh+dt@kernel.org, wens@csie.org, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Corentin Labbe <clabbe@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

address-cells/size-cells is unnecessary for dwmac-sun8i node.
It was in early days, but since a mdio node is used, it could be
removed.

This patch fix the following DT warning:
Warning (avoid_unnecessary_addr_size): /soc/ethernet@1c50000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/net/dwmac-sun8i.txt | 8 --------
 arch/arm/boot/dts/sun8i-a83t.dtsi                     | 2 --
 arch/arm/boot/dts/sun8i-r40.dtsi                      | 2 --
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                    | 2 --
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         | 2 --
 5 files changed, 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
index cfe724398a12..5bb3a18cc38d 100644
--- a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
+++ b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
@@ -19,8 +19,6 @@ Required properties:
 - reset-names: must be "stmmaceth"
 - phy-mode: See ethernet.txt
 - phy-handle: See ethernet.txt
-- #address-cells: shall be 1
-- #size-cells: shall be 0
 - syscon: A phandle to the device containing the EMAC or GMAC clock register
 
 Optional properties:
@@ -86,8 +84,6 @@ emac: ethernet@1c0b000 {
 	reset-names = "stmmaceth";
 	clocks = <&ccu CLK_BUS_EMAC>;
 	clock-names = "stmmaceth";
-	#address-cells = <1>;
-	#size-cells = <0>;
 
 	phy-handle = <&int_mii_phy>;
 	phy-mode = "mii";
@@ -137,8 +133,6 @@ emac: ethernet@1c0b000 {
 	reset-names = "stmmaceth";
 	clocks = <&ccu CLK_BUS_EMAC>;
 	clock-names = "stmmaceth";
-	#address-cells = <1>;
-	#size-cells = <0>;
 
 	phy-handle = <&ext_rgmii_phy>;
 	phy-mode = "rgmii";
@@ -191,8 +185,6 @@ emac: ethernet@1c0b000 {
 	reset-names = "stmmaceth";
 	clocks = <&ccu CLK_BUS_EMAC>;
 	clock-names = "stmmaceth";
-	#address-cells = <1>;
-	#size-cells = <0>;
 
 	phy-handle = <&ext_rgmii_phy>;
 	phy-mode = "rgmii";
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
diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index cb8932bcef0d..bd369112a400 100644
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
diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 90021f38c1ef..f0352b8da19f 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -516,8 +516,6 @@
 			reset-names = "stmmaceth";
 			clocks = <&ccu CLK_BUS_EMAC>;
 			clock-names = "stmmaceth";
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 
 			mdio: mdio {
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
