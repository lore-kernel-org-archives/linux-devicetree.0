From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/4] dt-bindings: arm: Add Sierra Wireless modules bindings
Date: Thu, 18 Aug 2016 15:11:19 +0200
Message-ID: <1471525881-2797-3-git-send-email-narmstrong@baylibre.com>
References: <1471525881-2797-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471525881-2797-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/swi.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/swi.txt

diff --git a/Documentation/devicetree/bindings/arm/swi.txt b/Documentation/devicetree/bindings/arm/swi.txt
new file mode 100644
index 0000000..7f36960
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/swi.txt
@@ -0,0 +1,12 @@
+Sierra Wireless Modules device tree bindings
+--------------------------------------------
+
+Supported Modules :
+ - WP8548 : Includes MDM9615 and PM8018 in a module
+
+Sierra Wireless modules shall have the following properties :
+  Required root node property
+   - compatible: "swi,wp8548" for the WP8548 CF3 Module
+
+Board compatible values:
+  - "swi,mangoh-green-wp8548" for the mangOH green board with the WP8548 module
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
