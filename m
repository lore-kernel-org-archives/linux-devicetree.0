From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 08/18] AT91: soc: Introduce register_devices callback
Date: Mon,  7 Jul 2014 16:25:21 +0200
Message-ID: <1404743131-24569-9-git-send-email-maxime.ripard@free-electrons.com>
References: <1404743131-24569-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404743131-24569-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Boris Brezillon <boris-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some core devices should be registered by the SoC itself rather than by every
board using this SoC. Introduce a register_devices callback that should be
called during the init_machine in order to do that.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/mach-at91/generic.h | 2 ++
 arch/arm/mach-at91/setup.c   | 5 +++++
 arch/arm/mach-at91/soc.h     | 1 +
 3 files changed, 8 insertions(+)

diff --git a/arch/arm/mach-at91/generic.h b/arch/arm/mach-at91/generic.h
index 631fa3b8c16d..4c2c96195a50 100644
--- a/arch/arm/mach-at91/generic.h
+++ b/arch/arm/mach-at91/generic.h
@@ -37,6 +37,8 @@ extern int  __init at91_aic5_of_init(struct device_node *node,
 extern void __init at91_sysirq_mask_rtc(u32 rtc_base);
 extern void __init at91_sysirq_mask_rtt(u32 rtt_base);
 
+ /* Devices */
+extern void __init at91_register_devices(void);
 
  /* Timer */
 extern void at91rm9200_ioremap_st(u32 addr);
diff --git a/arch/arm/mach-at91/setup.c b/arch/arm/mach-at91/setup.c
index 71003e40f01c..fe0601e0a3c0 100644
--- a/arch/arm/mach-at91/setup.c
+++ b/arch/arm/mach-at91/setup.c
@@ -508,3 +508,8 @@ void __init at91_initialize(unsigned long main_clock)
 
 	pinctrl_provide_dummies();
 }
+
+void __init at91_register_devices(void)
+{
+	at91_boot_soc.register_devices();
+}
diff --git a/arch/arm/mach-at91/soc.h b/arch/arm/mach-at91/soc.h
index a1e1482c6da8..ab983f2cc7dd 100644
--- a/arch/arm/mach-at91/soc.h
+++ b/arch/arm/mach-at91/soc.h
@@ -11,6 +11,7 @@ struct at91_init_soc {
 	void (*map_io)(void);
 	void (*ioremap_registers)(void);
 	void (*register_clocks)(void);
+	void (*register_devices)(void);
 	void (*init)(void);
 };
 
-- 
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
