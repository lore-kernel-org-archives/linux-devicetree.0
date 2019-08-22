From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 06/20] irqchip/mmp: do not use of_address_to_resource() to get mux regs
Date: Thu, 22 Aug 2019 11:26:29 +0200
Message-ID: <20190822092643.593488-7-lkundrak@v3.sk>
References: <20190822092643.593488-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822092643.593488-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Pavel Machek <pavel@ucw.cz>
List-Id: devicetree@vger.kernel.org

The "regs" property of the "mrvl,mmp2-mux-intc" devices are silly. They
are offsets from intc's base, not addresses on the parent bus. At this
point it probably can't be fixed.

On an OLPC XO-1.75 machine, the muxes are children of the intc, not the
axi bus, and thus of_address_to_resource() won't work. We should treat
the values as mere integers as opposed to bus addresses.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Pavel Machek <pavel@ucw.cz>

---
Changes since v4 of "MMP platform fixes" set:
- Add a comment, as suggested by Pavel

Changes since v1:
- Fix up typoes in the comment
- Do not allow the regs property be larger than the bindings document.

 drivers/irqchip/irq-mmp.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-mmp.c b/drivers/irqchip/irq-mmp.c
index 14618dc0bd396..e41e47ab71d3b 100644
--- a/drivers/irqchip/irq-mmp.c
+++ b/drivers/irqchip/irq-mmp.c
@@ -424,9 +424,9 @@ IRQCHIP_DECLARE(mmp2_intc, "mrvl,mmp2-intc", mmp2_of_=
init);
 static int __init mmp2_mux_of_init(struct device_node *node,
 				   struct device_node *parent)
 {
-	struct resource res;
 	int i, ret, irq, j =3D 0;
 	u32 nr_irqs, mfp_irq;
+	u32 reg[4];
=20
 	if (!parent)
 		return -ENODEV;
@@ -438,18 +438,22 @@ static int __init mmp2_mux_of_init(struct device_no=
de *node,
 		pr_err("Not found mrvl,intc-nr-irqs property\n");
 		return -EINVAL;
 	}
-	ret =3D of_address_to_resource(node, 0, &res);
+
+	/*
+	 * For historical reasons, the "regs" property of the
+	 * mrvl,mmp2-mux-intc is not a regular "regs" property containing
+	 * addresses on the parent bus, but offsets from the intc's base.
+	 * That is why we can't use of_address_to_resource() here.
+	 */
+	ret =3D of_property_read_variable_u32_array(node, "reg", reg,
+						  ARRAY_SIZE(reg),
+						  ARRAY_SIZE(reg));
 	if (ret < 0) {
 		pr_err("Not found reg property\n");
 		return -EINVAL;
 	}
-	icu_data[i].reg_status =3D mmp_icu_base + res.start;
-	ret =3D of_address_to_resource(node, 1, &res);
-	if (ret < 0) {
-		pr_err("Not found reg property\n");
-		return -EINVAL;
-	}
-	icu_data[i].reg_mask =3D mmp_icu_base + res.start;
+	icu_data[i].reg_status =3D mmp_icu_base + reg[0];
+	icu_data[i].reg_mask =3D mmp_icu_base + reg[2];
 	icu_data[i].cascade_irq =3D irq_of_parse_and_map(node, 0);
 	if (!icu_data[i].cascade_irq)
 		return -EINVAL;
--=20
2.21.0
