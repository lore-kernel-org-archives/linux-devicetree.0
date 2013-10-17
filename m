From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [Patch v2][ 06/37] video: backlight: gpio-backlight: Add DT support.
Date: Thu, 17 Oct 2013 17:02:04 +0200
Message-ID: <1382022155-21954-7-git-send-email-denis@eukrea.com>
References: <1382022155-21954-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382022155-21954-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/video/backlight/gpio-backlight.txt    |   18 +++++
 drivers/video/backlight/gpio_backlight.c           |   73 ++++++++++++=
++++++--
 2 files changed, 84 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/video/backlight/g=
pio-backlight.txt

diff --git a/Documentation/devicetree/bindings/video/backlight/gpio-bac=
klight.txt b/Documentation/devicetree/bindings/video/backlight/gpio-bac=
klight.txt
new file mode 100644
index 0000000..362dd40
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/backlight/gpio-backlight.=
txt
@@ -0,0 +1,18 @@
+gpio-backlight bindings
+
+Required properties:
+  - compatible: "gpio-backlight"
+  - gpios: describes the gpio that is used for enabling/disabling the =
backlight
+     (see GPIO binding[0] for more details).
+  - default-brightness-level: the default brightness level (can be 0(o=
ff) or
+      1(on) since GPIOs only support theses levels).
+
+[0]: Documentation/devicetree/bindings/gpio/gpio.txt
+
+Example:
+
+	backlight {
+		compatible =3D "gpio-backlight";
+		gpios =3D <&gpio3 4 0>;
+		default-brightness-level =3D <1>;
+	};
diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/b=
acklight/gpio_backlight.c
index 81fb127..f5d31e7 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -13,6 +13,8 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
 #include <linux/platform_data/gpio_backlight.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -23,6 +25,7 @@ struct gpio_backlight {
=20
 	int gpio;
 	int active;
+	int def_value;
 };
=20
 static int gpio_backlight_update_status(struct backlight_device *bl)
@@ -60,6 +63,43 @@ static const struct backlight_ops gpio_backlight_ops=
 =3D {
 	.check_fb	=3D gpio_backlight_check_fb,
 };
=20
+static int gpio_backlight_probe_dt(struct platform_device *pdev,
+				   struct gpio_backlight *gbl)
+{
+	struct device_node *np =3D pdev->dev.of_node;
+	enum of_gpio_flags gpio_flags;
+	int ret;
+
+	gbl->fbdev =3D NULL;
+	gbl->gpio =3D of_get_gpio_flags(np, 0, &gpio_flags);
+
+	gbl->active =3D (gpio_flags & OF_GPIO_ACTIVE_LOW) ? 0 : 1;
+
+	if (gbl->gpio =3D=3D -EPROBE_DEFER) {
+		return ERR_PTR(-EPROBE_DEFER);
+	} else if (gbl->gpio < 0) {
+		dev_err(&pdev->dev, "Error: gpios is a required parameter.\n");
+		return gbl->gpio;
+	}
+
+	ret =3D of_property_read_u32(np, "default-brightness-level",
+				   &gbl->def_value);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Error: default-brightness-level "
+			"is a required parameter.\n");
+		return ret;
+	}
+
+	if (gbl->def_value < 0 || gbl->def_value > 1) {
+		dev_err(&pdev->dev, "Error: Invalid "
+			"default-brightness-level value. Its value can be "
+			"either 0(off) or 1(on).\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int gpio_backlight_probe(struct platform_device *pdev)
 {
 	struct gpio_backlight_platform_data *pdata =3D
@@ -67,10 +107,12 @@ static int gpio_backlight_probe(struct platform_de=
vice *pdev)
 	struct backlight_properties props;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
+	struct device_node *np =3D pdev->dev.of_node;
 	int ret;
=20
-	if (!pdata) {
-		dev_err(&pdev->dev, "failed to find platform data\n");
+	if (!pdata && !np) {
+		dev_err(&pdev->dev, "failed to find platform data or device "
+			"tree node.\n");
 		return -ENODEV;
 	}
=20
@@ -79,14 +121,21 @@ static int gpio_backlight_probe(struct platform_de=
vice *pdev)
 		return -ENOMEM;
=20
 	gbl->dev =3D &pdev->dev;
-	gbl->fbdev =3D pdata->fbdev;
-	gbl->gpio =3D pdata->gpio;
-	gbl->active =3D pdata->active_low ? 0 : 1;
+
+	if (np) {
+		ret =3D gpio_backlight_probe_dt(pdev, gbl);
+		if (ret)
+			return ret;
+	} else {
+		gbl->fbdev =3D pdata->fbdev;
+		gbl->gpio =3D pdata->gpio;
+		gbl->active =3D pdata->active_low ? 0 : 1;
+	}
=20
 	ret =3D devm_gpio_request_one(gbl->dev, gbl->gpio, GPIOF_DIR_OUT |
 				    (gbl->active ? GPIOF_INIT_LOW
 						 : GPIOF_INIT_HIGH),
-				    pdata->name);
+				    pdata ? pdata->name : "backlight");
 	if (ret < 0) {
 		dev_err(&pdev->dev, "unable to request GPIO\n");
 		return ret;
@@ -103,17 +152,27 @@ static int gpio_backlight_probe(struct platform_d=
evice *pdev)
 		return PTR_ERR(bl);
 	}
=20
-	bl->props.brightness =3D pdata->def_value;
+	if (np)
+		bl->props.brightness =3D gbl->def_value;
+	else
+		bl->props.brightness =3D pdata->def_value;
+
 	backlight_update_status(bl);
=20
 	platform_set_drvdata(pdev, bl);
 	return 0;
 }
=20
+static struct of_device_id gpio_backlight_of_match[] =3D {
+	{ .compatible =3D "gpio-backlight" },
+	{ /* sentinel */ }
+};
+
 static struct platform_driver gpio_backlight_driver =3D {
 	.driver		=3D {
 		.name		=3D "gpio-backlight",
 		.owner		=3D THIS_MODULE,
+		.of_match_table =3D of_match_ptr(gpio_backlight_of_match),
 	},
 	.probe		=3D gpio_backlight_probe,
 };
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
