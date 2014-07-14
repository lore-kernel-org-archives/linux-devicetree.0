From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH] irqchip: gic: Add binding probe for ARM GIC400
Date: Tue, 15 Jul 2014 00:03:03 +0200
Message-ID: <2621565.f5eISveXXJ@diego>
References: <1404947104-21345-1-git-send-email-suravee.suthikulpanit@amd.com> <1404947104-21345-2-git-send-email-suravee.suthikulpanit@amd.com> <2932284.F1eaAf8ArJ@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <2932284.F1eaAf8ArJ@diego>
Sender: linux-doc-owner@vger.kernel.org
To: suravee.suthikulpanit@amd.com, jason@lakedaemon.net
Cc: linux-arm-kernel@lists.infradead.org, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, linux-doc@vger.kernel.org, Catalin.Marinas@arm.com, Harish.Kasiviswanathan@amd.com, linux-kernel@vger.kernel.org, Will.Deacon@arm.com, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, linux-pci@vger.kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>

Commit 3ab72f9156bb "dt-bindings: add GIC-400 binding" added the
"arm,gic-400" compatible string, but the corresponding IRQCHIP_DECLARE
was never added to the gic driver.

Therefore add the missing irqchip declaration for it.

Signed-off-by: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>

Removed additional empty line and adapted commit message to mark it
as fixing an issue.
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
As I really need this, I took the liberty of adapting the patch accordingly
to make it apply on top of the current irqchip/for-next (or urgent) and
explicitly state the fixed issue. Hope that is ok

 drivers/irqchip/irq-gic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 9d26643..6ff28b4 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1020,6 +1020,7 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 	gic_cnt++;
 	return 0;
 }
+IRQCHIP_DECLARE(gic_400, "arm,gic-400", gic_of_init);
 IRQCHIP_DECLARE(cortex_a15_gic, "arm,cortex-a15-gic", gic_of_init);
 IRQCHIP_DECLARE(cortex_a9_gic, "arm,cortex-a9-gic", gic_of_init);
 IRQCHIP_DECLARE(cortex_a7_gic, "arm,cortex-a7-gic", gic_of_init);
-- 
1.9.0


