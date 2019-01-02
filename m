From: Tony Xie <tony.xie@rock-chips.com>
Subject: [PATCH v7 1/6] mfd: rk808: remove the id_table
Date: Wed,  2 Jan 2019 05:19:57 -0500
Message-ID: <20190102102002.29245-2-tony.xie@rock-chips.com>
References: <20190102102002.29245-1-tony.xie@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190102102002.29245-1-tony.xie@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: broonie@kernel.org, lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, chenjh@rock-chips.com, xsf@rock-chips.com, zhangqing@rock-chips.com, huangtao@rock-chips.com, tony.xie@rock-chips.com
List-Id: devicetree@vger.kernel.org

Remove the id_table because it's not used.

Signed-off-by: Tony Xie <tony.xie@rock-chips.com>
---
 drivers/mfd/rk808.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
index 216fbf6adec9..94377782d208 100644
--- a/drivers/mfd/rk808.c
+++ b/drivers/mfd/rk808.c
@@ -568,14 +568,6 @@ static int rk808_remove(struct i2c_client *client)
 	return 0;
 }
 
-static const struct i2c_device_id rk808_ids[] = {
-	{ "rk805" },
-	{ "rk808" },
-	{ "rk818" },
-	{ },
-};
-MODULE_DEVICE_TABLE(i2c, rk808_ids);
-
 static struct i2c_driver rk808_i2c_driver = {
 	.driver = {
 		.name = "rk808",
@@ -583,7 +575,6 @@ static struct i2c_driver rk808_i2c_driver = {
 	},
 	.probe    = rk808_probe,
 	.remove   = rk808_remove,
-	.id_table = rk808_ids,
 };
 
 module_i2c_driver(rk808_i2c_driver);
-- 
2.17.1
