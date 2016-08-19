From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/13] Documentation: add BCM6328 pincontroller binding documentation
Date: Fri, 19 Aug 2016 12:53:34 +0200
Message-ID: <1471604025-21575-3-git-send-email-jonas.gorski@gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471604025-21575-1-git-send-email-jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6328 SoCs.

Signed-off-by: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/pinctrl/brcm,bcm6328-pinctrl.txt      | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.txt
new file mode 100644
index 0000000..401224e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.txt
@@ -0,0 +1,61 @@
+* Broadcom BCM6328 pin controller
+
+Required properties:
+- compatible: Must be "brcm,bcm6328-pinctrl".
+- reg: Register specifies of dirout, dat, mode, mux registers.
+- reg-names: Must be "dirout", "dat", "mode", "mux".
+- gpio-controller: Identifies this node as a GPIO controller.
+- #gpio-cells: Must be <2>.
+
+Example:
+
+pinctrl: pin-controller@10000080 {
+	compatible = "brcm,bcm6328-pinctrl";
+	reg = <0x10000080 0x8>,
+	      <0x10000088 0x8>,
+	      <0x10000098 0x4>,
+	      <0x1000009c 0xc>;
+	reg-names = "dirout", "dat", "mode", "mux";
+
+	gpio-controller;
+	#gpio-cells = <2>;
+};
+
+Available pins/groups and functions:
+
+name		pins	functions
+-----------------------------------------------------------
+gpio0		0	led
+gpio1		1	led
+gpio2		2	led
+gpio3		3	led
+gpio4		4	led
+gpio5		5	led
+gpio6		6	led, serial_led_data
+gpio7		7	led, serial_led_clk
+gpio8		8	led
+gpio9		9	led
+gpio10		10	led
+gpio11		11	led
+gpio12		12	led
+gpio13		13	led
+gpio14		14	led
+gpio15		15	led
+gpio16		16	led, pcie_clkreq
+gpio17		17	led
+gpio18		18	led
+gpio19		19	led
+gpio20		20	led
+gpio21		21	led
+gpio22		22	led
+gpio23		23	led
+gpio24		24	-
+gpio25		25	ephy0_act_led
+gpio26		26	ephy1_act_led
+gpio27		27	ephy2_act_led
+gpio28		28	ephy3_act_led
+gpio29		29	-
+gpio30		30	-
+gpio31		31	-
+hsspi_cs1	-	hsspi_cs1
+usb_port1	-	usb_host_port, usb_device_port
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
