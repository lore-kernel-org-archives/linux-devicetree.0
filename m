From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 09/12] ARM: dts: apq8064: Add USB OTG support for CM QS-600
Date: Fri, 10 Apr 2015 13:34:53 +0100
Message-ID: <1428669293-11165-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1428669187-10775-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428669187-10775-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Dechesne <nicolas.dechesne-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Nicolas Dechesne <nicolas.dechesne-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This patch adds USB OTG support on USB1 for Compulab QS-600 Board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
[Srinivas Kandagatla: fixed up regulators and status properties]
Signed-off-by: Nicolas Dechesne <nicolas.dechesne-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index fc69931..d353694 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -101,6 +101,14 @@
 			};
 		};
 
+		/* OTG */
+		usb1_phy:phy@12500000 {
+			status		= "okay";
+			vddcx-supply	= <&pm8921_s3>;
+			v3p3-supply	= <&pm8921_l3>;
+			v1p8-supply	= <&pm8921_l4>;
+		};
+
 		usb3_phy:phy@12520000 {
 			status		= "okay";
 			vddcx-supply	= <&pm8921_s3>;
@@ -115,6 +123,15 @@
 			v1p8-supply	= <&pm8921_l23>;
 		};
 
+		gadget1:gadget@12500000 {
+			status = "ok";
+		};
+
+		/* OTG */
+		usb1: usb@12500000 {
+			status = "ok";
+		};
+
 		usb3: usb@12520000 {
 			status = "okay";
 		};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
