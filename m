From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] [media] s5p-mfc: fix error return code in s5p_mfc_probe()
Date: Thu, 18 Apr 2013 11:18:19 +0800
Message-ID: <CAPgLHd_TwmtoaE7T7e3fRKh4NTGhOYjQZv0G7nt-iSVMLz3XEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: kyungmin.park@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, mchehab@redhat.com, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code from the error handling
case instead of 0, as returned elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/media/platform/s5p-mfc/s5p_mfc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index e810b1a..a5853fa 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -1110,7 +1110,8 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 	}
 
 	if (pdev->dev.of_node) {
-		if (s5p_mfc_alloc_memdevs(dev) < 0)
+		ret = s5p_mfc_alloc_memdevs(dev);
+		if (ret < 0)
 			goto err_res;
 	} else {
 		dev->mem_dev_l = device_find_child(&dev->plat_dev->dev,
