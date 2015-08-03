From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v3 5/5] arm: qcom: dts: Enable NAND node on IPQ8064 AP148 platform
Date: Mon,  3 Aug 2015 10:38:18 +0530
Message-ID: <1438578498-32254-6-git-send-email-architt@codeaurora.org>
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1438578498-32254-1-git-send-email-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438578498-32254-1-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dehrenberg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable the NAND controller node on the AP148 platform. Provide pinmux
information.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index 7f9ea50..2e88eff 100644
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
+		nand@1ac00000 {
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
