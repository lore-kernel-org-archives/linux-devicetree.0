From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 7/9] ARM: at91: standard device init only if DT is not
 populated.
Date: Wed, 11 Apr 2012 18:01:17 +0200
Message-ID: <1334160079-30831-7-git-send-email-plagnioj@jcrosoft.com>
References: <20120411153515.GK16641@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120411153515.GK16641@game.jcrosoft.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

This will avoid the CONFIG_OF on the *_devices.c as this file is deprecated
for DT support.

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 arch/arm/mach-at91/at91sam9260_devices.c |   20 +++-----------------
 arch/arm/mach-at91/at91sam9g45_devices.c |   30 ++++--------------------------
 2 files changed, 7 insertions(+), 43 deletions(-)

diff --git a/arch/arm/mach-at91/at91sam9260_devices.c b/arch/arm/mach-at91/at91sam9260_devices.c
index ad00fe9..d556de1 100644
--- a/arch/arm/mach-at91/at91sam9260_devices.c
+++ b/arch/arm/mach-at91/at91sam9260_devices.c
@@ -702,25 +702,8 @@ static struct platform_device at91sam9260_tcb1_device = {
 	.num_resources	= ARRAY_SIZE(tcb1_resources),
 };
 
-#if defined(CONFIG_OF)
-static struct of_device_id tcb_ids[] = {
-	{ .compatible = "atmel,at91rm9200-tcb" },
-	{ /*sentinel*/ }
-};
-#endif
-
 static void __init at91_add_device_tc(void)
 {
-#if defined(CONFIG_OF)
-	struct device_node *np;
-
-	np = of_find_matching_node(NULL, tcb_ids);
-	if (np) {
-		of_node_put(np);
-		return;
-	}
-#endif
-
 	platform_device_register(&at91sam9260_tcb0_device);
 	platform_device_register(&at91sam9260_tcb1_device);
 }
@@ -1364,6 +1347,9 @@ void __init at91_add_device_cf(struct at91_cf_data * data) {}
  */
 static int __init at91_add_standard_devices(void)
 {
+	if (of_have_populated_dt())
+		return 0;
+
 	at91_add_device_rtt();
 	at91_add_device_watchdog();
 	at91_add_device_tc();
diff --git a/arch/arm/mach-at91/at91sam9g45_devices.c b/arch/arm/mach-at91/at91sam9g45_devices.c
index db2f88c2..35bd42d 100644
--- a/arch/arm/mach-at91/at91sam9g45_devices.c
+++ b/arch/arm/mach-at91/at91sam9g45_devices.c
@@ -69,15 +69,7 @@ static struct platform_device at_hdmac_device = {
 
 void __init at91_add_device_hdmac(void)
 {
-#if defined(CONFIG_OF)
-	struct device_node *of_node =
-		of_find_node_by_name(NULL, "dma-controller");
-
-	if (of_node)
-		of_node_put(of_node);
-	else
-#endif
-		platform_device_register(&at_hdmac_device);
+	platform_device_register(&at_hdmac_device);
 }
 #else
 void __init at91_add_device_hdmac(void) {}
@@ -1094,25 +1086,8 @@ static struct platform_device at91sam9g45_tcb1_device = {
 	.num_resources	= ARRAY_SIZE(tcb1_resources),
 };
 
-#if defined(CONFIG_OF)
-static struct of_device_id tcb_ids[] = {
-	{ .compatible = "atmel,at91rm9200-tcb" },
-	{ /*sentinel*/ }
-};
-#endif
-
 static void __init at91_add_device_tc(void)
 {
-#if defined(CONFIG_OF)
-	struct device_node *np;
-
-	np = of_find_matching_node(NULL, tcb_ids);
-	if (np) {
-		of_node_put(np);
-		return;
-	}
-#endif
-
 	platform_device_register(&at91sam9g45_tcb0_device);
 	platform_device_register(&at91sam9g45_tcb1_device);
 }
@@ -1763,6 +1738,9 @@ void __init at91_add_device_serial(void) {}
  */
 static int __init at91_add_standard_devices(void)
 {
+	if (of_have_populated_dt())
+		return 0;
+
 	at91_add_device_hdmac();
 	at91_add_device_rtc();
 	at91_add_device_rtt();
-- 
1.7.9.1
