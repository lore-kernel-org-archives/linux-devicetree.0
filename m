From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 09/13] ARM: dts: rockchip: add rk3288 mipi_dsi nodes
Date: Sat, 31 Oct 2015 20:56:05 +0800
Message-ID: <1446296170-3702-10-git-send-email-zyw@rock-chips.com>
References: <1446296170-3702-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446296170-3702-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a mipi_dsi node, and also add mipi_dsi endpoints to vopb and vopl
output port nodes.

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v2: None

 arch/arm/boot/dts/rk3288.dtsi | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 6a79c9c..a5c5670 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -798,6 +798,10 @@
 				reg = <0>;
 				remote-endpoint = <&hdmi_in_vopb>;
 			};
+			vopb_out_mipi: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&mipi_in_vopb>;
+			};
 		};
 	};
 
@@ -831,6 +835,10 @@
 				reg = <0>;
 				remote-endpoint = <&hdmi_in_vopl>;
 			};
+			vopl_out_mipi: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&mipi_in_vopl>;
+			};
 		};
 	};
 
@@ -871,6 +879,37 @@
 		};
 	};
 
+	mipi_dsi: mipi@ff960000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi";
+		reg = <0xff960000 0x4000>;
+		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_MIPI_24M>, <&cru PCLK_MIPI_DSI0>;
+		clock-names = "ref", "pclk";
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			mipi_in: port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				mipi_in_vopb: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&vopb_out_mipi>;
+				};
+				mipi_in_vopl: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&vopl_out_mipi>;
+				};
+			};
+		};
+	};
+
 	gic: interrupt-controller@ffc01000 {
 		compatible = "arm,gic-400";
 		interrupt-controller;
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
