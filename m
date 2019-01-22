Return-Path: <SRS0=pK1f=P6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:60583 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbfAVRpi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 22 Jan 2019 12:45:38 -0500
From: thor.thayer@linux.intel.com
Subject: [PATCHv2 2/4] EDAC, altera: Less Intrusive Error Injection
Date: Tue, 22 Jan 2019 11:48:05 -0600
Message-Id: <1548179287-21760-3-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1548179287-21760-1-git-send-email-thor.thayer@linux.intel.com>
References: <1548179287-21760-1-git-send-email-thor.thayer@linux.intel.com>
Sender: devicetree-owner@vger.kernel.org
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Improve the Arria10 and Stratix10 error injection routines
by reading the data and changing just 1 bit before writing
back out. Previous routine would set the first bytes to 0
then change to 1 but this method is less intrusive.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
v2  No Changes
---
 drivers/edac/altera_edac.c | 30 +++++++++++++-----------------
 drivers/edac/altera_edac.h |  2 +-
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index c89d82aa2776..56af98d18645 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1756,28 +1756,24 @@ static ssize_t altr_edac_a10_device_trig2(struct file *file,
 	if (trig_type == ALTR_UE_TRIGGER_CHAR) {
 		writel(priv->ue_set_mask, set_addr);
 	} else {
-		/* Setup write of 0 to first 4 bytes */
-		writel(0x0, drvdata->base + ECC_BLK_WDATA0_OFST);
-		writel(0x0, drvdata->base + ECC_BLK_WDATA1_OFST);
-		writel(0x0, drvdata->base + ECC_BLK_WDATA2_OFST);
-		writel(0x0, drvdata->base + ECC_BLK_WDATA3_OFST);
-		/* Setup write of 4 bytes */
+		/* Setup read/write of 4 bytes */
 		writel(ECC_WORD_WRITE, drvdata->base + ECC_BLK_DBYTECTRL_OFST);
 		/* Setup Address to 0 */
-		writel(0x0, drvdata->base + ECC_BLK_ADDRESS_OFST);
-		/* Setup accctrl to write & data override */
-		writel(ECC_WRITE_DOVR, drvdata->base + ECC_BLK_ACCCTRL_OFST);
-		/* Kick it. */
-		writel(ECC_XACT_KICK, drvdata->base + ECC_BLK_STARTACC_OFST);
-		/* Setup accctrl to read & ecc override */
-		writel(ECC_READ_EOVR, drvdata->base + ECC_BLK_ACCCTRL_OFST);
+		writel(0, drvdata->base + ECC_BLK_ADDRESS_OFST);
+		/* Setup accctrl to read & ecc & data override */
+		writel(ECC_READ_EDOVR, drvdata->base + ECC_BLK_ACCCTRL_OFST);
 		/* Kick it. */
 		writel(ECC_XACT_KICK, drvdata->base + ECC_BLK_STARTACC_OFST);
 		/* Setup write for single bit change */
-		writel(0x1, drvdata->base + ECC_BLK_WDATA0_OFST);
-		writel(0x0, drvdata->base + ECC_BLK_WDATA1_OFST);
-		writel(0x0, drvdata->base + ECC_BLK_WDATA2_OFST);
-		writel(0x0, drvdata->base + ECC_BLK_WDATA3_OFST);
+		writel(readl(drvdata->base + ECC_BLK_RDATA0_OFST) ^ 0x1,
+		       drvdata->base + ECC_BLK_WDATA0_OFST);
+		writel(readl(drvdata->base + ECC_BLK_RDATA1_OFST),
+		       drvdata->base + ECC_BLK_WDATA1_OFST);
+		writel(readl(drvdata->base + ECC_BLK_RDATA2_OFST),
+		       drvdata->base + ECC_BLK_WDATA2_OFST);
+		writel(readl(drvdata->base + ECC_BLK_RDATA3_OFST),
+		       drvdata->base + ECC_BLK_WDATA3_OFST);
+
 		/* Copy Read ECC to Write ECC */
 		writel(readl(drvdata->base + ECC_BLK_RECC0_OFST),
 		       drvdata->base + ECC_BLK_WECC0_OFST);
diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index f8664bac9fa8..a1acca99c50b 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -319,7 +319,7 @@ struct altr_sdram_mc_data {
 #define ECC_BLK_STARTACC_OFST             0x7C
 
 #define ECC_XACT_KICK                     0x10000
-#define ECC_WORD_WRITE                    0xF
+#define ECC_WORD_WRITE                    0xFF
 #define ECC_WRITE_DOVR                    0x101
 #define ECC_WRITE_EDOVR                   0x103
 #define ECC_READ_EOVR                     0x2
-- 
2.7.4
