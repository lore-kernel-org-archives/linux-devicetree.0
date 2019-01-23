From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v2 4/9] arm64: dts: sdm845: Add UFS PHY reset
Date: Wed, 23 Jan 2019 14:11:32 -0800
Message-ID: <20190123221137.41722-5-evgreen@chromium.org>
References: <20190123221137.41722-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123221137.41722-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Can Guo <cang@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Wire up the reset controller in the Qcom UFS controller for the PHY.
This will be used to toggle PHY reset during initialization of the PHY.

Signed-off-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
This commit is based atop the series at [1]. Patches 1 and 2 of that
series have landed, but 3, 4, and 5 are still outstanding.

[1] https://lore.kernel.org/lkml/20181210192826.241350-1-evgreen@chromium.org/

Changes in v2: None

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b29332b265d9e..029ab66405cf4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -990,6 +990,7 @@
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			power-domains = <&gcc UFS_PHY_GDSC>;
+			#reset-cells = <1>;
 
 			clock-names =
 				"core_clk",
@@ -1033,6 +1034,8 @@
 			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
 
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
 			status = "disabled";
 
 			ufs_mem_phy_lanes: lanes@1d87400 {
-- 
2.18.1
