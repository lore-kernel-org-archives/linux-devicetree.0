From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 7/9] gpu: ipu-v3: only set non-zero AXI ID for IC when PRG is absent
Date: Tue, 14 Mar 2017 11:38:46 +0100
Message-ID: <1489487928-26083-7-git-send-email-p.zabel@pengutronix.de>
References: <1489487928-26083-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489487928-26083-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Using non-zero AXI IDs for anything other than the display channels
collides with the PRG AXI snooping, so only do this if there is no
PRG present.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index 805b6fa7b5f4c..524a717ab28e4 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -671,7 +671,12 @@ static void init_idmac_channel(struct ipu_image_convert_ctx *ctx,
 	ipu_ic_task_idma_init(chan->ic, channel, width, height,
 			      burst_size, rot_mode);
 
-	ipu_cpmem_set_axi_id(channel, 1);
+	/*
+	 * Setting a non-zero AXI ID collides with the PRG AXI snooping, so
+	 * only do this when there is no PRG present.
+	 */
+	if (!channel->ipu->prg_priv)
+		ipu_cpmem_set_axi_id(channel, 1);
 
 	ipu_idmac_set_double_buffer(channel, ctx->double_buffering);
 }
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
