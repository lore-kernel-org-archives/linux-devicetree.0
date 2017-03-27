From: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v5 1/7] mfd: rk808: fix up the chip id get failed
Date: Mon, 27 Mar 2017 14:21:39 +0800
Message-ID: <1490595705-28844-2-git-send-email-zhangqing@rock-chips.com>
References: <1490595705-28844-1-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1490595705-28844-1-git-send-email-zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org, chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

the rk8xx chip id is:
((MSB << 8) | LSB) & 0xfff0

Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
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
