From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [PATCH 9/9] ARM: at91/board-dt: remove AIC irq domain from board file
Date: Mon, 13 Feb 2012 15:43:09 +0100
Message-ID: <9d4eee84ad7c95fb7ad61194166696c64414fd3f.1329139662.git.nicolas.ferre@atmel.com>
References: <1329144189-4535-1-git-send-email-nicolas.ferre@atmel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1329144189-4535-1-git-send-email-nicolas.ferre@atmel.com>
In-Reply-To: <2fd1ebedc5ad5ac7aeb15c590c4400212a3b06cf.1329139662.git.nicolas.ferre@atmel.com>
References: <2fd1ebedc5ad5ac7aeb15c590c4400212a3b06cf.1329139662.git.nicolas.ferre@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: tglx@linutronix.de, devicetree-discuss@lists.ozlabs.org, avictor.za@gmail.com, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: devicetree@vger.kernel.org

Adding of irqdomain in AIC code make the specification
of the irq domain in board file useless.

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 arch/arm/mach-at91/board-dt.c |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-at91/board-dt.c b/arch/arm/mach-at91/board-dt.c
index 0579315..6120978 100644
--- a/arch/arm/mach-at91/board-dt.c
+++ b/arch/arm/mach-at91/board-dt.c
@@ -15,8 +15,6 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/gpio.h>
-#include <linux/irqdomain.h>
-#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 
 #include <mach/hardware.h>
@@ -88,14 +86,8 @@ static void __init ek_add_device_nand(void)
 	at91_add_device_nand(&ek_nand_data);
 }
 
-static const struct of_device_id aic_of_match[] __initconst = {
-	{ .compatible = "atmel,at91rm9200-aic", },
-	{},
-};
-
 static void __init at91_dt_init_irq(void)
 {
-	irq_domain_generate_simple(aic_of_match, 0xfffff000, 0);
 	at91_init_irq_default();
 }
 
-- 
1.7.9
