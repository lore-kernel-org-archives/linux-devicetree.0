From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 07/20] irqchip/mmp: add missing chained_irq_{enter,exit}()
Date: Thu, 22 Aug 2019 11:26:30 +0200
Message-ID: <20190822092643.593488-8-lkundrak@v3.sk>
References: <20190822092643.593488-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822092643.593488-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

The lack of chained_irq_exit() leaves the muxed interrupt masked on MMP3.
For reasons unknown this is not a problem on MMP2.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- Use irq_desc_get_chip() instead of irq_get_chip()

 drivers/irqchip/irq-mmp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mmp.c b/drivers/irqchip/irq-mmp.c
index e41e47ab71d3b..126ffdbffdddf 100644
--- a/drivers/irqchip/irq-mmp.c
+++ b/drivers/irqchip/irq-mmp.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
@@ -132,11 +133,14 @@ struct irq_chip icu_irq_chip =3D {
 static void icu_mux_irq_demux(struct irq_desc *desc)
 {
 	unsigned int irq =3D irq_desc_get_irq(desc);
+	struct irq_chip *chip =3D irq_desc_get_chip(desc);
 	struct irq_domain *domain;
 	struct icu_chip_data *data;
 	int i;
 	unsigned long mask, status, n;
=20
+	chained_irq_enter(chip, desc);
+
 	for (i =3D 1; i < max_icu_nr; i++) {
 		if (irq =3D=3D icu_data[i].cascade_irq) {
 			domain =3D icu_data[i].domain;
@@ -146,7 +150,7 @@ static void icu_mux_irq_demux(struct irq_desc *desc)
 	}
 	if (i >=3D max_icu_nr) {
 		pr_err("Spurious irq %d in MMP INTC\n", irq);
-		return;
+		goto out;
 	}
=20
 	mask =3D readl_relaxed(data->reg_mask);
@@ -158,6 +162,9 @@ static void icu_mux_irq_demux(struct irq_desc *desc)
 			generic_handle_irq(icu_data[i].virq_base + n);
 		}
 	}
+
+out:
+	chained_irq_exit(chip, desc);
 }
=20
 static int mmp_irq_domain_map(struct irq_domain *d, unsigned int irq,
--=20
2.21.0
