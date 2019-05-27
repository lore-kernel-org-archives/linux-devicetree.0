From: Matheus Castello <matheus@castello.eng.br>
Subject: [PATCH v3 3/5] power: supply: max17040: Config alert SOC low level threshold from FDT
Date: Sun, 26 May 2019 23:22:56 -0300
Message-ID: <20190527022258.32748-4-matheus@castello.eng.br>
References: <CAJKOXPf=nPrmw6Vzi_=LmO=dVsV4Gvoc-q75XP2FBEgm9Gxv0A@mail.gmail.com>
 <20190527022258.32748-1-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527022258.32748-1-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: sre@kernel.org, krzk@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, cw00.choi@samsung.com, b.zolnierkie@samsung.com, lee.jones@linaro.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matheus Castello <matheus@castello.eng.br>
List-Id: devicetree@vger.kernel.org

For configuration of fuel gauge alert for a low level state of charge
interrupt we add a function to config level threshold and a device tree
binding property to set it in flatned device tree node.

Now we can use "maxim,alert-low-soc-level" property with the values from
1% up to 32% to configure alert interrupt threshold.

Signed-off-by: Matheus Castello <matheus@castello.eng.br>
---
 drivers/power/supply/max17040_battery.c | 52 +++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/power/supply/max17040_battery.c b/drivers/power/supply/max17040_battery.c
index b7433e9ca7c2..2f4851608cfe 100644
--- a/drivers/power/supply/max17040_battery.c
+++ b/drivers/power/supply/max17040_battery.c
@@ -29,6 +29,9 @@
 #define MAX17040_DELAY		1000
 #define MAX17040_BATTERY_FULL	95

+#define MAX17040_ATHD_MASK		0xFFC0
+#define MAX17040_ATHD_DEFAULT_POWER_UP	4
+
 struct max17040_chip {
 	struct i2c_client		*client;
 	struct delayed_work		work;
@@ -43,6 +46,8 @@ struct max17040_chip {
 	int soc;
 	/* State Of Charge */
 	int status;
+	/* Low alert threshold from 32% to 1% of the State of Charge */
+	u32 low_soc_alert_threshold;
 };

 static int max17040_get_property(struct power_supply *psy,
@@ -99,6 +104,28 @@ static void max17040_reset(struct i2c_client *client)
 	max17040_write_reg(client, MAX17040_CMD, 0x0054);
 }

+static int max17040_set_low_soc_threshold_alert(struct i2c_client *client,
+	u32 level)
+{
+	int ret;
+	u16 data;
+
+	/* check if level is between 1% and 32% */
+	if (level > 0 && level < 33) {
+		level = 32 - level;
+		data = max17040_read_reg(client, MAX17040_RCOMP);
+		/* clear the alrt bit and set LSb 5 bits */
+		data &= MAX17040_ATHD_MASK;
+		data |= level;
+		max17040_write_reg(client, MAX17040_RCOMP, data);
+		ret = 0;
+	} else {
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
 static void max17040_get_vcell(struct i2c_client *client)
 {
 	struct max17040_chip *chip = i2c_get_clientdata(client);
@@ -161,6 +188,16 @@ static void max17040_get_status(struct i2c_client *client)
 		chip->status = POWER_SUPPLY_STATUS_FULL;
 }

+static void max17040_get_of_data(struct max17040_chip *chip)
+{
+	struct device *dev = &chip->client->dev;
+	struct device_node *np = dev->of_node;
+
+	if (of_property_read_u32(np, "maxim,alert-low-soc-level",
+			&chip->low_soc_alert_threshold))
+		chip->low_soc_alert_threshold = MAX17040_ATHD_DEFAULT_POWER_UP;
+}
+
 static void max17040_check_changes(struct i2c_client *client)
 {
 	max17040_get_vcell(client);
@@ -226,6 +263,7 @@ static int max17040_probe(struct i2c_client *client,

 	chip->client = client;
 	chip->pdata = client->dev.platform_data;
+	max17040_get_of_data(chip);

 	i2c_set_clientdata(client, chip);
 	psy_cfg.drv_data = chip;
@@ -243,12 +281,20 @@ static int max17040_probe(struct i2c_client *client,
 	/* check interrupt */
 	if (client->irq) {
 		int ret;
-		unsigned int flags;
+
+		ret = max17040_set_low_soc_threshold_alert(client,
+			chip->low_soc_alert_threshold);
+		if (ret) {
+			dev_err(&client->dev,
+				"Failed to set low SOC alert: err %d\n",
+				ret);
+			return ret;
+		}

 		dev_info(&client->dev, "IRQ: enabled\n");
-		flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 		ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
-						max17040_thread_handler, flags,
+						max17040_thread_handler,
+						(client->flags | IRQF_ONESHOT),
 						chip->battery->desc->name,
 						chip);

--
2.20.1
