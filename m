From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 5/7] ARM: at91: enclose at91_aic_xx calls in IS_ENABLED(CONFIG_OLD_IRQ_AT91) blocks
Date: Fri, 20 Jun 2014 17:01:25 +0200
Message-ID: <1403276487-8792-6-git-send-email-boris.brezillon@free-electrons.com>
References: <1403276487-8792-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403276487-8792-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enclose at91_aic_xx calls in IS_ENABLED(CONFIG_OLD_IRQ_AT91) blocks in
order to prepare migration to the new AIC driver.

In the new AIC driver the suspend/resume functions are called by the
generic irq framework and are no longer needed in the PM specific code.

Moreover, the new AIC driver no longer exposes the at91_aic_base variable
which is used by the at91_aic_read functions.

Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/mach-at91/pm.c    | 32 ++++++++++++++++++++------------
 arch/arm/mach-at91/setup.c |  3 ++-
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index e955545..5920373 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -206,16 +206,19 @@ static int at91_pm_enter(suspend_state_t state)
 		at91_pinctrl_gpio_suspend();
 	else
 		at91_gpio_suspend();
-	at91_irq_suspend();
 
-	pr_debug("AT91: PM - wake mask %08x, pm state %d\n",
-			/* remember all the always-wake irqs */
-			(at91_pmc_read(AT91_PMC_PCSR)
-					| (1 << AT91_ID_FIQ)
-					| (1 << AT91_ID_SYS)
-					| (at91_get_extern_irq()))
-				& at91_aic_read(AT91_AIC_IMR),
-			state);
+	if (IS_ENABLED(CONFIG_OLD_IRQ_AT91) && at91_aic_base) {
+		at91_irq_suspend();
+
+		pr_debug("AT91: PM - wake mask %08x, pm state %d\n",
+				/* remember all the always-wake irqs */
+				(at91_pmc_read(AT91_PMC_PCSR)
+						| (1 << AT91_ID_FIQ)
+						| (1 << AT91_ID_SYS)
+						| (at91_get_extern_irq()))
+					& at91_aic_read(AT91_AIC_IMR),
+				state);
+	}
 
 	switch (state) {
 		/*
@@ -280,12 +283,17 @@ static int at91_pm_enter(suspend_state_t state)
 			goto error;
 	}
 
-	pr_debug("AT91: PM - wakeup %08x\n",
-			at91_aic_read(AT91_AIC_IPR) & at91_aic_read(AT91_AIC_IMR));
+	if (IS_ENABLED(CONFIG_OLD_IRQ_AT91) && at91_aic_base)
+		pr_debug("AT91: PM - wakeup %08x\n",
+			 at91_aic_read(AT91_AIC_IPR) &
+			 at91_aic_read(AT91_AIC_IMR));
 
 error:
 	target_state = PM_SUSPEND_ON;
-	at91_irq_resume();
+
+	if (IS_ENABLED(CONFIG_OLD_IRQ_AT91) && at91_aic_base)
+		at91_irq_resume();
+
 	if (of_have_populated_dt())
 		at91_pinctrl_gpio_resume();
 	else
diff --git a/arch/arm/mach-at91/setup.c b/arch/arm/mach-at91/setup.c
index f7a07a5..0bf893a 100644
--- a/arch/arm/mach-at91/setup.c
+++ b/arch/arm/mach-at91/setup.c
@@ -49,7 +49,8 @@ void __init at91_init_irq_default(void)
 void __init at91_init_interrupts(unsigned int *priority)
 {
 	/* Initialize the AIC interrupt controller */
-	at91_aic_init(priority, at91_boot_soc.extern_irq);
+	if (IS_ENABLED(CONFIG_OLD_IRQ_AT91))
+		at91_aic_init(priority, at91_boot_soc.extern_irq);
 
 	/* Enable GPIO interrupts */
 	at91_gpio_irq_setup();
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
