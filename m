From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] gpio: rcar: Add r8a77995 (R-Car D3) support
Date: Wed, 13 Sep 2017 15:48:49 +0900
Message-ID: <1505285329-6881-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds binding for r8a77995 (R-Car D3). This SoC can use
"renesas,rcar-gen3-gpio" fallback compatibility. So, this patch
doesn't modify the gpio-rcar driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index 51c86f6..2a1579e 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -14,6 +14,7 @@ Required Properties:
     - "renesas,gpio-r8a7794": for R8A7794 (R-Car E2) compatible GPIO controller.
     - "renesas,gpio-r8a7795": for R8A7795 (R-Car H3) compatible GPIO controller.
     - "renesas,gpio-r8a7796": for R8A7796 (R-Car M3-W) compatible GPIO controller.
+    - "renesas,gpio-r8a77995": for R8A77995 (R-Car D3) compatible GPIO controller.
     - "renesas,rcar-gen1-gpio": for a generic R-Car Gen1 GPIO controller.
     - "renesas,rcar-gen2-gpio": for a generic R-Car Gen2 or RZ/G1 GPIO controller.
     - "renesas,rcar-gen3-gpio": for a generic R-Car Gen3 GPIO controller.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
