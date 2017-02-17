From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/9] gpu: ipu-v3: remove AXI ID setting for IC channel
Date: Fri, 17 Feb 2017 19:28:22 +0100
Message-ID: <20170217182830.32618-2-l.stach@pengutronix.de>
References: <20170217182830.32618-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170217182830.32618-1-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a pretty minor optimization for the IC channel to get
out-of-order AXI returns, but clashes with the AXI ID assignment
that needs to be done for the display channels on QuadPlus.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index 805b6fa7b5f4..5e3cc6bd98fc 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -671,8 +671,6 @@ static void init_idmac_channel(struct ipu_image_convert_ctx *ctx,
 	ipu_ic_task_idma_init(chan->ic, channel, width, height,
 			      burst_size, rot_mode);
 
-	ipu_cpmem_set_axi_id(channel, 1);
-
 	ipu_idmac_set_double_buffer(channel, ctx->double_buffering);
 }
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
