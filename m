From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH 04/13] Documentation: add BCM6348 pincontroller binding documentation
Date: Fri, 19 Aug 2016 12:53:36 +0200
Message-ID: <1471604025-21575-5-git-send-email-jonas.gorski@gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

Add binding documentation for the pincontrol core found in BCM6348 SoCs.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 .../bindings/pinctrl/brcm,bcm6348-pinctrl.txt      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6348-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6348-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6348-pinctrl.txt
new file mode 100644
index 0000000..3df7f30
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6348-pinctrl.txt
@@ -0,0 +1,32 @@
+* Broadcom BCM6348 pin controller
+
+Required properties:
+- compatible: Must be "brcm,bcm6348-pinctrl".
+- reg: register Specifiers of dirout, dat, mode registers.
+- reg-names: Must be "dirout", "dat", "mode".
+- gpio-controller: Identifies this node as a GPIO controller.
+- #gpio-cells: Must be <2>.
+
+Example:
+
+pinctrl: pin-controller@fffe0080 {
+	compatible = "brcm,bcm6348-pinctrl";
+	reg = <0xfffe0080 0x8>,
+	      <0xfffe0088 0x8>,
+	      <0xfffe0098 0x4>;
+	reg-names = "dirout", "dat", "mode";
+
+	gpio-controller;
+	#gpio-cells = <2>;
+};
+
+Available pins/groups and functions:
+
+name		pins	functions
+-----------------------------------------------------------
+group0		32-36	ext_mii, utopia, diag
+group1		22-31	ext_ephy, mii_snoop, mii_pccard,
+			spi_master_uart, utopia, diag
+group2		16-21	pci, diag
+group3		8-15	ext_mii, utopia
+group4		0-7	ext_ephy, mii_snoop, legacy_led, diag
-- 
2.1.4

