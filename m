From: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] arm64: dts: sprd: adding ETM entries to Spreadtrum SC9836
Date: Wed, 15 Jul 2015 15:05:48 +0800
Message-ID: <1436943948-14489-1-git-send-email-zhang.chunyan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Since ETMv4 driver has been merged, this patch adds ETM nodes for SC9836,
and four funnel input ports to connect with ETM output ports.

Signed-off-by: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/sprd/sc9836.dtsi | 99 ++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/sprd/sc9836.dtsi b/arch/arm64/boot/dts/sprd/sc9836.dtsi
index ee34e1a..63894c4 100644
--- a/arch/arm64/boot/dts/sprd/sc9836.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc9836.dtsi
@@ -16,28 +16,28 @@
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x3>;
@@ -75,14 +75,103 @@
 				};
 			};
 
-			/* funnel input port 0~3 is reserved for ETMs */
+			/* funnel input port 0-4 */
 			port@1 {
+				reg = <0>;
+				funnel_in_port0: endpoint {
+					slave-mode;
+					remote-endpoint = <&etm0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <1>;
+				funnel_in_port1: endpoint {
+					slave-mode;
+					remote-endpoint = <&etm1_out>;
+				};
+			};
+
+			port@3 {
+				reg = <2>;
+				funnel_in_port2: endpoint {
+					slave-mode;
+					remote-endpoint = <&etm2_out>;
+				};
+			};
+
+			port@4 {
+				reg = <3>;
+				funnel_in_port3: endpoint {
+					slave-mode;
+					remote-endpoint = <&etm3_out>;
+				};
+			};
+
+			port@5 {
 				reg = <4>;
 				funnel_in_port4: endpoint {
 					slave-mode;
 					remote-endpoint = <&stm_out>;
 				};
 			};
+			/* Other input ports aren't connected to anyone */
+		};
+	};
+
+	etm@10440000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0 0x10440000 0 0x1000>;
+
+		cpu = <&cpu0>;
+		clocks = <&clk26mhz>;
+		clock-names = "apb_pclk";
+		port {
+			etm0_out: endpoint {
+				remote-endpoint = <&funnel_in_port0>;
+			};
+		};
+	};
+
+	etm@10540000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0 0x10540000 0 0x1000>;
+
+		cpu = <&cpu1>;
+		clocks = <&clk26mhz>;
+		clock-names = "apb_pclk";
+		port {
+			etm1_out: endpoint {
+				remote-endpoint = <&funnel_in_port1>;
+			};
+		};
+	};
+
+	etm@10640000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0 0x10640000 0 0x1000>;
+
+		cpu = <&cpu2>;
+		clocks = <&clk26mhz>;
+		clock-names = "apb_pclk";
+		port {
+			etm2_out: endpoint {
+				remote-endpoint = <&funnel_in_port2>;
+			};
+		};
+	};
+
+	etm@10740000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0 0x10740000 0 0x1000>;
+
+		cpu = <&cpu3>;
+		clocks = <&clk26mhz>;
+		clock-names = "apb_pclk";
+		port {
+			etm3_out: endpoint {
+				remote-endpoint = <&funnel_in_port3>;
+			};
 		};
 	};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
