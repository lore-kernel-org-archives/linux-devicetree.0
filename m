From: Xiaogang Cui <xiaogang@codeaurora.org>
Subject: [PATCH 2/2] arm64: dts: add msm8996 reboot mode support
Date: Fri, 14 Oct 2016 10:09:32 +0800
Message-ID: <1476411017-21040-1-git-send-email-xiaogang@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: Xiaogang Cui <xiaogang@codeaurora.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT
        AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add reboot mode entry for MSM8996 platform.

Signed-off-by: Xiaogang Cui <xiaogang@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/pm8994.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index 1222d2e..c9b14ab 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -51,6 +51,14 @@
 				     <0 0xa6 0 IRQ_TYPE_NONE>,
 				     <0 0xa7 0 IRQ_TYPE_NONE>;
 		};
+
+		qcom,reboot-mode@88f {
+			compatible = "qcom,reboot-mode";
+			offset = <0x88f>;
+			mode-normal = <0x00>;
+			mode-recovery = <0x04>;
+			mode-bootloader = <0x08>;
+		};
 	};
 
 	pmic@1 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
