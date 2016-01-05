From: Vinay Simha BN <vinaysimha-Ep6qli4bsbRW60MLeMDbCVaTQe2KTcn/@public.gmane.org>
Subject: [PATCH] arm64: dts: qcom: apq8016-sbc: leds: bt and wlan
Date: Tue,  5 Jan 2016 17:06:56 +0530
Message-ID: <1451993818-3469-1-git-send-email-vinaysimha@inforcecomputing.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vinay Simha BN <vinaysimha-Ep6qli4bsbRW60MLeMDbCVaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nicolas Dechesne <nicolas.dechesne-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM64 PORT
	AARCH64 ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

BT LED   - PMIC - MPP_03
WLAN LED - PMIC - MPP_02

Signed-off-by: Vinay Simha BN <vinaysimha-Ep6qli4bsbRW60MLeMDbCVaTQe2KTcn/@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 7bb0ab8..37ca0c8 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -94,14 +94,14 @@
 		led@5 {
 			label = "apq8016-sbc:yellow:wifi";
 			gpios = <&pm8916_mpps 2 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "wlan";
+			linux,default-trigger = "rfkill0";
 			default-state = "off";
 		};
 
 		led@6 {
 			label = "apq8016-sbc:blue:bt";
 			gpios = <&pm8916_mpps 3 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "bt";
+			linux,default-trigger = "rfkill1";
 			default-state = "off";
 		};
 	};
-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
