From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/6] power: reset: DT bindings for the Versatile reset driver
Date: Fri, 25 Jul 2014 15:23:46 +0200
Message-ID: <1406294628-16079-5-git-send-email-linus.walleij@linaro.org>
References: <1406294628-16079-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406294628-16079-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the device tree bindings for the Versatile reset driver.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/reset/arm-versatile-reboot.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/arm-versatile-reboot.txt

diff --git a/Documentation/devicetree/bindings/reset/arm-versatile-reboot.txt b/Documentation/devicetree/bindings/reset/arm-versatile-reboot.txt
new file mode 100644
index 000000000000..fabb6cddf333
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/arm-versatile-reboot.txt
@@ -0,0 +1,18 @@
+ARM Versatile Family Reboot bindings
+
+Required nodes:
+
+- compatible: must be one of these to identify the system:
+   "arm,realview-eb-reboot"
+   "arm,realview-pb1176-reboot"
+   "arm,realview-pb11mp-reboot"
+   "arm,realview-pba8-reboot"
+   "arm,realview-pbx-reboot"
+- regmap : a phandle to a syscon node containing a regmap
+
+Example:
+
+reboot: reboot@0x40 {
+	compatible = "arm,realview-pb1176-reboot";
+	regmap = <&syscon>;
+};
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
