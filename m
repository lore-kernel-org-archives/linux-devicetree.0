From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH 1/1] arm64: dts: sdm845: Add device node for Last level cache controller
Date: Wed, 10 Jul 2019 16:59:24 +0530
Message-ID: <20190710112924.17724-1-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Last level cache (aka. system cache) controller provides control
over the last level cache present on SDM845. This cache lies after
the memory noc, right before the DDR.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4babff5f19b5..314241a99290 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1275,6 +1275,13 @@
 			};
 		};
 
+		cache-controller@1100000 {
+			compatible = "qcom,sdm845-llcc";
+			reg = <0 0x1100000 0 0x200000>, <0 0x1300000 0 0x50000>;
+			reg-names = "llcc_base", "llcc_broadcast_base";
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sdm845-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
