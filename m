From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 09/25] mtd: nand: qcom: remove memset for clearing read register buffer
Date: Wed, 19 Jul 2017 17:17:57 +0530
Message-ID: <1500464893-11352-10-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The memset in clear_read_regs is overhead. All the register data
will be filled by DMA during NAND operation so making these
register variables zero is not required.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 5b71478..7ecd0f8 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -826,8 +826,6 @@ static void free_descs(struct qcom_nand_controller *nandc)
 static void clear_read_regs(struct qcom_nand_controller *nandc)
 {
 	nandc->reg_read_pos = 0;
-	memset(nandc->reg_read_buf, 0,
-	       MAX_REG_RD * sizeof(*nandc->reg_read_buf));
 }
 
 static void pre_command(struct qcom_nand_host *host, int command)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
