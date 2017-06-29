From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 03/14] qcom: mtd: nand: Fixed config error for BCH
Date: Thu, 29 Jun 2017 12:45:55 +0530
Message-ID: <1498720566-20782-4-git-send-email-absahu@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The configuration for BCH is not correct in the current
driver so this patch fixed the same.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 520add9..410ee53 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -1919,7 +1919,7 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 				| wide_bus << WIDE_FLASH
 				| 1 << DEV0_CFG1_ECC_DISABLE;
 
-	host->ecc_bch_cfg = host->bch_enabled << ECC_CFG_ECC_DISABLE
+	host->ecc_bch_cfg = !host->bch_enabled << ECC_CFG_ECC_DISABLE
 				| 0 << ECC_SW_RESET
 				| host->cw_data << ECC_NUM_DATA_BYTES
 				| 1 << ECC_FORCE_CLK_OPEN
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
