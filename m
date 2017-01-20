From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 17/18] ARM64: dts: meson-gxm-nexbox-a1: Reorder nodes
Date: Fri, 20 Jan 2017 23:21:17 +0100
Message-ID: <20170120222118.21476-18-afaerber@suse.de>
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
 .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts | 58 +++++++++++-----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index 439060652689..804e8de80f37 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -102,10 +102,35 @@
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
 };
 
 &ir {
@@ -152,33 +177,8 @@
 	vqmmc-supply = <&vddio_boot>;
 };
 
-&ethmac {
+&uart_AO {
 	status = "okay";
-
-	pinctrl-0 = <&eth_pins>;
+	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
-
-	/* Select external PHY by default */
-	phy-handle = <&external_phy>;
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
 };
-- 
2.10.2
