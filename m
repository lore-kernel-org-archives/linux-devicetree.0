From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 07/18] AT91: soc: Introduce register_devices callback
Date: Thu,  3 Jul 2014 16:14:44 +0200
Message-ID: <1404396906-25194-12-git-send-email-maxime.ripard@free-electrons.com>
References: <1404396906-25194-1-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1404396906-25194-1-git-send-email-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux@maxim.org.za, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, dwmw2@infradead.org, dbaryshkov@gmail.com
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas@free-electrons.com>, linux-kernel@vger.kernel.org, Boris Brezillon <boris@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Some core devices should be registered by the SoC itself rather than by every
board using this SoC. Introduce a register_devices callback that should be
called during the init_machine in order to do that.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
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
index 3463b9e14418..771e0495bfe5 100644
--- a/arch/arm/mach-at91/setup.c
+++ b/arch/arm/mach-at91/setup.c
@@ -506,3 +506,8 @@ void __init at91_initialize(unsigned long main_clock)
 
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
