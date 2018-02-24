From: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] arm64: dts: fsl: fix ifc simple-bus unit address format
 warnings
Date: Sat, 24 Feb 2018 14:55:29 +0800
Message-ID: <1519455329-8595-1-git-send-email-shawnguo@kernel.org>
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
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

It fixes LS family SoCs device tree dtc warning in IFC child nodes.

Warning (simple_bus_reg): Node /soc/ifc@1530000/nor@0,0 simple-bus unit address format error, expected "0"
Warning (simple_bus_reg): Node /soc/ifc@1530000/nand@1,0 simple-bus unit address format error, expected "100000000"
Warning (simple_bus_reg): Node /soc/ifc@1530000/board-control@2,0 simple-bus unit address format error, expected "200000000"

Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts  | 6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts  | 6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts  | 6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts  | 4 ++--
 arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts  | 6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts  | 4 ++--
 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi | 6 +++---
 7 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
index 6341281485cf..3a09297dc0ef 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
@@ -84,19 +84,19 @@
 		  0x2 0x0 0x0 0x7fb00000 0x00000100>;
 	status = "okay";
 
-	nor@0,0 {
+	nor@0 {
 		compatible = "cfi-flash";
 		reg = <0x0 0x0 0x8000000>;
 		bank-width = <2>;
 		device-width = <1>;
 	};
 
-	nand@1,0 {
+	nand@100000000 {
 		compatible = "fsl,ifc-nand";
 		reg = <0x1 0x0 0x10000>;
 	};
 
-	fpga: board-control@2,0 {
+	fpga: board-control@200000000 {
 		compatible = "fsl,ls1043aqds-fpga", "fsl,fpga-qixis";
 		reg = <0x2 0x0 0x0000100>;
 	};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
index 3dc0c8e9663d..0a82bf941e11 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
@@ -97,7 +97,7 @@
 		  0x1 0x0 0x0 0x7e800000 0x00010000
 		  0x2 0x0 0x0 0x7fb00000 0x00000100>;
 
-		nor@0,0 {
+		nor@0 {
 			compatible = "cfi-flash";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -106,14 +106,14 @@
 			device-width = <1>;
 		};
 
-		nand@1,0 {
+		nand@100000000 {
 			compatible = "fsl,ifc-nand";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x1 0x0 0x10000>;
 		};
 
-		cpld: board-control@2,0 {
+		cpld: board-control@200000000 {
 			compatible = "fsl,ls1043ardb-cpld";
 			reg = <0x2 0x0 0x0000100>;
 		};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 434383bade0e..410dc61fe10a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -175,19 +175,19 @@
 		  0x2 0x0 0x0 0x7fb00000 0x00000100>;
 	status = "okay";
 
-	nor@0,0 {
+	nor@0 {
 		compatible = "cfi-flash";
 		reg = <0x0 0x0 0x8000000>;
 		bank-width = <2>;
 		device-width = <1>;
 	};
 
-	nand@1,0 {
+	nand@100000000 {
 		compatible = "fsl,ifc-nand";
 		reg = <0x1 0x0 0x10000>;
 	};
 
-	fpga: board-control@2,0 {
+	fpga: board-control@200000000 {
 		compatible = "fsl,ls1046aqds-fpga", "fsl,fpga-qixis";
 		reg = <0x2 0x0 0x0000100>;
 	};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 5dc2782e2a58..18d3c5bccfd1 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -122,14 +122,14 @@
 		  0x2 0x0 0x0 0x7fb00000 0x00000100>;
 	status = "okay";
 
-	nand@0,0 {
+	nand@0 {
 		compatible = "fsl,ifc-nand";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <0x0 0x0 0x10000>;
 	};
 
-	cpld: board-control@2,0 {
+	cpld: board-control@200000000 {
 		compatible = "fsl,ls1046ardb-cpld";
 		reg = <0x2 0x0 0x0000100>;
 	};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
index 30128051d0c0..0b96d6d4fe71 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
@@ -116,19 +116,19 @@
 		  3 0 0x5 0x20000000 0x00010000>;
 	status = "okay";
 
-	nor@0,0 {
+	nor@0 {
 		compatible = "cfi-flash";
 		reg = <0x0 0x0 0x8000000>;
 		bank-width = <2>;
 		device-width = <1>;
 	};
 
-	nand@2,0 {
+	nand@200000000 {
 		compatible = "fsl,ifc-nand";
 		reg = <0x2 0x0 0x10000>;
 	};
 
-	fpga: board-control@3,0 {
+	fpga: board-control@300000000 {
 		compatible = "fsl,ls1088aqds-fpga", "fsl,fpga-qixis";
 		reg = <0x3 0x0 0x0000100>;
 	};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 4f17601b919c..3d57008e70e8 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -99,12 +99,12 @@
 		  2 0 0x5 0x20000000 0x00010000>;
 	status = "okay";
 
-	nand@0,0 {
+	nand@0 {
 		compatible = "fsl,ifc-nand";
 		reg = <0x0 0x0 0x10000>;
 	};
 
-	fpga: board-control@2,0 {
+	fpga: board-control@200000000 {
 		compatible = "fsl,ls1088ardb-fpga", "fsl,fpga-qixis";
 		reg = <0x2 0x0 0x0000100>;
 	};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
index 1de618801c73..5ac34126bfe1 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
@@ -58,7 +58,7 @@
 		  0x2 0x0 0x5 0x30000000 0x00010000
 		  0x3 0x0 0x5 0x20000000 0x00010000>;
 
-	nor@0,0 {
+	nor@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "cfi-flash";
@@ -67,12 +67,12 @@
 		device-width = <1>;
 	};
 
-	nand@2,0 {
+	nand@200000000 {
 	     compatible = "fsl,ifc-nand";
 	     reg = <0x2 0x0 0x10000>;
 	};
 
-	cpld@3,0 {
+	cpld@300000000 {
 	     reg = <0x3 0x0 0x10000>;
 	     compatible = "fsl,ls2080aqds-fpga", "fsl,fpga-qixis";
 	};
-- 
1.9.1
