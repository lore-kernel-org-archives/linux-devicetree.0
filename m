From: James Liao <jamesjj.liao@mediatek.com>
Subject: [PATCH v8 2/4] soc: mediatek: Init MT8173 scpsys driver earlier
Date: Tue, 19 Jul 2016 15:04:41 +0800
Message-ID: <1468911883-41882-3-git-send-email-jamesjj.liao@mediatek.com>
References: <1468911883-41882-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1468911883-41882-1-git-send-email-jamesjj.liao@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <kernel@pengutronix.de>
Cc: srv_heupstream@mediatek.com, devicetree@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, linux-mediatek@lists.infradead.org, James Liao <jamesjj.liao@mediatek.com>, linux-arm-kernel@lists.infradead.org
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

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 1f3555a..e806cb7 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -618,4 +618,21 @@ static struct platform_driver scpsys_drv = {
 		.of_match_table = of_match_ptr(of_scpsys_match_tbl),
 	},
 };
-builtin_platform_driver(scpsys_drv);
+
+static int __init scpsys_drv_init(void)
+{
+	return platform_driver_register(&scpsys_drv);
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
