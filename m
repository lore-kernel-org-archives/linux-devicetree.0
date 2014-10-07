From: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RESUBMIT PATCH v3 4/8] devicetree: backlight: add new SKY81452 backlight binding
Date: Tue,  7 Oct 2014 14:04:56 +0900
Message-ID: <1412658296-8038-1-git-send-email-jack.yoo@skyworksinc.com>
References: <1412657745-7812-1-git-send-email-jack.yoo@skyworksinc.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412657745-7812-1-git-send-email-jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
---
 .../video/backlight/sky81452-backlight.txt         | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/backlight/sky81452-backlight.txt

diff --git a/Documentation/devicetree/bindings/video/backlight/sky81452-backlight.txt b/Documentation/devicetree/bindings/video/backlight/sky81452-backlight.txt
new file mode 100644
index 0000000..2c2d947
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/backlight/sky81452-backlight.txt
@@ -0,0 +1,24 @@
+SKY81452-backlight bindings
+
+Required properties:
+- compatible		: Must be "skyworks,sky81452-backlight"
+
+Optional properties:
+- name			: Name of backlight device. Default is 'lcd-backlight'.
+- gpio-enable		: GPIO to use to EN pin.
+- enable		: Enable mask for current sink channel 1 to 6.
+- ignore-pwm		: Ignore both PWM input
+- dpwm-mode		: Enable DPWM dimming mode, otherwise Analog dimming mode
+- phase-shift		: Enable phase shift mode
+- ovp-level		: Over-voltage protection level. Should be between 14 or 28V.
+- short-detection-threshold	: It should be one of 4, 5, 6 and 7V.
+- boost-current-limit	: It should be one of 800, 1100 and 1500mA.
+
+Example:
+
+	backlight {
+		compatible = "skyworks,sky81452-backlight";
+		name = "pwm-backlight";
+		enable = <0x3F>;
+		ignore-pwm;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
