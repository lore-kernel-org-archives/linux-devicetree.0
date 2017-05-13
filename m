From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 17/18] arm64: dts: meson-gxm-nexbox-a1: Fix node order
Date: Sat, 13 May 2017 16:33:36 +0200
Message-ID: <20170513143337.14278-18-afaerber@suse.de>
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
 
 .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts | 86 +++++++++++-----------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index 920fac10de93..5f626d683088 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -113,10 +113,49 @@
 	};
 };
 
-&uart_AO {
+&cvbs_vdac_port {
+	cvbs_vdac_out: endpoint {
+		remote-endpoint = <&cvbs_connector_in>;
+	};
+};
+
+&ethmac {
 	status = "okay";
-	pinctrl-0 = <&uart_ao_a_pins>;
+
+	pinctrl-0 = <&eth_pins>;
 	pinctrl-names = "default";
+
+	/* Select external PHY by default */
+	phy-handle = <&external_phy>;
+
+	amlogic,tx-delay-ns = <2>;
+
+	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-active-low;
+
+	/* External PHY is in RGMII */
+	phy-mode = "rgmii";
+};
+
+&external_mdio {
+	external_phy: ethernet-phy@0 {
+		compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+		max-speed = <1000>;
+	};
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
+	pinctrl-names = "default";
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
 };
 
 &ir {
@@ -163,47 +202,8 @@
 	vqmmc-supply = <&vddio_boot>;
 };
 
-&ethmac {
-	status = "okay";
-
-	pinctrl-0 = <&eth_pins>;
-	pinctrl-names = "default";
-
-	/* Select external PHY by default */
-	phy-handle = <&external_phy>;
-
-	amlogic,tx-delay-ns = <2>;
-
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
-	/* External PHY is in RGMII */
-	phy-mode = "rgmii";
-};
-
-&external_mdio {
-	external_phy: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c916", "ethernet-phy-ieee802.3-c22";
-		reg = <0>;
-		max-speed = <1000>;
-	};
-};
-
-&cvbs_vdac_port {
-	cvbs_vdac_out: endpoint {
-		remote-endpoint = <&cvbs_connector_in>;
-	};
-};
-
-&hdmi_tx {
+&uart_AO {
 	status = "okay";
-	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
+	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
-
-&hdmi_tx_tmds_port {
-	hdmi_tx_tmds_out: endpoint {
-		remote-endpoint = <&hdmi_connector_in>;
-	};
-};
-- 
2.12.0
