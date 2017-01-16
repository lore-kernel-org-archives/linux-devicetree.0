From: christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v3 02/18] drivers/fsi: Add device & driver definitions
Date: Mon, 16 Jan 2017 15:23:36 -0600
Message-ID: <1484601816-98188-1-git-send-email-christopher.lee.bostic@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
Cc: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

Add structs for fsi devices & drivers, and struct device conversion
functions.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Signed-off-by: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
---
 include/linux/fsi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 47aa181..f73886a 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -17,6 +17,17 @@
 
 #include <linux/device.h>
 
+struct fsi_device {
+	struct device dev;
+};
+
+struct fsi_driver {
+	struct device_driver drv;
+};
+
+#define to_fsi_dev(devp) container_of(devp, struct fsi_device, dev)
+#define to_fsi_drv(drvp) container_of(drvp, struct fsi_driver, drv)
+
 extern struct bus_type fsi_bus_type;
 
 #endif /* LINUX_FSI_H */
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
