From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: msm8998-mtp: Increase load on l21 for sdcard
Date: Tue, 18 Dec 2018 11:04:43 -0700
Message-ID: <1545156283-5461-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

l21 is used as sdcard vmmc, and needs the load increased to prevent
voltage drop issues with some sdcards.  This addresses -84 errors seen
during sdcard init with SDR104 cards.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 50e9033..288adbf 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -192,6 +192,8 @@
 		vreg_l21a_2p95: l21 {
 			regulator-min-microvolt = <2960000>;
 			regulator-max-microvolt = <2960000>;
+			regulator-allow-set-load;
+			regulator-system-load = <800000>;
 		};
 		vreg_l22a_2p85: l22 {
 			regulator-min-microvolt = <2864000>;
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
