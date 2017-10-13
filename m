From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: [PATCH] drm/tilcdc: Remove redundant OF_DETACHED flag setting
Date: Fri, 13 Oct 2017 00:47:55 -0700
Message-ID: <20171013074755.14718-1-stephen.boyd@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

of_fdt_unflatten_tree() already sets the flag on this node to
OF_DETACHED, because of_fdt_unflatten_tree() calls
__unflatten_device_tree() with the detached bool set to true.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
---
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
index 623a9140493c..482299a6f3b0 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
@@ -163,7 +163,6 @@ static struct device_node * __init tilcdc_get_overlay(struct kfree_table *kft)
 		return NULL;
 	}
 
-	of_node_set_flag(overlay, OF_DETACHED);
 	ret = of_resolve_phandles(overlay);
 	if (ret) {
 		pr_err("%s: Failed to resolve phandles: %d\n", __func__, ret);
-- 
2.14.GIT
