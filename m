From: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Subject: [PATCH v6 01/14] dt/bindings: Document pinctrl-ingenic
Date: Fri, 12 May 2017 18:52:54 +0200
Message-ID: <20170512165307.31369-1-paul@crapouillou.net>
References: <20170428200824.10906-2-paul@crapouillou.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170428200824.10906-2-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds documentation for the devicetree bindings of the
pinctrl-ingenic driver, which handles pin configuration and pin
muxing of the Ingenic SoCs currently supported by the Linux kernel.

Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../bindings/pinctrl/ingenic,pinctrl.txt           | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt

 v2: Rewrote the documentation for the new pinctrl-ingenic driver
 v3: No changes
 v4: Update for the v4 version of the pinctrl-ingenic driver
 v5: Rename 'ingenic-pinctrl@...' to 'pin-controller@...' in example
 v6: No changes

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
new file mode 100644
index 000000000000..ca313a7aeaff
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
@@ -0,0 +1,41 @@
+Ingenic jz47xx pin controller
+
+Please refer to pinctrl-bindings.txt in this directory for details of the
+common pinctrl bindings used by client devices, including the meaning of the
+phrase "pin configuration node".
+
+For the jz47xx SoCs, pin control is tightly bound with GPIO ports. All pins may
+be used as GPIOs, multiplexed device functions are configured within the
+GPIO port configuration registers and it is typical to refer to pins using the
+naming scheme "PxN" where x is a character identifying the GPIO port with
+which the pin is associated and N is an integer from 0 to 31 identifying the
+pin within that GPIO port. For example PA0 is the first pin in GPIO port A, and
+PB31 is the last pin in GPIO port B. The jz4740 contains 4 GPIO ports, PA to
+PD, for a total of 128 pins. The jz4780 contains 6 GPIO ports, PA to PF, for a
+total of 192 pins.
+
+
+Required properties:
+--------------------
+
+ - compatible: One of:
+    - "ingenic,jz4740-pinctrl"
+    - "ingenic,jz4770-pinctrl"
+    - "ingenic,jz4780-pinctrl"
+ - reg: Address range of the pinctrl registers.
+
+
+GPIO sub-nodes
+--------------
+
+The pinctrl node can have optional sub-nodes for the Ingenic GPIO driver;
+please refer to ../gpio/ingenic,gpio.txt.
+
+
+Example:
+--------
+
+pinctrl: pin-controller@10010000 {
+	compatible = "ingenic,jz4740-pinctrl";
+	reg = <0x10010000 0x400>;
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
