From: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] leds: Add DT support for leds-pca9532
Date: Sat, 16 Jun 2012 16:10:51 +0200
Message-ID: <1339855851-9171-1-git-send-email-stigge@antcom.de>
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
To: riku.voipio-X3B1VOXEql0@public.gmane.org, bryan.wu-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds DT support for leds-pca9532.

Signed-off-by: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>

---
 Documentation/devicetree/bindings/leds/leds-pca9532.txt |   43 ++++++++++++++
 drivers/leds/leds-pca9532.c                             |   47 ++++++++++++++++
 2 files changed, 90 insertions(+)

--- /dev/null
+++ linux-2.6/Documentation/devicetree/bindings/leds/leds-pca9532.txt
@@ -0,0 +1,43 @@
+NXP PCA9532 LED (incl. GPIO) controller
+
+Required properties:
+- compatible: must be "nxp,pca9532"
+- reg: I2C address
+- gpio-controller: Marks the device node as a GPIO controller.
+- #gpio-cells: Should be 2:
+   1) pin number
+   2) optional parameters:
+      - bit 0 specifies polarity (0 for normal, 1 for inverted)
+- nxp,typecodes: groups of 2 bits for each of the 16 pins:
+  0: None
+  1: LED
+  2: Beep
+  3: GPIO
+- nxp,statecodes: groups of 2 bits for each of the 16 pins:
+  0: off
+  1: on
+  2: pwm0
+  3: pwm1
+
+Optional properties:
+- nxp,psc: array of 2 numbers: PSC values for the two PWM channels (see datasheet)
+- nxp,pwm: array of 2 numbers: PWM values for the two PWM channels (see datasheet)
+
+Example:
+
+	pca9532: pca9532@60 {
+		compatible = "nxp,pca9532";
+		gpio-controller;
+		#gpio-cells = <2>;
+		nxp,typecodes = <0xffffffff>;
+		nxp,statecodes = <0x00000000>;
+		reg = <0x60>;
+	};
+
+	sd@20098000 {
+		wp-gpios = <&pca9532 5 0>;
+		cd-gpios = <&pca9532 4 0>;
+		cd-inverted;
+		bus-width = <4>;
+		status = "okay";
+	};
--- linux-2.6.orig/drivers/leds/leds-pca9532.c
+++ linux-2.6/drivers/leds/leds-pca9532.c
@@ -21,6 +21,7 @@
 #include <linux/workqueue.h>
 #include <linux/leds-pca9532.h>
 #include <linux/gpio.h>
+#include <linux/of.h>
 
 /* m =  num_leds*/
 #define PCA9532_REG_INPUT(i)	((i) >> 3)
@@ -444,6 +445,47 @@ exit:
 	return err;
 }
 
+#ifdef CONFIG_OF
+static struct pca9532_platform_data *pca9532_parse_dt(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct pca9532_platform_data *pca9532_pdata;
+	u32 typecodes, statecodes;
+	u32 pwm[2];
+	u32 psc[2];
+	int i;
+
+	pca9532_pdata = devm_kzalloc(dev, sizeof(*pca9532_pdata), GFP_KERNEL);
+	if (!pca9532_pdata) {
+		dev_err(dev, "could not allocate memory for platform data\n");
+		return NULL;
+	}
+
+	if (!of_property_read_u32(np, "nxp,typecodes", &typecodes)) {
+		for (i = 0; i < 16; i++)
+			pca9532_pdata->leds[i].type =
+				(typecodes >> (2 * i)) & 0x3;
+	}
+	if (!of_property_read_u32(np, "nxp,statecodes", &statecodes)) {
+		for (i = 0; i < 16; i++)
+			pca9532_pdata->leds[i].state =
+				(statecodes >> (2 * i)) & 0x3;
+	}
+	if (!of_property_read_u32_array(np, "nxp,pwm", &pwm[0], 2)) {
+		for (i = 0; i < 2; i++)
+			pca9532_pdata->pwm[i] = pwm[i];
+	}
+	if (!of_property_read_u32_array(np, "nxp,psc", &psc[0], 2)) {
+		for (i = 0; i < 2; i++)
+			pca9532_pdata->psc[i] = psc[i];
+	}
+
+	pca9532_pdata->gpio_base = -1; /* dynamically assign gpio base */
+
+	return pca9532_pdata;
+}
+#endif
+
 static int pca9532_probe(struct i2c_client *client,
 	const struct i2c_device_id *id)
 {
@@ -451,6 +493,11 @@ static int pca9532_probe(struct i2c_clie
 	struct pca9532_platform_data *pca9532_pdata = client->dev.platform_data;
 	int err;
 
+#ifdef CONFIG_OF
+	if (!pca9532_pdata && client->dev.of_node)
+		pca9532_pdata = pca9532_parse_dt(&client->dev);
+#endif
+
 	if (!pca9532_pdata)
 		return -EIO;
