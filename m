From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] mfd: cros ec: spi: Fix debug output
Date: Mon, 18 Nov 2013 11:30:49 +0100
Message-ID: <1384770649-8593-3-git-send-email-treding@nvidia.com>
References: <1384770649-8593-1-git-send-email-treding@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384770649-8593-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The dev_cont() symbol doesn't exist, so replace it with pr_cont(). While
at it, also append a newline to the debug output to make it look nicer.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/mfd/cros_ec_spi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index af5c2f6601cf..e3690fcb86ae 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -80,7 +80,9 @@ static void debug_packet(struct device *dev, const char *name, u8 *ptr,
 
 	dev_dbg(dev, "%s: ", name);
 	for (i = 0; i < len; i++)
-		dev_cont(dev, " %02x", ptr[i]);
+		pr_cont(" %02x", ptr[i]);
+
+	pr_cont("\n");
 #endif
 }
 
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
