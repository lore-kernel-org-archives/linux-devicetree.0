From: Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 1/2] devicetree: gpio: 74x164: optional enable-gpios
Date: Mon,  7 Aug 2017 20:27:12 +0800
Message-ID: <1502108833-10317-1-git-send-email-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There is an OE(low active) input pin for 74hc595 and 74lv595.
To some boards, the OE pin is controlled by GPIO, so add an
optional property "enable-gpios".

Signed-off-by: Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/gpio/gpio-74x164.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
index ce1b223..c878834 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
@@ -12,6 +12,9 @@ Required properties:
       1 = active low
 - registers-number: Number of daisy-chained shift registers
 
+Optional properties:
+- enable-gpios: Specifier of the GPIO connected to OE pin
+
 Example:
 
 gpio5: gpio5@0 {
-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
