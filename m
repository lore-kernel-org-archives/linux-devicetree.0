From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v3 2/5] dt-bindings: arm: Add Realtek RTD1295 bindings
Date: Sun, 14 May 2017 04:24:26 +0200
Message-ID: <20170514022429.11555-3-afaerber@suse.de>
References: <20170514022429.11555-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170514022429.11555-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Zidoo X9S and a few other recent TV boxes feature the Realtek RTD1295,
a quad-core ARM Cortex-A53 SoC.

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Acked-by: Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 v2 -> v3: unchanged
 
 v1 -> v2:
 * Changed subject
 * Extended commit message
 * Clarified wording
 
 Documentation/devicetree/bindings/arm/realtek.txt | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/realtek.txt

diff --git a/Documentation/devicetree/bindings/arm/realtek.txt b/Documentation/devicetree/bindings/arm/realtek.txt
new file mode 100644
index 000000000000..13d755787b4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/realtek.txt
@@ -0,0 +1,20 @@
+Realtek platforms device tree bindings
+--------------------------------------
+
+
+RTD1295 SoC
+===========
+
+Required root node properties:
+
+ - compatible :  must contain "realtek,rtd1295"
+
+
+Root node property compatible must contain, depending on board:
+
+ - Zidoo X9S: "zidoo,x9s"
+
+
+Example:
+
+    compatible = "zidoo,x9s", "realtek,rtd1295";
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
