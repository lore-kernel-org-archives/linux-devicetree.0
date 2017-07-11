From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] ARM: dts: meson: add a node which describes the SRAM
Date: Wed, 12 Jul 2017 00:26:55 +0200
Message-ID: <20170711222655.15859-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

All 32bit Meson SoCs contain 128KiB SRAM. This SRAM is used when
suspending the device (the the ARM Power Firmware on
Meson8/Meson8b/Meson8m2 saves the DDR settings there) and to boot the
secondary CPU cores.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/meson.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 4c27ca083afb..7e136991a4b9 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -244,5 +244,13 @@
 			interrupt-names = "macirq";
 			status = "disabled";
 		};
+
+		ahb_sram: sram@d9000000 {
+			compatible = "mmio-sram";
+			reg = <0xd9000000 0x20000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0xd9000000 0x20000>;
+		};
 	};
 }; /* end of / */
-- 
2.13.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
