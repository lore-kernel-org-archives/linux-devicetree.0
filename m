From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 3/5] mfd: axp20x: Support AXP806 in I2C mode
Date: Wed, 20 Jun 2018 13:15:38 +0800
Message-ID: <20180620051540.25617-4-wens@csie.org>
References: <20180620051540.25617-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180620051540.25617-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The Pine64 H64 board uses an AXP806 PMIC in I2C and self-working mode.
The H64 SoC does not have the usual RSB controller.

This patch adds AXP806 to the list of devices supported in I2C mode.
In theory, all RSB-based PMICs can also be used in I2C mode.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/mfd/axp20x-i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index d35a5fe6c950..a7b7c5423ea5 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -65,6 +65,7 @@ static const struct of_device_id axp20x_i2c_of_match[] = {
 	{ .compatible = "x-powers,axp202", .data = (void *)AXP202_ID },
 	{ .compatible = "x-powers,axp209", .data = (void *)AXP209_ID },
 	{ .compatible = "x-powers,axp221", .data = (void *)AXP221_ID },
+	{ .compatible = "x-powers,axp806", .data = (void *)AXP806_ID },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
@@ -74,6 +75,7 @@ static const struct i2c_device_id axp20x_i2c_id[] = {
 	{ "axp202", 0 },
 	{ "axp209", 0 },
 	{ "axp221", 0 },
+	{ "axp806", 0 },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
-- 
2.17.1
