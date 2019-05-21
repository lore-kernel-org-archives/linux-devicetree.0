From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH v2 1/3] mfd: bd718x7: Remove hardcoded config for button press
 duration
Date: Tue, 21 May 2019 20:41:12 +0000
Message-ID: <3afb20a0e4b14588d9fc6af7bd86920127feeba2.1558471150.git.leonard.crestez@nxp.com>
References: <cover.1558471150.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1558471150.git.leonard.crestez@nxp.com>
Content-Language: en-US
Content-ID: <890B93925C7E29428C5069DFFEABA9D6@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Angus Ainslie <angus@akkea.ca>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Robin Gong <yibin.gong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

The reset button on imx8mm-evk is tied to PWRON_B pin of bd71847 and the
long press duration is set to zero from OTP. The linux driver overrides
those values and breaks reset from button.

Overwriting OTP or bootloader configuration with some hardcoded defaults
is not desirable, keep already programmed values instead.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
Acked-By: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/mfd/rohm-bd718x7.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index a29d529a96f4..cdbef83884f0 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -115,33 +115,10 @@ static int bd718xx_i2c_probe(struct i2c_client *i2c,
 	if (ret) {
 		dev_err(&i2c->dev, "Failed to add irq_chip\n");
 		return ret;
 	}
 
-	/* Configure short press to 10 milliseconds */
-	ret = regmap_update_bits(bd718xx->regmap,
-				 BD718XX_REG_PWRONCONFIG0,
-				 BD718XX_PWRBTN_PRESS_DURATION_MASK,
-				 BD718XX_PWRBTN_SHORT_PRESS_10MS);
-	if (ret) {
-		dev_err(&i2c->dev,
-			"Failed to configure button short press timeout\n");
-		return ret;
-	}
-
-	/* Configure long press to 10 seconds */
-	ret = regmap_update_bits(bd718xx->regmap,
-				 BD718XX_REG_PWRONCONFIG1,
-				 BD718XX_PWRBTN_PRESS_DURATION_MASK,
-				 BD718XX_PWRBTN_LONG_PRESS_10S);
-
-	if (ret) {
-		dev_err(&i2c->dev,
-			"Failed to configure button long press timeout\n");
-		return ret;
-	}
-
 	ret = regmap_irq_get_virq(bd718xx->irq_data, BD718XX_INT_PWRBTN_S);
 
 	if (ret < 0) {
 		dev_err(&i2c->dev, "Failed to get the IRQ\n");
 		return ret;
-- 
2.17.1
