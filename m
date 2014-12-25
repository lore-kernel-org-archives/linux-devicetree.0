From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V6 01/25] MIPS: bcm3384: Fix outdated use of mips_cpu_intc_init()
Date: Thu, 25 Dec 2014 09:48:56 -0800
Message-ID: <1419529760-9520-2-git-send-email-cernekee@gmail.com>
References: <1419529760-9520-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1419529760-9520-1-git-send-email-cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: f.fainelli@gmail.com, jaedon.shin@gmail.com, abrestic@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, jogo@openwrt.org, arnd@arndb.de, computersforpeace@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This function was renamed to mips_cpu_irq_of_init(), so fix it to avoid
a compile error.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/bcm3384/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/bcm3384/irq.c b/arch/mips/bcm3384/irq.c
index 0fb5134..fd94fe8 100644
--- a/arch/mips/bcm3384/irq.c
+++ b/arch/mips/bcm3384/irq.c
@@ -180,7 +180,7 @@ static int __init intc_of_init(struct device_node *node,
 
 static struct of_device_id of_irq_ids[] __initdata = {
 	{ .compatible = "mti,cpu-interrupt-controller",
-	  .data = mips_cpu_intc_init },
+	  .data = mips_cpu_irq_of_init },
 	{ .compatible = "brcm,bcm3384-intc",
 	  .data = intc_of_init },
 	{},
-- 
2.1.1
