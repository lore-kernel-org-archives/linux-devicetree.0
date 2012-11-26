From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2] gpio: stmpe: Add DT support for stmpe gpio
Date: Mon, 26 Nov 2012 17:06:51 +0530
Message-ID: <1e773c8f35fed89f6eb6cc44f393fb76ba4ae3e2.1353929710.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, grant.likely@secretlab.ca
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, lee.jones@linaro.org, Vipul Kumar Samar <vipulkumar.samar@st.com>, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Vipul Kumar Samar <vipulkumar.samar@st.com>

This patch allows the STMPE GPIO driver to be successfully probed and
initialised when Device Tree support is enabled. Bindings are mentioned in
Documentation too.

Acked-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Vipul Kumar Samar <vipulkumar.samar@st.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V1->V2:
- Fixed norequest-mask as st,norequest-mask in Binding Documentation
- Added Acked-by from Lee Jones

 Documentation/devicetree/bindings/gpio/gpio-stmpe.txt | 18 +++++++++++++++=
+++
 drivers/gpio/gpio-stmpe.c                             | 10 ++++++++--
 drivers/mfd/stmpe.c                                   |  2 ++
 3 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-stmpe.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt b/Docume=
ntation/devicetree/bindings/gpio/gpio-stmpe.txt
new file mode 100644
index 0000000..a0e4cf8
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
@@ -0,0 +1,18 @@
+STMPE gpio
+----------
+
+Required properties:
+ - compatible: "st,stmpe-gpio"
+
+Optional properties:
+ - st,norequest-mask: bitmask specifying which GPIOs should _not_ be reque=
stable
+   due to different usage (e.g. touch, keypad)
+
+Node name must be stmpe_gpio and should be child node of stmpe node to whi=
ch it
+belongs.
+
+Example:
+=09stmpe_gpio {
+=09=09compatible =3D "st,stmpe-gpio";
+=09=09st,norequest-mask =3D <0x20>;=09//gpio 5 can't be used
+=09};
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index dce3472..522c90e 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -12,6 +12,7 @@
 #include <linux/gpio.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <linux/mfd/stmpe.h>
=20
 /*
@@ -304,6 +305,7 @@ static void stmpe_gpio_irq_remove(struct stmpe_gpio *st=
mpe_gpio)
 static int __devinit stmpe_gpio_probe(struct platform_device *pdev)
 {
 =09struct stmpe *stmpe =3D dev_get_drvdata(pdev->dev.parent);
+=09struct device_node *np =3D pdev->dev.of_node;
 =09struct stmpe_gpio_platform_data *pdata;
 =09struct stmpe_gpio *stmpe_gpio;
 =09int ret;
@@ -321,13 +323,17 @@ static int __devinit stmpe_gpio_probe(struct platform=
_device *pdev)
=20
 =09stmpe_gpio->dev =3D &pdev->dev;
 =09stmpe_gpio->stmpe =3D stmpe;
-=09stmpe_gpio->norequest_mask =3D pdata ? pdata->norequest_mask : 0;
-
 =09stmpe_gpio->chip =3D template_chip;
 =09stmpe_gpio->chip.ngpio =3D stmpe->num_gpios;
 =09stmpe_gpio->chip.dev =3D &pdev->dev;
 =09stmpe_gpio->chip.base =3D pdata ? pdata->gpio_base : -1;
=20
+=09if (pdata)
+=09=09stmpe_gpio->norequest_mask =3D pdata->norequest_mask;
+=09else if (np)
+=09=09of_property_read_u32(np, "st,norequest-mask",
+=09=09=09=09&stmpe_gpio->norequest_mask);
+
 =09if (irq >=3D 0)
 =09=09stmpe_gpio->irq_base =3D stmpe->irq_base + STMPE_INT_GPIO(0);
 =09else
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 0d5f7b7..8b164f3 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -295,12 +295,14 @@ static struct resource stmpe_gpio_resources[] =3D {
=20
 static struct mfd_cell stmpe_gpio_cell =3D {
 =09.name=09=09=3D "stmpe-gpio",
+=09.of_compatible=09=3D "st,stmpe-gpio",
 =09.resources=09=3D stmpe_gpio_resources,
 =09.num_resources=09=3D ARRAY_SIZE(stmpe_gpio_resources),
 };
=20
 static struct mfd_cell stmpe_gpio_cell_noirq =3D {
 =09.name=09=09=3D "stmpe-gpio",
+=09.of_compatible=09=3D "st,stmpe-gpio",
 =09/* gpio cell resources consist of an irq only so no resources here */
 };
=20
--=20
1.7.12.rc2.18.g61b472e
