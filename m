From: <tthayer@opensource.altera.com>
Subject: [PATCHv3 3/9] EDAC, altera: Remove platform device from check_deps()
Date: Mon, 21 Mar 2016 11:01:40 -0500
Message-ID: <1458576106-24505-4-git-send-email-tthayer@opensource.altera.com>
References: <1458576106-24505-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458576106-24505-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

In preparation for the Arria10 peripheral ECCs, the
platform device parameter is removed from the check_deps()
functions because it is not needed and makes the Arria10
check_deps() cleaner.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
 ---
v3: This change added.
---
 drivers/edac/altera_edac.c |   10 +++++-----
 drivers/edac/altera_edac.h |    4 +++-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index eee7a39..e20a045 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -746,7 +746,7 @@ static int altr_edac_device_probe(struct platform_device *pdev)
 
 	/* Check specific dependencies for the module */
 	if (drvdata->data->setup) {
-		res = drvdata->data->setup(pdev, drvdata->base);
+		res = drvdata->data->setup(drvdata);
 		if (res)
 			goto fail1;
 	}
@@ -856,9 +856,9 @@ static void ocram_free_mem(void *p, size_t size, void *other)
  *	Can't turn on ECC here because accessing un-initialized
  *	memory will cause CE/UE errors possibly causing an ABORT.
  */
-static int altr_ocram_check_deps(struct platform_device *pdev,
-				 void __iomem *base)
+static int altr_ocram_check_deps(struct altr_edac_device_dev *device)
 {
+	void __iomem  *base = device->base;
 	if (readl(base) & ALTR_OCR_ECC_EN)
 		return 0;
 
@@ -923,9 +923,9 @@ static void l2_free_mem(void *p, size_t size, void *other)
  *	Bail if ECC is not enabled.
  *	Note that L2 Cache Enable is forced at build time.
  */
-static int altr_l2_check_deps(struct platform_device *pdev,
-			      void __iomem *base)
+static int altr_l2_check_deps(struct altr_edac_device_dev *device)
 {
+	void __iomem *base = device->base;
 	if (readl(base) & ALTR_L2_ECC_EN)
 		return 0;
 
diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index 993bb0a..32c798a 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -217,8 +217,10 @@ struct altr_sdram_mc_data {
 #define ALTR_L2_ECC_INJS                BIT(1)
 #define ALTR_L2_ECC_INJD                BIT(2)
 
+struct altr_edac_device_dev;
+
 struct edac_device_prv_data {
-	int (*setup)(struct platform_device *pdev, void __iomem *base);
+	int (*setup)(struct altr_edac_device_dev *device);
 	int ce_clear_mask;
 	int ue_clear_mask;
 	char dbgfs_name[20];
-- 
1.7.9.5
