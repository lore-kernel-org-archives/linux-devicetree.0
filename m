From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 2/9] include: media: Add Renesas CEU driver interface
Date: Tue,  9 Jan 2018 17:25:24 +0100
Message-ID: <1515515131-13760-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1515515131-13760-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515515131-13760-1-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add renesas-ceu header file.

Do not remove the existing sh_mobile_ceu.h one as long as the original
driver does not go away.

Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
---
 include/media/drv-intf/renesas-ceu.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 include/media/drv-intf/renesas-ceu.h

diff --git a/include/media/drv-intf/renesas-ceu.h b/include/media/drv-intf/renesas-ceu.h
new file mode 100644
index 0000000..52841d1
--- /dev/null
+++ b/include/media/drv-intf/renesas-ceu.h
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * renesas-ceu.h - Renesas CEU driver interface
+ *
+ * Copyright 2017-2018 Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
+ */
+
+#ifndef __MEDIA_DRV_INTF_RENESAS_CEU_H__
+#define __MEDIA_DRV_INTF_RENESAS_CEU_H__
+
+#define CEU_MAX_SUBDEVS		2
+
+struct ceu_async_subdev {
+	unsigned long flags;
+	unsigned char bus_width;
+	unsigned char bus_shift;
+	unsigned int i2c_adapter_id;
+	unsigned int i2c_address;
+};
+
+struct ceu_platform_data {
+	unsigned int num_subdevs;
+	struct ceu_async_subdev subdevs[CEU_MAX_SUBDEVS];
+};
+
+#endif /* ___MEDIA_DRV_INTF_RENESAS_CEU_H__ */
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
