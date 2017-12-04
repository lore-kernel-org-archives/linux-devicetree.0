From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2] ARM64: dts: meson-axg: enable IR controller
Date: Mon, 4 Dec 2017 13:38:58 +0800
Message-ID: <20171204053858.1697-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable IR remote controller which find in Amlogic's Meson-AXG SoC.

Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>

---

Changes since v1 at [1]:
 - drop the compatbile 'amlogic,meson-gx-ir'

[1]
 http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005527.html
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 0864d1ff2d9b..ca676cafdbb3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -34,3 +34,9 @@
 	pinctrl-0 = <&i2c1_z_pins>;
 	pinctrl-names = "default";
 };
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 9bb85893c1b7..f68f709762dd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -616,6 +616,13 @@
 					#gpio-cells = <2>;
 					gpio-ranges = <&pinctrl_aobus 0 0 15>;
 				};
+
+				remote_input_ao_pins: remote_input_ao {
+					mux {
+						groups = "remote_input_ao";
+						function = "remote_input_ao";
+					};
+				};
 			};
 
 			i2c_AO: i2c@5000 {
@@ -664,6 +671,13 @@
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
+
+			ir: ir@8000 {
+				compatible = "amlogic,meson-gxbb-ir";
+				reg = <0x0 0x8000 0x0 0x20>;
+				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
