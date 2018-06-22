Return-Path: <SRS0=pxWX=JI=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] crypto: sahara - Add i.MX51 entry
Date: Fri, 22 Jun 2018 13:21:27 -0300
Message-Id: <1529684487-5025-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1529684487-5025-1-git-send-email-festevam@gmail.com>
References: <1529684487-5025-1-git-send-email-festevam@gmail.com>
To: herbert@gondor.apana.org.au
Cc: robh+dt@kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, horia.geanta@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

i.MX51 and i.MX51 share the same sahara IP block version, so add
i.MX51 in the compatible list.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/crypto/sahara.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/sahara.c b/drivers/crypto/sahara.c
index 0f2245e..ce1a42c 100644
--- a/drivers/crypto/sahara.c
+++ b/drivers/crypto/sahara.c
@@ -1382,6 +1382,7 @@ static const struct platform_device_id sahara_platform_ids[] = {
 MODULE_DEVICE_TABLE(platform, sahara_platform_ids);
 
 static const struct of_device_id sahara_dt_ids[] = {
+	{ .compatible = "fsl,imx51-sahara" },
 	{ .compatible = "fsl,imx53-sahara" },
 	{ .compatible = "fsl,imx27-sahara" },
 	{ /* sentinel */ }
@@ -1507,7 +1508,9 @@ static int sahara_probe(struct platform_device *pdev)
 		if (version != SAHARA_VERSION_3)
 			err = -ENODEV;
 	} else if (of_device_is_compatible(pdev->dev.of_node,
-			"fsl,imx53-sahara")) {
+		   "fsl,imx53-sahara") ||
+		   of_device_is_compatible(pdev->dev.of_node,
+		   "fsl,imx51-sahara")) {
 		if (((version >> 8) & 0xff) != SAHARA_VERSION_4)
 			err = -ENODEV;
 		version = (version >> 8) & 0xff;
-- 
2.7.4
