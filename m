From: andy.tang@nxp.com
Subject: [PATCH 2/3 v2] clk: qoriq: remove legacy bindings and add more
 compatibles
Date: Wed, 24 Oct 2018 10:11:21 +0800
Message-ID: <20181024021122.3942-2-andy.tang@nxp.com>
References: <20181024021122.3942-1-andy.tang@nxp.com>
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20181024021122.3942-1-andy.tang@nxp.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: sboyd@kernel.org, mturquette@baylibre.com, oss@buserror.net
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Yuantian Tang <andy.tang@nxp.com>

The new bindings will be used, so delete the old bindings.
Add more SOC compatibles as needed as well.

Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
---
v2:
  - involve more chips

 .../devicetree/bindings/clock/qoriq-clock.txt      |  112 +------------------
 1 files changed, 6 insertions(+), 106 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
index 97f46ad..8484d90 100644
--- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
+++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
@@ -28,6 +28,12 @@ Required properties:
 	* "fsl,p4080-clockgen"
 	* "fsl,p5020-clockgen"
 	* "fsl,p5040-clockgen"
+	* "fsl,t1023-clockgen"
+	* "fsl,t1024-clockgen"
+	* "fsl,t1040-clockgen"
+	* "fsl,t1042-clockgen"
+	* "fsl,t2080-clockgen"
+	* "fsl,t2081-clockgen"
 	* "fsl,t4240-clockgen"
 	* "fsl,b4420-clockgen"
 	* "fsl,b4860-clockgen"
@@ -96,109 +102,3 @@ second cell is the clock index for the specified type.
 		...
 	};
 }
-4. Legacy Child Nodes
-
-NOTE: These nodes are deprecated.  Kernels should continue to support
-device trees with these nodes, but new device trees should not use them.
-
-Most of the bindings are from the common clock binding[1].
- [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : Should include one of the following:
-	* "fsl,qoriq-core-pll-1.0" for core PLL clocks (v1.0)
-	* "fsl,qoriq-core-pll-2.0" for core PLL clocks (v2.0)
-	* "fsl,qoriq-core-mux-1.0" for core mux clocks (v1.0)
-	* "fsl,qoriq-core-mux-2.0" for core mux clocks (v2.0)
-	* "fsl,qoriq-sysclk-1.0": for input system clock (v1.0).
-		It takes parent's clock-frequency as its clock.
-	* "fsl,qoriq-sysclk-2.0": for input system clock (v2.0).
-		It takes parent's clock-frequency as its clock.
-	* "fsl,qoriq-platform-pll-1.0" for the platform PLL clock (v1.0)
-	* "fsl,qoriq-platform-pll-2.0" for the platform PLL clock (v2.0)
-- #clock-cells: From common clock binding. The number of cells in a
-	clock-specifier. Should be <0> for "fsl,qoriq-sysclk-[1,2].0"
-	clocks, or <1> for "fsl,qoriq-core-pll-[1,2].0" clocks.
-	For "fsl,qoriq-core-pll-[1,2].0" clocks, the single
-	clock-specifier cell may take the following values:
-	* 0 - equal to the PLL frequency
-	* 1 - equal to the PLL frequency divided by 2
-	* 2 - equal to the PLL frequency divided by 4
-
-Recommended properties:
-- clocks: Should be the phandle of input parent clock
-- clock-names: From common clock binding, indicates the clock name
-- clock-output-names: From common clock binding, indicates the names of
-	output clocks
-- reg: Should be the offset and length of clock block base address.
-	The length should be 4.
-
-Legacy Example:
-/ {
-	clockgen: global-utilities@e1000 {
-		compatible = "fsl,p5020-clockgen", "fsl,qoriq-clockgen-1.0";
-		ranges = <0x0 0xe1000 0x1000>;
-		clock-frequency = <133333333>;
-		reg = <0xe1000 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		sysclk: sysclk {
-			#clock-cells = <0>;
-			compatible = "fsl,qoriq-sysclk-1.0";
-			clock-output-names = "sysclk";
-		};
-
-		pll0: pll0@800 {
-			#clock-cells = <1>;
-			reg = <0x800 0x4>;
-			compatible = "fsl,qoriq-core-pll-1.0";
-			clocks = <&sysclk>;
-			clock-output-names = "pll0", "pll0-div2";
-		};
-
-		pll1: pll1@820 {
-			#clock-cells = <1>;
-			reg = <0x820 0x4>;
-			compatible = "fsl,qoriq-core-pll-1.0";
-			clocks = <&sysclk>;
-			clock-output-names = "pll1", "pll1-div2";
-		};
-
-		mux0: mux0@0 {
-			#clock-cells = <0>;
-			reg = <0x0 0x4>;
-			compatible = "fsl,qoriq-core-mux-1.0";
-			clocks = <&pll0 0>, <&pll0 1>, <&pll1 0>, <&pll1 1>;
-			clock-names = "pll0", "pll0-div2", "pll1", "pll1-div2";
-			clock-output-names = "cmux0";
-		};
-
-		mux1: mux1@20 {
-			#clock-cells = <0>;
-			reg = <0x20 0x4>;
-			compatible = "fsl,qoriq-core-mux-1.0";
-			clocks = <&pll0 0>, <&pll0 1>, <&pll1 0>, <&pll1 1>;
-			clock-names = "pll0", "pll0-div2", "pll1", "pll1-div2";
-			clock-output-names = "cmux1";
-		};
-
-		platform-pll: platform-pll@c00 {
-			#clock-cells = <1>;
-			reg = <0xc00 0x4>;
-			compatible = "fsl,qoriq-platform-pll-1.0";
-			clocks = <&sysclk>;
-			clock-output-names = "platform-pll", "platform-pll-div2";
-		};
-	};
-};
-
-Example for legacy clock consumer:
-
-/ {
-	cpu0: PowerPC,e5500@0 {
-		...
-		clocks = <&mux0>;
-		...
-	};
-};
-- 
1.7.1
