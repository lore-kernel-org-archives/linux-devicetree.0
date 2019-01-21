From: Alok Chauhan <alokc@codeaurora.org>
Subject: [PATCH 6/6] arm64: dts: sdm845: Add interconnect for GENI QUP
Date: Mon, 21 Jan 2019 16:51:43 +0530
Message-ID: <1548069703-26595-7-git-send-email-alokc@codeaurora.org>
References: <1548069703-26595-1-git-send-email-alokc@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548069703-26595-1-git-send-email-alokc@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Cc: georgi.djakov@linaro.org, dianders@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org, Alok Chauhan <alokc@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add interconnect ports for GENI QUPs to set bus
capabilities.

Signed-off-by: Alok Chauhan <alokc@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index c27cbd3..fb0a8a7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -374,6 +374,13 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
+
+			interconnects = <&rsc_hlos MASTER_BLSP_1
+					&rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC
+					&rsc_hlos SLAVE_BLSP_1>;
+			interconnect-names = "qup-memory", "qup-config";
+
 			status = "disabled";
 
 			i2c0: i2c@880000 {
@@ -682,6 +689,13 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
+
+			interconnects = <&rsc_hlos MASTER_BLSP_2
+					&rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC
+					&rsc_hlos SLAVE_BLSP_2>;
+			interconnect-names = "qup-memory", "qup-config";
+
 			status = "disabled";
 
 			i2c8: i2c@a80000 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
