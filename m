From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] drivers/tty: pl011: read fifo size from OF if present
Date: Wed, 18 Feb 2015 15:07:49 -0500
Message-ID: <1424290069-8760-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <amba uarts - arm type uarts fifo size provided by device tree>
 <1424290069-8760-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424290069-8760-1-git-send-email-jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/tty/serial/amba-pl011.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 02016fc..c6a2dd8 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -84,6 +84,11 @@ struct vendor_data {
 
 static unsigned int get_fifosize_arm(struct amba_device *dev)
 {
+	u32 val;
+
+	if (!of_property_read_u32(dev->dev.of_node, "fifo-size", &val))
+		return val;
+
 	return amba_rev(dev) < 3 ? 16 : 32;
 }
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
