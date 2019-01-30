From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH V2 3/4] irq: imx-irqsteer: change to use reg_num instead of
 irq_group
Date: Wed, 30 Jan 2019 13:06:03 +0000
Message-ID: <1548853196-11447-4-git-send-email-aisheng.dong@nxp.com>
References: <1548853196-11447-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548853196-11447-1-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

One group can manage 64 interrupts by using two registers (e.g. STATUS/SET)=
.
However, the integrated irqsteer may support only 32 interrupts which
needs only one register in a group. But the current driver assume there's
a mininum of two registers in a group which result in a wrong register map
for 32 interrupts per channel irqsteer. Let's use the reg_num caculated by
interrupts per channel instead of irq_group to cover this case.

Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
v1->v2:
 * The using of property name updated accordingly
---
 drivers/irqchip/irq-imx-irqsteer.c | 35 +++++++++++++++++++---------------=
-
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-i=
rqsteer.c
index 5b3f1d7..67ed862 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -13,7 +13,7 @@
 #include <linux/of_platform.h>
 #include <linux/spinlock.h>
=20
-#define CTRL_STRIDE_OFF(_t, _r)	(_t * 8 * _r)
+#define CTRL_STRIDE_OFF(_t, _r)	(_t * 4 * _r)
 #define CHANCTRL		0x0
 #define CHANMASK(n, t)		(CTRL_STRIDE_OFF(t, 0) + 0x4 * (n) + 0x4)
 #define CHANSET(n, t)		(CTRL_STRIDE_OFF(t, 1) + 0x4 * (n) + 0x4)
@@ -26,7 +26,7 @@ struct irqsteer_data {
 	struct clk		*ipg_clk;
 	int			irq;
 	raw_spinlock_t		lock;
-	int			irq_groups;
+	int			reg_num;
 	int			channel;
 	struct irq_domain	*domain;
 	u32			*saved_reg;
@@ -35,7 +35,7 @@ struct irqsteer_data {
 static int imx_irqsteer_get_reg_index(struct irqsteer_data *data,
 				      unsigned long irqnum)
 {
-	return (data->irq_groups * 2 - irqnum / 32 - 1);
+	return (data->reg_num - irqnum / 32 - 1);
 }
=20
 static void imx_irqsteer_irq_unmask(struct irq_data *d)
@@ -46,9 +46,9 @@ static void imx_irqsteer_irq_unmask(struct irq_data *d)
 	u32 val;
=20
 	raw_spin_lock_irqsave(&data->lock, flags);
-	val =3D readl_relaxed(data->regs + CHANMASK(idx, data->irq_groups));
+	val =3D readl_relaxed(data->regs + CHANMASK(idx, data->reg_num));
 	val |=3D BIT(d->hwirq % 32);
-	writel_relaxed(val, data->regs + CHANMASK(idx, data->irq_groups));
+	writel_relaxed(val, data->regs + CHANMASK(idx, data->reg_num));
 	raw_spin_unlock_irqrestore(&data->lock, flags);
 }
=20
@@ -60,9 +60,9 @@ static void imx_irqsteer_irq_mask(struct irq_data *d)
 	u32 val;
=20
 	raw_spin_lock_irqsave(&data->lock, flags);
-	val =3D readl_relaxed(data->regs + CHANMASK(idx, data->irq_groups));
+	val =3D readl_relaxed(data->regs + CHANMASK(idx, data->reg_num));
 	val &=3D ~BIT(d->hwirq % 32);
-	writel_relaxed(val, data->regs + CHANMASK(idx, data->irq_groups));
+	writel_relaxed(val, data->regs + CHANMASK(idx, data->reg_num));
 	raw_spin_unlock_irqrestore(&data->lock, flags);
 }
=20
@@ -94,13 +94,13 @@ static void imx_irqsteer_irq_handler(struct irq_desc *d=
esc)
=20
 	chained_irq_enter(irq_desc_get_chip(desc), desc);
=20
-	for (i =3D 0; i < data->irq_groups * 64; i +=3D 32) {
+	for (i =3D 0; i < data->reg_num * 32; i +=3D 32) {
 		int idx =3D imx_irqsteer_get_reg_index(data, i);
 		unsigned long irqmap;
 		int pos, virq;
=20
 		irqmap =3D readl_relaxed(data->regs +
-				       CHANSTATUS(idx, data->irq_groups));
+				       CHANSTATUS(idx, data->reg_num));
=20
 		for_each_set_bit(pos, &irqmap, 32) {
 			virq =3D irq_find_mapping(data->domain, pos + i);
@@ -146,12 +146,15 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
=20
 	raw_spin_lock_init(&data->lock);
=20
-	of_property_read_u32(np, "fsl,irq-groups", &data->irq_groups);
+	of_property_read_u32(np, "fsl,num-irqs", &data->reg_num);
 	of_property_read_u32(np, "fsl,channel", &data->channel);
=20
+	/* one register bit map represents 32 input interrupts */
+	data->reg_num /=3D 32;
+
 	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
 		data->saved_reg =3D devm_kzalloc(&pdev->dev,
-					sizeof(u32) * data->irq_groups * 2,
+					sizeof(u32) * data->reg_num,
 					GFP_KERNEL);
 		if (!data->saved_reg)
 			return -ENOMEM;
@@ -166,7 +169,7 @@ static int imx_irqsteer_probe(struct platform_device *p=
dev)
 	/* steer all IRQs into configured channel */
 	writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
=20
-	data->domain =3D irq_domain_add_linear(np, data->irq_groups * 64,
+	data->domain =3D irq_domain_add_linear(np, data->reg_num * 32,
 					     &imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
@@ -199,9 +202,9 @@ static void imx_irqsteer_save_regs(struct irqsteer_data=
 *data)
 {
 	int i;
=20
-	for (i =3D 0; i < data->irq_groups * 2; i++)
+	for (i =3D 0; i < data->reg_num; i++)
 		data->saved_reg[i] =3D readl_relaxed(data->regs +
-						CHANMASK(i, data->irq_groups));
+						CHANMASK(i, data->reg_num));
 }
=20
 static void imx_irqsteer_restore_regs(struct irqsteer_data *data)
@@ -209,9 +212,9 @@ static void imx_irqsteer_restore_regs(struct irqsteer_d=
ata *data)
 	int i;
=20
 	writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
-	for (i =3D 0; i < data->irq_groups * 2; i++)
+	for (i =3D 0; i < data->reg_num; i++)
 		writel_relaxed(data->saved_reg[i],
-			       data->regs + CHANMASK(i, data->irq_groups));
+			       data->regs + CHANMASK(i, data->reg_num));
 }
=20
 static int imx_irqsteer_suspend(struct device *dev)
--=20
2.7.4
