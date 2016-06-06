From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/22] of: Implement of_match_device()
Date: Mon,  6 Jun 2016 10:31:43 +0200
Message-ID: <20160606083204.19760-2-thierry.reding@gmail.com>
References: <20160606083204.19760-1-thierry.reding@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160606083204.19760-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Many drivers open-code a variant of this function to look up the device
representing a given device tree node. Provide a common implementation
that can be reused by all drivers to avoid duplication.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 5 -----
 include/linux/of_device.h      | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index f5d80839a90c..37f95f3b2dd2 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -77,11 +77,6 @@ static struct bus_type mipi_dsi_bus_type = {
 	.pm = &mipi_dsi_device_pm_ops,
 };
 
-static int of_device_match(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 /**
  * of_find_mipi_dsi_device_by_node() - find the MIPI DSI device matching a
  *    device tree node
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index cc7dd687a89d..ada83eac2ae2 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -102,4 +102,9 @@ static inline void of_dma_configure(struct device *dev, struct device_node *np)
 {}
 #endif /* CONFIG_OF */
 
+static inline int of_device_match(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
 #endif /* _LINUX_OF_DEVICE_H */
-- 
2.8.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
