From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 05/10] ARM: dts: meson: add the SAR ADC
Date: Thu, 15 Jun 2017 23:33:47 +0200
Message-ID: <20170615213352.25134-6-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615213352.25134-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the SAR ADC to meson.dtsi and configures the clocks on Meson8
and Meson8b to allow boards to use it. Some boards use it to connect a
button to it.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/meson.dtsi   | 8 ++++++++
 arch/arm/boot/dts/meson8.dtsi  | 8 ++++++++
 arch/arm/boot/dts/meson8b.dtsi | 8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index d287f606e06f..46706d74a145 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -103,6 +103,14 @@
 				status = "disabled";
 			};
 
+			saradc: adc@8680 {
+				compatible = "amlogic,meson-saradc";
+				reg = <0x8680 0x34>;
+				#io-channel-cells = <1>;
+				interrupts = <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+			};
+
 			uart_C: serial@8700 {
 				compatible = "amlogic,meson-uart";
 				reg = <0x8700 0x18>;
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index bb3608bddc98..6687b1b4c7c9 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -232,6 +232,14 @@
 	arm,filter-ranges = <0x100000 0xc0000000>;
 };
 
+&saradc {
+	compatible = "amlogic,meson8-saradc", "amlogic,meson-saradc";
+	clocks = <&clkc CLKID_XTAL>,
+		<&clkc CLKID_SAR_ADC>,
+		<&clkc CLKID_SANA>;
+	clock-names = "clkin", "core", "sana";
+};
+
 &spifc {
 	clocks = <&clkc CLKID_CLK81>;
 };
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index d9f116a418b2..1c09090ff4a5 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -177,6 +177,14 @@
 	arm,filter-ranges = <0x100000 0xc0000000>;
 };
 
+&saradc {
+	compatible = "amlogic,meson8b-saradc", "amlogic,meson-saradc";
+	clocks = <&clkc CLKID_XTAL>,
+		<&clkc CLKID_SAR_ADC>,
+		<&clkc CLKID_SANA>;
+	clock-names = "clkin", "core", "sana";
+};
+
 &uart_AO {
 	clocks = <&clkc CLKID_CLK81>;
 };
-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
