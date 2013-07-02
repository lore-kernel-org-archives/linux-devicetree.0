From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] [SCSI] ufshcd-pltfrm: remove redundant dev_err call in ufshcd_pltfrm_probe()
Date: Tue, 2 Jul 2013 08:45:42 +0800
Message-ID: <CAPgLHd-vPmOVUtUM2EFVKZg_MMDx0UEg6kD2A8LqmgBLnx72yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-scsi-owner@vger.kernel.org>
Sender: linux-scsi-owner@vger.kernel.org
To: vinholikatti@gmail.com, santoshsy@gmail.com, JBottomley@parallels.com, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-scsi@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/scsi/ufs/ufshcd-pltfrm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
index c42db40..2bd7417 100644
--- a/drivers/scsi/ufs/ufshcd-pltfrm.c
+++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
@@ -110,7 +110,6 @@ static int ufshcd_pltfrm_probe(struct platform_device *pdev)
 
 	mmio_base = devm_ioremap_resource(dev, mem_res);
 	if (IS_ERR(mmio_base)) {
-		dev_err(dev, "memory map failed\n");
 		err = PTR_ERR(mmio_base);
 		goto out;
 	}

