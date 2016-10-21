From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2] dt/bindings: arm-boards: Remove skeleton.dtsi inclusion from example
Date: Fri, 21 Oct 2016 12:28:13 +0200
Message-ID: <1477045693-6820-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As of commit 9c0da3cc61f1233c ("ARM: dts: explicitly mark skeleton.dtsi
as deprecated"), including skeleton.dtsi is deprecated.
Hence remove it from the example.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
---
v2:
  - Restore #address-cells/#size-cells in soc subnode,
  - Add Acked-by,
  - Correct #address-cells from <0> to <1>.
---
 Documentation/devicetree/bindings/arm/arm-boards | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arm-boards b/Documentation/devicetree/bindings/arm/arm-boards
index ab318a56fca2194f..b6e810c2781a4ec8 100644
--- a/Documentation/devicetree/bindings/arm/arm-boards
+++ b/Documentation/devicetree/bindings/arm/arm-boards
@@ -148,11 +148,12 @@ Example:
 
 /dts-v1/;
 #include <dt-bindings/interrupt-controller/irq.h>
-#include "skeleton.dtsi"
 
 / {
 	model = "ARM RealView PB1176 with device tree";
 	compatible = "arm,realview-pb1176";
+	#address-cells = <1>;
+	#size-cells = <1>;
 
 	soc {
 		#address-cells = <1>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
