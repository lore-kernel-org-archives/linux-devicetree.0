From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 07/17] irqchip/irq-mvebu-icu: make irq_domain local
Date: Sat, 21 Apr 2018 15:55:27 +0200
Message-ID: <20180421135537.24716-8-miquel.raynal@bootlin.com>
References: <20180421135537.24716-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180421135537.24716-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Make the current MSI irq_domain local to ease the split between ICU
platform device code and NSR platform device code.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/irqchip/irq-mvebu-icu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-mvebu-icu.c b/drivers/irqchip/irq-mvebu-icu.c
index 580586240781..493c9625d48b 100644
--- a/drivers/irqchip/irq-mvebu-icu.c
+++ b/drivers/irqchip/irq-mvebu-icu.c
@@ -43,7 +43,6 @@
 struct mvebu_icu {
 	struct irq_chip irq_chip;
 	struct regmap *regmap;
-	struct irq_domain *domain;
 	struct device *dev;
 };
 
@@ -198,6 +197,7 @@ static int mvebu_icu_probe(struct platform_device *pdev)
 	struct mvebu_icu *icu;
 	struct device_node *node = pdev->dev.of_node;
 	struct device_node *gicp_dn;
+	struct irq_domain *irq_domain;
 	struct resource *res;
 	phys_addr_t setspi, clrspi;
 	int ret;
@@ -269,11 +269,11 @@ static int mvebu_icu_probe(struct platform_device *pdev)
 			regmap_write(icu->regmap, ICU_INT_CFG(i), 0);
 	}
 
-	icu->domain =
+	irq_domain =
 		platform_msi_create_device_domain(&pdev->dev, ICU_MAX_IRQS,
 						  mvebu_icu_write_msg,
 						  &mvebu_icu_domain_ops, icu);
-	if (!icu->domain) {
+	if (!irq_domain) {
 		dev_err(&pdev->dev, "Failed to create ICU domain\n");
 		return -ENOMEM;
 	}
-- 
2.14.1
