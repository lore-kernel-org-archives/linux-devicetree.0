From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: zynq: DT: Add LEDs to zc702 DT
Date: Thu, 28 Aug 2014 09:22:53 -0700
Message-ID: <1409242973-2735-1-git-send-email-soren.brinkmann@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Ezra Savard <ezras-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ezra Savard <ezra.savard-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ezra Savard <ezra.savard-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Adds LEDs to the zc702 devicetree for use with the leds-gpio driver.

Signed-off-by: Ezra Savard <ezra.savard-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/zynq-zc702.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index 835c3089c61c..4e9fe26b3e85 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -27,6 +27,16 @@
 		bootargs = "console=ttyPS0,115200 earlyprintk";
 	};
 
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-ds23 {
+			label = "ds23";
+			gpios = <&gpio0 10 0>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 };
 
 &can0 {
-- 
2.1.0.1.g27b9230

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
