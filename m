From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 01/15] MIPS: dts: img: pistachio_marduk: Reorder nodes
Date: Sun, 22 Jul 2018 23:19:56 +0200
Message-ID: <20180722212010.3979-2-afaerber@suse.de>
References: <20180722212010.3979-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722212010.3979-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, James Hartley <james.hartley@sondrel.com>, Rahul Bedarkar <rahulbedarkar89@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Consistently order nodes referenced by label alphabetically.
No functional changes. This prepares for adding nodes.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/mips/boot/dts/img/pistachio_marduk.dts | 76 ++++++++++++++---------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
index cf9cebd52294..f03f4114e645 100644
--- a/arch/mips/boot/dts/img/pistachio_marduk.dts
+++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
@@ -74,40 +74,34 @@
 	};
 };
 
-&internal_dac {
-	VDD-supply = <&internal_dac_supply>;
-};
-
-&spfi1 {
+&adc {
 	status = "okay";
-
-	pinctrl-0 = <&spim1_pins>, <&spim1_quad_pins>, <&spim1_cs0_pin>,
-		    <&spim1_cs1_pin>;
-	pinctrl-names = "default";
-	cs-gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>, <&gpio0 1 GPIO_ACTIVE_HIGH>;
-
-	flash@0 {
-		compatible = "spansion,s25fl016k", "jedec,spi-nor";
-		reg = <0>;
-		spi-max-frequency = <50000000>;
-	};
+	vref-supply = <&reg_1v8>;
+	adc-reserved-channels = <0x10>;
 };
 
-&uart0 {
+&enet {
 	status = "okay";
-	assigned-clock-rates = <114278400>, <1843200>;
 };
 
-&uart1 {
+&i2c2 {
 	status = "okay";
+	clock-frequency = <400000>;
+
+	tpm@20 {
+		compatible = "infineon,slb9645tt";
+		reg = <0x20>;
+	};
+
 };
 
-&usb {
+&i2c3 {
 	status = "okay";
+	clock-frequency = <400000>;
 };
 
-&enet {
-	status = "okay";
+&internal_dac {
+	VDD-supply = <&internal_dac_supply>;
 };
 
 &pin_enet {
@@ -118,12 +112,6 @@
 	drive-strength = <2>;
 };
 
-&sdhost {
-	status = "okay";
-	bus-width = <4>;
-	disable-wp;
-};
-
 &pin_sdhost_cmd {
 	drive-strength = <2>;
 };
@@ -140,24 +128,36 @@
 	pinctrl-names = "default";
 };
 
-&adc {
+&sdhost {
 	status = "okay";
-	vref-supply = <&reg_1v8>;
-	adc-reserved-channels = <0x10>;
+	bus-width = <4>;
+	disable-wp;
 };
 
-&i2c2 {
+&spfi1 {
 	status = "okay";
-	clock-frequency = <400000>;
 
-	tpm@20 {
-		compatible = "infineon,slb9645tt";
-		reg = <0x20>;
+	pinctrl-0 = <&spim1_pins>, <&spim1_quad_pins>, <&spim1_cs0_pin>,
+		    <&spim1_cs1_pin>;
+	pinctrl-names = "default";
+	cs-gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>, <&gpio0 1 GPIO_ACTIVE_HIGH>;
+
+	flash@0 {
+		compatible = "spansion,s25fl016k", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
 	};
+};
 
+&uart0 {
+	status = "okay";
+	assigned-clock-rates = <114278400>, <1843200>;
 };
 
-&i2c3 {
+&uart1 {
+	status = "okay";
+};
+
+&usb {
 	status = "okay";
-	clock-frequency = <400000>;
 };
-- 
2.16.4
