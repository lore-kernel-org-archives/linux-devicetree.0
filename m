From: Mingkai Hu <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3] dts/ls2080a: Update PCIe compatible
Date: Wed, 17 Feb 2016 10:04:23 +0800
Message-ID: <1455674663-9273-1-git-send-email-Mingkai.Hu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yang.shi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, Minghuan Lian <minghuan.lian-3arQi8VN3Tc@public.gmane.org>, Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Minghuan Lian <minghuan.lian-3arQi8VN3Tc@public.gmane.org>

The patch adds LS2085a to PCIe compatible to fix the compatibility
issue when using firmware with LS2085a compatible property.

Signed-off-by: Minghuan Lian <minghuan.lian-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>
---
v3:
 - Make the compatible consistent between layerscape-pci.txt
   and dts file.

v2:
  - Rebased to latest kernel base

 Documentation/devicetree/bindings/pci/layerscape-pci.txt |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi           | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
index e376785..ef683b2 100644
--- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
+++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
@@ -14,7 +14,7 @@ information.
 Required properties:
 - compatible: should contain the platform identifier such as:
         "fsl,ls1021a-pcie", "snps,dw-pcie"
-        "fsl,ls2080a-pcie", "snps,dw-pcie"
+        "fsl,ls2080a-pcie", "fsl,ls2085a-pcie", "snps,dw-pcie"
 - reg: base addresses and lengths of the PCIe controller
 - interrupts: A list of interrupt outputs of the controller. Must contain an
   entry for each entry in the interrupt-names property.
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 2b23d03..1b18d7a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -456,7 +456,8 @@
 		};
 
 		pcie@3400000 {
-			compatible = "fsl,ls2080a-pcie", "snps,dw-pcie";
+			compatible = "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
+				     "snps,dw-pcie";
 			reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
 			       0x10 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names = "regs", "config";
@@ -479,7 +480,8 @@
 		};
 
 		pcie@3500000 {
-			compatible = "fsl,ls2080a-pcie", "snps,dw-pcie";
+			compatible = "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
+				     "snps,dw-pcie";
 			reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
 			       0x12 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names = "regs", "config";
@@ -502,7 +504,8 @@
 		};
 
 		pcie@3600000 {
-			compatible = "fsl,ls2080a-pcie", "snps,dw-pcie";
+			compatible = "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
+				     "snps,dw-pcie";
 			reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
 			       0x14 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names = "regs", "config";
@@ -525,7 +528,8 @@
 		};
 
 		pcie@3700000 {
-			compatible = "fsl,ls2080a-pcie", "snps,dw-pcie";
+			compatible = "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
+				     "snps,dw-pcie";
 			reg = <0x00 0x03700000 0x0 0x00100000   /* controller registers */
 			       0x16 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names = "regs", "config";
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
