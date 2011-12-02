From: Kyle Moffett <Kyle.D.Moffett-X8CqP27nNzzQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 1/3] of_gpio: Extend of_gpio_count() to support other
 property names
Date: Fri,  2 Dec 2011 15:37:59 -0500
Message-ID: <1322858281-17831-2-git-send-email-Kyle.D.Moffett@boeing.com>
References: <1322858281-17831-1-git-send-email-Kyle.D.Moffett@boeing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322858281-17831-1-git-send-email-Kyle.D.Moffett-X8CqP27nNzzQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Kyle Moffett <Kyle.D.Moffett-X8CqP27nNzzQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The of_get_named_gpio_flags() function allows the caller to specify the
property name which should be read for a list of GPIOs.

Unfortunately there is no easy way to *count* the number of GPIOs listed
in an arbitrary property.

To resolve this, rename of_gpio_count() to of_gpio_count_named() and add
a new "propname" parameter.

Also add a static inline replacement for of_gpio_count() which calls
of_gpio_count_named() with "gpios" to avoid breaking existing users.

Signed-off-by: Kyle Moffett <Kyle.D.Moffett-X8CqP27nNzzQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/gpio.c       |   13 ++++++-------
 include/linux/of_gpio.h |   27 +++++++++++++++++++++++++--
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/of/gpio.c b/drivers/of/gpio.c
index ef0105f..f349aaf 100644
--- a/drivers/of/gpio.c
+++ b/drivers/of/gpio.c
@@ -83,8 +83,9 @@ err0:
 EXPORT_SYMBOL(of_get_named_gpio_flags);
 
 /**
- * of_gpio_count - Count GPIOs for a device
+ * of_gpio_count_named - Count GPIOs for a device
  * @np:		device node to count GPIOs for
+ * @propname:	property name containing gpio specifier(s)
  *
  * The function returns the count of GPIOs specified for a node.
  *
@@ -98,15 +99,13 @@ EXPORT_SYMBOL(of_get_named_gpio_flags);
  * defines four GPIOs (so this function will return 4), two of which
  * are not specified.
  */
-unsigned int of_gpio_count(struct device_node *np)
+unsigned int of_gpio_count_named(struct device_node *np, const char *propname)
 {
 	unsigned int cnt = 0;
 
 	do {
-		int ret;
-
-		ret = of_parse_phandles_with_args(np, "gpios", "#gpio-cells",
-						  cnt, NULL, NULL);
+		int ret = of_parse_phandles_with_args(np, propname,
+				"#gpio-cells", cnt, NULL, NULL);
 		/* A hole in the gpios = <> counts anyway. */
 		if (ret < 0 && ret != -EEXIST)
 			break;
@@ -114,7 +113,7 @@ unsigned int of_gpio_count(struct device_node *np)
 
 	return cnt;
 }
-EXPORT_SYMBOL(of_gpio_count);
+EXPORT_SYMBOL(of_gpio_count_named);
 
 /**
  * of_gpio_simple_xlate - translate gpio_spec to the GPIO number and flags
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 52280a2..1411a06 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -49,7 +49,8 @@ static inline struct of_mm_gpio_chip *to_of_mm_gpio_chip(struct gpio_chip *gc)
 extern int of_get_named_gpio_flags(struct device_node *np,
 		const char *list_name, int index, enum of_gpio_flags *flags);
 
-extern unsigned int of_gpio_count(struct device_node *np);
+extern unsigned int of_gpio_count_named(struct device_node *np,
+		const char *propname);
 
 extern int of_mm_gpiochip_add(struct device_node *np,
 			      struct of_mm_gpio_chip *mm_gc);
@@ -69,7 +70,8 @@ static inline int of_get_named_gpio_flags(struct device_node *np,
 	return -ENOSYS;
 }
 
-static inline unsigned int of_gpio_count(struct device_node *np)
+static inline unsigned int of_gpio_count_named(struct device_node *np,
+		const char *propname)
 {
 	return 0;
 }
@@ -87,6 +89,27 @@ static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
 #endif /* CONFIG_OF_GPIO */
 
 /**
+ * of_gpio_count - Count GPIOs for a device
+ * @np:		device node to count GPIOs for
+ *
+ * The function returns the count of GPIOs specified for a node.
+ *
+ * Note that the empty GPIO specifiers counts too. For example,
+ *
+ * gpios = <0
+ *          &pio1 1 2
+ *          0
+ *          &pio2 3 4>;
+ *
+ * defines four GPIOs (so this function will return 4), two of which
+ * are not specified.
+ */
+static inline unsigned int of_gpio_count(struct device_node *np)
+{
+	return of_gpio_count_named(np, "gpios");
+}
+
+/**
  * of_get_gpio_flags() - Get a GPIO number and flags to use with GPIO API
  * @np:		device node to get GPIO from
  * @index:	index of the GPIO
-- 
1.7.2.5
