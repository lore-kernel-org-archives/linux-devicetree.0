From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 11/18] ARM64: dts: meson-gxbb-odroidc2: Reorder nodes
Date: Fri, 20 Jan 2017 23:21:11 +0100
Message-ID: <20170120222118.21476-12-afaerber@suse.de>
References: <20170120222118.21476-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170120222118.21476-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sort nodes referenced by label alphabetically.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 52 +++++++++++-----------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 238fbeacd330..a1ccfe702c27 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -137,45 +137,22 @@
 	};
 };
 
-&uart_AO {
-	status = "okay";
-	pinctrl-0 = <&uart_ao_a_pins>;
-	pinctrl-names = "default";
-};
-
 &ethmac {
 	status = "okay";
 	pinctrl-0 = <&eth_rgmii_pins>;
 	pinctrl-names = "default";
 };
 
-&ir {
-	status = "okay";
-	pinctrl-0 = <&remote_input_ao_pins>;
-	pinctrl-names = "default";
-};
-
 &i2c_A {
 	status = "okay";
 	pinctrl-0 = <&i2c_a_pins>;
 	pinctrl-names = "default";
 };
 
-&usb0_phy {
-	status = "okay";
-	phy-supply = <&usb_otg_pwr>;
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
-&usb0 {
-	status = "okay";
-};
-
-&usb1 {
+&ir {
 	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
 };
 
 /* SD */
@@ -215,3 +192,26 @@
 	vmmc-supply = <&vcc3v3>;
 	vqmmc-supply = <&vcc1v8>;
 };
+
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+&usb0_phy {
+	status = "okay";
+	phy-supply = <&usb_otg_pwr>;
+};
+
+&usb1_phy {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
-- 
2.10.2
