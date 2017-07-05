From: Zhiqiang Hou <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCHv4 1/9] irqchip/ls-scfg-msi: fix typo of MSI compatible strings
Date: Wed, 5 Jul 2017 14:58:55 +0800
Message-ID: <1499237943-24203-1-git-send-email-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Minghuan.Lian-3arQi8VN3Tc@public.gmane.org
Cc: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>

The patch is to fix typo of the Layerscape SCFG MSI dts compatible
strings. "1" is replaced by "l".

Signed-off-by: Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
---
v4-v1:
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
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
