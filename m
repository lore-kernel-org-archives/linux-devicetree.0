From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARM64: meson-axg: enable hardware rng
Date: Mon, 18 Dec 2017 12:35:46 +0100
Message-ID: <20171218113546.13116-1-jbrunet@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable the hardware random generator

Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
Hi Kevin,

This patch depends on the changes adding the ethernet controller [0],
for including the axg clock binding header.

Cheers
Jerome

[0]: https://lkml.kernel.org/r/20171216035527.96952-2-yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org


 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index dea1bc31b4de..c741fc16486f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -212,6 +212,13 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xff634000 0x0 0x2000>;
 
+			hwrng: rng {
+				compatible = "amlogic,meson-rng";
+				reg = <0x0 0x18 0x0 0x4>;
+				clocks = <&clkc CLKID_RNG0>;
+				clock-names = "core";
+			};
+
 			pinctrl_periphs: pinctrl@480 {
 				compatible = "amlogic,meson-axg-periphs-pinctrl";
 				#address-cells = <2>;
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
