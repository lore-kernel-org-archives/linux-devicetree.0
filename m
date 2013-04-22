From: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Subject: [PATCH 07/23] i2c: stu300: device tree support
Date: Mon, 22 Apr 2013 11:53:03 +0200
Message-ID: <1366624383-6330-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This adds device tree support for the ST DDC I2C driver known
as "stu300" in the kernel tree.

Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
Wolfram, I'm seeking an ACK to take this with the other lump
of U300 device tree patches through the ARM SoC tree.
---
 Documentation/devicetree/bindings/i2c/i2c-st-ddci2c.txt | 15 +++++++++++++++
 drivers/i2c/busses/i2c-stu300.c                         | 12 ++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-st-ddci2c.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-st-ddci2c.txt b/Documentation/devicetree/bindings/i2c/i2c-st-ddci2c.txt
new file mode 100644
index 0000000..bd81a48
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-st-ddci2c.txt
@@ -0,0 +1,15 @@
+ST Microelectronics DDC I2C
+
+Required properties :
+- compatible : Must be "st,ddci2c"
+- reg: physical base address of the controller and length of memory mapped
+     region.
+- interrupts: interrupt number to the cpu.
+- #address-cells = <1>;
+- #size-cells = <0>;
+
+Optional properties:
+- Child nodes conforming to i2c bus binding
+
+Examples :
+
diff --git a/drivers/i2c/busses/i2c-stu300.c b/drivers/i2c/busses/i2c-stu300.c
index 0a6f941..1beaa05a 100644
--- a/drivers/i2c/busses/i2c-stu300.c
+++ b/drivers/i2c/busses/i2c-stu300.c
@@ -17,6 +17,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/of_i2c.h>
 
 /* the name of this kernel module */
 #define NAME "stu300"
@@ -923,6 +924,7 @@ stu300_probe(struct platform_device *pdev)
 	adap->nr = bus_nr;
 	adap->algo = &stu300_algo;
 	adap->dev.parent = &pdev->dev;
+	adap->dev.of_node = pdev->dev.of_node;
 	i2c_set_adapdata(adap, dev);
 
 	/* i2c device drivers may be active on return from add_adapter() */
@@ -934,6 +936,10 @@ stu300_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, dev);
+	dev_info(&pdev->dev, "ST DDC I2C @ %p, irq %d\n",
+		 dev->virtbase, dev->irq);
+	of_i2c_register_devices(adap);
+
 	return 0;
 }
 
@@ -978,11 +984,17 @@ stu300_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id stu300_dt_match[] = {
+	{ .compatible = "st,ddci2c" },
+	{},
+};
+
 static struct platform_driver stu300_i2c_driver = {
 	.driver = {
 		.name	= NAME,
 		.owner	= THIS_MODULE,
 		.pm	= STU300_I2C_PM,
+		.of_match_table = stu300_dt_match,
 	},
 	.remove		= __exit_p(stu300_remove),
 
-- 
1.7.11.3
