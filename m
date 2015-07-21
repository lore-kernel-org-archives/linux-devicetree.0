From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v2 4/5] arm: qcom: dts: Add NAND controller node for ipq806x
Date: Tue, 21 Jul 2015 16:04:45 +0530
Message-ID: <1437474886-6209-5-git-send-email-architt@codeaurora.org>
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1437474886-6209-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437474886-6209-1-git-send-email-architt@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org, dehrenberg@google.com, cernekee@gmail.com, computersforpeace@gmail.com
Cc: linux-arm-msm@vger.kernel.org, agross@codeaurora.org, linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The nand controller in IPQ806x is of the 'EBI2 type'. Use the corresponding
compatible string.

Cc: devicetree@vger.kernel.org
Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 1e1b3f0..08dc2ef 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -350,5 +350,20 @@
 			status = "disabled";
 		};
 
+		nand@0x1ac00000 {
+			compatible = "qcom,ebi2-nandc";
+			reg = <0x1ac00000 0x800>;
+
+			clocks = <&gcc EBI2_CLK>,
+				 <&gcc EBI2_AON_CLK>;
+			clock-names = "core", "aon";
+
+			dmas = <&adm_dma 3>;
+			dma-names = "rxtx";
+			qcom,cmd-crci = <15>;
+			qcom,data-crci = <3>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
