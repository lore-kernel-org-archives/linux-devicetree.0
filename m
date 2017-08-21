From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v9 RESEND 1/9] mfd: rk808: fix up the chip id get failed
Date: Mon, 21 Aug 2017 03:28:34 +0200
Message-ID: <20170821012842.17875-2-heiko@sntech.de>
References: <20170821012842.17875-1-heiko@sntech.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170821012842.17875-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: chenjh@rock-chips.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

From: Elaine Zhang <zhangqing@rock-chips.com>

the rk8xx chip id is:
((MSB << 8) | LSB) & 0xfff0

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/mfd/rk808.c       | 21 +++++++++++++++------
 include/linux/mfd/rk808.h |  1 +
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
index fd087cbb0bde..8e60ebaeaadb 100644
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
+	/* Read chip variant */
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
+	dev_info(&client->dev, "chip id: 0x%x\n", (unsigned int)rk808->variant);
 
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
2.14.1
