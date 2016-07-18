From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH 04/10] dmaending: qcom_hidma: configure DMA and MSI for OF
Date: Mon, 18 Jul 2016 14:39:31 -0400
Message-ID: <1468867177-15007-5-git-send-email-okaya@codeaurora.org>
References: <1468867177-15007-1-git-send-email-okaya@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468867177-15007-1-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com
Cc: eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sinan Kaya <okaya@codeaurora.org>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Configure the DMA bindings for the device tree based firmware.

Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
---
 drivers/dma/qcom/hidma_mgmt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index c0e3653..fb30730 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -375,8 +375,10 @@ static int __init hidma_mgmt_of_populate_channels(struct device_node *np)
 			ret = -ENODEV;
 			goto out;
 		}
+		of_node_get(child);
+		new_pdev->dev.of_node = child;
 		of_dma_configure(&new_pdev->dev, child);
-
+		of_msi_configure(&new_pdev->dev, child);
 		kfree(res);
 		res = NULL;
 	}
-- 
1.8.2.1
