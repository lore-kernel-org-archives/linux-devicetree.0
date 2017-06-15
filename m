From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 07/10] ARM: dts: meson: add the hardware random number generator
Date: Thu, 15 Jun 2017 23:33:49 +0200
Message-ID: <20170615213352.25134-8-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615213352.25134-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

All supported Meson SoCs have a random number generator in CBUS.
Newer SoCs (GXBB, GXL and GXM) provide only one 32-bit random number
register, whereas the older SoCs (Meson6, Meson8 and Meson8b) have two
32-bit random number registers. The existing meson-rng driver only
supports the lower 32-bit - but it still works fine on the older SoCs
apart from this small limitation.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/meson.dtsi   | 5 +++++
 arch/arm/boot/dts/meson8.dtsi  | 6 ++++++
 arch/arm/boot/dts/meson8b.dtsi | 6 ++++++
 3 files changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 46706d74a145..bf37606ba82e 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -80,6 +80,11 @@
 			#size-cells = <1>;
 			ranges = <0x0 0xc1100000 0x200000>;
 
+			hwrng: rng@8100 {
+				compatible = "amlogic,meson-rng";
+				reg = <0x8100 0x8>;
+			};
+
 			uart_A: serial@84c0 {
 				compatible = "amlogic,meson-uart";
 				reg = <0x84c0 0x18>;
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index df79a34a3530..b4c5fdd7b451 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -241,6 +241,12 @@
 	clock-names = "stmmaceth";
 };
 
+&hwrng {
+	compatible = "amlogic,meson8-rng", "amlogic,meson-rng";
+	clocks = <&clkc CLKID_RNG0>;
+	clock-names = "core";
+};
+
 &i2c_AO {
 	clocks = <&clkc CLKID_CLK81>;
 };
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 1c09090ff4a5..a9d7074e6369 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -171,6 +171,12 @@
 	};
 };
 
+&hwrng {
+	compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
+	clocks = <&clkc CLKID_RNG0>;
+	clock-names = "core";
+};
+
 &L2 {
 	arm,data-latency = <3 3 3>;
 	arm,tag-latency = <2 2 2>;
-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
