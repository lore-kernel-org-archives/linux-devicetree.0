From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] gpio: pxa: using for_each_set_bit to simplify the code
Date: Fri, 14 Sep 2012 10:36:59 +0800
Message-ID: <CAPgLHd93SqsiFmE7y356VwBJtaac0APE__vk+8dBZnaOyt4org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@secretlab.ca, linus.walleij@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Using for_each_set_bit() to simplify the code.

spatch with a semantic match is used to found this.
(http://coccinelle.lip6.fr/)

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/gpio/gpio-pxa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 9cac88a..a9e1a74 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -413,12 +413,10 @@ static void pxa_gpio_demux_handler(unsigned int irq, struct irq_desc *desc)
 			gedr = gedr & c->irq_mask;
 			writel_relaxed(gedr, c->regbase + GEDR_OFFSET);
 
-			n = find_first_bit(&gedr, BITS_PER_LONG);
-			while (n < BITS_PER_LONG) {
+			for_each_set_bit(n, &gedr, BITS_PER_LONG) {
 				loop = 1;
 
 				generic_handle_irq(gpio_to_irq(gpio_base + n));
-				n = find_next_bit(&gedr, BITS_PER_LONG, n + 1);
 			}
 		}
 	} while (loop);
