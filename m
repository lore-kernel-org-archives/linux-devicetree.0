From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [RFC v3.1 2/3] gpio: generic: add DT support for basic memory-mapped GPIOs
Date: Wed, 27 Apr 2016 01:03:28 +0200
Message-ID: <ad474a207787625ddc242cfc9124e0245a945c0d.1461710785.git.chunkeey@googlemail.com>
References: <ad474a207787625ddc242cfc9124e0245a945c0d.1461710784.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <ad474a207787625ddc242cfc9124e0245a945c0d.1461710784.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Christian Lamparter <chunkeey@googlemail.com>
List-Id: devicetree@vger.kernel.org

=46rom: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>

This patch adds support for defining basic memory-mapped
GPIOs within the device tree framework.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
fixed bgpio_>>P<<data typo.
---

 drivers/gpio/gpio-generic.c | 70 +++++++++++++++++++++++++++++++++++++=
++++++--
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index 54cddfa..f535299 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
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
@@ -569,6 +571,59 @@ static void __iomem *bgpio_map(struct platform_dev=
ice *pdev,
 	return devm_ioremap_resource(&pdev->dev, r);
 }
=20
+#ifdef CONFIG_OF
+static const struct of_device_id  bgpio_of_match[] =3D {
+	{ .compatible =3D "basic-mmio-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, bgpio_of_match);
+
+static struct bgpio_pdata *bgpio_parse_dt(struct device *dev,
+					  unsigned long *flags)
+{
+	struct bgpio_pdata *pdata;
+	int err;
+
+	if (!of_match_node(bgpio_of_match, dev->of_node))
+		return NULL;
+
+	pdata =3D devm_kzalloc(dev, sizeof(struct bgpio_pdata),
+			     GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	err =3D of_property_read_u32(dev->of_node, "ngpio", &pdata->ngpio);
+	if (err && err !=3D -EINVAL)
+		return ERR_PTR(err);
+
+	if (of_device_is_big_endian(dev->of_node))
+		*flags |=3D BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+
+	if (of_property_read_bool(dev->of_node, "unreadable-reg-set"))
+		*flags |=3D BGPIOF_UNREADABLE_REG_SET;
+
+	if (of_property_read_bool(dev->of_node, "unreadable-reg-dir"))
+		*flags |=3D BGPIOF_UNREADABLE_REG_DIR;
+
+	if (of_property_read_bool(dev->of_node, "big-endian-byte-order"))
+		*flags |=3D BGPIOF_BIG_ENDIAN;
+
+	if (of_property_read_bool(dev->of_node, "read-output-reg-set"))
+		*flags |=3D BGPIOF_READ_OUTPUT_REG_SET;
+
+	if (of_property_read_bool(dev->of_node, "no-output"))
+		*flags |=3D BGPIOF_NO_OUTPUT;
+
+	return pdata;
+}
+#else
+static struct bgpio_pdata *bgpio_parse_dt(struct device *dev,
+					  unsigned long *flags)
+{
+	return NULL;
+}
+#endif /* CONFIG_OF */
+
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -579,10 +634,18 @@ static int bgpio_pdev_probe(struct platform_devic=
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
+	pdata =3D bgpio_parse_dt(dev, &flags);
+	if (IS_ERR(pdata)) {
+		return PTR_ERR(pdata);
+	} else if (!pdata) {
+		pdata =3D dev_get_platdata(dev);
+		flags =3D pdev->id_entry->driver_data;
+	}
=20
 	r =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
 	if (!r)
@@ -646,6 +709,9 @@ MODULE_DEVICE_TABLE(platform, bgpio_id_table);
 static struct platform_driver bgpio_driver =3D {
 	.driver =3D {
 		.name =3D "basic-mmio-gpio",
+#ifdef CONFIG_OF
+		.of_match_table =3D of_match_ptr(bgpio_of_match),
+#endif
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
