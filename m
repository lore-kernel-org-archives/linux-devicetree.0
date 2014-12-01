From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [PATCH v3 2/3] arm: dts: zynq: Move crystal freq. to board level
Date: Mon,  1 Dec 2014 10:25:49 +1000
Message-ID: <1417393550-6674-2-git-send-email-crosthwaite.peter@gmail.com>
References: <1417393550-6674-1-git-send-email-crosthwaite.peter@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417393550-6674-1-git-send-email-crosthwaite.peter@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: michals@xilinx.com, sorenb@xilinx.com, steven.wang@digilentinc.com
List-Id: devicetree@vger.kernel.org

The fact that all supported boards use the same 33MHz crystal is a
co-incidence. The Zynq PS support a range of crystal freqs so the
hardcoded setting should be removed from the dtsi. Re-implement it
on the board level.

This prepares support for Zynq boards with different crystal
frequencies (e.g. the Digilent ZYBO).

Acked-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

---
Changed since v1:
Alphabetize node ordering (Soren review)

Im guessing long term this should be converted to a fixed clock. But
I think this at least steps in that direction.
---
 arch/arm/boot/dts/zynq-7000.dtsi      | 1 -
 arch/arm/boot/dts/zynq-parallella.dts | 1 +
 arch/arm/boot/dts/zynq-zc702.dts      | 4 ++++
 arch/arm/boot/dts/zynq-zc706.dts      | 4 ++++
 arch/arm/boot/dts/zynq-zed.dts        | 4 ++++
 5 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index ce2ef5b..ee3e5d6 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -243,7 +243,6 @@
 			clkc: clkc@100 {
 				#clock-cells = <1>;
 				compatible = "xlnx,ps7-clkc";
-				ps-clk-frequency = <33333333>;
 				fclk-enable = <0>;
 				clock-output-names = "armpll", "ddrpll", "iopll", "cpu_6or4x",
 						"cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x", "ddr3x",
diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/zynq-parallella.dts
index 0429bbd..b5792cab 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -35,6 +35,7 @@
 };
 
 &clkc {
+	ps-clk-frequency = <33333333>;
 	fclk-enable = <0xf>;
 };
 
diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index 94e2cda..280f02d 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -42,6 +42,10 @@
 	status = "okay";
 };
 
+&clkc {
+	ps-clk-frequency = <33333333>;
+};
+
 &gem0 {
 	status = "okay";
 	phy-mode = "rgmii-id";
diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
index a8bbdfb..34f7812 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -29,6 +29,10 @@
 
 };
 
+&clkc {
+	ps-clk-frequency = <33333333>;
+};
+
 &gem0 {
 	status = "okay";
 	phy-mode = "rgmii-id";
diff --git a/arch/arm/boot/dts/zynq-zed.dts b/arch/arm/boot/dts/zynq-zed.dts
index 697779a..1c7cc99 100644
--- a/arch/arm/boot/dts/zynq-zed.dts
+++ b/arch/arm/boot/dts/zynq-zed.dts
@@ -29,6 +29,10 @@
 
 };
 
+&clkc {
+	ps-clk-frequency = <33333333>;
+};
+
 &gem0 {
 	status = "okay";
 	phy-mode = "rgmii-id";
-- 
1.9.1
