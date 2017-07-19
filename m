From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 03/25] mtd: nand: qcom: change compatible string for EBI2 NANDC
Date: Wed, 19 Jul 2017 17:17:51 +0530
Message-ID: <1500464893-11352-4-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The current compatible string “qcom,ipq806x-nand" implies that
the driver is specific to IPQ806x. This driver can be used by
any chip which uses EBI2 NAND controller so changed the
compatible string to “qcom,ebi2-nandc” to give it more generic
name.

Since there is no user for this driver currently in so
changing compatible string is safe.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index f3b995d..8fa2f0c 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -2190,7 +2190,7 @@ static int qcom_nandc_remove(struct platform_device *pdev)
  * more controller variants
  */
 static const struct of_device_id qcom_nandc_of_match[] = {
-	{	.compatible = "qcom,ipq806x-nand",
+	{	.compatible = "qcom,ebi2-nandc",
 		.data = (void *)EBI2_NANDC_ECC_MODES,
 	},
 	{}
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
