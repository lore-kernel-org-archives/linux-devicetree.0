From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] gpio: em: Use dynamic allocation of GPIOs
Date: Mon, 17 Nov 2014 15:30:32 +0100
Message-ID: <1416234632-16166-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Use dynamic allocation of GPIOs instead of looking at the gpio%u alias
in DT.
---
  - Is this correct? Not having to care about the alias would simplify the
    to-be-written DT binding documentation.
  - Completely untested.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

 drivers/gpio/gpio-em.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 21d34d4d473dcefe..c3434146f605748b 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -330,12 +330,7 @@ static int em_gio_probe(struct platform_device *pdev)
 			goto err0;
 		}
 
-		ret = of_alias_get_id(pdev->dev.of_node, "gpio");
-		if (ret < 0) {
-			dev_err(&pdev->dev, "Couldn't get OF id\n");
-			goto err0;
-		}
-		pdata->gpio_base = ret * 32; /* 32 GPIOs per instance */
+		pdata->gpio_base = -1;
 	}
 
 	gpio_chip = &p->gpio_chip;
-- 
1.9.1

