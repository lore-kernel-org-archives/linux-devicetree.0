From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 1/2] ARM64: dts: meson-gx: move the SCPI and SRAM nodes to meson-gx
Date: Wed, 23 Nov 2016 17:20:39 +0100
Message-ID: <20161123162040.24843-2-martin.blumenstingl@googlemail.com>
References: <20161123162040.24843-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161123162040.24843-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SCPI and SRAM are identical on GXBB and GXL. Moving the corresponding
nodes to meson-gx adds support for the thermal sensor on GXL based
devices.
While here, also rename the second compatible string because
"arm,legacy-scpi" was replaced by "arm,scpi-pre-1.0".

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 45 +++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 57 -----------------------------
 2 files changed, 45 insertions(+), 57 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index fc033c0..47ab306 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -65,6 +65,7 @@
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			clocks = <&scpi_dvfs 0>;
 		};
 
 		cpu1: cpu@1 {
@@ -73,6 +74,7 @@
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			clocks = <&scpi_dvfs 0>;
 		};
 
 		cpu2: cpu@2 {
@@ -81,6 +83,7 @@
 			reg = <0x0 0x2>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			clocks = <&scpi_dvfs 0>;
 		};
 
 		cpu3: cpu@3 {
@@ -89,6 +92,7 @@
 			reg = <0x0 0x3>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			clocks = <&scpi_dvfs 0>;
 		};
 
 		l2: l2-cache0 {
@@ -153,6 +157,28 @@
 		};
 	};
 
+	scpi {
+		compatible = "amlogic,meson-gxbb-scpi", "arm,scpi-pre-1.0";
+		mboxes = <&mailbox 1 &mailbox 2>;
+		shmem = <&cpu_scp_lpri &cpu_scp_hpri>;
+
+		clocks {
+			compatible = "arm,scpi-clocks";
+
+			scpi_dvfs: scpi_clocks@0 {
+				compatible = "arm,scpi-dvfs-clocks";
+				#clock-cells = <1>;
+				clock-indices = <0>;
+				clock-output-names = "vcpu";
+			};
+		};
+
+		scpi_sensors: sensors {
+			compatible = "arm,scpi-sensors";
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -264,6 +290,25 @@
 			#address-cells = <0>;
 		};
 
+		sram: sram@c8000000 {
+			compatible = "amlogic,meson-gxbb-sram", "mmio-sram";
+			reg = <0x0 0xc8000000 0x0 0x14000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x0 0xc8000000 0x14000>;
+
+			cpu_scp_lpri: scp-shmem@0 {
+				compatible = "amlogic,meson-gxbb-scp-shmem";
+				reg = <0x13000 0x400>;
+			};
+
+			cpu_scp_hpri: scp-shmem@200 {
+				compatible = "amlogic,meson-gxbb-scp-shmem";
+				reg = <0x13400 0x400>;
+			};
+		};
+
 		aobus: aobus@c8100000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc8100000 0x0 0x100000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index ac5ad3b..76465e7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -50,28 +50,6 @@
 / {
 	compatible = "amlogic,meson-gxbb";
 
-	scpi {
-		compatible = "amlogic,meson-gxbb-scpi";
-		mboxes = <&mailbox 1 &mailbox 2>;
-		shmem = <&cpu_scp_lpri &cpu_scp_hpri>;
-
-		clocks {
-			compatible = "arm,scpi-clocks";
-
-			scpi_dvfs: scpi_clocks@0 {
-				compatible = "arm,scpi-dvfs-clocks";
-				#clock-cells = <1>;
-				clock-indices = <0>;
-				clock-output-names = "vcpu";
-			};
-		};
-
-		scpi_sensors: sensors {
-			compatible = "arm,scpi-sensors";
-			#thermal-sensor-cells = <1>;
-		};
-	};
-
 	soc {
 		usb0_phy: phy@c0000000 {
 			compatible = "amlogic,meson-gxbb-usb2-phy";
@@ -93,25 +71,6 @@
 			status = "disabled";
 		};
 
-		sram: sram@c8000000 {
-			compatible = "amlogic,meson-gxbb-sram", "mmio-sram";
-			reg = <0x0 0xc8000000 0x0 0x14000>;
-
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x0 0xc8000000 0x14000>;
-
-			cpu_scp_lpri: scp-shmem@0 {
-				compatible = "amlogic,meson-gxbb-scp-shmem";
-				reg = <0x13000 0x400>;
-			};
-
-			cpu_scp_hpri: scp-shmem@200 {
-				compatible = "amlogic,meson-gxbb-scp-shmem";
-				reg = <0x13400 0x400>;
-			};
-		};
-
 		usb0: usb@c9000000 {
 			compatible = "amlogic,meson-gxbb-usb", "snps,dwc2";
 			reg = <0x0 0xc9000000 0x0 0x40000>;
@@ -138,22 +97,6 @@
 	};
 };
 
-&cpu0 {
-	clocks = <&scpi_dvfs 0>;
-};
-
-&cpu1 {
-	clocks = <&scpi_dvfs 0>;
-};
-
-&cpu2 {
-	clocks = <&scpi_dvfs 0>;
-};
-
-&cpu3 {
-	clocks = <&scpi_dvfs 0>;
-};
-
 &cbus {
 	spifc: spi@8c80 {
 		compatible = "amlogic,meson-gxbb-spifc";
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
