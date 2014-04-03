From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [patch] irqchip/irq-crossbar: not allocating enough memory
Date: Thu, 3 Apr 2014 10:21:34 +0300
Message-ID: <20140403072134.GA14286@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Sricharan R <r.sricharan-l0cyMroinI0@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

We are allocating the size of a pointer and not the size of the data.
This will lead to memory corruption.

There isn't actually a "cb_device" struct, btw.  The code is only able
to compile because GCC knows that all pointers are the same size.

Fixes: 96ca848ef7ea ('DRIVERS: IRQCHIP: CROSSBAR: Add support for Crossbar IP')
Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

diff --git a/drivers/irqchip/irq-crossbar.c b/drivers/irqchip/irq-crossbar.c
index fc817d2..3d15d16 100644
--- a/drivers/irqchip/irq-crossbar.c
+++ b/drivers/irqchip/irq-crossbar.c
@@ -107,7 +107,7 @@ static int __init crossbar_of_init(struct device_node *node)
 	int i, size, max, reserved = 0, entry;
 	const __be32 *irqsr;
 
-	cb = kzalloc(sizeof(struct cb_device *), GFP_KERNEL);
+	cb = kzalloc(sizeof(*cb), GFP_KERNEL);
 
 	if (!cb)
 		return -ENOMEM;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
