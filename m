From: Andrew Jeffery <andrew@aj.id.au>
Subject: [RESEND PATCH 2/2] gpio: aspeed: Remove reference to clock name in debounce warning message
Date: Tue,  8 Aug 2017 15:46:34 +0930
Message-ID: <20170808061634.11857-3-andrew@aj.id.au>
References: <20170808061634.11857-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170808061634.11857-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, ryan_chen@aspeedtech.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

HPLL was in fact not the clock we need. Remove description of which
clock to avoid any further error.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 4ca436e66bdb..bfc53995064a 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -834,7 +834,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->clk = of_clk_get(pdev->dev.of_node, 0);
 	if (IS_ERR(gpio->clk)) {
 		dev_warn(&pdev->dev,
-				"No HPLL clock phandle provided, debouncing disabled\n");
+				"Failed to get clock from devicetree, debouncing disabled\n");
 		gpio->clk = NULL;
 	}
 
-- 
2.11.0
