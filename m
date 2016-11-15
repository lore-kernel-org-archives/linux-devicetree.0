From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCHv2 02/10] mmc: dw_mmc: fix the debug message for checking card's
 present
Date: Tue, 15 Nov 2016 19:12:24 +0900
Message-ID: <20161115101232.3854-3-jh80.chung@samsung.com>
References: <20161115101232.3854-1-jh80.chung@samsung.com>
Return-path: <linux-mmc-owner@vger.kernel.org>
In-reply-to: <20161115101232.3854-1-jh80.chung@samsung.com>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, heiko@sntech.de, shawn.lin@rock-chips.com, robh+dt@kernel.org, Jaehoon Chung <jh80.chung@samsung.com>
List-Id: devicetree@vger.kernel.org

If display the debug message, this message should be spamming.
If flags is maintained the previous value, didn't display the debug
message.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/mmc/host/dw_mmc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index e53899e..6c0c4c5 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -1537,13 +1537,10 @@ static int dw_mci_get_cd(struct mmc_host *mmc)
 			== 0 ? 1 : 0;
 
 	spin_lock_bh(&host->lock);
-	if (present) {
-		set_bit(DW_MMC_CARD_PRESENT, &slot->flags);
+	if (present && !test_and_set_bit(DW_MMC_CARD_PRESENT, &slot->flags))
 		dev_dbg(&mmc->class_dev, "card is present\n");
-	} else {
-		clear_bit(DW_MMC_CARD_PRESENT, &slot->flags);
+	else if (!test_and_clear_bit(DW_MMC_CARD_PRESENT, &slot->flags))
 		dev_dbg(&mmc->class_dev, "card is not present\n");
-	}
 	spin_unlock_bh(&host->lock);
 
 	return present;
-- 
2.10.1

