From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: wheat: add QSPI support
Date: Sat, 03 Sep 2016 01:09:26 +0300
Message-ID: <3191777.fJ30rYXr4J@wasted.cogentembedded.com>
References: <1648590.FPpmBRoQyh@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1648590.FPpmBRoQyh-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Define the Wheat board dependent part of the QSPI device node.
Add device nodes for Spansion S25FL512S SPI flash and MTD partitions on it.

Based  on the original (and large) patch by Vladimir Barinov
<vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 arch/arm/boot/dts/r8a7792-wheat.dts |   43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792-wheat.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792-wheat.dts
+++ renesas/arch/arm/boot/dts/r8a7792-wheat.dts
@@ -132,6 +132,11 @@
 		function = "sdhi0";
 	};
 
+	qspi_pins: qspi {
+		groups = "qspi_ctrl", "qspi_data4";
+		function = "qspi";
+	};
+
 	du0_pins: du0 {
 		groups = "du0_rgb888", "du0_sync", "du0_disp";
 		function = "du0";
@@ -173,6 +178,44 @@
 	status = "okay";
 };
 
+&qspi {
+	pinctrl-0 = <&qspi_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "spansion,s25fl512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <30000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		spi-cpol;
+		spi-cpha;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "loader";
+				reg = <0x00000000 0x00040000>;
+				read-only;
+			};
+			partition@40000 {
+				label = "user";
+				reg = <0x00040000 0x00400000>;
+				read-only;
+			};
+			partition@440000 {
+				label = "flash";
+				reg = <0x00440000 0x03bc0000>;
+			};
+		};
+	};
+};
+
 &i2c4 {
 	status = "okay";
 	clock-frequency = <400000>;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
