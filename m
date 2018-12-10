From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v2 3/4] arm64: dts: qcom: sdm845: Fix QMP PHY #clock-cells
Date: Mon, 10 Dec 2018 11:32:06 -0800
Message-ID: <20181210193207.242080-4-evgreen@chromium.org>
References: <20181210193207.242080-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210193207.242080-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <andy.gross@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Move #clock-cells into the child node for instances of the qcom-qmp-phy
nodes, and set it to zero, in accordance with the proper bindings. PHYs
that don't provide clocks don't have #clock-cells, and so are left alone.

Signed-off-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v2: None

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 47bb7edc03afe..fedd6578776a2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1170,7 +1170,6 @@
 			      <0x88e8000 0x10>;
 			reg-names = "reg-base", "dp_com";
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1192,6 +1191,7 @@
 				      <0x88e9600 0x128>,
 				      <0x88e9800 0x200>,
 				      <0x88e9a00 0x100>;
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
 				clock-names = "pipe0";
@@ -1203,7 +1203,6 @@
 			compatible = "qcom,sdm845-qmp-usb3-uni-phy";
 			reg = <0x88eb000 0x18c>;
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1223,6 +1222,7 @@
 				      <0x88eb400 0x1fc>,
 				      <0x88eb800 0x218>,
 				      <0x88e9600 0x70>;
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
 				clock-names = "pipe0";
-- 
2.18.1
