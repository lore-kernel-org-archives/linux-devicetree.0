From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 5/5] rtc: pcf85063: external capacitor configuration
Date: Fri,  7 Sep 2018 21:35:08 +0200
Message-ID: <20180907193508.24974-6-sam@ravnborg.org>
References: <20180822183555.GA24084@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180822183555.GA24084@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Jeffery <andrew@aj.id.au>, Fabio Estevam <fabio.estevam@nxp.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>
List-Id: devicetree@vger.kernel.org

From: Søren Andersen <san@skov.dk>

Add support for specifying the quartz load in the DT node.
The pcf85063 may use either a 7 pF or an 12.5 pF xtal.
If the rtc has the wrong configuration the time will
drift several hours/week.

If nothing is specified in DT then the factory default of 7 pF is used.

Signed-off-by: Søren Andersen <san@skov.dk>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf85063.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 283c2335b01b..38163446664f 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -27,6 +27,7 @@
 */
 
 #define PCF85063_REG_CTRL1		0x00 /* status */
+#define PCF85063_REG_CTRL1_CAP_SEL	BIT(0)
 #define PCF85063_REG_CTRL1_STOP		BIT(5)
 #define PCF85063_REG_CTRL2		0x01
 
@@ -180,6 +181,31 @@ static const struct rtc_class_ops pcf85063_rtc_ops = {
 	.set_time	= pcf85063_rtc_set_time
 };
 
+static int pcf85063_select_capacitance(struct i2c_client *client)
+{
+	int rc;
+	u8 reg;
+
+	rc = i2c_smbus_read_byte_data(client, PCF85063_REG_CTRL1);
+	if (rc < 0) {
+		dev_err(&client->dev, "Failing to read Control1 reg\n");
+		return -EIO;
+	}
+
+	if (device_property_present(&client->dev, "nxp,quartz_load_12.5pf"))
+		reg = rc |= PCF85063_REG_CTRL1_CAP_SEL;
+	else
+		reg = rc &= ~PCF85063_REG_CTRL1_CAP_SEL;
+
+	rc = i2c_smbus_write_byte_data(client, PCF85063_REG_CTRL1, reg);
+	if (rc < 0) {
+		dev_err(&client->dev, "Failing to configure device\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int pcf85063_probe(struct i2c_client *client,
 				const struct i2c_device_id *id)
 {
@@ -197,6 +223,11 @@ static int pcf85063_probe(struct i2c_client *client,
 		return err;
 	}
 
+	err = pcf85063_select_capacitance(client);
+	if (err < 0)
+		dev_warn(&client->dev,
+			 "Capacitance  setup failed. Trying to continue\n");
+
 	rtc = devm_rtc_device_register(&client->dev,
 				       pcf85063_driver.driver.name,
 				       &pcf85063_rtc_ops, THIS_MODULE);
-- 
2.12.0
