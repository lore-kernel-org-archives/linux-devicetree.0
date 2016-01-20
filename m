From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 2/4] soc: mediatek: Init MT8173 scpsys driver earlier
Date: Wed, 20 Jan 2016 14:08:15 +0800
Message-ID: <1453270097-53853-3-git-send-email-jamesjj.liao@mediatek.com>
References: <1453270097-53853-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453270097-53853-1-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some power domain comsumers may init before module_init.
So the power domain provider (scpsys) need to be initialized
earlier too.

Take an example for our IOMMU (M4U) and SMI. SMI is a bridge
between IOMMU and multimedia HW. SMI is responsible to
enable/disable iommu and help transfer data for each multimedia
HW. Both of them have to wait until the power and clocks are
enabled.

So scpsys driver should be initialized before SMI, and SMI should
be initialized before IOMMU, and then init IOMMU consumers
(display/vdec/venc/camera etc.).

IOMMU is subsys_init by default. So we need to init scpsys driver
before subsys_init.

Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-scpsys.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 339adfc..0490a93 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -560,4 +560,21 @@ static struct platform_driver scpsys_drv = {
 		.of_match_table = of_match_ptr(of_scpsys_match_tbl),
 	},
 };
-builtin_platform_driver_probe(scpsys_drv, scpsys_probe);
+
+static int __init scpsys_drv_init(void)
+{
+	return platform_driver_probe(&scpsys_drv, scpsys_probe);
+}
+
+/*
+ * There are some Mediatek drivers which depend on the power domain driver need
+ * to probe in earlier initcall levels. So scpsys driver also need to probe
+ * earlier.
+ *
+ * IOMMU(M4U) and SMI drivers for example. SMI is a bridge between IOMMU and
+ * multimedia HW. IOMMU depends on SMI, and SMI is a power domain consumer,
+ * so the proper probe sequence should be scpsys -> SMI -> IOMMU driver.
+ * IOMMU drivers are initialized during subsys_init by default, so we need to
+ * move SMI and scpsys drivers to subsys_init or earlier init levels.
+ */
+subsys_initcall(scpsys_drv_init);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
