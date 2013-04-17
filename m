From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RFC 2/2] gpio: samsung: Remove OF support for Exynos4/5
Date: Wed, 17 Apr 2013 13:06:08 +0200
Message-ID: <1366196768-19015-1-git-send-email-s.nawrocki@samsung.com>
References: <1366134094-23140-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1366134094-23140-1-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now when Exynos4 and Exynos5 SoC DT platforms use the pinctrl API
we can remove the interim OF support from this GPIO driver. There
should be no need any more to check the compatible property and to
find out if initialization of the GPIO driver should be skipped
we just check if OF tree is available.

Cc: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpio/gpio-samsung.c |  106 +++----------------------------------------
 1 file changed, 6 insertions(+), 100 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 4fecfb8..e1c59c0 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -2658,70 +2658,6 @@ static struct samsung_gpio_chip exynos5_gpios_4[] = {
 };
 #endif

-
-#if defined(CONFIG_ARCH_EXYNOS) && defined(CONFIG_OF)
-static int exynos_gpio_xlate(struct gpio_chip *gc,
-			const struct of_phandle_args *gpiospec, u32 *flags)
-{
-	unsigned int pin;
-
-	if (WARN_ON(gc->of_gpio_n_cells < 4))
-		return -EINVAL;
-
-	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
-		return -EINVAL;
-
-	if (gpiospec->args[0] > gc->ngpio)
-		return -EINVAL;
-
-	pin = gc->base + gpiospec->args[0];
-
-	if (s3c_gpio_cfgpin(pin, S3C_GPIO_SFN(gpiospec->args[1])))
-		pr_warn("gpio_xlate: failed to set pin function\n");
-	if (s3c_gpio_setpull(pin, gpiospec->args[2] & 0xffff))
-		pr_warn("gpio_xlate: failed to set pin pull up/down\n");
-	if (s5p_gpio_set_drvstr(pin, gpiospec->args[3]))
-		pr_warn("gpio_xlate: failed to set pin drive strength\n");
-
-	if (flags)
-		*flags = gpiospec->args[2] >> 16;
-
-	return gpiospec->args[0];
-}
-
-static const struct of_device_id exynos_gpio_dt_match[] __initdata = {
-	{ .compatible = "samsung,exynos4-gpio", },
-	{}
-};
-
-static __init void exynos_gpiolib_attach_ofnode(struct samsung_gpio_chip *chip,
-						u64 base, u64 offset)
-{
-	struct gpio_chip *gc =  &chip->chip;
-	u64 address;
-
-	if (!of_have_populated_dt())
-		return;
-
-	address = chip->base ? base + ((u32)chip->base & 0xfff) : base + offset;
-	gc->of_node = of_find_matching_node_by_address(NULL,
-			exynos_gpio_dt_match, address);
-	if (!gc->of_node) {
-		pr_info("gpio: device tree node not found for gpio controller"
-			" with base address %08llx\n", address);
-		return;
-	}
-	gc->of_gpio_n_cells = 4;
-	gc->of_xlate = exynos_gpio_xlate;
-}
-#elif defined(CONFIG_ARCH_EXYNOS)
-static __init void exynos_gpiolib_attach_ofnode(struct samsung_gpio_chip *chip,
-						u64 base, u64 offset)
-{
-	return;
-}
-#endif /* defined(CONFIG_ARCH_EXYNOS) && defined(CONFIG_OF) */
-
 static __init void exynos4_gpiolib_init(void)
 {
 #ifdef CONFIG_CPU_EXYNOS4210
@@ -2746,8 +2682,6 @@ static __init void exynos4_gpiolib_init(void)
 			chip->config = &exynos_gpio_cfg;
 			chip->group = group++;
 		}
-		exynos_gpiolib_attach_ofnode(chip,
-				EXYNOS4_PA_GPIO1, i * 0x20);
 	}
 	samsung_gpiolib_add_4bit_chips(exynos4_gpios_1,
 				       nr_chips, gpio_base1);
@@ -2773,8 +2707,6 @@ static __init void exynos4_gpiolib_init(void)
 			chip->config = &exynos_gpio_cfg;
 			chip->group = group++;
 		}
-		exynos_gpiolib_attach_ofnode(chip,
-				EXYNOS4_PA_GPIO2, i * 0x20);
 	}
 	samsung_gpiolib_add_4bit_chips(exynos4_gpios_2,
 				       nr_chips, gpio_base2);
@@ -2794,8 +2726,6 @@ static __init void exynos4_gpiolib_init(void)
 			chip->config = &exynos_gpio_cfg;
 			chip->group = group++;
 		}
-		exynos_gpiolib_attach_ofnode(chip,
-				EXYNOS4_PA_GPIO3, i * 0x20);
 	}
 	samsung_gpiolib_add_4bit_chips(exynos4_gpios_3,
 				       nr_chips, gpio_base3);
@@ -2849,8 +2779,6 @@ static __init void exynos5_gpiolib_init(void)
 			chip->config = &exynos_gpio_cfg;
 			chip->group = group++;
 		}
-		exynos_gpiolib_attach_ofnode(chip,
-				EXYNOS5_PA_GPIO1, i * 0x20);
 	}
 	samsung_gpiolib_add_4bit_chips(exynos5_gpios_1,
 				       nr_chips, gpio_base1);
@@ -2870,8 +2798,6 @@ static __init void exynos5_gpiolib_init(void)
 			chip->config = &exynos_gpio_cfg;
 			chip->group = group++;
 		}
-		exynos_gpiolib_attach_ofnode(chip,
-				EXYNOS5_PA_GPIO2, i * 0x20);
 	}
 	samsung_gpiolib_add_4bit_chips(exynos5_gpios_2,
 				       nr_chips, gpio_base2);
@@ -2898,8 +2824,6 @@ static __init void exynos5_gpiolib_init(void)
 			chip->config = &exynos_gpio_cfg;
 			chip->group = group++;
 		}
-		exynos_gpiolib_attach_ofnode(chip,
-				EXYNOS5_PA_GPIO3, i * 0x20);
 	}
 	samsung_gpiolib_add_4bit_chips(exynos5_gpios_3,
 				       nr_chips, gpio_base3);
@@ -2919,8 +2843,6 @@ static __init void exynos5_gpiolib_init(void)
 			chip->config = &exynos_gpio_cfg;
 			chip->group = group++;
 		}
-		exynos_gpiolib_attach_ofnode(chip,
-				EXYNOS5_PA_GPIO4, i * 0x20);
 	}
 	samsung_gpiolib_add_4bit_chips(exynos5_gpios_4,
 				       nr_chips, gpio_base4);
@@ -2945,29 +2867,13 @@ static __init int samsung_gpiolib_init(void)
 	int i, nr_chips;
 	int group = 0;

-#if defined(CONFIG_PINCTRL_EXYNOS) || defined(CONFIG_PINCTRL_EXYNOS5440)
 	/*
-	* This gpio driver includes support for device tree support and there
-	* are platforms using it. In order to maintain compatibility with those
-	* platforms, and to allow non-dt Exynos4210 platforms to use this
-	* gpiolib support, a check is added to find out if there is a active
-	* pin-controller driver support available. If it is available, this
-	* gpiolib support is ignored and the gpiolib support available in
-	* pin-controller driver is used. This is a temporary check and will go
-	* away when all of the Exynos4210 platforms have switched to using
-	* device tree and the pin-ctrl driver.
-	*/
-	struct device_node *pctrl_np;
-	static const struct of_device_id exynos_pinctrl_ids[] = {
-		{ .compatible = "samsung,exynos4210-pinctrl", },
-		{ .compatible = "samsung,exynos4x12-pinctrl", },
-		{ .compatible = "samsung,exynos5440-pinctrl", },
-		{ }
-	};
-	for_each_matching_node(pctrl_np, exynos_pinctrl_ids)
-		if (pctrl_np && of_device_is_available(pctrl_np))
-			return -ENODEV;
-#endif
+	 * All Samsung platforms that support device tree will use the pinctrl
+	 * driver, hence we skip initialization of this driver if the OF tree
+	 * is available.
+	 */
+	if (of_have_populated_dt())
+		return -ENODEV;

 	samsung_gpiolib_set_cfg(samsung_gpio_cfgs, ARRAY_SIZE(samsung_gpio_cfgs));

--
1.7.9.5
