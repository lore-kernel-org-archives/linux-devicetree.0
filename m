From: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v1 3/3] arm64:dts: Add APM X-Gene standby GPIO controller DTS entries
Date: Wed,  8 Oct 2014 21:52:28 +0700
Message-ID: <1412779948-28769-4-git-send-email-yvo@apm.com>
References: <1412779948-28769-1-git-send-email-yvo@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412779948-28769-1-git-send-email-yvo-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Toan Le <toanle-qTEPVZfXA3Y@public.gmane.org>, Tin Huynh <tnhuynh-qTEPVZfXA3Y@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add standby domain gpio controller for APM X-Gene SoC platform.

Signed-off-by: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>
---
 arch/arm64/boot/dts/apm-storm.dtsi |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index c0aceef..1d1da4c 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -389,6 +389,19 @@
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
1.7.9.5

CONFIDENTIALITY NOTICE: This e-mail message, including any attachments, 
is for the sole use of the intended recipient(s) and contains information
that is confidential and proprietary to Applied Micro Circuits Corporation or its subsidiaries. 
It is to be used solely for the purpose of furthering the parties' business relationship. 
All unauthorized review, use, disclosure or distribution is prohibited. 
If you are not the intended recipient, please contact the sender by reply e-mail 
and destroy all copies of the original message.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
