From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 05/10] gpio-sx150x: Replace "io_pull*_ena" with DT bindings
Date: Wed, 19 Oct 2016 07:04:01 -0700
Message-ID: <1476885846-16469-6-git-send-email-andrew.smirnov@gmail.com>
References: <1476885846-16469-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476885846-16469-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/gpio/gpio-sx150x.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index 9b62133..b751ff9 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -90,24 +90,12 @@ struct sx150x_device_data {
  *                instead of as an oscillator, increasing the size of the
  *                GP(I)O pool created by this expander by one.  The
  *                output-only GPO pin will be added at the end of the block.
- * @io_pullup_ena: A bit-mask which enables or disables the pull-up resistor
- *                 for each IO line in the expander.  Setting the bit at
- *                 position n will enable the pull-up for the IO at
- *                 the corresponding offset.  For chips with fewer than
- *                 16 IO pins, high-end bits are ignored.
- * @io_pulldn_ena: A bit-mask which enables-or disables the pull-down
- *                 resistor for each IO line in the expander. Setting the
- *                 bit at position n will enable the pull-down for the IO at
- *                 the corresponding offset.  For chips with fewer than
- *                 16 IO pins, high-end bits are ignored.
  * @reset_during_probe: If set to true, the driver will trigger a full
  *                      reset of the chip at the beginning of the probe
  *                      in order to place it in a known state.
  */
 struct sx150x_platform_data {
 	bool     oscio_is_gpo;
-	u16      io_pullup_ena;
-	u16      io_pulldn_ena;
 	bool     reset_during_probe;
 };
 
@@ -614,6 +602,8 @@ static int sx150x_reset(struct sx150x_chip *chip)
 static int sx150x_init_hw(struct sx150x_chip *chip,
 			struct sx150x_platform_data *pdata)
 {
+	u32 io_pulldown = 0;
+	u32 io_pullup   = 0;
 	int err = 0;
 
 	if (pdata->reset_during_probe) {
@@ -622,6 +612,14 @@ static int sx150x_init_hw(struct sx150x_chip *chip,
 			return err;
 	}
 
+	of_property_read_u32(chip->client->dev.of_node,
+			     "semtech,io-pullup",
+			     &io_pullup);
+
+	of_property_read_u32(chip->client->dev.of_node,
+			     "semtech,io-pulldown",
+			     &io_pulldown);
+
 	if (chip->dev_cfg->model == SX150X_789)
 		err = sx150x_i2c_write(chip->client,
 				chip->dev_cfg->pri.x789.reg_misc,
@@ -638,12 +636,12 @@ static int sx150x_init_hw(struct sx150x_chip *chip,
 		return err;
 
 	err = sx150x_init_io(chip, chip->dev_cfg->reg_pullup,
-			pdata->io_pullup_ena);
+			     io_pullup);
 	if (err < 0)
 		return err;
 
 	err = sx150x_init_io(chip, chip->dev_cfg->reg_pulldn,
-			pdata->io_pulldn_ena);
+			     io_pulldown);
 	if (err < 0)
 		return err;
 
-- 
2.5.5
