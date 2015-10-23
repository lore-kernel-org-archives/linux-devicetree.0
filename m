From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 9/9] NFC: nfcmrvl: update device tree bindings for Marvell NFC
Date: Fri, 23 Oct 2015 14:23:06 +0200
Message-ID: <1445602986-3254-10-git-send-email-cuissard@marvell.com>
References: <1445602986-3254-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445602986-3254-1-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Align NFC bindgins to use marvell instead of mrvl.

Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt | 12 ++++++------
 drivers/nfc/nfcmrvl/i2c.c                             |  2 +-
 drivers/nfc/nfcmrvl/spi.c                             |  2 +-
 drivers/nfc/nfcmrvl/uart.c                            |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
index 41058fc..0f95924 100644
--- a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
+++ b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
@@ -2,9 +2,9 @@
 
 Required properties:
 - compatible: Should be:
-  - "mrvl,nfc-uart" for UART devices
-  - "mrvl,nfc-i2c" for I2C devices
-  - "mrvl,nfc-spi" for SPI devices
+  - "marvell,nfc-uart" for UART devices
+  - "marvell,nfc-i2c" for I2C devices
+  - "marvell,nfc-spi" for SPI devices
 
 Optional SoC specific properties:
 - pinctrl-names: Contains only one value - "default".
@@ -28,7 +28,7 @@ Example (for ARM-based BeagleBoard Black with 88W8887 on UART5):
 	status = "okay";
 
 	nfcmrvluart: nfcmrvluart@5 {
-		compatible = "mrvl,nfc-uart";
+		compatible = "marvell,nfc-uart";
 
 		reset-n-io = <&gpio3 16 0>;
 
@@ -45,7 +45,7 @@ Example (for ARM-based BeagleBoard Black with 88W8887 on I2C1):
 	clock-frequency = <400000>;
 
 	nfcmrvli2c0: i2c@1 {
-		compatible = "mrvl,nfc-i2c";
+		compatible = "marvell,nfc-i2c";
 
 		reg = <0x8>;
 
@@ -67,7 +67,7 @@ Example (for ARM-based BeagleBoard Black on SPI0):
 &spi0 {
 
 	mrvlnfcspi0: spi@0 {
-		compatible = "mrvl,nfc-spi";
+		compatible = "marvell,nfc-spi";
 
 		reg = <0>;
 
diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index acc721f..4dae227 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -262,7 +262,7 @@ static int nfcmrvl_i2c_remove(struct i2c_client *client)
 
 
 static const struct of_device_id of_nfcmrvl_i2c_match[] = {
-	{ .compatible = "mrvl,nfc-i2c", },
+	{ .compatible = "marvell,nfc-i2c", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, of_nfcmrvl_i2c_match);
diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index 19154c8..cd1da85 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -197,7 +197,7 @@ static int nfcmrvl_spi_remove(struct spi_device *spi)
 }
 
 static const struct of_device_id of_nfcmrvl_spi_match[] = {
-	{ .compatible = "mrvl,nfc-spi", },
+	{ .compatible = "marvell,nfc-spi", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, of_nfcmrvl_spi_match);
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 4dccee2..d8fdbaa 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -75,7 +75,7 @@ static int nfcmrvl_uart_parse_dt(struct device_node *node,
 	struct device_node *matched_node;
 	int ret;
 
-	matched_node = of_find_compatible_node(node, NULL, "mrvl,nfc-uart");
+	matched_node = of_find_compatible_node(node, NULL, "marvell,nfc-uart");
 	if (!matched_node)
 		return -ENODEV;
 
-- 
2.2.0.33.gc18b867

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
