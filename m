From: Matheus Castello <matheus@castello.eng.br>
Subject: [PATCH v3 4/5] power: supply: max17040: Clear ALRT bit when the SOC are above threshold
Date: Sun, 26 May 2019 23:22:57 -0300
Message-ID: <20190527022258.32748-5-matheus@castello.eng.br>
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

In order to not generate duplicate interrupts we clear the ALRT bit when
the SOC is in a state that shows that the battery is charged above the set
threshold for the SOC low level alert.

Signed-off-by: Matheus Castello <matheus@castello.eng.br>
---
 drivers/power/supply/max17040_battery.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/power/supply/max17040_battery.c b/drivers/power/supply/max17040_battery.c
index 2f4851608cfe..61e6fcfea8a1 100644
--- a/drivers/power/supply/max17040_battery.c
+++ b/drivers/power/supply/max17040_battery.c
@@ -48,6 +48,7 @@ struct max17040_chip {
 	int status;
 	/* Low alert threshold from 32% to 1% of the State of Charge */
 	u32 low_soc_alert_threshold;
+	int alert_bit;
 };

 static int max17040_get_property(struct power_supply *psy,
@@ -107,6 +108,7 @@ static void max17040_reset(struct i2c_client *client)
 static int max17040_set_low_soc_threshold_alert(struct i2c_client *client,
 	u32 level)
 {
+	struct max17040_chip *chip = i2c_get_clientdata(client);
 	int ret;
 	u16 data;

@@ -118,6 +120,7 @@ static int max17040_set_low_soc_threshold_alert(struct i2c_client *client,
 		data &= MAX17040_ATHD_MASK;
 		data |= level;
 		max17040_write_reg(client, MAX17040_RCOMP, data);
+		chip->alert_bit = 0;
 		ret = 0;
 	} else {
 		ret = -EINVAL;
@@ -144,6 +147,11 @@ static void max17040_get_soc(struct i2c_client *client)
 	soc = max17040_read_reg(client, MAX17040_SOC);

 	chip->soc = (soc >> 8);
+
+	/* check SOC level to clear ALRT bit */
+	if (chip->soc > chip->low_soc_alert_threshold && chip->alert_bit)
+		max17040_set_low_soc_threshold_alert(client,
+			chip->low_soc_alert_threshold);
 }

 static void max17040_get_version(struct i2c_client *client)
@@ -229,6 +237,9 @@ static irqreturn_t max17040_thread_handler(int id, void *dev)
 	/* send uevent */
 	power_supply_changed(chip->battery);

+	/* ALRT bit is seted */
+	chip->alert_bit = 1;
+
 	return IRQ_HANDLED;
 }

--
2.20.1
