From: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v1 1/2] of: irq: Ignore disabled intc's when searching map
Date: Wed, 27 Nov 2013 23:26:12 -0800
Message-ID: <ee3c0c716da8f1b1146d8829bc5184fbf1c3ead2.1385623064.git.peter.crosthwaite@xilinx.com>
References: <cover.1385623064.git.peter.crosthwaite@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1385623064.git.peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <cover.1385623064.git.peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
References: <cover.1385623064.git.peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant-likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

When searching the interrupt map, if a matched parent is disabled, just
ignore it and move on with the search.

This allows for specifying connection of a single device IRQ to
multiple interrupt controllers via the interrupt map schema. This change
allows for selection of the active interrupt controller via the already
existing status = "disabled" mechanism.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/irq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 786b0b4..22e414b 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -217,6 +217,9 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
 				goto fail;
 			}
 
+			if (!of_device_is_available(newpar))
+				match = 0;
+
 			/* Get #interrupt-cells and #address-cells of new
 			 * parent
 			 */
-- 
1.8.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
