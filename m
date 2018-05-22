From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 04/16] irqchip/irq-mvebu-icu: clarify the reset operation of configured interrupts
Date: Tue, 22 May 2018 11:40:30 +0200
Message-ID: <20180522094042.24770-5-miquel.raynal@bootlin.com>
References: <20180522094042.24770-1-miquel.raynal@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180522094042.24770-1-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Haim Boot <hayim@marvell.com>, Hanna Hawa <hannah@marvell.com>, linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Rewrite a small section to clarify the reset operation of interrupts
already configured by ATF that we want to handle in the driver. This
will simplify the introduction of System Error Interrupts support.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 drivers/irqchip/irq-mvebu-icu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mvebu-icu.c b/drivers/irqchip/irq-mvebu-icu.c
index a2a3acd74491..0f2655d7f19e 100644
--- a/drivers/irqchip/irq-mvebu-icu.c
+++ b/drivers/irqchip/irq-mvebu-icu.c
@@ -258,8 +258,12 @@ static int mvebu_icu_probe(struct platform_device *pdev)
 	 * avoid unpredictable SPI assignments done by firmware.
 	 */
 	for (i = 0 ; i < ICU_MAX_IRQS ; i++) {
-		u32 icu_int = readl_relaxed(icu->base + ICU_INT_CFG(i));
-		if ((icu_int >> ICU_GROUP_SHIFT) == ICU_GRP_NSR)
+		u32 icu_int, icu_grp;
+
+		icu_int = readl_relaxed(icu->base + ICU_INT_CFG(i));
+		icu_grp = icu_int >> ICU_GROUP_SHIFT;
+
+		if (icu_grp == ICU_GRP_NSR)
 			writel_relaxed(0x0, icu->base + ICU_INT_CFG(i));
 	}
 
-- 
2.14.1
