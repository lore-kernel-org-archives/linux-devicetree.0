From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 3/3] arm64: dts: qcom: Add APSS shared mailbox node to SDM845
Date: Wed, 25 Apr 2018 20:08:03 +0530
Message-ID: <20180425143803.11260-3-sibis@codeaurora.org>
References: <20180425143803.11260-1-sibis@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180425143803.11260-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, mark.rutland@arm.com, bjorn.andersson@linaro.org
Cc: david.brown@linaro.org, linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, jassisinghbrar@gmail.com, will.deacon@arm.com, catalin.marinas@arm.com, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch add the node to support APSS shared
mailbox on SDM845

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

This patch depends on https://patchwork.kernel.org/patch/10276419/

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 486ace9a9e8b..9be763da0664 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -338,5 +338,11 @@
 				status = "disabled";
 			};
 		};
+
+		apss_shared: mailbox@17990000 {
+			compatible = "qcom,sdm845-apss-shared";
+			reg = <0x17990000 0x1000>;
+			#mbox-cells = <1>;
+		};
 	};
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
