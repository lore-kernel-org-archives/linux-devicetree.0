From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 4/4] irq: imx: irqsteer: add multi output interrupts support
Date: Fri, 18 Jan 2019 07:53:58 +0000
Message-ID: <1547797668-30342-5-git-send-email-aisheng.dong@nxp.com>
References: <1547797668-30342-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547797668-30342-1-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

One irqsteer channel can support up to 8 output interrupts.

Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 39 +++++++++++++++++++++++++++-------=
----
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-i=
rqsteer.c
index 1bebf0a..54802fa 100644
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
@@ -117,7 +121,7 @@ static int imx_irqsteer_probe(struct platform_device *p=
dev)
 	struct device_node *np =3D pdev->dev.of_node;
 	struct irqsteer_data *data;
 	struct resource *res;
-	int ret;
+	int i, ret;
=20
 	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -130,12 +134,6 @@ static int imx_irqsteer_probe(struct platform_device *=
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
@@ -177,8 +175,23 @@ static int imx_irqsteer_probe(struct platform_device *=
pdev)
 		return -ENOMEM;
 	}
=20
-	irq_set_chained_handler_and_data(data->irq, imx_irqsteer_irq_handler,
-					 data);
+	data->irq_count =3D of_irq_count(np);
+	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
+		clk_disable_unprepare(data->ipg_clk);
+		return -EINVAL;
+	}
+
+	for (i =3D 0; i < data->irq_count; i++) {
+		data->irq[i] =3D irq_of_parse_and_map(np, i);
+		if (!data->irq[i]) {
+			clk_disable_unprepare(data->ipg_clk);
+			return -EINVAL;
+		}
+
+		irq_set_chained_handler_and_data(data->irq[i],
+						 imx_irqsteer_irq_handler,
+						 data);
+	}
=20
 	platform_set_drvdata(pdev, data);
=20
@@ -188,8 +201,12 @@ static int imx_irqsteer_probe(struct platform_device *=
pdev)
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
