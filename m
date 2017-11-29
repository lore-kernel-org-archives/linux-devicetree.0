From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/11] ARM: dts: imx6dl: Remove unneeded label and unit address
Date: Wed, 29 Nov 2017 16:46:13 -0200
Message-ID: <1511981179-12660-5-git-send-email-festevam@gmail.com>
References: <1511981179-12660-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511981179-12660-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Remove unneeded label and unit address in order to fix the following
build warnings with W=1:

arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2000000/iomuxc-gpr@20e0000/ipu1_csi0_mux@34 has a unit name, but no reg property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2000000/iomuxc-gpr@20e0000/ipu1_csi1_mux@34 has a unit name, but no

Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
index d987661..c01674f 100644
--- a/arch/arm/boot/dts/imx6dl.dtsi
+++ b/arch/arm/boot/dts/imx6dl.dtsi
@@ -170,7 +170,7 @@
 };
 
 &gpr {
-	ipu1_csi0_mux: ipu1_csi0_mux@34 {
+	ipu1_csi0_mux {
 		compatible = "video-mux";
 		mux-controls = <&mux 0>;
 		#address-cells = <1>;
@@ -224,7 +224,7 @@
 		};
 	};
 
-	ipu1_csi1_mux: ipu1_csi1_mux@34 {
+	ipu1_csi1_mux {
 		compatible = "video-mux";
 		mux-controls = <&mux 1>;
 		#address-cells = <1>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
