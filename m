From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] pinctrl: sunxi: fix error return code in sunxi_pinctrl_probe()
Date: Thu, 23 May 2013 17:32:14 +0800
Message-ID: <CAPgLHd_v3oNBP5DcqJ9bkGKkCDqwr1UzJNnVT6uz8V--FWEQ0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, grant.likely@linaro.org, rob.herring@calxeda.com, emilio@elopez.com.ar
Cc: yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code from the devm_clk_get() error
handling case instead of 0, as done elsewhere in this function.

Introduced by commit 950707c0eb5c7aeaa2c446a04c824f4be686d2f6
(pinctrl: sunxi: add clock support)

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/pinctrl/pinctrl-sunxi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-sunxi.c b/drivers/pinctrl/pinctrl-sunxi.c
index c058529..b7d8c89 100644
--- a/drivers/pinctrl/pinctrl-sunxi.c
+++ b/drivers/pinctrl/pinctrl-sunxi.c
@@ -1990,8 +1990,10 @@ static int sunxi_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
 		goto gpiochip_error;
+	}
 
 	clk_prepare_enable(clk);
 
