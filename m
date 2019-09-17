From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 09/13] arm64: dts: rockchip: document explicit px30 cru dependencies
Date: Tue, 17 Sep 2019 10:26:55 +0200
Message-ID: <20190917082659.25549-9-heiko@sntech.de>
References: <20190917082659.25549-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917082659.25549-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-rockchip@lists.infradead.org, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

The px30 contains 2 separate clock controllers the regular cru creating
most clocks as well as the pmucru managing the GPLL and some other clocks.

The gpll of course also is needed by the cru, so while we normally do rely
on clock names to associate clocks getting probed later on (for example
xin32k coming from an i2c device in most cases) it is safer to declare the
explicit dependency between the two crus. This makes sure that for example
the clock-framework probes them in the correct order from the start.

The assigned-clocks properties were simply working by chance in the past
so split them accordingly to the 2 crus to honor the loading direction.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/clock/rockchip,px30-cru.txt      |  5 ++++
 arch/arm64/boot/dts/rockchip/px30.dtsi        | 25 +++++++++++--------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/rockchip,px30-cru.txt b/Documentation/devicetree/bindings/clock/rockchip,px30-cru.txt
index 39f0c1ac84ee..55e78cddec8c 100644
--- a/Documentation/devicetree/bindings/clock/rockchip,px30-cru.txt
+++ b/Documentation/devicetree/bindings/clock/rockchip,px30-cru.txt
@@ -10,6 +10,11 @@ Required Properties:
 - compatible: CRU should be "rockchip,px30-cru"
 - reg: physical base address of the controller and length of memory mapped
   region.
+- clocks: A list of phandle + clock-specifier pairs for the clocks listed
+          in clock-names
+- clock-names: Should contain the following:
+  - "xin24m" for both PMUCRU and CRU
+  - "gpll" for CRU (sourced from PMUCRU)
 - #clock-cells: should be 1.
 - #reset-cells: should be 1.
 
diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 63499d27994c..9ad1c2f04ea9 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -667,33 +667,38 @@
 	cru: clock-controller@ff2b0000 {
 		compatible = "rockchip,px30-cru";
 		reg = <0x0 0xff2b0000 0x0 0x1000>;
+		clocks = <&xin24m>, <&pmucru PLL_GPLL>;
+		clock-names = "xin24m", "gpll";
 		rockchip,grf = <&grf>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 
-		assigned-clocks = <&cru PLL_NPLL>;
-		assigned-clock-rates = <1188000000>;
+		assigned-clocks = <&cru PLL_NPLL>,
+			<&cru ACLK_BUS_PRE>, <&cru ACLK_PERI_PRE>,
+			<&cru HCLK_BUS_PRE>, <&cru HCLK_PERI_PRE>,
+			<&cru PCLK_BUS_PRE>, <&cru SCLK_GPU>;
+
+		assigned-clock-rates = <1188000000>,
+			<200000000>, <200000000>,
+			<150000000>, <150000000>,
+			<100000000>, <200000000>;
 	};
 
 	pmucru: clock-controller@ff2bc000 {
 		compatible = "rockchip,px30-pmucru";
 		reg = <0x0 0xff2bc000 0x0 0x1000>;
+		clocks = <&xin24m>;
+		clock-names = "xin24m";
 		rockchip,grf = <&grf>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 
 		assigned-clocks =
 			<&pmucru PLL_GPLL>, <&pmucru PCLK_PMU_PRE>,
-			<&pmucru SCLK_WIFI_PMU>, <&cru ARMCLK>,
-			<&cru ACLK_BUS_PRE>, <&cru ACLK_PERI_PRE>,
-			<&cru HCLK_BUS_PRE>, <&cru HCLK_PERI_PRE>,
-			<&cru PCLK_BUS_PRE>, <&cru SCLK_GPU>;
+			<&pmucru SCLK_WIFI_PMU>;
 		assigned-clock-rates =
 			<1200000000>, <100000000>,
-			<26000000>, <600000000>,
-			<200000000>, <200000000>,
-			<150000000>, <150000000>,
-			<100000000>, <200000000>;
+			<26000000>;
 	};
 
 	usb20_otg: usb@ff300000 {
-- 
2.20.1
