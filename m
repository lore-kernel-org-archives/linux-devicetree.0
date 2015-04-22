From: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] coresight: Add support for Juno platform
Date: Wed, 22 Apr 2015 16:46:42 -0600
Message-ID: <1429742802-13089-1-git-send-email-mathieu.poirier@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support for ARM's juno platform.  More
specifically it has definitions for the A53/57 tracers, the
A53/57 cluster funnels, the main funnel and the ETF in
circular buffer mode.

Support for the replicator, TPIU, ETR, CTI, CTM, ATM along with
all the coresight IP blocks found in the SPC sub-system have
not been addressed.

Signed-off-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno.dts | 222 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 222 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
index 133ee59de2d7..0d0a9cbbb193 100644
--- a/arch/arm64/boot/dts/arm/juno.dts
+++ b/arch/arm64/boot/dts/arm/juno.dts
@@ -200,6 +200,228 @@
 		clock-names = "apb_pclk";
 	};
 
+	etf@20010000 {
+		compatible = "arm,coresight-tmc", "arm,primecell";
+		reg = <0 0x20010000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		port {
+			etf_in_port: endpoint@0 {
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
+			port@0 {
+				reg = <0>;
+				main_funnel_out_port: endpoint {
+					remote-endpoint =
+						<&etf_in_port>;
+				};
+			};
+
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
+			port@0 {
+				reg = <0>;
+				A57_funnel_out_port: endpoint {
+					remote-endpoint =
+						<&main_funnel_in_port0>;
+				};
+			};
+
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
+			port@0 {
+				reg = <0>;
+				A53_funnel_out_port: endpoint {
+					remote-endpoint =
+						<&main_funnel_in_port1>;
+				};
+			};
+
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
+
 	smb {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
