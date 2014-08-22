From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH] phy: exynos5-usbdrd: Add MODULE_DEVICE_TABLE entry
Date: Fri, 22 Aug 2014 15:58:12 +0200
Message-ID: <1408715892-27728-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

Add a MODULE_DEVICE_TABLE call for OF match tables. This allows the
module to be autoloaded based on devicetree information.

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 drivers/phy/phy-exynos5-usbdrd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/phy-exynos5-usbdrd.c b/drivers/phy/phy-exynos5-usbdrd.c
index b05302b..e9a0f54 100644
--- a/drivers/phy/phy-exynos5-usbdrd.c
+++ b/drivers/phy/phy-exynos5-usbdrd.c
@@ -542,6 +542,7 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	},
 	{ },
 };
+MODULE_DEVICE_TABLE (of, exynos5_usbdrd_phy_of_match);
 
 static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 {
-- 
2.1.0
