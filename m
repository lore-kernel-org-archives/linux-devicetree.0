From: Philip Avinash <avinashphilipk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/4] gpio: davinci: DT changes for driver
Date: Fri, 14 Jun 2013 15:50:39 +0530
Message-ID: <1371205241-17205-3-git-send-email-avinashphilipk@gmail.com>
References: <1371203020-15092-1-git-send-email-avinashphilip@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1371203020-15092-1-git-send-email-avinashphilip-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: nsekhar-l0cyMroinI0@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, avinashphilip-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: KV Sujith <sujithkv-l0cyMroinI0@public.gmane.org>

- Add of_device_id for Davinci GPIO driver.
- Add function to populate data from DT.
- Modify the probe to read from DT if DT match is found.
- Add DT binding documentation for Davinci GPIO properties in a new file
  gpio-davinci.txt located at Documentation/devicetree/bindings/gpio/.

Signed-off-by: KV Sujith <sujithkv-l0cyMroinI0@public.gmane.org>
Signed-off-by: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
---
Changes since v1:
	- description for interrupts changed to reflecti
	   interrupt array usage.

 .../devicetree/bindings/gpio/gpio-davinci.txt      |   32 +++++++++++
 drivers/gpio/gpio-davinci.c                        |   57 ++++++++++++++++++--
 2 files changed, 86 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
new file mode 100644
index 0000000..1c31638
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
@@ -0,0 +1,32 @@
+Davinci GPIO controller bindings
+
+Required Properties:
+- compatible:"ti,da830-gpio"
+
+- reg: Physical base address of the controller and length of memory mapped
+	region.
+
+- interrupts: Array of GPIO interrupt number.
+
+- ngpio: The number of GPIO pins supported
+
+- intc_irq_num: The number of IRQs supported by the Interrupt Controller
+
+- gpio_unbanked: The number of GPIOs that have an individual interrupt
+		line to processor.
+
+Example:
+#include <dt-bindings/interrupt-controller/irq.h>
+
+gpio: gpio@1e26000 {
+	compatible = "ti,da830-gpio";
+	reg = <0x226000 0x1000>;
+	interrupts = <42 IRQ_TYPE_EDGE_BOTH 43 IRQ_TYPE_EDGE_BOTH
+		44 IRQ_TYPE_EDGE_BOTH 45 IRQ_TYPE_EDGE_BOTH
+		46 IRQ_TYPE_EDGE_BOTH 47 IRQ_TYPE_EDGE_BOTH
+		48 IRQ_TYPE_EDGE_BOTH 49 IRQ_TYPE_EDGE_BOTH
+		50 IRQ_TYPE_EDGE_BOTH>;
+	ngpio = <144>;
+	intc_irq_num = <101>;
+	gpio_unbanked = <0>;
+};
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 475a5ece..cd2ed25 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -20,6 +20,8 @@
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/gpio-davinci.h>
 
@@ -137,6 +139,50 @@ davinci_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	__raw_writel((1 << offset), value ? &g->set_data : &g->clr_data);
 }
 
+static struct davinci_gpio_platform_data *davinci_gpio_set_pdata_of(
+						struct platform_device *pdev)
+{
+	struct device_node *dn = pdev->dev.of_node;
+	struct davinci_gpio_platform_data *pdata;
+	u32 val, ret;
+
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (pdata) {
+		ret = of_property_read_u32(dn, "ngpio", &val);
+		if (ret)
+			goto of_err;
+
+		pdata->ngpio = val;
+
+		ret = of_property_read_u32(dn, "gpio_unbanked", &val);
+		if (ret)
+			goto of_err;
+
+		pdata->gpio_unbanked = val;
+
+		ret = of_property_read_u32(dn, "intc_irq_num", &val);
+		if (ret)
+			goto of_err;
+
+		pdata->intc_irq_num = val;
+	}
+
+	return pdata;
+
+of_err:
+	dev_err(&pdev->dev, "Populating pdata from DT failed: err %d\n", ret);
+	return NULL;
+}
+
+static const struct of_device_id davinci_gpio_ids[] = {
+	{
+		.compatible = "ti,da830-gpio",
+	},
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, davinci_gpio_ids);
+
 static int davinci_gpio_probe(struct platform_device *pdev)
 {
 	int i, base;
@@ -146,13 +192,17 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	struct davinci_gpio_regs __iomem *regs;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
+	const struct of_device_id *match =
+		of_match_device(of_match_ptr(davinci_gpio_ids), &pdev->dev);
 
-	pdata = dev->platform_data;
+	pdata = match ? davinci_gpio_set_pdata_of(pdev) : dev->platform_data;
 	if (!pdata) {
 		dev_err(dev, "No platform data found\n");
 		return -EINVAL;
 	}
 
+	dev->platform_data = pdata;
+
 	/*
 	 * The gpio banks conceptually expose a segmented bitmap,
 	 * and "ngpio" is one more than the largest zero-based
@@ -497,8 +547,9 @@ done:
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
