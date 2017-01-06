From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCHv2] ARM: dts: socfpga: add base fpga region and fpga bridges
Date: Fri,  6 Jan 2017 01:48:03 -0600
Message-ID: <1483688883-27106-1-git-send-email-dinguyen@kernel.org>
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
To: devicetree@vger.kernel.org
Cc: Alan Tull <atull@opensource.altera.com>, Dinh Nguyen <dinguyen@kernel.org>, dinguyen@opensource.altera.com, linux-arm-kernel@lists.infradead.org, atull@kernel.org
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Add h2f and lwh2f bridges.
Add base FPGA Region to support DT overlays for FPGA programming.
Add l3regs.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: removed fpga-bridges, ranges, and reset-names
---
 arch/arm/boot/dts/socfpga.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index de29172..c984f53 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -93,6 +93,14 @@
 			};
 		};
 
+		base_fpga_region {
+			compatible = "fpga-region";
+			fpga-mgr = <&fpgamgr0>;
+
+			#address-cells = <0x1>;
+			#size-cells = <0x1>;
+		};
+
 		can0: can@ffc00000 {
 			compatible = "bosch,d_can";
 			reg = <0xffc00000 0x1000>;
@@ -513,6 +521,20 @@
 				};
 		};
 
+		fpga_bridge0: fpga_bridge@ff400000 {
+			compatible = "altr,socfpga-lwhps2fpga-bridge";
+			reg = <0xff400000 0x100000>;
+			resets = <&rst LWHPS2FPGA_RESET>;
+			clocks = <&l4_main_clk>;
+		};
+
+		fpga_bridge1: fpga_bridge@ff500000 {
+			compatible = "altr,socfpga-hps2fpga-bridge";
+			reg = <0xff500000 0x10000>;
+			resets = <&rst HPS2FPGA_RESET>;
+			clocks = <&l4_main_clk>;
+		};
+
 		fpgamgr0: fpgamgr@ff706000 {
 			compatible = "altr,socfpga-fpga-mgr";
 			reg = <0xff706000 0x1000
@@ -694,6 +716,11 @@
 			arm,prefetch-offset = <7>;
 		};
 
+		l3regs@0xff800000 {
+			compatible = "altr,l3regs", "syscon";
+			reg = <0xff800000 0x1000>;
+		};
+
 		mmc: dwmmc0@ff704000 {
 			compatible = "altr,socfpga-dw-mshc";
 			reg = <0xff704000 0x1000>;
-- 
2.7.4
