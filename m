From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v5 4/5] arm64: dts: qcom: sdm845: Add UFS nodes for sdm845-mtp
Date: Fri, 26 Oct 2018 10:35:43 -0700
Message-ID: <20181026173544.136037-5-evgreen@chromium.org>
References: <20181026173544.136037-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181026173544.136037-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Can Guo <cang@codeaurora.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Can Guo <cang@codeaurora.org>

Enable the UFS host controller and PHY on sdm845-mtp.

Signed-off-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index eedfaf8922e2..d5fddea71a85 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -356,6 +356,20 @@
 	status = "okay";
 };
 
+&ufshc1 {
+	status = "okay";
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <600000>;
+};
+
+&ufsphy1 {
+	status = "okay";
+
+	vdda-phy-supply = <&vdda_ufs1_core>;
+	vdda-pll-supply = <&vdda_ufs1_1p2>;
+};
+
 &usb_1 {
 	status = "okay";
 };
-- 
2.16.4
