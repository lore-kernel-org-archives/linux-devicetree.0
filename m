From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v1 2/3] extcon: int3496: Rename GPIO pins in accordance with binding
Date: Thu, 23 Feb 2017 12:31:55 +0200
Message-ID: <20170223103156.109643-2-andriy.shevchenko@linux.intel.com>
References: <20170223103156.109643-1-andriy.shevchenko@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170223103156.109643-1-andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Cohen <david.a.cohen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

First of all, add an optional binding for external muxer which might be
used.

Second, update GPIO pin names in extcon-intel-int3496.c driver to follow
the existing binding.

Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt | 3 +++
 drivers/extcon/extcon-intel-int3496.c                        | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
index dfc14f71e81f..9d97472ae51d 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
@@ -10,6 +10,9 @@ Either one of id-gpio or vbus-gpio must be present. Both can be present as well.
 - id-gpio: gpio for USB ID pin. See gpio binding.
 - vbus-gpio: gpio for USB VBUS pin.
 
+Optional properties:
+- mux-gpios: gpio for USB external muxer
+
 Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed below:
 	extcon_usb1 {
 		compatible = "linux,extcon-usb-gpio";
diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
index 38eb6cab938f..81713bf7487e 100644
--- a/drivers/extcon/extcon-intel-int3496.c
+++ b/drivers/extcon/extcon-intel-int3496.c
@@ -105,13 +105,13 @@ static int int3496_probe(struct platform_device *pdev)
 		return data->usb_id_irq;
 	}
 
-	data->gpio_vbus_en = devm_gpiod_get_index(dev, "vbus en",
+	data->gpio_vbus_en = devm_gpiod_get_index(dev, "vbus",
 						 INT3496_GPIO_VBUS_EN,
 						 GPIOD_ASIS);
 	if (IS_ERR(data->gpio_vbus_en))
 		dev_info(dev, "can't request VBUS EN GPIO\n");
 
-	data->gpio_usb_mux = devm_gpiod_get_index(dev, "usb mux",
+	data->gpio_usb_mux = devm_gpiod_get_index(dev, "mux",
 						 INT3496_GPIO_USB_MUX,
 						 GPIOD_ASIS);
 	if (IS_ERR(data->gpio_usb_mux))
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
