From: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] arm64: Juno: Add support for coresight
Date: Mon,  6 Jul 2015 14:21:45 -0600
Message-ID: <1436214105-3147-1-git-send-email-mathieu.poirier@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support for coresight components.  More specifically
it has definitions for the A53/57 tracers, the A53/57 cluster funnels,
the main funnel and the ETF configured in circular buffer mode.

Support for other coresight IP blocks have not been addressed yet.

Signed-off-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 241 +++++++++++++++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index e3ee96036eca..b787f8a9304d 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -152,3 +152,244 @@
 
 		/include/ "juno-motherboard.dtsi"
 	};
+
+	etf@20010000 {
+		compatible = "arm,coresight-tmc", "arm,primecell";
+		reg = <0 0x20010000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		port {
+			etf_in_port: endpoint {
+				slave-mode;
+				remote-endpoint = <&main_funnel_out_port>;
+			};
+		};
+	};
+
+	main_funnel@20040000 {
+		compatible = "arm,coresight-funnel", "arm,primecell";
+		reg = <0 0x20040000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* output port */
+			port@0 {
+				reg = <0>;
+				main_funnel_out_port: endpoint {
+					remote-endpoint =
+						<&etf_in_port>;
+				};
+			};
+
+			/*
+			 * input ports:
+			 * port 0: Funnel Cortex-A57
+			 * port 1: Funnel Cortex-A53
+			 * port 2: STM
+			 * port 3: Funnel SCP
+			 * port 4: System profiler
+			 * port 5: ATB extension interfaces
+			 * port 6: ATB extension interfaces
+			 */
+			port@1 {
+				reg = <0>;
+				main_funnel_in_port0: endpoint {
+					slave-mode;
+					remote-endpoint =
+							<&A57_funnel_out_port>;
+				};
+			};
+
+			port@2 {
+				reg = <1>;
+				main_funnel_in_port1: endpoint {
+					slave-mode;
+					remote-endpoint = <&A53_etm0_out_port>;
+				};
+			};
+
+		};
+	};
+
+	A57_funnel@220c0000 {
+		compatible = "arm,coresight-funnel", "arm,primecell";
+		reg = <0 0x220c0000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* output port */
+			port@0 {
+				reg = <0>;
+				A57_funnel_out_port: endpoint {
+					remote-endpoint =
+						<&main_funnel_in_port0>;
+				};
+			};
+
+			/* input ports */
+			port@1 {
+				reg = <0>;
+				A57_funnel_in_port0: endpoint {
+					slave-mode;
+					remote-endpoint = <&A57_etm0_out_port>;
+				};
+			};
+
+			port@2 {
+				reg = <1>;
+				A57_funnel_in_port1: endpoint {
+					slave-mode;
+					remote-endpoint = <&A57_etm1_out_port>;
+				};
+			};
+
+			/* input port 2 to 6 are not connected */
+		};
+	};
+
+	A53_funnel@220c0000 {
+		compatible = "arm,coresight-funnel", "arm,primecell";
+		reg = <0 0x230c0000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* output port */
+			port@0 {
+				reg = <0>;
+				A53_funnel_out_port: endpoint {
+					remote-endpoint =
+						<&main_funnel_in_port1>;
+				};
+			};
+
+			/* input port */
+			port@1 {
+				reg = <0>;
+				A53_funnel_in_port0: endpoint {
+					slave-mode;
+					remote-endpoint = <&A53_etm0_out_port>;
+				};
+			};
+
+			port@2 {
+				reg = <1>;
+				A53_funnel_in_port1: endpoint {
+					slave-mode;
+					remote-endpoint = <&A53_etm1_out_port>;
+				};
+			};
+			port@3 {
+				reg = <2>;
+				A53_funnel_in_port2: endpoint {
+					slave-mode;
+					remote-endpoint = <&A53_etm2_out_port>;
+				};
+			};
+			port@4 {
+				reg = <3>;
+				A53_funnel_in_port3: endpoint {
+					slave-mode;
+					remote-endpoint = <&A53_etm3_out_port>;
+				};
+			};
+
+			/* input port 4 to 6 are not connected */
+		};
+	};
+
+	etm@22040000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0 0x22040000 0 0x1000>;
+
+		cpu = <&A57_0>;
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		port {
+			A57_etm0_out_port: endpoint {
+				remote-endpoint = <&A57_funnel_in_port0>;
+			};
+		};
+	};
+
+	etm@22140000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0 0x22140000 0 0x1000>;
+
+		cpu = <&A57_1>;
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		port {
+			A57_etm1_out_port: endpoint {
+				remote-endpoint = <&A57_funnel_in_port1>;
+			};
+		};
+	};
+
+	etm@23040000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0 0x23040000 0 0x1000>;
+
+		cpu = <&A53_0>;
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		port {
+			A53_etm0_out_port: endpoint {
+				remote-endpoint = <&A53_funnel_in_port0>;
+			};
+		};
+	};
+
+	etm@23140000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0 0x23140000 0 0x1000>;
+
+		cpu = <&A53_1>;
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		port {
+			A53_etm1_out_port: endpoint {
+				remote-endpoint = <&A53_funnel_in_port1>;
+			};
+		};
+	};
+
+	etm@23240000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0 0x23240000 0 0x1000>;
+
+		cpu = <&A53_2>;
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		port {
+			A53_etm2_out_port: endpoint {
+				remote-endpoint = <&A53_funnel_in_port2>;
+			};
+		};
+	};
+
+	etm@23340000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0 0x23340000 0 0x1000>;
+
+		cpu = <&A53_3>;
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		port {
+			A53_etm3_out_port: endpoint {
+				remote-endpoint = <&A53_funnel_in_port3>;
+			};
+		};
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
