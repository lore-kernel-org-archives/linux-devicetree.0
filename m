From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [PATCH v5 2/2] ARM: at91/pit: add traces in case of error
Date: Wed, 22 Feb 2012 15:32:49 +0100
Message-ID: <76116efd8af5f70ca2d3ccd18e51dfe791e2a616.1329920069.git.nicolas.ferre@atmel.com>
References: <1325866830-13259-1-git-send-email-nicolas.ferre@atmel.com>
 <06c78dfd072dd03b45acbecb0380ce67de0bee70.1329920069.git.nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <06c78dfd072dd03b45acbecb0380ce67de0bee70.1329920069.git.nicolas.ferre@atmel.com>
In-Reply-To: <06c78dfd072dd03b45acbecb0380ce67de0bee70.1329920069.git.nicolas.ferre@atmel.com>
References: <06c78dfd072dd03b45acbecb0380ce67de0bee70.1329920069.git.nicolas.ferre@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robherring2@gmail.com, grant.likely@secretlab.ca, plagnioj@jcrosoft.com
Cc: jamie@jamieiles.com, devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Traces related to IRQ management are useful for timers in case of
non-working IRQ subsystem (switch to irq_domain for instance).

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 arch/arm/mach-at91/at91sam926x_time.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-at91/at91sam926x_time.c b/arch/arm/mach-at91/at91sam926x_time.c
index 8e5cc37..e4f7ba0 100644
--- a/arch/arm/mach-at91/at91sam926x_time.c
+++ b/arch/arm/mach-at91/at91sam926x_time.c
@@ -174,8 +174,10 @@ int __init of_at91sam926x_pit_init(void)
 
 	/* Get the interrupts property */
 	ret = irq_of_parse_and_map(np, 0);
-	if (!ret)
+	if (!ret) {
+		pr_crit("AT91: PIT: Unable to get IRQ from DT\n");
 		goto ioremap_err;
+	}
 	at91sam926x_pit_irq.irq = ret;
 
 	of_node_put(np);
@@ -203,6 +205,7 @@ static void __init at91sam926x_pit_init(void)
 {
 	unsigned long	pit_rate;
 	unsigned	bits;
+	int		ret;
 
 	/* For device tree enabled device: initialize here */
 	of_at91sam926x_pit_init();
@@ -227,7 +230,9 @@ static void __init at91sam926x_pit_init(void)
 	clocksource_register_hz(&pit_clk, pit_rate);
 
 	/* Set up irq handler */
-	setup_irq(at91sam926x_pit_irq.irq, &at91sam926x_pit_irq);
+	ret = setup_irq(at91sam926x_pit_irq.irq, &at91sam926x_pit_irq);
+	if (ret)
+		pr_crit("AT91: PIT: Unable to setup IRQ\n");
 
 	/* Set up and register clockevents */
 	pit_clkevt.mult = div_sc(pit_rate, NSEC_PER_SEC, pit_clkevt.shift);
-- 
1.7.9
