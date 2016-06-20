From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] of/irq: Mark initialised interrupt controllers as populated
Date: Mon, 20 Jun 2016 14:49:18 +0100
Message-ID: <1466430558-24143-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For interrupt controllers successfully initialised early via device-tree,
mark these interrupt controllers as populated so we don't unnecessarily
create a device and populate any platform data later on in the boot
sequence when we populate all the various platform devices.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/irq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 6ec743faabe8..1b58cd574316 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -557,6 +557,8 @@ void __init of_irq_init(const struct of_device_id *matches)
 			 * its children can get processed in a subsequent pass.
 			 */
 			list_add_tail(&desc->list, &intc_parent_list);
+
+			of_node_set_flag(desc->dev, OF_POPULATED);
 		}
 
 		/* Get the next pending parent that might have children */
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
