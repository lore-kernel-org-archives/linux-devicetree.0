From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] extcon: usb-gpio: Add level trigger support
Date: Mon, 20 Mar 2017 15:59:41 +0800
Message-ID: <0db99bd509c94ea8a80f633022d15235a99391a9.1489995966.git.baolin.wang@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Now extcon-usb-gpio only supports for GPIO egdge trigger, but VBUS/ID
gpios' detection can be triggered by the level trigger on some platforms.
Thus intoduce one property 'extcon-gpio,level-trigger' to identify this
situation.

Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/extcon/extcon-usb-gpio.txt |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
index dfc14f7..191504b 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
@@ -9,6 +9,9 @@ Required properties:
 Either one of id-gpio or vbus-gpio must be present. Both can be present as well.
 - id-gpio: gpio for USB ID pin. See gpio binding.
 - vbus-gpio: gpio for USB VBUS pin.
+- extcon-gpio,level-trigger: Boolean, set this gpio's interrupt flag to
+level trigger. If not specified defaults to false, gpio's interrupt flag
+defaults to edge trigger.
 
 Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed below:
 	extcon_usb1 {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
