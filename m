From: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 1/3] gpio: davinci: add OF support
Date: Fri, 4 Oct 2013 21:33:14 +0530
Message-ID: <1380902596-4693-2-git-send-email-sujithkv@ti.com>
References: <1380902596-4693-1-git-send-email-sujithkv@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1380902596-4693-1-git-send-email-sujithkv-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, LDOC <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: KV Sujith <sujithkv-l0cyMroinI0@public.gmane.org>

This patch adds OF parser support for davinci gpio
driver and also appropriate documentation in gpio-davinci.txt
located at Documentation/devicetree/bindings/gpio/.

Signed-off-by: KV Sujith <sujithkv-l0cyMroinI0@public.gmane.org>
Signed-off-by: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
[prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: simplified the OF code and also
                 the commit message]
Signed-off-by: Lad, Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio-davinci.txt      |   34 +++++++++++
 drivers/gpio/gpio-davinci.c                        |   60 +++++++++++++++++++-
 2 files changed, 91 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
new file mode 100644
index 0000000..87abd3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
@@ -0,0 +1,34 @@
+Davinci GPIO controller bindings
+
+Required Properties:
+- compatible: should be "ti,dm6441-gpio"
+
+- reg: Physical base address of the controller and the size of memory mapped
+       registers.
+
+- gpio-controller : Marks the device node as a gpio controller.
+
+- interrupts: Array of GPIO interrupt number.
+
+- ngpio: The number of GPIO pins supported.
+
+- ti,davinci-gpio-irq-base: Base from where GPIO interrupt numbering starts.
+
+- ti,davinci-gpio-unbanked: The number of GPIOs that have an individual interrupt
+		             line to processor.
+
+Example:
+
+gpio: gpio@1e26000 {
+	compatible = "ti,dm6441-gpio";
+	gpio-controller;
+	reg = <0x226000 0x1000>;
+	interrupts = <42 IRQ_TYPE_EDGE_BOTH 43 IRQ_TYPE_EDGE_BOTH
+		44 IRQ_TYPE_EDGE_BOTH 45 IRQ_TYPE_EDGE_BOTH
+		46 IRQ_TYPE_EDGE_BOTH 47 IRQ_TYPE_EDGE_BOTH
+		48 IRQ_TYPE_EDGE_BOTH 49 IRQ_TYPE_EDGE_BOTH
+		50 IRQ_TYPE_EDGE_BOTH>;
+	ngpio = <144>;
+	ti,davinci-gpio-irq-base = <101>;
+	ti,davinci-gpio-unbanked = <0>;
+};
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 8847adf..1e7c5a4 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -16,6 +16,9 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/gpio-davinci.h>
 
@@ -133,6 +136,46 @@ davinci_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	__raw_writel((1 << offset), value ? &g->set_data : &g->clr_data);
 }
 
+static struct davinci_gpio_platform_data *
+davinci_gpio_get_pdata(struct platform_device *pdev)
+{
+	struct device_node *dn = pdev->dev.of_node;
+	struct davinci_gpio_platform_data *pdata;
+	int ret;
+	u32 val;
+
+	if (!IS_ENABLED(CONFIG_OF) || !pdev->dev.of_node)
+		return pdev->dev.platform_data;
+
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return NULL;
+
+	ret = of_property_read_u32(dn, "ngpio", &val);
+	if (ret)
+		goto of_err;
+
+	pdata->ngpio = val;
+
+	ret = of_property_read_u32(dn, "ti,davinci-gpio-unbanked", &val);
+	if (ret)
+		goto of_err;
+
+	pdata->gpio_unbanked = val;
+
+	ret = of_property_read_u32(dn, "ti,davinci-gpio-irq-base", &val);
+	if (ret)
+		goto of_err;
+
+	pdata->intc_irq_num = val;
+
+	return pdata;
+
+of_err:
+	dev_err(&pdev->dev, "Populating pdata from DT failed: err %d\n", ret);
+	return NULL;
+}
+
 static int davinci_gpio_probe(struct platform_device *pdev)
 {
 	int i, base;
@@ -143,12 +186,14 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 
-	pdata = dev->platform_data;
+	pdata = davinci_gpio_get_pdata(pdev);
 	if (!pdata) {
 		dev_err(dev, "No platform data found\n");
 		return -EINVAL;
 	}
 
+	dev->platform_data = pdata;
+
 	/*
 	 * The gpio banks conceptually expose a segmented bitmap,
 	 * and "ngpio" is one more than the largest zero-based
@@ -490,11 +535,20 @@ done:
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id davinci_gpio_ids[] = {
+	{ .compatible = "ti,dm6441-gpio", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, davinci_gpio_ids);
+#endif
+
 static struct platform_driver davinci_gpio_driver = {
 	.probe		= davinci_gpio_probe,
 	.driver		= {
-		.name	= "davinci_gpio",
-		.owner	= THIS_MODULE,
+		.name		= "davinci_gpio",
+		.owner		= THIS_MODULE,
+		.of_match_table	= of_match_ptr(davinci_gpio_ids),
 	},
 };
 
-- 
1.7.9.5
