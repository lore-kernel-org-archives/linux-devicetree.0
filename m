From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] pinctrl: exynos5440: fix invalid use of sizeof in exynos5440_pinctrl_probe()
Date: Thu, 14 Mar 2013 21:59:38 +0800
Message-ID: <CAPgLHd8yrZbidfvavg2nrO77zpx_NvKS7QDk=oDWD4T6Vb5+zQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

sizeof() when applied to a pointer typed expression gives the
size of the pointer, not that of the pointed data.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/pinctrl/pinctrl-exynos5440.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-exynos5440.c b/drivers/pinctrl/pinctrl-exynos5440.c
index 1376eb7..fe65739 100644
--- a/drivers/pinctrl/pinctrl-exynos5440.c
+++ b/drivers/pinctrl/pinctrl-exynos5440.c
@@ -854,7 +854,7 @@ static int exynos5440_pinctrl_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	priv = devm_kzalloc(dev, sizeof(priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		dev_err(dev, "could not allocate memory for private data\n");
 		return -ENOMEM;
