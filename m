From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 04/11] ARM: dts: imx6dl: Pass the reg properties for mipi nodes
Date: Wed, 29 Nov 2017 16:46:12 -0200
Message-ID: <1511981179-12660-4-git-send-email-festevam@gmail.com>
References: <1511981179-12660-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511981179-12660-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Pass the reg properties for mipi nodes in order to fix the
following build warnings with W=1:

arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2100000/mipi@21dc000/port@1/endpoint@0 has a unit name, but no reg property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2100000/mipi@21dc000/port@1/endpoint@1 has a unit name, but no reg property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2100000/mipi@21dc000/port@2/endpoint@0 has a unit name, but no reg property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2100000/mipi@21dc000/port@2/endpoint@1 has a unit name, but no reg property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2100000/mipi@21dc000/port@3/endpoint@0 has a unit name, but no reg property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2100000/mipi@21dc000/port@3/endpoint@1 has a unit name, but no reg property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2100000/mipi@21dc000/port@4/endpoint@0 has a unit name, but no reg property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2100000/mipi@21dc000/port@4/endpoint@1 has a unit name, but no reg property

Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
index 4d693a7..d987661 100644
--- a/arch/arm/boot/dts/imx6dl.dtsi
+++ b/arch/arm/boot/dts/imx6dl.dtsi
@@ -309,10 +309,12 @@
 		#size-cells = <0>;
 
 		mipi_vc0_to_ipu1_csi0_mux: endpoint@0 {
+			reg = <0>;
 			remote-endpoint = <&ipu1_csi0_mux_from_mipi_vc0>;
 		};
 
 		mipi_vc0_to_ipu1_csi1_mux: endpoint@1 {
+			reg = <1>;
 			remote-endpoint = <&ipu1_csi1_mux_from_mipi_vc0>;
 		};
 	};
@@ -323,10 +325,12 @@
 		#size-cells = <0>;
 
 		mipi_vc1_to_ipu1_csi0_mux: endpoint@0 {
+			reg = <0>;
 			remote-endpoint = <&ipu1_csi0_mux_from_mipi_vc1>;
 		};
 
 		mipi_vc1_to_ipu1_csi1_mux: endpoint@1 {
+			reg = <1>;
 			remote-endpoint = <&ipu1_csi1_mux_from_mipi_vc1>;
 		};
 	};
@@ -337,10 +341,12 @@
 		#size-cells = <0>;
 
 		mipi_vc2_to_ipu1_csi0_mux: endpoint@0 {
+			reg = <0>;
 			remote-endpoint = <&ipu1_csi0_mux_from_mipi_vc2>;
 		};
 
 		mipi_vc2_to_ipu1_csi1_mux: endpoint@1 {
+			reg = <1>;
 			remote-endpoint = <&ipu1_csi1_mux_from_mipi_vc2>;
 		};
 	};
@@ -351,10 +357,12 @@
 		#size-cells = <0>;
 
 		mipi_vc3_to_ipu1_csi0_mux: endpoint@0 {
+			reg = <0>;
 			remote-endpoint = <&ipu1_csi0_mux_from_mipi_vc3>;
 		};
 
 		mipi_vc3_to_ipu1_csi1_mux: endpoint@1 {
+			reg = <1>;
 			remote-endpoint = <&ipu1_csi1_mux_from_mipi_vc3>;
 		};
 	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
