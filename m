From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH 10/13] Documentation: add BCM6368 pincontroller binding documentation
Date: Fri, 19 Aug 2016 12:53:42 +0200
Message-ID: <1471604025-21575-11-git-send-email-jonas.gorski@gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6368 SoCs.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 .../bindings/pinctrl/brcm,bcm6368-pinctrl.txt      | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.txt
new file mode 100644
index 0000000..59c466e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.txt
@@ -0,0 +1,67 @@
+* Broadcom BCM6368 pin controller
+
+Required properties:
+- compatible: Must be "brcm,bcm6368-pinctrl".
+- reg: Register specifiers of dirout, dat, mode registers.
+- reg-names: Must be "dirout", "dat", "mode".
+- brcm,gpiobasemode: Phandle to the gpio basemode register.
+- gpio-controller: Identifies this node as a GPIO controller.
+- #gpio-cells: Must be <2>.
+
+Example:
+
+pinctrl: pin-controller@10000080 {
+	compatible = "brcm,bcm6368-pinctrl";
+	reg = <0x10000080 0x08>,
+	      <0x10000088 0x08>,
+	      <0x10000098 0x04>;
+	reg-names = "dirout", "dat", "mode";
+	brcm,gpiobasemode = <&gpiobasemode>;
+
+	gpio-controller;
+	#gpio-cells = <2>;
+};
+
+gpiobasemode: syscon@100000b8 {
+	compatible = "brcm,bcm6368-gpiobasemode", "syscon";
+	reg = <0x100000b8 4>;
+	native-endian;
+};
+
+Available pins/groups and functions:
+
+name		pins	functions
+-----------------------------------------------------------
+gpio0		0	analog_afe0
+gpio1		1	analog_afe1
+gpio2		2	sys_irq
+gpio3		3	serial_led_data
+gpio4		4	serial_led_clk
+gpio5		5	inet_led
+gpio6		6	ephy0_led
+gpio7		7	ephy1_led
+gpio8		8	ephy2_led
+gpio9		9	ephy3_led
+gpio10		10	robosw_led_data
+gpio11		11	robosw_led_clk
+gpio12		12	robosw_led0
+gpio13		13	robosw_led1
+gpio14		14	usb_device_led
+gpio15		15	-
+gpio16		16	pci_req1
+gpio17		17	pci_gnt1
+gpio18		18	pci_intb
+gpio19		19	pci_req0
+gpio20		20	pci_gnt0
+gpio21		21	-
+gpio22		22	pcmcia_cd1
+gpio23		23	pcmcia_cd2
+gpio24		24	pcmcia_vs1
+gpio25		25	pcmcia_vs2
+gpio26		26	ebi_cs2
+gpio27		27	ebi_cs3
+gpio28		28	spi_cs2
+gpio29		29	spi_cs3
+gpio30		30	spi_cs4
+gpio31		31	spi_cs5
+uart1_grp	30-33	uart1
-- 
2.1.4

