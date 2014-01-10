From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv9 1/2] video: backlight: gpio-backlight: Add DT support.
Date: Fri, 10 Jan 2014 16:07:23 +0100
Message-ID: <1389366444-29449-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
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
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
ChangeLog v8->v9:
- Added Shawn Guo in the Cc list.
- The default-brightness-level is now a boolean default-on property,
  the gpio is only touched if the gpio-backlight driver instance probes=
=2E
- The code and documentation was updated accordingly.

ChangeLog v7->v8:
- The default-state was renamed to default-brightness-level.
- default-brightness-level is now mandatory, like for backlight-pwm,
  That way we avoid having to handle the case where it's not set,
  which means that we would need not to set the gpio, but still
  report a brightness value for sysfs, when not all gpio controllers ar=
e
  able to read the gpio value.
- switched the default-brightness-level to boolean values (0 or 1) inst=
ead
  of using strings ("on", "off", "keep").
- The documentation was updated accordingly.
- The example in the documentation now uses the dts gpio defines.
- The "backlight: gpio_backlight: Use a default state enum." patch was =
then
  dropped, becuase it is not necessary anymore.

ChangeLog v6->v7:
- removed a compilation warning with the removal of the useless ret dec=
laration.

ChangeLog v5->v6:
- The default state handling was reworked:
  - it's now called default-state, and looks like the gpio-leds default=
-state.
  - it now has a "keep" option, like for the gpio-leds.
  - that "keep" option is the default when the default-state property i=
s not set.
- The documentation was updated accordingly.

ChangeLog v4->v5:
- The default-brightness property now defaults to 0 in the driver.
- def_value int becomes a bool.
- The check for the gpio validity has been reworked.
---
 .../bindings/video/backlight/gpio-backlight.txt    |   19 +++++++
 drivers/video/backlight/gpio_backlight.c           |   60 ++++++++++++=
+++++---
 2 files changed, 72 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/video/backlight/g=
pio-backlight.txt

diff --git a/Documentation/devicetree/bindings/video/backlight/gpio-bac=
klight.txt b/Documentation/devicetree/bindings/video/backlight/gpio-bac=
klight.txt
new file mode 100644
index 0000000..a923193
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/backlight/gpio-backlight.=
txt
@@ -0,0 +1,19 @@
+gpio-backlight bindings
+
+Required properties:
+  - compatible: "gpio-backlight"
+  - gpios: describes the gpio that is used for enabling/disabling the =
backlight
+    (see GPIO binding[0] for more details).
+
+Optional properties:
+  - default-on: enable the backlight at boot.
+
+[0]: Documentation/devicetree/bindings/gpio/gpio.txt
+
+Example:
+
+	backlight {
+		compatible =3D "gpio-backlight";
+		gpios =3D <&gpio3 4 GPIO_ACTIVE_HIGH>;
+		default-on;
+	};
diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/b=
acklight/gpio_backlight.c
index 81fb127..05f84f1 100644
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
@@ -60,6 +63,33 @@ static const struct backlight_ops gpio_backlight_ops=
 =3D {
 	.check_fb	=3D gpio_backlight_check_fb,
 };
=20
+static int gpio_backlight_probe_dt(struct platform_device *pdev,
+				   struct gpio_backlight *gbl)
+{
+	struct device_node *np =3D pdev->dev.of_node;
+	enum of_gpio_flags gpio_flags;
+	bool default_on =3D false;
+
+	gbl->fbdev =3D NULL;
+	gbl->gpio =3D of_get_gpio_flags(np, 0, &gpio_flags);
+
+	if (!gpio_is_valid(gbl->gpio)) {
+		if (gbl->gpio !=3D -EPROBE_DEFER) {
+			dev_err(&pdev->dev,
+				"Error: The gpios parameter is missing or invalid.\n");
+		}
+		return gbl->gpio;
+	}
+
+	gbl->active =3D (gpio_flags & OF_GPIO_ACTIVE_LOW) ? 0 : 1;
+
+	default_on =3D of_property_read_bool(np, "default-on");
+
+	gbl->def_value =3D default_on;
+
+	return 0;
+}
+
 static int gpio_backlight_probe(struct platform_device *pdev)
 {
 	struct gpio_backlight_platform_data *pdata =3D
@@ -67,10 +97,12 @@ static int gpio_backlight_probe(struct platform_dev=
ice *pdev)
 	struct backlight_properties props;
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
+	struct device_node *np =3D pdev->dev.of_node;
 	int ret;
=20
-	if (!pdata) {
-		dev_err(&pdev->dev, "failed to find platform data\n");
+	if (!pdata && !np) {
+		dev_err(&pdev->dev,
+			"failed to find platform data or device tree node.\n");
 		return -ENODEV;
 	}
=20
@@ -79,14 +111,22 @@ static int gpio_backlight_probe(struct platform_de=
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
+		gbl->def_value =3D pdata->def_value;
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
@@ -103,17 +143,23 @@ static int gpio_backlight_probe(struct platform_d=
evice *pdev)
 		return PTR_ERR(bl);
 	}
=20
-	bl->props.brightness =3D pdata->def_value;
+	bl->props.brightness =3D gbl->def_value;
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
