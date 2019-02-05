From: Roger Quadros <rogerq@ti.com>
Subject: [PATCH v2 3/3] arm64: dts: ti: k3-am654-base-board: enable USB1
Date: Tue, 5 Feb 2019 14:45:22 +0200
Message-ID: <1549370722-414-4-git-send-email-rogerq@ti.com>
References: <1549370722-414-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549370722-414-1-git-send-email-rogerq@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: t-kristo@ti.com
Cc: nm@ti.com, nsekhar@ti.com, vigneshr@ti.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

Add pinmux for USB1 and enable it as a dual role port.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 11e9a2a..a70e904 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -86,6 +86,12 @@
 			AM65X_IOPAD(0x01b0, PIN_INPUT, 0) /* (C25) MMC0_DS */
 		>;
 	};
+
+	usb1_pins_default: usb1_pins_default {
+		pinctrl-single,pins = <
+			AM65X_IOPAD(0x02c0, PIN_OUTPUT, 0) /* (AC8) USB1_DRVVBUS */
+		>;
+	};
 };
 
 &main_pmx1 {
@@ -188,3 +194,25 @@
 	non-removable;
 	ti,driver-strength-ohm = <50>;
 };
+
+&dwc3_1 {
+	status = "okay";
+};
+
+&usb1_phy {
+	status = "okay";
+};
+
+&usb1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_pins_default>;
+	dr_mode = "otg";
+};
+
+&dwc3_0 {
+	status = "disabled";
+};
+
+&usb0_phy {
+	status = "disabled";
+};
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
