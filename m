From: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH] of_gpio: enchance simple gpio binding with remove function
Date: Mon, 16 Nov 2009 17:50:33 +0300
Message-ID: <20091116145033.GA5322@oksana.dev.rtsoft.ru>
References: <1258379252-30657-1-git-send-email-dbaryshkov@gmail.com>
Reply-To: avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1258379252-30657-1-git-send-email-dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Nov 16, 2009 at 04:47:32PM +0300, Dmitry Eremin-Solenikov wrote:
> Add of_simple_gpiochip_remove() - a pair to of_simple_gpiochip_add that
> can remove simple gpiochip binding.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
[...]
> +int of_simple_gpiochip_add(struct device_node *np,
> +		       struct of_gpio_chip *of_gc)
> +{
> +	int ret = -ENOMEM;
> +	struct gpio_chip *gc = &of_gc->gc;
> +
> +	gc->base = -1;
> +
> +	if (!of_gc->xlate)
> +		of_gc->xlate = of_gpio_simple_xlate;
> +
> +	np->data = of_gc;
> +
> +	/* We don't want to lose the node and its ->data */
> +	of_node_get(np);
> +
> +	ret = gpiochip_add(gc);
> +	if (ret)
> +		goto err;

I don't think OF stuff should register gpiochips.

Previously we did this, but if you look into platform gpio
drivers (e.g. drivers/gpio/pc{a,f}*.c), you'll notice that
they already register GPIO chips, and call pdata hooks
afterwards.

Our aim is to only register OF part in the pdata hook, and
don't mess with generic gpiochip handling.

I started the work, but never actually find time to continue.
I'm attaching the unfinished patches as an example of how I
think it should be done, but I doubt they apply to the latest
kernels, but nonetheless you might want to borrow some ideas.

Thanks!

-- 
Anton Vorontsov
email: cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
irc://irc.freenode.net/bd2

--7AUc2qLy4jB3hD7Z
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="0001-of-gpio-add-support-for-two-stage-registration-for-t.patch"

>From 3e19b9a6d8c753aaaadc1aad80e055672b888f79 Mon Sep 17 00:00:00 2001
From: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Date: Fri, 1 May 2009 18:36:09 +0400
Subject: [PATCH 1/4] of/gpio: add support for two-stage registration for the of_gpio_chips

Currently there are two ways to register OF GPIO controllers:
1. Allocating the of_gpio_chip structure and passing the
   &of_gc->gc pointer to the gpiochip_add. (Can use container_of
   to convert the gpio_chip to the of_gpio_chip.)

2. Allocating and registering the gpio_chip structure separately
   from the of_gpio_chip. (Since two allocations are separate,
   container_of won't work.)

As time goes by we'll kill the first option.

Signed-off-by: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |    1 +
 drivers/of/gpio.c                              |   23 +++++++++++++++++++++--
 include/linux/of_gpio.h                        |    1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 82a9bcb..73c7e6b 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -93,6 +93,7 @@ static int mcu_gpiochip_add(struct mcu *mcu)
 	gc->base = -1;
 	gc->set = mcu_gpio_set;
 	gc->direction_output = mcu_gpio_dir_out;
+	of_gc->chip = gc;
 	of_gc->gpio_cells = 2;
 	of_gc->xlate = of_gpio_simple_xlate;
 
diff --git a/drivers/of/gpio.c b/drivers/of/gpio.c
index 6eea601..148030f 100644
--- a/drivers/of/gpio.c
+++ b/drivers/of/gpio.c
@@ -70,7 +70,7 @@ int of_get_gpio_flags(struct device_node *np, int index,
 	if (ret < 0)
 		goto err1;
 
-	ret += of_gc->gc.base;
+	ret += of_gc->chip->base;
 err1:
 	of_node_put(gc);
 err0:
@@ -140,7 +140,7 @@ int of_gpio_simple_xlate(struct of_gpio_chip *of_gc, struct device_node *np,
 		return -EINVAL;
 	}
 
-	if (*gpio > of_gc->gc.ngpio)
+	if (*gpio > of_gc->chip->ngpio)
 		return -EINVAL;
 
 	if (flags)
@@ -178,6 +178,25 @@ int of_mm_gpiochip_add(struct device_node *np,
 	struct of_gpio_chip *of_gc = &mm_gc->of_gc;
 	struct gpio_chip *gc = &of_gc->gc;
 
+	/*
+	 * Currently there are two ways to register OF GPIO controllers:
+	 *
+	 * 1. Allocating the of_gpio_chip structure and passing the
+	 *    &of_gc->gc pointer to the gpiochip_add. (Can use container_of
+	 *    to convert the gpio_chip to the of_gpio_chip.)
+	 *
+	 * 2. Allocating and registering the gpio_chip structure separately
+	 *    from the of_gpio_chip. (Since two allocations are separate,
+	 *    container_of won't work.)
+	 *
+	 * As time goes by we'll kill the first option. For now just check
+	 * if it's "new-style" registration or "old-style" one.
+	 */
+	if (!of_gc->chip)
+		of_gc->chip = gc;
+	else
+		gc = of_gc->chip;
+
 	gc->label = kstrdup(np->full_name, GFP_KERNEL);
 	if (!gc->label)
 		goto err0;
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index fc2472c..fb859dd 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -37,6 +37,7 @@ enum of_gpio_flags {
  */
 struct of_gpio_chip {
 	struct gpio_chip gc;
+	struct gpio_chip *chip;
 	int gpio_cells;
 	int (*xlate)(struct of_gpio_chip *of_gc, struct device_node *np,
 		     const void *gpio_spec, enum of_gpio_flags *flags);
-- 
1.6.3.3


--7AUc2qLy4jB3hD7Z
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="0002-of-gpio-implement-of_dev_gpiochip_-add-remove-calls.patch"

>From 265a4a0e3574f5a610a33a04717532cd2603e17b Mon Sep 17 00:00:00 2001
From: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Date: Fri, 1 May 2009 18:36:09 +0400
Subject: [PATCH 2/4] of/gpio: implement of_dev_gpiochip_{add,remove} calls

And let the gpiolib forward all dev_gpiochip_ calls to of_ versions, there
we can glue the gpiochips with the device tree.

Signed-off-by: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/gpio.c       |   56 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_gpio.h |    4 +++
 2 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/drivers/of/gpio.c b/drivers/of/gpio.c
index 148030f..1ae92dd 100644
--- a/drivers/of/gpio.c
+++ b/drivers/of/gpio.c
@@ -236,3 +236,59 @@ err0:
 	return ret;
 }
 EXPORT_SYMBOL(of_mm_gpiochip_add);
+
+/**
+ * of_gpiochip_register_simple - Register a chip with the OF GPIO subsystem
+ * @chip	pointer to a GPIO chip
+ * @np:		device node to register the GPIO chip with
+ *
+ * This function registers a GPIO chip with the OF infrastructure. It is
+ * assumed that the chip was previsously allocated and added to a generic
+ * GPIOLIB framework (using gpiochip_add() function).
+ *
+ * The `simple' name means that the chip is using simple two-cells scheme for
+ * the gpio-specifier.
+ */
+int of_gpiochip_register_simple(struct gpio_chip *chip, struct device_node *np)
+{
+	struct of_gpio_chip *of_gc;
+
+	if (np->data) {
+		WARN_ON(1);
+		return -EBUSY;
+	}
+
+	of_gc = kzalloc(sizeof(*of_gc), GFP_KERNEL);
+	if (!of_gc)
+		return -ENOMEM;
+
+	of_gc->gpio_cells = 2;
+	of_gc->xlate = of_gpio_simple_xlate;
+	of_gc->chip = chip;
+	np->data = of_gc;
+	of_node_get(np);
+	return 0;
+}
+EXPORT_SYMBOL(of_gpiochip_register_simple);
+
+/**
+ * of_gpiochip_unregister - Unregister a GPIO chip
+ * @chip	pointer to a GPIO chip
+ * @np:		device node for which the GPIO chip was previously registered
+ *
+ * This function unregisters a GPIO chip that was previsously registered
+ * with of_gpiochip_register*().
+ */
+void of_gpiochip_unregister(struct gpio_chip *chip, struct device_node *np)
+{
+	struct of_gpio_chip *of_gc = np->data;
+
+	if (!of_gc || of_gc->chip != chip) {
+		WARN_ON(1);
+		return;
+	}
+	np->data = NULL;
+	kfree(of_gc);
+	of_node_put(np);
+}
+EXPORT_SYMBOL(of_gpiochip_unregister);
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index fb859dd..323e6d4 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -70,6 +70,10 @@ extern unsigned int of_gpio_count(struct device_node *np);
 
 extern int of_mm_gpiochip_add(struct device_node *np,
 			      struct of_mm_gpio_chip *mm_gc);
+extern int of_gpiochip_register_simple(struct gpio_chip *chip,
+				       struct device_node *np);
+extern void of_gpiochip_unregister(struct gpio_chip *chip,
+				   struct device_node *np);
 extern int of_gpio_simple_xlate(struct of_gpio_chip *of_gc,
 				struct device_node *np,
 				const void *gpio_spec,
-- 
1.6.3.3


--7AUc2qLy4jB3hD7Z
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="0003-i2c-mcu_mpc8349emitx-Use-new-OF-GPIO-helpers.patch"

>From 2e27423e56561e74d438814a8ecb757024019d8e Mon Sep 17 00:00:00 2001
From: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Date: Fri, 1 May 2009 18:36:10 +0400
Subject: [PATCH 3/4] i2c/mcu_mpc8349emitx: Use new OF GPIO helpers

With the new OF GPIO helpers it's much easier to handle I2C GPIO
controllers. Now drivers don't need to deal with the OF-specific
bits.

Signed-off-by: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |   78 +++++++----------------
 1 files changed, 24 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 73c7e6b..374c99c 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -18,7 +18,6 @@
 #include <linux/mutex.h>
 #include <linux/i2c.h>
 #include <linux/gpio.h>
-#include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <asm/prom.h>
 #include <asm/machdep.h>
@@ -36,7 +35,7 @@ struct mcu {
 	struct mutex lock;
 	struct device_node *np;
 	struct i2c_client *client;
-	struct of_gpio_chip of_gc;
+	struct gpio_chip gc;
 	u8 reg_ctrl;
 };
 
@@ -55,8 +54,7 @@ static void mcu_power_off(void)
 
 static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_gpio_chip *of_gc = to_of_gpio_chip(gc);
-	struct mcu *mcu = container_of(of_gc, struct mcu, of_gc);
+	struct mcu *mcu = container_of(gc, struct mcu, gc);
 	u8 bit = 1 << (4 + gpio);
 
 	mutex_lock(&mcu->lock);
@@ -75,56 +73,11 @@ static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static int mcu_gpiochip_add(struct mcu *mcu)
-{
-	struct device_node *np;
-	struct of_gpio_chip *of_gc = &mcu->of_gc;
-	struct gpio_chip *gc = &of_gc->gc;
-	int ret;
-
-	np = of_find_compatible_node(NULL, NULL, "fsl,mcu-mpc8349emitx");
-	if (!np)
-		return -ENODEV;
-
-	gc->owner = THIS_MODULE;
-	gc->label = np->full_name;
-	gc->can_sleep = 1;
-	gc->ngpio = MCU_NUM_GPIO;
-	gc->base = -1;
-	gc->set = mcu_gpio_set;
-	gc->direction_output = mcu_gpio_dir_out;
-	of_gc->chip = gc;
-	of_gc->gpio_cells = 2;
-	of_gc->xlate = of_gpio_simple_xlate;
-
-	np->data = of_gc;
-	mcu->np = np;
-
-	/*
-	 * We don't want to lose the node, its ->data and ->full_name...
-	 * So, if succeeded, we don't put the node here.
-	 */
-	ret = gpiochip_add(gc);
-	if (ret)
-		of_node_put(np);
-	return ret;
-}
-
-static int mcu_gpiochip_remove(struct mcu *mcu)
-{
-	int ret;
-
-	ret = gpiochip_remove(&mcu->of_gc.gc);
-	if (ret)
-		return ret;
-	of_node_put(mcu->np);
-
-	return 0;
-}
-
 static int __devinit mcu_probe(struct i2c_client *client,
 			       const struct i2c_device_id *id)
 {
+	struct device *dev = &client->dev;
+	struct device_node *np = dev_archdata_get_node(&dev->archdata);
 	struct mcu *mcu;
 	int ret;
 
@@ -141,15 +94,28 @@ static int __devinit mcu_probe(struct i2c_client *client,
 		goto err;
 	mcu->reg_ctrl = ret;
 
-	ret = mcu_gpiochip_add(mcu);
+	mcu->gc.owner = THIS_MODULE;
+	mcu->gc.label = client->dev.bus_id;
+	mcu->gc.can_sleep = 1;
+	mcu->gc.ngpio = MCU_NUM_GPIO;
+	mcu->gc.base = -1;
+	mcu->gc.set = mcu_gpio_set;
+	mcu->gc.direction_output = mcu_gpio_dir_out;
+
+	ret = gpiochip_add(&mcu->gc);
 	if (ret)
 		goto err;
 
+	/* The OF interface isn't mandatory (think of sysfs GPIO interface). */
+	ret = of_gpiochip_register_simple(&mcu->gc, np);
+	if (ret)
+		dev_warn(dev, "OF GPIO registration failed: %d\n", ret);
+
 	/* XXX: this is potentially racy, but there is no lock for ppc_md */
 	if (!ppc_md.power_off) {
 		glob_mcu = mcu;
 		ppc_md.power_off = mcu_power_off;
-		dev_info(&client->dev, "will provide power-off service\n");
+		dev_info(dev, "will provide power-off service\n");
 	}
 
 	return 0;
@@ -160,6 +126,8 @@ err:
 
 static int __devexit mcu_remove(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
+	struct device_node *np = dev_archdata_get_node(&dev->archdata);
 	struct mcu *mcu = i2c_get_clientdata(client);
 	int ret;
 
@@ -168,9 +136,11 @@ static int __devexit mcu_remove(struct i2c_client *client)
 		glob_mcu = NULL;
 	}
 
-	ret = mcu_gpiochip_remove(mcu);
+	ret = gpiochip_remove(&mcu->gc);
 	if (ret)
 		return ret;
+
+	of_gpiochip_unregister(&mcu->gc, np);
 	i2c_set_clientdata(client, NULL);
 	kfree(mcu);
 	return 0;
-- 
1.6.3.3


--7AUc2qLy4jB3hD7Z
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="0004-gpio-pca953x-pass-gpio_chip-pointer-to-the-setup-tea.patch"

>From 64abcde84f722c280872a389369e2113f507569e Mon Sep 17 00:00:00 2001
From: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Date: Mon, 16 Nov 2009 17:41:27 +0300
Subject: [PATCH 4/4] gpio/pca953x: pass gpio_chip pointer to the setup/teardown callbacks

This is needed so that the platform code could register the chip
with the platform internal structures.

While at it, also change gpio_base to the signed type (we'll pass
-1 for the dynamic allocation).

Signed-off-by: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpio/pca953x.c      |    7 +++----
 include/linux/i2c/pca953x.h |    8 +++++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/pca953x.c b/drivers/gpio/pca953x.c
index 8dc0164..c65a353 100644
--- a/drivers/gpio/pca953x.c
+++ b/drivers/gpio/pca953x.c
@@ -239,8 +239,7 @@ static int __devinit pca953x_probe(struct i2c_client *client,
 		goto out_failed;
 
 	if (pdata->setup) {
-		ret = pdata->setup(client, chip->gpio_chip.base,
-				chip->gpio_chip.ngpio, pdata->context);
+		ret = pdata->setup(client, &chip->gpio_chip, pdata->context);
 		if (ret < 0)
 			dev_warn(&client->dev, "setup failed, %d\n", ret);
 	}
@@ -260,8 +259,8 @@ static int pca953x_remove(struct i2c_client *client)
 	int ret = 0;
 
 	if (pdata->teardown) {
-		ret = pdata->teardown(client, chip->gpio_chip.base,
-				chip->gpio_chip.ngpio, pdata->context);
+		ret = pdata->teardown(client, &chip->gpio_chip,
+				      pdata->context);
 		if (ret < 0) {
 			dev_err(&client->dev, "%s failed, %d\n",
 					"teardown", ret);
diff --git a/include/linux/i2c/pca953x.h b/include/linux/i2c/pca953x.h
index 3c73612..60d60c0 100644
--- a/include/linux/i2c/pca953x.h
+++ b/include/linux/i2c/pca953x.h
@@ -1,8 +1,10 @@
 /* platform data for the PCA9539 16-bit I/O expander driver */
 
+struct gpio_chip;
+
 struct pca953x_platform_data {
 	/* number of the first GPIO */
-	unsigned	gpio_base;
+	int		gpio_base;
 
 	/* initial polarity inversion setting */
 	uint16_t	invert;
@@ -10,9 +12,9 @@ struct pca953x_platform_data {
 	void		*context;	/* param to setup/teardown */
 
 	int		(*setup)(struct i2c_client *client,
-				unsigned gpio, unsigned ngpio,
+				struct gpio_chip *chip,
 				void *context);
 	int		(*teardown)(struct i2c_client *client,
-				unsigned gpio, unsigned ngpio,
+				struct gpio_chip *chip,
 				void *context);
 };
-- 
1.6.3.3


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--7AUc2qLy4jB3hD7Z--
