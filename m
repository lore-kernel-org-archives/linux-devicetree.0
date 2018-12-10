From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v2 2/4] arm64: dts: qcom: msm8996: Fix QMP PHY #clock-cells
Date: Mon, 10 Dec 2018 11:32:05 -0800
Message-ID: <20181210193207.242080-3-evgreen@chromium.org>
References: <20181210193207.242080-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210193207.242080-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <andy.gross@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Move #clock-cells into the child node and set it to 0 to conform to the
proper binding specification.

Signed-off-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---

Changes in v2: None

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index b29fe80d72883..44a494c70fa11 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -760,7 +760,6 @@
 		phy@34000 {
 			compatible = "qcom,msm8996-qmp-pcie-phy";
 			reg = <0x34000 0x488>;
-			#clock-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -783,6 +782,7 @@
 				reg = <0x035000 0x130>,
 					<0x035200 0x200>,
 					<0x035400 0x1dc>;
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 
 				clock-output-names = "pcie_0_pipe_clk_src";
@@ -796,6 +796,7 @@
 				reg = <0x036000 0x130>,
 					<0x036200 0x200>,
 					<0x036400 0x1dc>;
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 
 				clock-output-names = "pcie_1_pipe_clk_src";
@@ -809,6 +810,7 @@
 				reg = <0x037000 0x130>,
 					<0x037200 0x200>,
 					<0x037400 0x1dc>;
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 
 				clock-output-names = "pcie_2_pipe_clk_src";
@@ -822,7 +824,6 @@
 		phy@7410000 {
 			compatible = "qcom,msm8996-qmp-usb3-phy";
 			reg = <0x7410000 0x1c4>;
-			#clock-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -844,6 +845,7 @@
 				reg = <0x7410200 0x200>,
 					<0x7410400 0x130>,
 					<0x7410600 0x1a8>;
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 
 				clock-output-names = "usb3_phy_pipe_clk_src";
-- 
2.18.1
