From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v2 5/5] arm: qcom: dts: Enale NAND node on IPQ8064 AP148 platform
Date: Tue, 21 Jul 2015 16:04:46 +0530
Message-ID: <1437474886-6209-6-git-send-email-architt@codeaurora.org>
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1437474886-6209-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437474886-6209-1-git-send-email-architt@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org, dehrenberg@google.com, cernekee@gmail.com, computersforpeace@gmail.com
Cc: linux-arm-msm@vger.kernel.org, agross@codeaurora.org, linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable the NAND controller node on the AP148 platform. Provide pinmux
information.

Cc: devicetree@vger.kernel.org
Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index 7f9ea50..03fd6b7 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
@@ -30,6 +30,28 @@
 					bias-none;
 				};
 			};
+			nand_pins: nand_pins {
+				mux {
+					pins = "gpio34", "gpio35", "gpio36",
+					       "gpio37", "gpio38", "gpio39",
+					       "gpio40", "gpio41", "gpio42",
+					       "gpio43", "gpio44", "gpio45",
+					       "gpio46", "gpio47";
+					function = "nand";
+					drive-strength = <10>;
+					bias-disable;
+				};
+				pullups {
+					pins = "gpio39";
+					bias-pull-up;
+				};
+				hold {
+					pins = "gpio40", "gpio41", "gpio42",
+					       "gpio43", "gpio44", "gpio45",
+					       "gpio46", "gpio47";
+					bias-bus-hold;
+				};
+			};
 		};
 
 		gsbi@16300000 {
@@ -93,5 +115,19 @@
 		sata@29000000 {
 			status = "ok";
 		};
+
+		nand@0x1ac00000 {
+			status = "ok";
+
+			pinctrl-0 = <&nand_pins>;
+			pinctrl-names = "default";
+
+			nand-ecc-strength = <4>;
+			nand-bus-width = <8>;
+		};
 	};
 };
+
+&adm_dma {
+	status = "ok";
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
