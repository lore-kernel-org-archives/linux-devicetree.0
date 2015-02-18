From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] drivers/tty: pl011: read fifo size from OF if present
Date: Wed, 18 Feb 2015 13:53:13 -0500
Message-ID: <1424285593-2886-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1424285593-2886-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424285593-2886-1-git-send-email-jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/tty/serial/amba-pl011.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 02016fc..23fef63 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -84,6 +84,12 @@ struct vendor_data {
 
 static unsigned int get_fifosize_arm(struct amba_device *dev)
 {
+	const void *prop;
+
+	prop = of_get_property(dev->dev.of_node, "fifo-size", NULL);
+	if (prop)
+		return of_read_ulong(prop, 1);
+
 	return amba_rev(dev) < 3 ? 16 : 32;
 }
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
