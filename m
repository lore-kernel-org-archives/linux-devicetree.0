From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v4 4/5] arm: qcom: dts: Add NAND controller node for ipq806x
Date: Wed, 19 Aug 2015 10:19:05 +0530
Message-ID: <1439959746-25498-5-git-send-email-architt@codeaurora.org>
References: <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1439959746-25498-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org, dehrenberg@google.com, cernekee@gmail.com, computersforpeace@gmail.com, sboyd@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, agross@codeaurora.org, linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The nand controller in IPQ806x is of the 'EBI2 type'. Use the corresponding
compatible string.

Cc: devicetree@vger.kernel.org

Reviewed-by: Andy Gross <agross@codeaurora.org>
Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 1e1b3f0..a7f0ee5 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -350,5 +350,20 @@
 			status = "disabled";
 		};
 
+		nand@1ac00000 {
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
