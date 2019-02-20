From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH V4 4/4] irq: imx: irqsteer: add multi output interrupts
 support
Date: Wed, 20 Feb 2019 11:40:51 +0000
Message-ID: <1550662447-8565-5-git-send-email-aisheng.dong@nxp.com>
References: <1550662447-8565-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550662447-8565-1-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

One irqsteer channel can support up to 8 output interrupts.

Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v3->v4:
 * no changes
v2->v3:
 * add error check for imx_irqsteer_get_hwirq_base
 * use DIV_ROUND_UP
 * merge 'hwirq +=3D32' into for loop
 * common error path in probe to avoid replicating clk_disable_unprepare
v1->v2:
 * calculate irq_count by fsl,num-irqs instead of parsing interrupts
   property from devicetree to match the input interrupts and outputs
 * improve output interrupt handler by searching only two registers
   withint the same group
---
 drivers/irqchip/irq-imx-irqsteer.c | 88 +++++++++++++++++++++++++++++-----=
----
 1 file changed, 68 insertions(+), 20 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-i=
rqsteer.c
index 67ed862..d1098f4 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -10,6 +10,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/spinlock.h>
=20
@@ -21,10 +22,13 @@
 #define CHAN_MINTDIS(t)		(CTRL_STRIDE_OFF(t, 3) + 0x4)
 #define CHAN_MASTRSTAT(t)	(CTRL_STRIDE_OFF(t, 3) + 0x8)
=20
+#define CHAN_MAX_OUTPUT_INT	0x8
+
 struct irqsteer_data {
 	void __iomem		*regs;
 	struct clk		*ipg_clk;
-	int			irq;
+	int			irq[CHAN_MAX_OUTPUT_INT];
+	int			irq_count;
 	raw_spinlock_t		lock;
 	int			reg_num;
 	int			channel;
@@ -87,23 +91,47 @@ static const struct irq_domain_ops imx_irqsteer_domain_=
ops =3D {
 	.xlate		=3D irq_domain_xlate_onecell,
 };
=20
+static int imx_irqsteer_get_hwirq_base(struct irqsteer_data *data, u32 irq=
)
+{
+	int i;
+
+	for (i =3D 0; i < data->irq_count; i++) {
+		if (data->irq[i] =3D=3D irq)
+			return i * 64;
+	}
+
+	return -EINVAL;
+}
+
 static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 {
 	struct irqsteer_data *data =3D irq_desc_get_handler_data(desc);
-	int i;
+	int hwirq;
+	int irq, i;
=20
 	chained_irq_enter(irq_desc_get_chip(desc), desc);
=20
-	for (i =3D 0; i < data->reg_num * 32; i +=3D 32) {
-		int idx =3D imx_irqsteer_get_reg_index(data, i);
+	irq =3D irq_desc_get_irq(desc);
+	hwirq =3D imx_irqsteer_get_hwirq_base(data, irq);
+	if (hwirq < 0) {
+		pr_warn("%s: unable to get hwirq base for irq %d\n",
+			__func__, irq);
+		return;
+	}
+
+	for (i =3D 0; i < 2; i++, hwirq +=3D 32) {
+		int idx =3D imx_irqsteer_get_reg_index(data, hwirq);
 		unsigned long irqmap;
 		int pos, virq;
=20
+		if (hwirq >=3D data->reg_num * 32)
+			break;
+
 		irqmap =3D readl_relaxed(data->regs +
 				       CHANSTATUS(idx, data->reg_num));
=20
 		for_each_set_bit(pos, &irqmap, 32) {
-			virq =3D irq_find_mapping(data->domain, pos + i);
+			virq =3D irq_find_mapping(data->domain, pos + hwirq);
 			if (virq)
 				generic_handle_irq(virq);
 		}
@@ -117,7 +145,8 @@ static int imx_irqsteer_probe(struct platform_device *p=
dev)
 	struct device_node *np =3D pdev->dev.of_node;
 	struct irqsteer_data *data;
 	struct resource *res;
-	int ret;
+	u32 irqs_num;
+	int i, ret;
=20
 	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -130,12 +159,6 @@ static int imx_irqsteer_probe(struct platform_device *=
pdev)
 		return PTR_ERR(data->regs);
 	}
=20
-	data->irq =3D platform_get_irq(pdev, 0);
-	if (data->irq <=3D 0) {
-		dev_err(&pdev->dev, "failed to get irq\n");
-		return -ENODEV;
-	}
-
 	data->ipg_clk =3D devm_clk_get(&pdev->dev, "ipg");
 	if (IS_ERR(data->ipg_clk)) {
 		ret =3D PTR_ERR(data->ipg_clk);
@@ -146,11 +169,15 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
=20
 	raw_spin_lock_init(&data->lock);
=20
-	of_property_read_u32(np, "fsl,num-irqs", &data->reg_num);
+	of_property_read_u32(np, "fsl,num-irqs", &irqs_num);
 	of_property_read_u32(np, "fsl,channel", &data->channel);
=20
-	/* one register bit map represents 32 input interrupts */
-	data->reg_num /=3D 32;
+	/*
+	 * There is one output irq for each group of 64 inputs.
+	 * One register bit map can represent 32 input interrupts.
+	 */
+	data->irq_count =3D DIV_ROUND_UP(irqs_num, 64);
+	data->reg_num =3D irqs_num / 32;
=20
 	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
 		data->saved_reg =3D devm_kzalloc(&pdev->dev,
@@ -173,23 +200,44 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
 					     &imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
-		clk_disable_unprepare(data->ipg_clk);
-		return -ENOMEM;
+		ret =3D -ENOMEM;
+		goto out;
 	}
=20
-	irq_set_chained_handler_and_data(data->irq, imx_irqsteer_irq_handler,
-					 data);
+	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
+		ret =3D -EINVAL;
+		goto out;
+	}
+
+	for (i =3D 0; i < data->irq_count; i++) {
+		data->irq[i] =3D irq_of_parse_and_map(np, i);
+		if (!data->irq[i]) {
+			ret =3D -EINVAL;
+			goto out;
+		}
+
+		irq_set_chained_handler_and_data(data->irq[i],
+						 imx_irqsteer_irq_handler,
+						 data);
+	}
=20
 	platform_set_drvdata(pdev, data);
=20
 	return 0;
+out:
+	clk_disable_unprepare(data->ipg_clk);
+	return ret;
 }
=20
 static int imx_irqsteer_remove(struct platform_device *pdev)
 {
 	struct irqsteer_data *irqsteer_data =3D platform_get_drvdata(pdev);
+	int i;
+
+	for (i =3D 0; i < irqsteer_data->irq_count; i++)
+		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
+						 NULL, NULL);
=20
-	irq_set_chained_handler_and_data(irqsteer_data->irq, NULL, NULL);
 	irq_domain_remove(irqsteer_data->domain);
=20
 	clk_disable_unprepare(irqsteer_data->ipg_clk);
--=20
2.7.4
