From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 07/11] ARM: dts: imx7d: Fix pcie node warnings
Date: Wed, 29 Nov 2017 16:54:40 -0200
Message-ID: <1511981684-13433-7-git-send-email-festevam@gmail.com>
References: <1511981684-13433-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511981684-13433-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Fix the unit address notation and pass bus-range property in order to
fix the following build warnings with W=1:

arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (pci_bridge): Node /soc/aips-bus@30800000/pcie@0x33800000 missing bus-range for PCI bridge
arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (unit_address_format): Failed prerequisite 'pci_bridge'
arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (pci_device_reg): Failed prerequisite 'pci_bridge'
arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (simple_bus_reg): Node /soc/aips-bus@30800000/pcie@0x33800000 simple-bus unit address format error, expected "33800000"

Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
Changes since v1:
- Fix Subject and commit log

 arch/arm/boot/dts/imx7d.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 9d92725..200714e 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -132,7 +132,7 @@
 		status = "disabled";
 	};
 
-	pcie: pcie@0x33800000 {
+	pcie: pcie@33800000 {
 		compatible = "fsl,imx7d-pcie", "snps,dw-pcie";
 		reg = <0x33800000 0x4000>,
 		      <0x4ff00000 0x80000>;
@@ -140,6 +140,7 @@
 		#address-cells = <3>;
 		#size-cells = <2>;
 		device_type = "pci";
+		bus-range = <0x00 0xff>;
 		ranges = <0x81000000 0 0          0x4ff80000 0 0x00010000   /* downstream I/O */
 			  0x82000000 0 0x40000000 0x40000000 0 0x0ff00000>; /* non-prefetchable memory */
 		num-lanes = <1>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
