From: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] devicetree: sound: add binding for WM8974 codec
Date: Wed, 16 Dec 2015 13:55:13 +0000
Message-ID: <1450274114-20145-1-git-send-email-mans@mansr.com>
References: <1450270975-17955-1-git-send-email-mans@mansr.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450270975-17955-1-git-send-email-mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds a binding for the Wolfson WM8974 mono audio codec.

Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
---
Sending this patch again, this time including Mark Brown.
---
 Documentation/devicetree/bindings/sound/wlf,wm8974.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8974.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8974.txt b/Documentation/devicetree/bindings/sound/wlf,wm8974.txt
new file mode 100644
index 0000000..01d3a7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8974.txt
@@ -0,0 +1,15 @@
+WM8974 audio CODEC
+
+This device supports both I2C and SPI (configured with pin strapping
+on the board).
+
+Required properties:
+  - compatible: "wlf,wm8974"
+  - reg: the I2C address or SPI chip select number of the device
+
+Examples:
+
+codec: wm8974@1a {
+	compatible = "wlf,wm8974";
+	reg = <0x1a>;
+};
-- 
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
