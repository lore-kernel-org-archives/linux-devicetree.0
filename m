From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v3 1/5] mfd: rk808: fix up the chip id get failed
Date: Thu, 16 Mar 2017 10:15:00 +0800
Message-ID: <1489630504-11328-2-git-send-email-zhangqing@rock-chips.com>
References: <1489630504-11328-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489630504-11328-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org
Cc: huangtao@rock-chips.com, xxx@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, chenjh@rock-chips.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, w.egorov@phytec.de, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

the rk8xx chip id is:
((MSB << 8) | LSB) & 0xfff0

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 drivers/mfd/rk808.c       | 21 +++++++++++++++------
 include/linux/mfd/rk808.h |  1 +
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
index fd087cbb0bde..3334a2a7f3fb 100644
--- a/drivers/mfd/rk808.c
+++ b/drivers/mfd/rk808.c
@@ -325,7 +325,7 @@ static int rk808_probe(struct i2c_client *client,
 	void (*pm_pwroff_fn)(void);
 	int nr_pre_init_regs;
 	int nr_cells;
-	int pm_off = 0;
+	int pm_off = 0, msb, lsb;
 	int ret;
 	int i;
 
@@ -333,14 +333,23 @@ static int rk808_probe(struct i2c_client *client,
 	if (!rk808)
 		return -ENOMEM;
 
-	rk808->variant = i2c_smbus_read_word_data(client, RK808_ID_MSB);
-	if (rk808->variant < 0) {
-		dev_err(&client->dev, "Failed to read the chip id at 0x%02x\n",
+	/* read Chip variant */
+	msb = i2c_smbus_read_byte_data(client, RK808_ID_MSB);
+	if (msb < 0) {
+		dev_err(&client->dev, "failed to read the chip id at 0x%x\n",
 			RK808_ID_MSB);
-		return rk808->variant;
+		return msb;
 	}
 
-	dev_dbg(&client->dev, "Chip id: 0x%x\n", (unsigned int)rk808->variant);
+	lsb = i2c_smbus_read_byte_data(client, RK808_ID_LSB);
+	if (lsb < 0) {
+		dev_err(&client->dev, "failed to read the chip id at 0x%x\n",
+			RK808_ID_LSB);
+		return lsb;
+	}
+
+	rk808->variant = ((msb << 8) | lsb) & RK8XX_ID_MSK;
+	dev_info(&client->dev, "Chip id: 0x%x\n", (unsigned int)rk808->variant);
 
 	switch (rk808->variant) {
 	case RK808_ID:
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 83701ef7d3c7..54feb140c210 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -298,6 +298,7 @@ enum rk818_reg {
 #define VOUT_LO_INT	BIT(0)
 #define CLK32KOUT2_EN	BIT(0)
 
+#define RK8XX_ID_MSK			0xfff0
 enum {
 	BUCK_ILMIN_50MA,
 	BUCK_ILMIN_100MA,
-- 
1.9.1
