From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 4/4] ARM: dts: meson: add the efuse node
Date: Tue,  3 Oct 2017 01:28:04 +0200
Message-ID: <20171002232804.20042-5-martin.blumenstingl@googlemail.com>
References: <20171002232804.20042-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171002232804.20042-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Meson6, Meson8 and Meson8b use a similar IP block which has access to
512 bytes of efuse data.
During SoC manufacturing some calibration settings for the CVBS
connector and the internal temperature sensor are written to this efuse.
On some boards it additionally stores for example the MAC addresses.

The efuse is enabled on Meson8 and Meson8b but kept disabled on Meson6
since we do not have a clock driver there (which is required to read
data from the efuse).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/meson.dtsi   | 15 +++++++++++++++
 arch/arm/boot/dts/meson6.dtsi  |  3 +++
 arch/arm/boot/dts/meson8.dtsi  |  6 ++++++
 arch/arm/boot/dts/meson8b.dtsi |  7 +++++++
 4 files changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 163dac42bf2e..9e9c1f752f4e 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -262,5 +262,20 @@
 			compatible = "amlogic,meson-mx-bootrom", "syscon";
 			reg = <0xd9040000 0x10000>;
 		};
+
+		secbus: secbus@da000000 {
+			compatible = "simple-bus";
+			reg = <0xda000000 0x6000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xda000000 0x6000>;
+
+			efuse: nvmem@0 {
+				compatible = "amlogic,meson6-efuse";
+				reg = <0x0 0x2000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+			};
+		};
 	};
 }; /* end of / */
diff --git a/arch/arm/boot/dts/meson6.dtsi b/arch/arm/boot/dts/meson6.dtsi
index ef281d290052..9b463211339f 100644
--- a/arch/arm/boot/dts/meson6.dtsi
+++ b/arch/arm/boot/dts/meson6.dtsi
@@ -84,6 +84,9 @@
 	};
 }; /* end of / */
 
+&efuse {
+	status = "disabled";
+};
 
 &uart_AO {
 	clocks = <&xtal>, <&clk81>, <&clk81>;
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 2095a002ea8d..dad8b234c172 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -275,6 +275,12 @@
 	};
 };
 
+&efuse {
+	compatible = "amlogic,meson8-efuse";
+	clocks = <&clkc CLKID_EFUSE>;
+	clock-names = "core";
+};
+
 &ethmac {
 	clocks = <&clkc CLKID_ETH>;
 	clock-names = "stmmaceth";
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 111e01809ad7..4f8fc01ee0f0 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -183,6 +183,13 @@
 	};
 };
 
+
+&efuse {
+	compatible = "amlogic,meson8b-efuse";
+	clocks = <&clkc CLKID_EFUSE>;
+	clock-names = "core";
+};
+
 &ethmac {
 	clocks = <&clkc CLKID_ETH>;
 	clock-names = "stmmaceth";
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
