From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v7 5/5] arm64: dts: qcom: sdm845: Add USB PHY lane two
Date: Mon, 10 Dec 2018 11:28:26 -0800
Message-ID: <20181210192826.241350-6-evgreen@chromium.org>
References: <20181210192826.241350-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210192826.241350-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the second lane registers for the USB PHY, now that the
QMP phy bindings have been updated. This way the driver can stop
reaching beyond its register region to get at the second lane.

Signed-off-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes in v7:
 - Rebased on top of phy/next

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3:
 - Removed erroneous fixup for USB UniPro PHY, which is not dual lane (Doug)

Changes in v2: None

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4ad4eaf1d61ce..dcc362b6cf04d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1185,10 +1185,12 @@
 				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
 
-			usb_1_ssphy: lane@88e9200 {
+			usb_1_ssphy: lanes@88e9200 {
 				reg = <0x88e9200 0x128>,
 				      <0x88e9400 0x200>,
 				      <0x88e9c00 0x218>,
+				      <0x88e9600 0x128>,
+				      <0x88e9800 0x200>,
 				      <0x88e9a00 0x100>;
 				#phy-cells = <0>;
 				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
-- 
2.18.1
