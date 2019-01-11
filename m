From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v1 4/8] arm64: dts: msm8996: Add UFS PHY reset controller
Date: Fri, 11 Jan 2019 15:01:25 -0800
Message-ID: <20190111230129.127037-5-evgreen@chromium.org>
References: <20190111230129.127037-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111230129.127037-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Can Guo <cang@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add the reset controller for the UFS controller, and wire it up
so that the UFS PHY can initialize itself without relying on
implicit sequencing between the two drivers.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 99b7495455a62..179f1988d45c5 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -663,10 +663,11 @@
 			clock-names = "ref_clk_src", "ref_clk";
 			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
 				 <&gcc GCC_UFS_CLKREF_CLK>;
+			resets = <&ufshc 0>;
 			status = "disabled";
 		};
 
-		ufshc@624000 {
+		ufshc: ufshc@624000 {
 			compatible = "qcom,ufshc";
 			reg = <0x624000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
@@ -722,6 +723,7 @@
 				<0 0>;
 
 			lanes-per-direction = <1>;
+			#reset-cells = <1>;
 			status = "disabled";
 
 			ufs_variant {
-- 
2.18.1
