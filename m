From: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v2 RESEND 3/3] arm64:dts: Add APM X-Gene standby GPIO controller DTS entries
Date: Wed, 17 Dec 2014 12:10:50 +0700
Message-ID: <1418793050-26927-4-git-send-email-yvo@apm.com>
References: <1418793050-26927-1-git-send-email-yvo@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418793050-26927-1-git-send-email-yvo-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Toan Le <toanle-qTEPVZfXA3Y@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add standby domain gpio controller for APM X-Gene SoC platform.

Signed-off-by: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>
---
 arch/arm64/boot/dts/apm-storm.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index 295c72d..e2454a2 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -587,6 +587,19 @@
 			phy-names = "sata-phy";
 		};
 
+		sbgpio: sbgpio@17001000{
+			compatible = "apm,xgene-gpio-sb";
+			reg = <0x0 0x17001000 0x0 0x400>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			interrupts = 	<0x0 0x28 0x1>,
+					<0x0 0x29 0x1>,
+					<0x0 0x2a 0x1>,
+					<0x0 0x2b 0x1>,
+					<0x0 0x2c 0x1>,
+					<0x0 0x2d 0x1>;
+		};
+
 		rtc: rtc@10510000 {
 			compatible = "apm,xgene-rtc";
 			reg = <0x0 0x10510000 0x0 0x400>;
-- 
2.2.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
