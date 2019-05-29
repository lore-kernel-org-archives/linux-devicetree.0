From: Chuanhua Han <chuanhua.han@nxp.com>
Subject: [PATCH 1/3] gpio: mpc8xxx: Enable port input and interrupt
Date: Wed, 29 May 2019 16:32:52 +0800
Message-ID: <20190529083254.39581-1-chuanhua.han@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Chuanhua Han <chuanhua.han@nxp.com>, Zhang Ying-22455 <ying.zhang22455@nxp.com>
List-Id: devicetree@vger.kernel.org

The GPIO Input Buffer Enable register is used to control the input
enable of each individual GPIO port. When an individual GPIO port's
direction is set to input (GPIO_GPDIR[DRn=0]), the associated
input enable must be set (GPIOxGPIE[IEn]=1) to propagate the port
value to the GPIO Data Register.

This patch enable port input and interrupt.

Signed-off-by: Zhang Ying-22455 <ying.zhang22455@nxp.com>
Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index c8673a5d9412..555e0e7957d9 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -373,9 +373,10 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	if (!mpc8xxx_gc->irq)
 		return 0;
 
-	/* ack and mask all irqs */
+	/* ack and enable irqs */
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
-	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0);
+	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0xffffffff);
+	gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR2, 0xffffffff);
 
 	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
 					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
-- 
2.17.1
