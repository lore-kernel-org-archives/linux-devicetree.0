From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ARM: zynq: DT: Add LEDs to zc702 DT
Date: Fri, 29 Aug 2014 07:38:37 -0700
Message-ID: <1409323117-21711-1-git-send-email-soren.brinkmann@xilinx.com>
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
v2:
 - fix node names
---
 arch/arm/boot/dts/zynq-zc702.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index 835c3089c61c..b29e0f97e764 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -27,6 +27,15 @@
 		bootargs = "console=ttyPS0,115200 earlyprintk";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		ds23 {
+			label = "ds23";
+			gpios = <&gpio0 10 0>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &can0 {
-- 
2.1.0.1.g27b9230

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
