From: Mingkai Hu <Mingkai.Hu@freescale.com>
Subject: [PATCH v2] dts/ls2080a: Update PCIe compatible
Date: Fri, 4 Dec 2015 18:20:17 +0800
Message-ID: <1449224417-20753-1-git-send-email-Mingkai.Hu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: devicetree@vger.kernel.org, Mingkai Hu <Mingkai.Hu@freescale.com>, leoli@freescale.com, linux-arm-kernel@lists.infradead.org, Minghuan Lian <Minghuan.Lian@freescale.com>
List-Id: devicetree@vger.kernel.org

From: Minghuan Lian <Minghuan.Lian@freescale.com>

The patch adds LS2085a to PCIe compatible to fix the compatibility
issue when using firmware with LS2085a compatible property.

Signed-off-by: Minghuan Lian <Minghuan.Lian@freescale.com>
Signed-off-by: Mingkai Hu <Mingkai.Hu@freescale.com>
---
v2 change:
 - Rebased to latest kernel base

 Documentation/devicetree/bindings/pci/layerscape-pci.txt |  1 +
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi           | 12 ++++++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
index e376785..4600007 100644
--- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
+++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
@@ -15,6 +15,7 @@ Required properties:
 - compatible: should contain the platform identifier such as:
         "fsl,ls1021a-pcie", "snps,dw-pcie"
         "fsl,ls2080a-pcie", "snps,dw-pcie"
+        "fsl,ls2085a-pcie", "snps,dw-pcie"
 - reg: base addresses and lengths of the PCIe controller
 - interrupts: A list of interrupt outputs of the controller. Must contain an
   entry for each entry in the interrupt-names property.
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index e81cd48..3821bb1 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -383,7 +383,8 @@
 		};
 
 		pcie@3400000 {
-			compatible = "fsl,ls2080a-pcie", "snps,dw-pcie";
+			compatible = "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
+				     "snps,dw-pcie";
 			reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
 			       0x10 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names = "regs", "config";
@@ -406,7 +407,8 @@
 		};
 
 		pcie@3500000 {
-			compatible = "fsl,ls2080a-pcie", "snps,dw-pcie";
+			compatible = "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
+				     "snps,dw-pcie";
 			reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
 			       0x12 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names = "regs", "config";
@@ -429,7 +431,8 @@
 		};
 
 		pcie@3600000 {
-			compatible = "fsl,ls2080a-pcie", "snps,dw-pcie";
+			compatible = "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
+				     "snps,dw-pcie";
 			reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
 			       0x14 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names = "regs", "config";
@@ -452,7 +455,8 @@
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
