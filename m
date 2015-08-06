From: Alexander Couzens <lynxis@fe80.eu>
Subject: [PATCH 1/2] MIPS: ath79: set irq ACK handler for ar7100-misc-intc irq chip
Date: Thu,  6 Aug 2015 12:43:24 +0200
Message-ID: <1438857805-18443-1-git-send-email-lynxis@fe80.eu>
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Alban Bedel <albeu@free.fr>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 arch/mips/ath79/irq.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/mips/ath79/irq.c b/arch/mips/ath79/irq.c
index afb0096..dc76fa1 100644
--- a/arch/mips/ath79/irq.c
+++ b/arch/mips/ath79/irq.c
@@ -303,13 +303,20 @@ static int __init ath79_misc_intc_of_init(
 	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_ENABLE);
 	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_STATUS);
 
-
 	irq_set_chained_handler(irq, ath79_misc_irq_handler);
 
 	return 0;
 }
-IRQCHIP_DECLARE(ath79_misc_intc, "qca,ar7100-misc-intc",
-		ath79_misc_intc_of_init);
+
+static int __init ar7100_misc_intc_of_init(
+	struct device_node *node, struct device_node *parent)
+{
+	ath79_misc_irq_chip.irq_mask_ack = ar71xx_misc_irq_mask;
+	return ath79_misc_intc_of_init(node, parent);
+}
+
+IRQCHIP_DECLARE(ar7100_misc_intc, "qca,ar7100-misc-intc",
+		ar7100_misc_intc_of_init);
 
 static int __init ar79_cpu_intc_of_init(
 	struct device_node *node, struct device_node *parent)
-- 
2.4.0
