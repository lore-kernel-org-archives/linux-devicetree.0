From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] mmc: sdhci-s3c: Use NULL instead of 0 for pointers
Date: Tue, 20 Nov 2012 09:41:53 +0530
Message-ID: <1353384713-21969-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: cjb@laptop.org, thomas.abraham@linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

The third argument for of_get_property() is a pointer, hence pass
NULL instead of 0.

Fixes following sparse warning.
drivers/mmc/host/sdhci-s3c.c:452:48: warning: Using plain integer as
NULL pointer
drivers/mmc/host/sdhci-s3c.c:457:52: warning: Using plain integer as
NULL pointer

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 drivers/mmc/host/sdhci-s3c.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index a54dd5d..80b10f2 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -449,12 +449,12 @@ static int __devinit sdhci_s3c_parse_dt(struct device *dev,
 		return -ENOMEM;
 
 	/* get the card detection method */
-	if (of_get_property(node, "broken-cd", 0)) {
+	if (of_get_property(node, "broken-cd", NULL)) {
 		pdata->cd_type = S3C_SDHCI_CD_NONE;
 		goto setup_bus;
 	}
 
-	if (of_get_property(node, "non-removable", 0)) {
+	if (of_get_property(node, "non-removable", NULL)) {
 		pdata->cd_type = S3C_SDHCI_CD_PERMANENT;
 		goto setup_bus;
 	}
-- 
1.7.4.1

