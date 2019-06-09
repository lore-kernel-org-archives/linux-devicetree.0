From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC next v1 3/5] net: stmmac: use GPIO descriptors in stmmac_mdio_reset
Date: Sun,  9 Jun 2019 20:06:19 +0200
Message-ID: <20190609180621.7607-4-martin.blumenstingl@googlemail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com
Cc: devicetree@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, khilman@baylibre.com, narmstrong@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Switch stmmac_mdio_reset to use GPIO descriptors. GPIO core handles the
"snps,reset-gpio" for GPIO descriptors so we don't need to take care of
it inside the driver anymore.

The advantage of this is that we now preserve the GPIO flags which are
passed via devicetree. This is required on some newer Amlogic boards
which use an Open Drain pin for the reset GPIO. This pin can only output
a LOW signal or switch to input mode but it cannot output a HIGH signal.
There are already devicetree bindings for these special cases and GPIO
core already takes care of them but only if we use GPIO descriptors
instead of GPIO numbers.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 27 +++++++++----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index cb9aad090cc9..21bbe3ba3e8e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -20,11 +20,11 @@
   Maintainer: Giuseppe Cavallaro <peppe.cavallaro@st.com>
 *******************************************************************************/
 
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/mii.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_mdio.h>
 #include <linux/phy.h>
 #include <linux/slab.h>
@@ -251,34 +251,33 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 
 #ifdef CONFIG_OF
 	if (priv->device->of_node) {
+		struct gpio_desc *reset_gpio;
+
 		if (data->reset_gpio < 0) {
 			struct device_node *np = priv->device->of_node;
 
-			data->reset_gpio = of_get_named_gpio(np,
-						"snps,reset-gpio", 0);
-			if (data->reset_gpio < 0)
-				return 0;
+			reset_gpio = devm_gpiod_get_optional(priv->device,
+							     "snps,reset",
+							     GPIOD_OUT_LOW);
+			if (IS_ERR(reset_gpio))
+				return PTR_ERR(reset_gpio);
 
-			data->active_low = of_property_read_bool(np,
-						"snps,reset-active-low");
 			of_property_read_u32_array(np,
 				"snps,reset-delays-us", data->delays, 3);
+		} else {
+			reset_gpio = gpio_to_desc(data->reset_gpio);
 
-			if (devm_gpio_request(priv->device, data->reset_gpio,
-					      "mdio-reset"))
-				return 0;
+			gpiod_direction_output(reset_gpio, 0);
 		}
 
-		gpio_direction_output(data->reset_gpio,
-				      data->active_low ? 1 : 0);
 		if (data->delays[0])
 			msleep(DIV_ROUND_UP(data->delays[0], 1000));
 
-		gpio_set_value(data->reset_gpio, data->active_low ? 0 : 1);
+		gpiod_set_value_cansleep(reset_gpio, 1);
 		if (data->delays[1])
 			msleep(DIV_ROUND_UP(data->delays[1], 1000));
 
-		gpio_set_value(data->reset_gpio, data->active_low ? 1 : 0);
+		gpiod_set_value_cansleep(reset_gpio, 0);
 		if (data->delays[2])
 			msleep(DIV_ROUND_UP(data->delays[2], 1000));
 	}
-- 
2.21.0
