From: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v9 1/2] gpio: Adjust of_xlate API to support multiple GPIO
 chips
Date: Fri, 11 May 2012 11:47:39 +0200
Message-ID: <1336729660-7670-1-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, kevin.wells-3arQi8VN3Tc@public.gmane.org, srinivas.bakki-3arQi8VN3Tc@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch changes the of_xlate API to make it possible to manipulate the
actual used gc. This way, multiple GPIO banks can be supported with the same DT
registered GPIO controller.

The issue was discussed upon the integration of LPC32xx's DT support for its
GPIO (see separate patch).

Signed-off-by: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>

---
Applies to v3.4-rc6

Changes since last version:
* Added this patch to the series

Thanks to Grant Likely for reviewing and advice!

 drivers/gpio/gpio-samsung.c |   10 +++++-----
 drivers/of/gpio.c           |   14 ++++++++------
 include/asm-generic/gpio.h  |    2 +-
 include/linux/of_gpio.h     |    2 +-
 4 files changed, 15 insertions(+), 13 deletions(-)

--- linux-2.6.orig/drivers/gpio/gpio-samsung.c
+++ linux-2.6/drivers/gpio/gpio-samsung.c
@@ -2655,21 +2655,21 @@ static struct samsung_gpio_chip exynos5_
 
 
 #if defined(CONFIG_ARCH_EXYNOS) && defined(CONFIG_OF)
-static int exynos_gpio_xlate(struct gpio_chip *gc,
+static int exynos_gpio_xlate(struct gpio_chip **gc,
 			const struct of_phandle_args *gpiospec, u32 *flags)
 {
 	unsigned int pin;
 
-	if (WARN_ON(gc->of_gpio_n_cells < 4))
+	if (WARN_ON((*gc)->of_gpio_n_cells < 4))
 		return -EINVAL;
 
-	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
+	if (WARN_ON(gpiospec->args_count < (*gc)->of_gpio_n_cells))
 		return -EINVAL;
 
-	if (gpiospec->args[0] > gc->ngpio)
+	if (gpiospec->args[0] > (*gc)->ngpio)
 		return -EINVAL;
 
-	pin = gc->base + gpiospec->args[0];
+	pin = (*gc)->base + gpiospec->args[0];
 
 	if (s3c_gpio_cfgpin(pin, S3C_GPIO_SFN(gpiospec->args[1])))
 		pr_warn("gpio_xlate: failed to set pin function\n");
--- linux-2.6.orig/drivers/of/gpio.c
+++ linux-2.6/drivers/of/gpio.c
@@ -64,7 +64,7 @@ int of_get_named_gpio_flags(struct devic
 	if (flags)
 		*flags = 0;
 
-	ret = gc->of_xlate(gc, &gpiospec, flags);
+	ret = gc->of_xlate(&gc, &gpiospec, flags);
 	if (ret < 0)
 		goto err1;
 
@@ -114,7 +114,9 @@ EXPORT_SYMBOL(of_gpio_named_count);
 
 /**
  * of_gpio_simple_xlate - translate gpio_spec to the GPIO number and flags
- * @gc:		pointer to the gpio_chip structure
+ * @gc:		pointer to pointer to the gpio_chip structure: the xlate
+ *              function can alter *gc itself to make GPIO distribution to
+ *              multiple gpio_chips possible
  * @np:		device node of the GPIO chip
  * @gpio_spec:	gpio specifier as found in the device tree
  * @flags:	a flags pointer to fill in
@@ -123,7 +125,7 @@ EXPORT_SYMBOL(of_gpio_named_count);
  * gpio chips. This function performs only one sanity check: whether gpio
  * is less than ngpios (that is specified in the gpio_chip).
  */
-int of_gpio_simple_xlate(struct gpio_chip *gc,
+int of_gpio_simple_xlate(struct gpio_chip **gc,
 			 const struct of_phandle_args *gpiospec, u32 *flags)
 {
 	/*
@@ -132,15 +134,15 @@ int of_gpio_simple_xlate(struct gpio_chi
 	 * number and the flags from a single gpio cell -- this is possible,
 	 * but not recommended).
 	 */
-	if (gc->of_gpio_n_cells < 2) {
+	if ((*gc)->of_gpio_n_cells < 2) {
 		WARN_ON(1);
 		return -EINVAL;
 	}
 
-	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
+	if (WARN_ON(gpiospec->args_count < (*gc)->of_gpio_n_cells))
 		return -EINVAL;
 
-	if (gpiospec->args[0] >= gc->ngpio)
+	if (gpiospec->args[0] >= (*gc)->ngpio)
 		return -EINVAL;
 
 	if (flags)
--- linux-2.6.orig/include/asm-generic/gpio.h
+++ linux-2.6/include/asm-generic/gpio.h
@@ -129,7 +129,7 @@ struct gpio_chip {
 	 */
 	struct device_node *of_node;
 	int of_gpio_n_cells;
-	int (*of_xlate)(struct gpio_chip *gc,
+	int (*of_xlate)(struct gpio_chip **gc,
 		        const struct of_phandle_args *gpiospec, u32 *flags);
 #endif
 };
--- linux-2.6.orig/include/linux/of_gpio.h
+++ linux-2.6/include/linux/of_gpio.h
@@ -59,7 +59,7 @@ extern int of_mm_gpiochip_add(struct dev
 extern void of_gpiochip_add(struct gpio_chip *gc);
 extern void of_gpiochip_remove(struct gpio_chip *gc);
 extern struct gpio_chip *of_node_to_gpiochip(struct device_node *np);
-extern int of_gpio_simple_xlate(struct gpio_chip *gc,
+extern int of_gpio_simple_xlate(struct gpio_chip **gc,
 				const struct of_phandle_args *gpiospec,
 				u32 *flags);
