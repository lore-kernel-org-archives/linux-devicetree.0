From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: [RFC 07/18] omap3isp: Rename regulators to better suit the Device Tree
Date: Sat,  7 Mar 2015 23:41:04 +0200
Message-ID: <1425764475-27691-8-git-send-email-sakari.ailus@iki.fi>
References: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, pali.rohar@gmail.com
List-Id: devicetree@vger.kernel.org

Rename VDD_CSIPHY1 as vdd-csiphy1 and VDD_CSIPHY2 as vdd-csiphy2.

Signed-off-by: Sakari Ailus <sakari.ailus@iki.fi>
---
 drivers/media/platform/omap3isp/isp.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index 1b5c6df..c045318 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -2292,8 +2292,8 @@ static int isp_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, isp);
 
 	/* Regulators */
-	isp->isp_csiphy1.vdd = devm_regulator_get(&pdev->dev, "VDD_CSIPHY1");
-	isp->isp_csiphy2.vdd = devm_regulator_get(&pdev->dev, "VDD_CSIPHY2");
+	isp->isp_csiphy1.vdd = devm_regulator_get(&pdev->dev, "vdd-csiphy1");
+	isp->isp_csiphy2.vdd = devm_regulator_get(&pdev->dev, "vdd-csiphy2");
 
 	/* Clocks
 	 *
-- 
1.7.10.4
