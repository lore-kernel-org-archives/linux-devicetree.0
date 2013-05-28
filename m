From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] mmc: sh_mobile_sdhi: fix error return code in sh_mobile_sdhi_probe()
Date: Tue, 28 May 2013 13:26:50 +0800
Message-ID: <CAPgLHd_dwxRp8Ug7=05=3gTTa9bPME5tb-Mq1aqRFXZSrgqFGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: g.liakhovetski@gmx.de, ian@mnementh.co.uk, cjb@laptop.org, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code instead of 0 when we cannot get
IRQ source by platform_get_irq(), as done elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mmc/host/sh_mobile_sdhi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sh_mobile_sdhi.c b/drivers/mmc/host/sh_mobile_sdhi.c
index cc4c872..a4316b3 100644
--- a/drivers/mmc/host/sh_mobile_sdhi.c
+++ b/drivers/mmc/host/sh_mobile_sdhi.c
@@ -273,8 +273,10 @@ static int sh_mobile_sdhi_probe(struct platform_device *pdev)
 		}
 
 		/* There must be at least one IRQ source */
-		if (!i)
+		if (!i) {
+			ret = irq;
 			goto eirq;
+		}
 	}
 
 	dev_info(&pdev->dev, "%s base at 0x%08lx clock rate %u MHz\n",

