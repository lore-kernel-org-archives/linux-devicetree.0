From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH 12/13] Documentation: add BCM63268 pincontroller binding documentation
Date: Fri, 19 Aug 2016 12:53:44 +0200
Message-ID: <1471604025-21575-13-git-send-email-jonas.gorski@gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

Add binding documentation for the pincontrol core found in the BCM63268
family SoCs.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 .../bindings/pinctrl/brcm,bcm63268-pinctrl.txt     | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.txt
new file mode 100644
index 0000000..781d5fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.txt
@@ -0,0 +1,88 @@
+* Broadcom BCM63268 pin controller
+
+Required properties:
+- compatible: Must be "brcm,bcm6362-pinctrl".
+- reg: Register specifiers of dirout, dat, led, mode, ctrl, basemode registers.
+- reg-names: Must be "dirout", "dat", "led", "mode", "ctrl", "basemode".
+- gpio-controller: Identifies this node as a GPIO controller.
+- #gpio-cells: Must be <2>.
+
+Example:
+
+pinctrl: pin-controller@100000c0 {
+	compatible = "brcm,bcm63268-pinctrl";
+	reg = <0x100000c0 0x8>,
+	      <0x100000c8 0x8>,
+	      <0x100000d0 0x4>,
+	      <0x100000d8 0x4>,
+	      <0x100000dc 0x4>,
+	      <0x100000f8 0x4>;
+	reg-names = "dirout", "dat", "led", "mode",
+		    "ctrl", "basemode";
+
+	gpio-controller;
+	#gpio-cells = <2>;
+};
+
+Available pins/groups and functions:
+
+name		pins		functions
+-----------------------------------------------------------
+gpio0		0		led, serial_led_clk
+gpio1		1		led, serial_led_data
+gpio2		2		led,
+gpio3		3		led,
+gpio4		4		led,
+gpio5		5		led,
+gpio6		6		led,
+gpio7		7		led,
+gpio8		8		led, hsspi_cs6
+gpio9		9		led, hsspi_cs7
+gpio10		10		led, uart1_scts
+gpio11		11		led, uart1_srts
+gpio12		12		led, uart1_sdin
+gpio13		13		led, uart1_sdout
+gpio14		14		led, ntr_pulse_in
+gpio15		15		led, dsl_ntr_pulse_out
+gpio16		16		led, hsspi_cs4
+gpio17		17		led, hsspi_cs5
+gpio18		18		led, adsl_spi_miso
+gpio19		19		led, adsl_spi_mosi
+gpio20		20		led,
+gpio21		21		led,
+gpio22		22		led, vreg_clk
+gpio23		23		led, pcie_clkreq_b
+gpio24		24		uart1_scts
+gpio25		25		uart1_srts
+gpio26		26		uart1_sdin
+gpio27		27		uart1_sdout
+gpio28		28		ntr_pulse_in
+gpio29		29		dsl_ntr_pulse_out
+gpio30		30		switch_led_clk
+gpio31		31		switch_led_data
+gpio32		32		wifi
+gpio33		33		wifi
+gpio34		34		wifi
+gpio35		35		wifi
+gpio36		36		wifi
+gpio37		37		wifi
+gpio38		38		wifi
+gpio39		39		wifi
+gpio40		40		wifi
+gpio41		41		wifi
+gpio42		42		wifi
+gpio43		43		wifi
+gpio44		44		wifi
+gpio45		45		wifi
+gpio46		46		wifi
+gpio47		47		wifi
+gpio48		48		wifi
+gpio49		49		wifi
+gpio50		50		wifi
+gpio51		51		wifi
+nand_grp	2-7,24-31	nand
+dect_pd_grp	8-9		dect_pd
+vdsl_phy0_grp	10-11		vdsl_phy0
+vdsl_phy1_grp	12-13		vdsl_phy1
+vdsl_phy2_grp	24-25		vdsl_phy2
+vdsl_phy3_grp	26-27		vdsl_phy3
-- 
2.1.4

