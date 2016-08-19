From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/13] Documentation: add BCM6358 pincontroller binding documentation
Date: Fri, 19 Aug 2016 12:53:38 +0200
Message-ID: <1471604025-21575-7-git-send-email-jonas.gorski@gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471604025-21575-1-git-send-email-jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6358 SoCs.

Signed-off-by: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/pinctrl/brcm,bcm6358-pinctrl.txt      | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.txt
new file mode 100644
index 0000000..d1e1874
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.txt
@@ -0,0 +1,44 @@
+* Broadcom BCM6358 pin controller
+
+Required properties:
+- compatible: Must be "brcm,bcm6358-pinctrl".
+- reg: Register specifiers of dirout, dat registers.
+- reg-names: Must be "dirout", "dat".
+- brcm,gpiomode: Phandle to the shared gpiomode register.
+- gpio-controller: Identifies this node as a gpio-controller.
+- #gpio-cells: Must be <2>.
+
+Example:
+
+pinctrl: pin-controller@fffe0080 {
+	compatible = "brcm,bcm6358-pinctrl";
+	reg = <0xfffe0080 0x8>,
+	      <0xfffe0088 0x8>,
+	      <0xfffe0098 0x4>;
+	reg-names = "dirout", "dat";
+	brcm,gpiomode = <&gpiomode>;
+
+	gpio-controller;
+	#gpio-cells = <2>;
+};
+
+gpiomode: syscon@fffe0098 {
+	compatible = "brcm,bcm6358-gpiomode", "syscon";
+	reg = <0xfffe0098 0x4>;
+	native-endian;
+};
+
+Available pins/groups and functions:
+
+name		pins		functions
+-----------------------------------------------------------
+ebi_cs_grp	30-31		ebi_cs
+uart1_grp	28-31		uart1
+spi_cs_grp	32-33		spi_cs
+async_modem_grp	12-15		async_modem
+legacy_led_grp	9-15		legacy_led
+serial_led_grp	6-7		serial_led
+led_grp		0-3		led
+utopia_grp	12-15, 22-31	utopia
+pwm_syn_clk_grp	8		pwm_syn_clk
+sys_irq_grp	5		sys_irq
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
