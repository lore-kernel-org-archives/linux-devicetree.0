From: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v7 2/3] gpio: mmio: add DT support for memory-mapped GPIOs
Date: Fri,  6 May 2016 13:10:20 +0200
Message-ID: <50f7f506364f84effd5224677b21726fd2e511a4.1462372360.git.chunkeey@googlemail.com>
References: <cover.1462372360.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1462372360.git.chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <cover.1462372360.git.chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
References: <cover.1462372360.git.chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=46rom: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

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

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/gpio/gpio-mmio.c | 99 ++++++++++++++++++++++++++++++++++++++++=
+++++++-
 1 file changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 6c1cb3b..1cfb70a 100644
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
@@ -569,6 +571,89 @@ static void __iomem *bgpio_map(struct platform_dev=
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
+	/* If ngpio property is not specified, of_property_read_u32
+	 * will return -EINVAL. In this case the number of GPIOs is
+	 * automatically determined by the register width. Any
+	 * other error of of_property_read_u32 is due bad data and
+	 * needs to be dealt with.
+	 */
+	err =3D of_property_read_u32(dev->of_node, "ngpio", &pdata->ngpio);
+	if (err && err !=3D -EINVAL)
+		return err;
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
+	return 0;
+}
+
+#define ADD_GPIO_OF(_name, _func) { .compatible =3D _name, .data =3D _=
func }
+
+static const struct of_device_id bgpio_of_match[] =3D {
+	ADD_GPIO_OF("wd,mbl-gpio", bgpio_basic_mmio_parse_dt),
+	{ }
+};
+#undef ADD_GPIO_OF
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
@@ -579,10 +664,19 @@ static int bgpio_pdev_probe(struct platform_devic=
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
@@ -646,6 +740,7 @@ MODULE_DEVICE_TABLE(platform, bgpio_id_table);
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
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
