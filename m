From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v2 3/9] dt-bindings: phy: qcom-ufs: Add resets property
Date: Wed, 23 Jan 2019 14:11:31 -0800
Message-ID: <20190123221137.41722-4-evgreen@chromium.org>
References: <20190123221137.41722-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123221137.41722-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Can Guo <cang@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a resets property to the PHY that represents the PHY reset
register in the UFS controller itself. This better describes the
complete specification of the PHY, and allows the PHY to perform
its initialization in a single function, rather than relying on
back-channel sequencing of initialization through the PHY framework.

Signed-off-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes in v2:
- Added resets to example (Stephen).

 Documentation/devicetree/bindings/ufs/ufs-qcom.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt b/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
index 21d9a93db2e97..fd59f93e95562 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
+++ b/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
@@ -29,6 +29,7 @@ Optional properties:
 - vdda-pll-max-microamp : specifies max. load that can be drawn from pll supply
 - vddp-ref-clk-supply   : phandle to UFS device ref_clk pad power supply
 - vddp-ref-clk-max-microamp : specifies max. load that can be drawn from this supply
+- resets : specifies the PHY reset in the UFS controller
 
 Example:
 
@@ -51,9 +52,11 @@ Example:
 			<&clock_gcc clk_ufs_phy_ldo>,
 			<&clock_gcc clk_gcc_ufs_tx_cfg_clk>,
 			<&clock_gcc clk_gcc_ufs_rx_cfg_clk>;
+		resets = <&ufshc 0>;
 	};
 
-	ufshc@fc598000 {
+	ufshc: ufshc@fc598000 {
+		#reset-cells = <1>;
 		...
 		phys = <&ufsphy1>;
 		phy-names = "ufsphy";
-- 
2.18.1
