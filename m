From: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2] gpio-exar: Use correct property prefix and document
 bindings
Date: Wed, 19 Jul 2017 07:31:14 +0200
Message-ID: <dd5bb6b5-a6a7-a799-581f-b5fb83aa677b@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-gpio <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The device-specific property should be prefixed with the vendor name,
not "linux,", as Linus Walleij pointed out. Change this and document the
bindings of this platform device.

We didn't ship the old binding in a release yet. So we can still change
it without breaking an official API.

Fixes: 380b1e2f3a2f ("gpio-exar/8250-exar: Make set of exported GPIOs configurable")

Signed-off-by: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/gpio/gpio-exar.txt | 5 +++++
 drivers/gpio/gpio-exar.c                             | 2 +-
 drivers/tty/serial/8250/8250_exar.c                  | 4 ++--
 3 files changed, 8 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-exar.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-exar.txt b/Documentation/devicetree/bindings/gpio/gpio-exar.txt
new file mode 100644
index 000000000000..4540d61824af
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-exar.txt
@@ -0,0 +1,5 @@
+Exportable MPIO interface of Exar UART chips
+
+Required properties of the device:
+ - exar,first-pin: first exportable pins (0..15)
+ - ngpios: number of exportable pins (1..16)
diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index fb8d304cfa17..0ecd2369c2ca 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -132,7 +132,7 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	if (!p)
 		return -ENOMEM;
 
-	ret = device_property_read_u32(&pdev->dev, "linux,first-pin",
+	ret = device_property_read_u32(&pdev->dev, "exar,first-pin",
 				       &first_pin);
 	if (ret)
 		return ret;
diff --git a/drivers/tty/serial/8250/8250_exar.c b/drivers/tty/serial/8250/8250_exar.c
index b5c98e5bf524..c6360fbdf808 100644
--- a/drivers/tty/serial/8250/8250_exar.c
+++ b/drivers/tty/serial/8250/8250_exar.c
@@ -261,7 +261,7 @@ __xr17v35x_register_gpio(struct pci_dev *pcidev,
 }
 
 static const struct property_entry exar_gpio_properties[] = {
-	PROPERTY_ENTRY_U32("linux,first-pin", 0),
+	PROPERTY_ENTRY_U32("exar,first-pin", 0),
 	PROPERTY_ENTRY_U32("ngpios", 16),
 	{ }
 };
@@ -326,7 +326,7 @@ static int iot2040_rs485_config(struct uart_port *port,
 }
 
 static const struct property_entry iot2040_gpio_properties[] = {
-	PROPERTY_ENTRY_U32("linux,first-pin", 10),
+	PROPERTY_ENTRY_U32("exar,first-pin", 10),
 	PROPERTY_ENTRY_U32("ngpios", 1),
 	{ }
 };
-- 
2.12.3
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
