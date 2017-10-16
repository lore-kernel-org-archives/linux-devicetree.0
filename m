From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 2/5] dt-bindings: arm: realtek: Document RTD1293 and Synology DS418j
Date: Mon, 16 Oct 2017 06:01:47 +0200
Message-ID: <20171016040150.23400-3-afaerber@suse.de>
References: <20171016040150.23400-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171016040150.23400-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bizon <bizongod-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, info-UelDjCVBxVpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Define compatible strings for Realtek RTD1293 SoC and Synology
DiskStation DS418j NAS.

Cc: info-UelDjCVBxVpWk0Htik3J/w@public.gmane.org
Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/realtek.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/realtek.txt b/Documentation/devicetree/bindings/arm/realtek.txt
index 297c15eb81e2..500e771614c4 100644
--- a/Documentation/devicetree/bindings/arm/realtek.txt
+++ b/Documentation/devicetree/bindings/arm/realtek.txt
@@ -2,6 +2,23 @@ Realtek platforms device tree bindings
 --------------------------------------
 
 
+RTD1293 SoC
+===========
+
+Required root node properties:
+
+ - compatible :  must contain "realtek,rtd1293"
+
+
+Root node property compatible must contain, depending on board:
+
+ - Synology DiskStation DS418j: "synology,ds418j"
+
+Example:
+
+    compatible = "synology,ds418j", "realtek,rtd1293";
+
+
 RTD1295 SoC
 ===========
 
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
