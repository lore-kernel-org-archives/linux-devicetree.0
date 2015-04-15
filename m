From: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dmaengine: imx-sdma: Add DMA event remapping for imx6sx-sdma
Date: Tue, 14 Apr 2015 22:39:11 -0700
Message-ID: <1429076351-4429-1-git-send-email-nicoleotsuka@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The SDMA on imx6sx has a few DMA event remapping configurations
inside the GPR (General Purpose Register) of that SoC. When users
want to use a non-default DMA event, they need to configure the
GPR register. So this patch gives an interface of the GPR and
implements it in the SDMA driver so as to finish the DMA event
remapping.

Signed-off-by: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/dma/fsl-imx-sdma.txt       |  9 ++++
 drivers/dma/imx-sdma.c                             | 58 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt b/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
index dc8d3aa..03315a6 100644
--- a/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
+++ b/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
@@ -8,6 +8,7 @@ Required properties:
       "fsl,imx51-sdma"
       "fsl,imx53-sdma"
       "fsl,imx6q-sdma"
+      "fsl,imx6sx-sdma"
   The -to variants should be preferred since they allow to determine the
   correct ROM script addresses needed for the driver to work without additional
   firmware.
@@ -19,6 +20,14 @@ Required properties:
 - fsl,sdma-ram-script-name : Should contain the full path of SDMA RAM
   scripts firmware
 
+Optional properties:
+- fsl, sdma-event-remap : List of one or more DMA event remapping
+  configurations. Its format: <&gpr addr shift val>
+	gpr : the gpr phandle
+	addr : the register address of the GPR
+	shift : the bit shift of the GPR register
+	val : the value of that bit
+
 The second cell of dma phandle specifies the peripheral type of DMA transfer.
 The full ID of peripheral types can be found below.
 
diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 62bbd79..f0339ab 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -25,6 +25,7 @@
 #include <linux/interrupt.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/regmap.h>
 #include <linux/sched.h>
 #include <linux/semaphore.h>
 #include <linux/spinlock.h>
@@ -39,6 +40,7 @@
 #include <linux/of_dma.h>
 
 #include <asm/irq.h>
+#include <linux/mfd/syscon.h>
 #include <linux/platform_data/dma-imx-sdma.h>
 #include <linux/platform_data/dma-imx.h>
 
@@ -440,12 +442,16 @@ static struct platform_device_id sdma_devtypes[] = {
 		.name = "imx6q-sdma",
 		.driver_data = (unsigned long)&sdma_imx6q,
 	}, {
+		.name = "imx6sx-sdma",
+		.driver_data = (unsigned long)&sdma_imx6q,
+	}, {
 		/* sentinel */
 	}
 };
 MODULE_DEVICE_TABLE(platform, sdma_devtypes);
 
 static const struct of_device_id sdma_dt_ids[] = {
+	{ .compatible = "fsl,imx6sx-sdma", .data = &sdma_imx6q, },
 	{ .compatible = "fsl,imx6q-sdma", .data = &sdma_imx6q, },
 	{ .compatible = "fsl,imx53-sdma", .data = &sdma_imx53, },
 	{ .compatible = "fsl,imx51-sdma", .data = &sdma_imx51, },
@@ -1337,6 +1343,54 @@ err_firmware:
 	release_firmware(fw);
 }
 
+static int sdma_event_remap(struct sdma_engine *sdma)
+{
+	struct device_node *np = sdma->dev->of_node;
+	char propname[] = "fsl,sdma-event-remap";
+	struct of_phandle_args gpr_spec;
+	struct regmap *gpr;
+	int i = 0, ret = 0;
+
+	/* Only support DT */
+	if (IS_ERR(np))
+		return ret;
+
+	/* Only apply to imx6sx platform */
+	if (!of_device_is_compatible(np, "fsl,imx6sx-sdma"))
+		return ret;
+
+	/* Bypass if no need to remap */
+	if (!of_find_property(np, propname, NULL))
+		return ret;
+
+	/* Fetch the remap configurations of GPR */
+	ret = of_parse_phandle_with_args(np, propname, "#gpr-cells", i++,
+					 &gpr_spec);
+	if (ret) {
+		dev_err(sdma->dev, "failed to get a correct %s property: %d\n",
+				propname, ret);
+		return ret;
+	}
+
+next:
+	gpr = syscon_node_to_regmap(gpr_spec.np);
+	if (IS_ERR(gpr)) {
+		ret = PTR_ERR(gpr);
+		dev_err(sdma->dev, "failed to get gpr regmap: %d\n", reg);
+		return ret;
+	}
+
+	/* 0 : Register address, 1 : Bit shift, 2 : Bit value */
+	regmap_update_bits(gpr, gpr_spec.args[0], BIT(gpr_spec.args[1]),
+			   gpr_spec.args[2] << gpr_spec.args[1]);
+
+	if (!of_parse_phandle_with_args(np, propname, "#gpr-cells", i++,
+					&gpr_spec))
+		goto next;
+
+	return ret;
+}
+
 static int sdma_get_firmware(struct sdma_engine *sdma,
 		const char *fw_name)
 {
@@ -1551,6 +1605,10 @@ static int sdma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_init;
 
+	ret = sdma_event_remap(sdma);
+	if (ret)
+		goto err_init;
+
 	if (sdma->drvdata->script_addrs)
 		sdma_add_scripts(sdma, sdma->drvdata->script_addrs);
 	if (pdata && pdata->script_addrs)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
