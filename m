From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] rtc: pcf8563: disable CLKOUT
Date: Tue, 13 Oct 2015 07:08:58 +0200
Message-ID: <1444712938-22865-1-git-send-email-hs@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Georg.Soffel-k21M0aUVSxZWk0Htik3J/w@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Disable the CLKOUT of the RTC after power-up.
After power-up/reset of the RTC, CLKOUT is enabled by default,
with CLKOUT enabled the RTC chip has 2-3 times higher power
consumption. If you do not need CLKOUT, you can disable the
CLKOUT with setting "disable-clkout" property.

Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
---

 Documentation/devicetree/bindings/rtc/pcf8563.txt | 22 ++++++++++++++
 drivers/rtc/rtc-pcf8563.c                         | 37 +++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/pcf8563.txt

diff --git a/Documentation/devicetree/bindings/rtc/pcf8563.txt b/Documentation/devicetree/bindings/rtc/pcf8563.txt
new file mode 100644
index 0000000..36f49e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/pcf8563.txt
@@ -0,0 +1,22 @@
+* Philips PCF8563/Epson RTC8564 Real Time Clock
+
+Philips PCF8563/Epson RTC8564 Real Time Clock
+
+Required properties:
+see: Documentation/devicetree/bindings/i2c/trivial-devices.txt
+
+Optional property:
+- disable-clkout:
+  disable the CLKOUT of the RTC after power-up.
+  After power-up/reset of the RTC, CLKOUT is enabled by default,
+  with CLKOUT enabled the RTC chip has 2-3 times higher power
+  consumption. If you not need CLKOUT, you can disable the CLKOUT
+  with setting this property.
+
+Example:
+
+pcf8563@51 {
+	compatible = "nxp,pcf8563";
+	reg = <0x51>;
+	disable-clkout;
+};
diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index e569243..fa9a412 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -53,6 +53,7 @@
 
 #define PCF8563_SC_LV		0x80 /* low voltage */
 #define PCF8563_MO_C		0x80 /* century */
+#define PCF8563_CLKOUT		0x80 /* CLKOUT */
 
 static struct i2c_driver pcf8563_driver;
 
@@ -74,6 +75,7 @@ struct pcf8563 {
 	 */
 	int c_polarity;	/* 0: MO_C=1 means 19xx, otherwise MO_C=1 means 20xx */
 	int voltage_low; /* incicates if a low_voltage was detected */
+	int disable_clkout;
 
 	struct i2c_client *client;
 };
@@ -186,6 +188,33 @@ static irqreturn_t pcf8563_irq(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
+static int pcf8563_disable_clkout(struct i2c_client *client)
+{
+	struct pcf8563 *pcf8563 = i2c_get_clientdata(client);
+	unsigned char buf;
+	int err;
+
+	if (!pcf8563->disable_clkout)
+		return 0;
+
+	err = pcf8563_read_block_data(client, PCF8563_REG_CLKO, 1, &buf);
+	if (err)
+		return err;
+
+	if (buf & PCF8563_CLKOUT) {
+		buf = 0x00;
+		dev_warn(&client->dev, "CLKOUT enabled! Disabling it...\n");
+		err = pcf8563_write_block_data(client, PCF8563_REG_CLKO, 1,
+				       &buf);
+		if (err < 0)
+			dev_err(&client->dev, "could not disable clock\n");
+	} else {
+		dev_info(&client->dev, "CLKOUT disabled.\n");
+	}
+
+	return 0;
+}
+
 /*
  * In the routines that deal directly with the pcf8563 hardware, we use
  * rtc_time -- month 0-11, hour 0-23, yr = calendar year-epoch.
@@ -235,6 +264,7 @@ static int pcf8563_get_datetime(struct i2c_client *client, struct rtc_time *tm)
 		tm->tm_sec, tm->tm_min, tm->tm_hour,
 		tm->tm_mday, tm->tm_mon, tm->tm_year, tm->tm_wday);
 
+	pcf8563_disable_clkout(client);
 	return 0;
 }
 
@@ -406,6 +436,9 @@ static int pcf8563_probe(struct i2c_client *client,
 	int err;
 	unsigned char buf;
 	unsigned char alm_pending;
+#ifdef CONFIG_OF
+	int len;
+#endif
 
 	dev_dbg(&client->dev, "%s\n", __func__);
 
@@ -419,6 +452,10 @@ static int pcf8563_probe(struct i2c_client *client,
 
 	dev_info(&client->dev, "chip found, driver version " DRV_VERSION "\n");
 
+#ifdef CONFIG_OF
+	if (of_find_property(client->dev.of_node, "disable-clkout", &len))
+		pcf8563->disable_clkout = 1;
+#endif
 	i2c_set_clientdata(client, pcf8563);
 	pcf8563->client = client;
 	device_set_wakeup_capable(&client->dev, 1);
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
