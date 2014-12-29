From: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Subject: [PATCH v3] dt: atmel_ac97c: Add device tree documentation
Date: Mon, 29 Dec 2014 13:08:40 +0100
Message-ID: <1419854922-29338-2-git-send-email-alexanders83@web.de>
References: <1419854922-29338-1-git-send-email-alexanders83@web.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419854922-29338-1-git-send-email-alexanders83-S0/GAf8tV78@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the bindings for AC97 controller device tree support.

Signed-off-by: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Acked-By Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
Changes in v3:
* Renamed the compatible string to atmel,at91sam9263-ac97c
* Added 'Acked-By Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>'

Changes in v2:
* Split from commit adding actual code

 .../devicetree/bindings/sound/atmel_ac97c.txt        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel_ac97c.txt

diff --git a/Documentation/devicetree/bindings/sound/atmel_ac97c.txt b/Documentation/devicetree/bindings/sound/atmel_ac97c.txt
new file mode 100644
index 0000000..b151bd9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel_ac97c.txt
@@ -0,0 +1,20 @@
+* Atmel AC97 controller
+
+Required properties:
+  - compatible: "atmel,at91sam9263-ac97c"
+  - reg: Address and length of the register set for the device
+  - interrupts: Should contain AC97 interrupt
+  - ac97-gpios: Please refer to soc-ac97link.txt, only ac97-reset is used
+Optional properties:
+  - pinctrl-names, pinctrl-0: Please refer to pinctrl-bindings.txt
+
+Example:
+sound@fffa0000 {
+       compatible = "atmel,at91sam9263-ac97c";
+       pinctrl-names = "default";
+       pinctrl-0 = <&pinctrl_ac97>;
+       reg = <0xfffa0000 0x4000>;
+       interrupts = <18 IRQ_TYPE_LEVEL_HIGH 5>;
+
+       ac97-gpios = <&pioB 0 0 &pioB 2 0 &pioC 29 GPIO_ACTIVE_LOW>;
+};
-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
