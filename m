From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 7/9] gpu: ipu-v3: hook up PRG unit
Date: Fri, 17 Feb 2017 19:28:28 +0100
Message-ID: <20170217182830.32618-8-l.stach@pengutronix.de>
References: <20170217182830.32618-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170217182830.32618-1-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The i.MX6 QuadPlus IPU needs to PRG unit to gain access to the
data bus. Make sure it is present and available to be used.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/gpu/ipu-v3/ipu-common.c | 7 +++++++
 drivers/gpu/ipu-v3/ipu-prv.h    | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index d0694ef95f28..37426dd94408 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -937,6 +937,7 @@ static const struct of_device_id imx_ipu_dt_ids[] = {
 	{ .compatible = "fsl,imx51-ipu", .data = &ipu_type_imx51, },
 	{ .compatible = "fsl,imx53-ipu", .data = &ipu_type_imx53, },
 	{ .compatible = "fsl,imx6q-ipu", .data = &ipu_type_imx6q, },
+	{ .compatible = "fsl,imx6qp-ipu", .data = &ipu_type_imx6q, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx_ipu_dt_ids);
@@ -1402,6 +1403,12 @@ static int ipu_probe(struct platform_device *pdev)
 	if (!ipu)
 		return -ENODEV;
 
+	if (of_device_is_compatible(np, "fsl,imx6qp-ipu")) {
+		ipu->prg_priv = ipu_prg_get_by_ipu_device(&pdev->dev);
+		if (!ipu->prg_priv)
+			return -EPROBE_DEFER;
+	}
+
 	for (i = 0; i < 64; i++)
 		ipu->channel[i].ipu = ipu;
 	ipu->devtype = devtype;
diff --git a/drivers/gpu/ipu-v3/ipu-prv.h b/drivers/gpu/ipu-v3/ipu-prv.h
index 0d1d2d667f3b..0d32a4f3a76a 100644
--- a/drivers/gpu/ipu-v3/ipu-prv.h
+++ b/drivers/gpu/ipu-v3/ipu-prv.h
@@ -204,6 +204,7 @@ struct ipu_soc {
 	struct ipu_vdi          *vdi_priv;
 	struct ipu_image_convert_priv *image_convert_priv;
 	struct ipu_smfc_priv	*smfc_priv;
+	struct ipu_prg		*prg_priv;
 };
 
 static inline u32 ipu_idmac_read(struct ipu_soc *ipu, unsigned offset)
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
