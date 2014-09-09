From: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 5/5] extcon: gpio: Add support for using cable names
Date: Tue, 9 Sep 2014 09:44:38 +0530
Message-ID: <1410236078-11713-6-git-send-email-george.cherian@ti.com>
References: <1410236078-11713-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410236078-11713-1-git-send-email-george.cherian-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rongjun.ying-kQvG35nSl+M@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for using cable names. Enables other drivers to register interest
and get notified using extcon provided notifier call backs.

Signed-off-by: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
---
 Documentation/devicetree/bindings/extcon/extcon-gpio.txt | 2 ++
 drivers/extcon/extcon-gpio.c                             | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
index 30aa2e1..2c9d29f 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
@@ -7,6 +7,7 @@ Required Properties:
  - compatible: should be:
 	* "linux,extcon-gpio"
  - gpios: specifies the gpio pin used.
+ - cable-name: Name of the cable used.
 
 Optional Properties:
  - debounce: Debounce time for GPIO IRQ in ms
@@ -18,4 +19,5 @@ Eg:
 		compatible = "linux,extcon-gpio";
 		gpios = <&gpio3 12 GPIO_ACTIVE_HIGH>;
 		debounce = <20>;
+		cable-name = "USB-HOST";
 		};
diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index 3839749..c0ab8e7 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -42,6 +42,7 @@ struct gpio_extcon_data {
 	struct delayed_work work;
 	unsigned long debounce_jiffies;
 	bool check_on_resume;
+	const char *cable_name[1];
 };
 
 static void gpio_extcon_work(struct work_struct *work)
@@ -111,6 +112,9 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 		of_property_read_u32(np, "debounce", &debounce);
 		irq = gpiod_to_irq(extcon_data->gpiod);
 		irq_flags = irq_get_trigger_type(irq);
+		of_property_read_string_index(np, "cable-name", 0,
+					      extcon_data->cable_name);
+		extcon_data->edev->supported_cable = extcon_data->cable_name;
 	} else {
 		if (!pdata)
 			return -EBUSY;
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
