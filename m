From: Jyri Sarha <jsarha@ti.com>
Subject: [PATCH v4 6/7] ARM: dts: am335x-boneblack: Use new binding for HDMI
Date: Wed, 1 Apr 2015 11:49:30 +0300
Message-ID: <47f5f917413b1b67b7cc9965865b704a353b03e4.1427877412.git.jsarha@ti.com>
References: <cover.1427877412.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <cover.1427877412.git.jsarha@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, bcousson@baylibre.com, tony@atomide.com
Cc: tomi.valkeinen@ti.com, rmk+kernel@arm.linux.org.uk, robdclark@gmail.com, moinejf@free.fr, Jyri Sarha <jsarha@ti.com>
List-Id: devicetree@vger.kernel.org

Use new binding for the external tda19988 HDMI encoder.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 arch/arm/boot/dts/am335x-boneblack.dts | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-boneblack.dts b/arch/arm/boot/dts/am335x-boneblack.dts
index 5c42d25..eadbba3 100644
--- a/arch/arm/boot/dts/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/am335x-boneblack.dts
@@ -68,16 +68,26 @@
 
 &lcdc {
 	status = "okay";
+	port {
+		lcdc_0: endpoint@0 {
+			remote-endpoint = <&hdmi_0>;
+		};
+	};
 };
 
-/ {
-	hdmi {
-		compatible = "ti,tilcdc,slave";
-		i2c = <&i2c0>;
+&i2c0 {
+	tda19988 {
+		compatible = "nxp,tda998x";
+		reg = <0x70>;
 		pinctrl-names = "default", "off";
 		pinctrl-0 = <&nxp_hdmi_bonelt_pins>;
 		pinctrl-1 = <&nxp_hdmi_bonelt_off_pins>;
-		status = "okay";
+
+		port {
+			hdmi_0: endpoint@0 {
+				remote-endpoint = <&lcdc_0>;
+			};
+		};
 	};
 };
 
-- 
1.9.1

