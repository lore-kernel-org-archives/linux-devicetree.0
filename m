From: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH 3/5] mmc: mxcmmc: constify mxcmci_devtype and fix build warning
Date: Thu, 14 Mar 2013 17:40:51 +0100
Message-ID: <1363279254-22351-4-git-send-email-agust@denx.de>
References: <1363279254-22351-1-git-send-email-agust@denx.de>
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1363279254-22351-1-git-send-email-agust@denx.de>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: Chris Ball <cjb@laptop.org>, Sascha Hauer <s.hauer@pengutronix.de>, Markus Pargmann <mpa@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, Anatolij Gustschin <agust@denx.de>
List-Id: devicetree@vger.kernel.org

Fix:
drivers/mmc/host/mxcmmc.c: In function 'mxcmci_probe':
drivers/mmc/host/mxcmmc.c:1137:41: warning: initialization discards
'const' qualifier from pointer target type [enabled by default]

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/mmc/host/mxcmmc.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index dc25802..c0115e9 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -169,7 +169,7 @@ struct mxcmci_host {
 	struct mxcmci_reg_ops   *reg_ops;
 };
 
-static struct platform_device_id mxcmci_devtype[] = {
+static const struct platform_device_id mxcmci_devtype[] = {
 	{
 		.name = "imx21-mmc",
 		.driver_data = IMX21_MMC,
@@ -1091,7 +1091,7 @@ static int mxcmci_probe(struct platform_device *pdev)
 	host->reg_ops = &mxcmci_reg_ops;
 
 	if (of_id) {
-		struct platform_device_id *id_entry = of_id->data;
+		const struct platform_device_id *id_entry = of_id->data;
 		host->devtype = id_entry->driver_data;
 	} else {
 		host->devtype = pdev->id_entry->driver_data;
-- 
1.7.5.4

