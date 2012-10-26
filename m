From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] ARM: at91: using for_each_set_bit to simplify the code
Date: Fri, 26 Oct 2012 22:50:54 +0800
Message-ID: <CAPgLHd8V+pcvfhCnkjmc=oteRaav4p97Jiyd7NRJPQ1DCF+QhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Using for_each_set_bit() to simplify the code.

dpatch engine is used to auto generate this patch.
(https://github.com/weiyj/dpatch)

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/pinctrl/pinctrl-at91.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 01bf924..cccac23 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1220,10 +1220,8 @@ static void gpio_irq_handler(unsigned irq, struct irq_desc *desc)
 			continue;
 		}
 
-		n = find_first_bit(&isr, BITS_PER_LONG);
-		while (n < BITS_PER_LONG) {
+		for_each_set_bit(n, &isr, BITS_PER_LONG) {
 			generic_handle_irq(irq_find_mapping(at91_gpio->domain, n));
-			n = find_next_bit(&isr, BITS_PER_LONG, n + 1);
 		}
 	}
 	chained_irq_exit(chip, desc);
