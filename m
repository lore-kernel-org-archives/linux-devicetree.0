From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] dt-bindings: uniphier: add bindings for UniPhier SoC family
Date: Tue, 28 Nov 2017 16:29:10 +0900
Message-ID: <1511854150-26346-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 Documentation/devicetree/bindings/arm/uniphier.txt | 40 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/uniphier.txt

diff --git a/Documentation/devicetree/bindings/arm/uniphier.txt b/Documentation/devicetree/bindings/arm/uniphier.txt
new file mode 100644
index 0000000..08d3cf3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/uniphier.txt
@@ -0,0 +1,40 @@
+Socionext UniPhier SoC family
+
+Required properties in the root node:
+  - compatible: should contain board and SoC compatible strings
+
+    SoC compatibles:
+      - "socionext,uniphier-ld4"   - LD4 SoC
+      - "socionext,uniphier-pro4"  - Pro4 SoC
+      - "socionext,uniphier-sld8"  - sLD8 SoC
+      - "socionext,uniphier-pro5"  - Pro5 SoC
+      - "socionext,uniphier-pxs2"  - PXs2 SoC
+      - "socionext,uniphier-ld6b"  - LD6b SoC
+      - "socionext,uniphier-ld11"  - LD11 SoC
+      - "socionext,uniphier-ld20"  - LD20 SoC
+      - "socionext,uniphier-pxs3"  - PXs3 SoC
+
+    Board compatibles:
+      - "socionext,uniphier-ld4-ref"      - LD4 Reference Board
+      - "socionext,uniphier-pro4-ref"     - Pro4 Reference Board
+      - "socionext,uniphier-pro4-ace"     - Pro4 Ace Board
+      - "socionext,uniphier-pro4-sanji"   - Pro4 Sanji Board
+      - "socionext,uniphier-sld8-ref"     - sLD8 Reference Board
+      - "socionext,uniphier-pxs2-gentil"  - PXs2 Gentil Board
+      - "socionext,uniphier-pxs2-vodka"   - PXs2 Vodka Board
+      - "socionext,uniphier-ld6b-ref"     - LD6b Reference Board
+      - "socionext,uniphier-ld11-ref"     - LD11 Reference Board
+      - "socionext,uniphier-ld11-global"  - LD11 Global Board
+      - "socionext,uniphier-ld20-ref"     - LD20 Reference Board
+      - "socionext,uniphier-ld20-global"  - LD20 Global Board
+      - "socionext,uniphier-pxs3-ref"     - PXs3 Reference Board
+
+Example:
+
+/dts-v1/;
+
+/ {
+	compatible = "socionext,uniphier-ld20-ref", "socionext,uniphier-ld20";
+
+	...
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index cbb89bb..1fcbd65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2041,6 +2041,7 @@ M:	Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
 L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-uniphier.git
 S:	Maintained
+F:	Documentation/devicetree/bindings/arm/uniphier.txt
 F:	Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
 F:	arch/arm/boot/dts/uniphier*
 F:	arch/arm/include/asm/hardware/cache-uniphier.h
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
