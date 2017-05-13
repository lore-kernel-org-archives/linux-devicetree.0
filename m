From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 14/18] arm64: dts: meson-gxbb-p20x: Fix node order
Date: Sat, 13 May 2017 16:33:33 +0200
Message-ID: <20170513143337.14278-15-afaerber@suse.de>
References: <20170513143337.14278-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170513143337.14278-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sort nodes referenced by label alphabetically.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v1 -> v2:
 * Rebased (new nodes added)
 
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi | 62 ++++++++++++------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index 0ec1d19522dd..d904deb1018c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -148,34 +148,36 @@
 	};
 };
 
-/* This UART is brought out to the DB9 connector */
-&uart_AO {
-	status = "okay";
-	pinctrl-0 = <&uart_ao_a_pins>;
-	pinctrl-names = "default";
+&cvbs_vdac_port {
+	cvbs_vdac_out: endpoint {
+		remote-endpoint = <&cvbs_connector_in>;
+	};
 };
 
-&ir {
+&hdmi_tx {
 	status = "okay";
-	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
 };
 
-&usb0_phy {
-	status = "okay";
-	phy-supply = <&usb_pwr>;
-};
-
-&usb1_phy {
-	status = "okay";
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
 };
 
-&usb0 {
+&ir {
 	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
 };
 
-&usb1 {
+&pwm_ef {
 	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&clkc CLKID_FCLK_DIV4>;
+	clock-names = "clkin0";
 };
 
 /* Wireless SDIO Module */
@@ -242,28 +244,26 @@
 	vqmmc-supply = <&vddio_boot>;
 };
 
-&pwm_ef {
+/* This UART is brought out to the DB9 connector */
+&uart_AO {
 	status = "okay";
-	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
 };
 
-&cvbs_vdac_port {
-	cvbs_vdac_out: endpoint {
-		remote-endpoint = <&cvbs_connector_in>;
-	};
+&usb0_phy {
+	status = "okay";
+	phy-supply = <&usb_pwr>;
 };
 
-&hdmi_tx {
+&usb1_phy {
 	status = "okay";
-	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
-	pinctrl-names = "default";
 };
 
-&hdmi_tx_tmds_port {
-	hdmi_tx_tmds_out: endpoint {
-		remote-endpoint = <&hdmi_connector_in>;
-	};
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
 };
-- 
2.12.0
