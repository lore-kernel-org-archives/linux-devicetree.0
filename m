From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH V3 04/10] dmaengine: qcom_hidma: configure DMA and MSI for OF
Date: Thu, 15 Sep 2016 13:22:40 -0400
Message-ID: <1473960166-30155-5-git-send-email-okaya@codeaurora.org>
References: <1473960166-30155-1-git-send-email-okaya@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1473960166-30155-1-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com
Cc: agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sinan Kaya <okaya@codeaurora.org>, Dan Williams <dan.j.williams@intel.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Configure the DMA bindings for the device tree based firmware.

Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
---
 drivers/dma/qcom/hidma_mgmt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 82f36e4..e8f6b84 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -375,8 +375,11 @@ static int __init hidma_mgmt_of_populate_channels(struct device_node *np)
 			ret = PTR_ERR(new_pdev);
 			goto out;
 		}
+		of_node_get(child);
+		new_pdev->dev.of_node = child;
 		of_dma_configure(&new_pdev->dev, child);
-
+		of_msi_configure(&new_pdev->dev, child);
+		of_node_put(child);
 		kfree(res);
 		res = NULL;
 	}
-- 
1.9.1
