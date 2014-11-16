From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V2 02/22] irqchip: brcmstb-l2: fix error handling of irq_of_parse_and_map
Date: Sat, 15 Nov 2014 16:17:26 -0800
Message-ID: <1416097066-20452-3-git-send-email-cernekee@gmail.com>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
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
Cc: f.fainelli@gmail.com, jfraser@broadcom.com, dtor@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Dmitry Torokhov <dtor@chromium.org>

Return value of irq_of_parse_and_map() is unsigned int, with 0
indicating failure, so testing for negative result never works.

Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Kevin Cernekee <cernekee@gmail.com>
---
 drivers/irqchip/irq-brcmstb-l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l2.c
index 4aa653a..313c2c6 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -139,9 +139,9 @@ int __init brcmstb_l2_intc_of_init(struct device_node *np,
 	writel(0xffffffff, data->base + CPU_CLEAR);
 
 	data->parent_irq = irq_of_parse_and_map(np, 0);
-	if (data->parent_irq < 0) {
+	if (!data->parent_irq) {
 		pr_err("failed to find parent interrupt\n");
-		ret = data->parent_irq;
+		ret = -EINVAL;
 		goto out_unmap;
 	}
 
-- 
2.1.1
