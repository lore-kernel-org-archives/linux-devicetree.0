From: Minghuan Lian <Minghuan.Lian@nxp.com>
Subject: [PATCH v2,
 1/9] irqchip/ls-scfg-msi: fix typo of MSI compatible strings
Date: Thu, 5 Jan 2017 16:10:29 +0800
Message-ID: <1483603837-4629-1-git-send-email-Minghuan.Lian@nxp.com>
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
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Roy Zang <roy.zang@nxp.com>, Marc Zyngier <marc.zyngier@arm.com>, Stuart Yoder <stuart.yoder@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>, Minghuan Lian <Minghuan.Lian@nxp.com>, Scott Wood <scott.wood@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>
List-Id: devicetree@vger.kernel.org

The patch is to fix typo of the Layerscape SCFG MSI dts compatible
strings. "1" is replaced by "l".

Signed-off-by: Minghuan Lian <Minghuan.Lian@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v2-v1:
- None

 .../devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt    | 6 +++---
 drivers/irqchip/irq-ls-scfg-msi.c                                   | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
index 9e38949..2755cd1 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt
@@ -4,8 +4,8 @@ Required properties:
 
 - compatible: should be "fsl,<soc-name>-msi" to identify
 	      Layerscape PCIe MSI controller block such as:
-              "fsl,1s1021a-msi"
-              "fsl,1s1043a-msi"
+              "fsl,ls1021a-msi"
+              "fsl,ls1043a-msi"
 - msi-controller: indicates that this is a PCIe MSI controller node
 - reg: physical base address of the controller and length of memory mapped.
 - interrupts: an interrupt to the parent interrupt controller.
@@ -23,7 +23,7 @@ MSI controller node
 Examples:
 
 	msi1: msi-controller@1571000 {
-		compatible = "fsl,1s1043a-msi";
+		compatible = "fsl,ls1043a-msi";
 		reg = <0x0 0x1571000 0x0 0x8>,
 		msi-controller;
 		interrupts = <0 116 0x4>;
diff --git a/drivers/irqchip/irq-ls-scfg-msi.c b/drivers/irqchip/irq-ls-scfg-msi.c
index 02cca74c..cef67cc 100644
--- a/drivers/irqchip/irq-ls-scfg-msi.c
+++ b/drivers/irqchip/irq-ls-scfg-msi.c
@@ -219,8 +219,10 @@ static int ls_scfg_msi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id ls_scfg_msi_id[] = {
-	{ .compatible = "fsl,1s1021a-msi", },
-	{ .compatible = "fsl,1s1043a-msi", },
+	{ .compatible = "fsl,1s1021a-msi", }, /* a typo */
+	{ .compatible = "fsl,1s1043a-msi", }, /* a typo */
+	{ .compatible = "fsl,ls1021a-msi", },
+	{ .compatible = "fsl,ls1043a-msi", },
 	{},
 };
 
-- 
1.9.1
