From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [PATCH 6/9] ARM: at91/gpio: non-DT builds do not have gpio_chip.of_node field
Date: Mon, 13 Feb 2012 15:43:06 +0100
Message-ID: <bb41f7d8c40982714b9404314569c342307d9a17.1329139662.git.nicolas.ferre@atmel.com>
References: <1329144189-4535-1-git-send-email-nicolas.ferre@atmel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1329144189-4535-1-git-send-email-nicolas.ferre@atmel.com>
In-Reply-To: <2fd1ebedc5ad5ac7aeb15c590c4400212a3b06cf.1329139662.git.nicolas.ferre@atmel.com>
References: <2fd1ebedc5ad5ac7aeb15c590c4400212a3b06cf.1329139662.git.nicolas.ferre@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: tglx@linutronix.de, devicetree-discuss@lists.ozlabs.org, avictor.za@gmail.com, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: devicetree@vger.kernel.org

Protect build failure in case of non-DT configuration: the
gpio_chip structure does not have a of_node field in case of
!CONFIG_OF_GPIO.

Keep this in a separate patch as it can be reverted if the
field is added for both DT/non-DT cases.

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 arch/arm/mach-at91/gpio.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-at91/gpio.c b/arch/arm/mach-at91/gpio.c
index 89e683a..0dc3f5e 100644
--- a/arch/arm/mach-at91/gpio.c
+++ b/arch/arm/mach-at91/gpio.c
@@ -496,12 +496,17 @@ postcore_initcall(at91_gpio_debugfs_init);
 static void __init at91_gpio_irqdomain(struct at91_gpio_chip *at91_gpio)
 {
 	int irq_base;
+#if defined(CONFIG_OF)
+	struct device_node *of_node = at91_gpio->chip.of_node;
+#else
+	struct device_node *of_node = NULL;
+#endif
 
 	irq_base = irq_alloc_descs(-1, 0, at91_gpio->chip.ngpio, 0);
 	if (irq_base < 0)
 		panic("at91_gpio.%d: error %d: couldn't allocate IRQ numbers.\n",
 			at91_gpio->pioc_idx, irq_base);
-	at91_gpio->domain = irq_domain_add_legacy(at91_gpio->chip.of_node,
+	at91_gpio->domain = irq_domain_add_legacy(of_node,
 						  at91_gpio->chip.ngpio,
 						  irq_base, 0,
 						  &irq_domain_simple_ops, NULL);
-- 
1.7.9
