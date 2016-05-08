From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [PATCH v8 2/3] gpio: mmio: add DT support for memory-mapped GPIOs
Date: Sun,  8 May 2016 15:08:23 +0200
Message-ID: <535f785bf6116c0fb6f46afbb77e6d4bd3ef5f60.1462543458.git.chunkeey@googlemail.com>
References: <cover.1462543457.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1462543457.git.chunkeey@googlemail.com>
In-Reply-To: <cover.1462543457.git.chunkeey@googlemail.com>
References: <cover.1462543457.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Christian Lamparter <chunkeey@googlemail.com>
List-Id: devicetree@vger.kernel.org

=46rom: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>

This patch adds support for defining memory-mapped GPIOs which
are compatible with the existing gpio-mmio interface. The generic
library provides support for many memory-mapped GPIO controllers
that are found in various on-board FPGA and ASIC solutions that
are used to control board's switches, LEDs, chip-selects,
Ethernet/USB PHY power, etc.

=46or setting GPIO's there are three configurations:
	1. single input/output register resource (named "dat"),
	2. set/clear pair (named "set" and "clr"),
	3. single output register resource and single input resource
	   ("set" and dat").

The configuration is detected by which resources are present.
=46or the single output register, this drives a 1 by setting a bit
and a zero by clearing a bit.  For the set clr pair, this drives
a 1 by setting a bit in the set register and clears it by setting
a bit in the clear register. The configuration is detected by
which resources are present.

=46or setting the GPIO direction, there are three configurations:
	a. simple bidirectional GPIOs that requires no configuration.
	b. an output direction register (named "dirout")
	   where a 1 bit indicates the GPIO is an output.
	c. an input direction register (named "dirin")
	   where a 1 bit indicates the GPIO is an input.

The first user for this binding is "wd,mbl-gpio".

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/gpio/gpio-mmio.c | 76 ++++++++++++++++++++++++++++++++++++++++=
++++++--
 1 file changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 6c1cb3b..4b7b74c 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -61,6 +61,8 @@ o        `                     ~~~~\___/~~~~    ` con=
troller in FPGA is ,.`
 #include <linux/bitops.h>
 #include <linux/platform_device.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
=20
 static void bgpio_write8(void __iomem *reg, unsigned long data)
 {
@@ -569,6 +571,66 @@ static void __iomem *bgpio_map(struct platform_dev=
ice *pdev,
 	return devm_ioremap_resource(&pdev->dev, r);
 }
=20
+#ifdef CONFIG_OF
+static int bgpio_basic_mmio_parse_dt(struct platform_device *pdev,
+				     struct bgpio_pdata *pdata,
+				     unsigned long *flags)
+{
+	struct device *dev =3D &pdev->dev;
+	int err;
+
+	pdata->base =3D -1;
+
+	if (of_property_read_bool(dev->of_node, "no-output"))
+		*flags |=3D BGPIOF_NO_OUTPUT;
+
+	return 0;
+}
+
+#define ADD(_name, _func) { .compatible =3D _name, .data =3D _func }
+
+static const struct of_device_id bgpio_of_match[] =3D {
+	ADD("wd,mbl-gpio", bgpio_basic_mmio_parse_dt),
+	{ }
+};
+#undef ADD
+MODULE_DEVICE_TABLE(of, bgpio_of_match);
+
+static struct bgpio_pdata *bgpio_parse_dt(struct platform_device *pdev=
,
+					  unsigned long *flags)
+{
+	const int (*parse_dt)(struct platform_device *,
+			      struct bgpio_pdata *, unsigned long *);
+	const struct device_node *node =3D pdev->dev.of_node;
+	const struct of_device_id *of_id;
+	struct bgpio_pdata *pdata;
+	int err =3D -ENODEV;
+
+	of_id =3D of_match_node(bgpio_of_match, node);
+	if (!of_id)
+		return NULL;
+
+	pdata =3D devm_kzalloc(&pdev->dev, sizeof(struct bgpio_pdata),
+			     GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	parse_dt =3D (const void *)of_id->data;
+	if (parse_dt)
+		err =3D parse_dt(pdev, pdata, flags);
+	if (err)
+		return ERR_PTR(err);
+
+	return pdata;
+}
+#else
+static struct bgpio_pdata *bgpio_parse_dt(struct platform_device *pdev=
,
+					  unsigned long *flags)
+{
+	return NULL;
+}
+#endif /* CONFIG_OF */
+
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -579,10 +641,19 @@ static int bgpio_pdev_probe(struct platform_devic=
e *pdev)
 	void __iomem *dirout;
 	void __iomem *dirin;
 	unsigned long sz;
-	unsigned long flags =3D pdev->id_entry->driver_data;
+	unsigned long flags =3D 0;
 	int err;
 	struct gpio_chip *gc;
-	struct bgpio_pdata *pdata =3D dev_get_platdata(dev);
+	struct bgpio_pdata *pdata;
+
+	pdata =3D bgpio_parse_dt(pdev, &flags);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+
+	if (!pdata) {
+		pdata =3D dev_get_platdata(dev);
+		flags =3D pdev->id_entry->driver_data;
+	}
=20
 	r =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
 	if (!r)
@@ -646,6 +717,7 @@ MODULE_DEVICE_TABLE(platform, bgpio_id_table);
 static struct platform_driver bgpio_driver =3D {
 	.driver =3D {
 		.name =3D "basic-mmio-gpio",
+		.of_match_table =3D of_match_ptr(bgpio_of_match),
 	},
 	.id_table =3D bgpio_id_table,
 	.probe =3D bgpio_pdev_probe,
--=20
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
