From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 05/17] irqchip/irq-mvebu-icu: clarify the reset operation of
 configured interrupts
Date: Sat, 21 Apr 2018 15:55:25 +0200
Message-ID: <20180421135537.24716-6-miquel.raynal@bootlin.com>
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

Rewrite a small section to clarify the reset operation of interrupts
already configured by ATF that we want to handle in the driver. This
will simplify the introduction of System Error Interrupts support.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/irqchip/irq-mvebu-icu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mvebu-icu.c b/drivers/irqchip/irq-mvebu-icu.c
index 6a77b9ea8e41..5af2520445c4 100644
--- a/drivers/irqchip/irq-mvebu-icu.c
+++ b/drivers/irqchip/irq-mvebu-icu.c
@@ -198,8 +198,8 @@ static int mvebu_icu_probe(struct platform_device *pdev)
 	struct device_node *gicp_dn;
 	struct resource *res;
 	phys_addr_t setspi, clrspi;
-	u32 i, icu_int;
 	int ret;
+	u32 i;
 
 	icu = devm_kzalloc(&pdev->dev, sizeof(struct mvebu_icu),
 			   GFP_KERNEL);
@@ -257,8 +257,12 @@ static int mvebu_icu_probe(struct platform_device *pdev)
 	 * avoid unpredictable SPI assignments done by firmware.
 	 */
 	for (i = 0 ; i < ICU_MAX_IRQS ; i++) {
+		u32 icu_int, icu_grp;
+
 		icu_int = readl(icu->base + ICU_INT_CFG(i));
-		if ((icu_int >> ICU_GROUP_SHIFT) == ICU_GRP_NSR)
+		icu_grp = icu_int >> ICU_GROUP_SHIFT;
+
+		if (icu_grp == ICU_GRP_NSR)
 			writel_relaxed(0x0, icu->base + ICU_INT_CFG(i));
 	}
 
-- 
2.14.1
