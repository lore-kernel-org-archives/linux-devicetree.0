From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v7 07/14] gpio: thunderx: Use the default parent apis for {request,release}_resources
Date: Sat, 20 Apr 2019 15:39:43 +0530
Message-ID: <20190420100950.7997-8-lokeshvutla@ti.com>
References: <20190420100950.7997-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190420100950.7997-1-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>, tglx@linutronix.de, jason@lakedaemon.net
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>, linus.walleij@linaro.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

thunderx_gpio_irq_{request,release}_resources apis are trying to
{request,release} resources on parent interrupt. There are default
apis doing the same. Use the default parent apis instead of writing
the same code snippet.

Cc: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
Changes since v6:
- new patch

 drivers/gpio/gpio-thunderx.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index 1306722faa5a..715371b5102a 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -363,22 +363,16 @@ static int thunderx_gpio_irq_request_resources(struct irq_data *data)
 {
 	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
 	struct thunderx_gpio *txgpio = txline->txgpio;
-	struct irq_data *parent_data = data->parent_data;
 	int r;
 
 	r = gpiochip_lock_as_irq(&txgpio->chip, txline->line);
 	if (r)
 		return r;
 
-	if (parent_data && parent_data->chip->irq_request_resources) {
-		r = parent_data->chip->irq_request_resources(parent_data);
-		if (r)
-			goto error;
-	}
+	r = irq_chip_request_resources_parent(data);
+	if (r)
+		gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
 
-	return 0;
-error:
-	gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
 	return r;
 }
 
@@ -386,10 +380,8 @@ static void thunderx_gpio_irq_release_resources(struct irq_data *data)
 {
 	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
 	struct thunderx_gpio *txgpio = txline->txgpio;
-	struct irq_data *parent_data = data->parent_data;
 
-	if (parent_data && parent_data->chip->irq_release_resources)
-		parent_data->chip->irq_release_resources(parent_data);
+	irq_chip_release_resources_parent(data);
 
 	gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
 }
-- 
2.21.0
