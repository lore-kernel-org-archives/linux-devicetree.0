From: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Subject: [PATCH] gpio: 74x164: add dt support for nxp's 74x594
Date: Mon, 14 Mar 2016 23:32:10 +0000
Message-ID: <1457998330-8070-1-git-send-email-nicolassaenzj@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

The chip is also an 8 bit shift register which works out of the box as a GPO
expander with this patch

Signed-off-by: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-74x164.txt | 4 +++-
 drivers/gpio/gpio-74x164.c                             | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
index cc26080..ce1b223 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
@@ -1,7 +1,9 @@
 * Generic 8-bits shift register GPIO driver
 
 Required properties:
-- compatible : Should be "fairchild,74hc595"
+- compatible: Should contain one of the following:
+    "fairchild,74hc595"
+    "nxp,74lvc594"
 - reg : chip select number
 - gpio-controller : Marks the device node as a gpio controller.
 - #gpio-cells : Should be two.  The first cell is the pin number and
diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index c81224f..ebd0d1a 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -153,6 +153,7 @@ static int gen_74x164_remove(struct spi_device *spi)
 
 static const struct of_device_id gen_74x164_dt_ids[] = {
 	{ .compatible = "fairchild,74hc595" },
+	{ .compatible = "nxp,74lvc594" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, gen_74x164_dt_ids);
-- 
2.5.0

