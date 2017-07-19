From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 05/25] mtd: nand: qcom: remove redundant chip select compatible string
Date: Wed, 19 Jul 2017 17:17:53 +0530
Message-ID: <1500464893-11352-6-git-send-email-absahu@codeaurora.org>
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

Currently the compatible “qcom,nandcs” is being used for each
connected NAND device to support for multiple NAND devices in the
same bus. The same thing can be achieved by looking reg property
for each sub nodes which contains the chip select number so this
patch removes the use of “qcom,nandcs” for specifying NAND device
sub nodes.

Since there is no user for this driver currently in so
changing compatible string is safe.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 8fa2f0c..110a26a 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -2129,22 +2129,20 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 		goto err_setup;
 
 	for_each_available_child_of_node(dn, child) {
-		if (of_device_is_compatible(child, "qcom,nandcs")) {
-			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
-			if (!host) {
-				of_node_put(child);
-				ret = -ENOMEM;
-				goto err_cs_init;
-			}
-
-			ret = qcom_nand_host_init(nandc, host, child);
-			if (ret) {
-				devm_kfree(dev, host);
-				continue;
-			}
+		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+		if (!host) {
+			of_node_put(child);
+			ret = -ENOMEM;
+			goto err_cs_init;
+		}
 
-			list_add_tail(&host->node, &nandc->host_list);
+		ret = qcom_nand_host_init(nandc, host, child);
+		if (ret) {
+			devm_kfree(dev, host);
+			continue;
 		}
+
+		list_add_tail(&host->node, &nandc->host_list);
 	}
 
 	if (list_empty(&nandc->host_list)) {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
