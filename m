From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 04/13] gpio-sx150x: Replace 'io_polarity' with DT binding
Date: Mon, 17 Oct 2016 07:26:59 -0700
Message-ID: <1476714428-11264-5-git-send-email-andrew.smirnov@gmail.com>
References: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/gpio/gpio-sx150x.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index e01afd8..9b62133 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -100,11 +100,6 @@ struct sx150x_device_data {
  *                 bit at position n will enable the pull-down for the IO at
  *                 the corresponding offset.  For chips with fewer than
  *                 16 IO pins, high-end bits are ignored.
- * @io_polarity: A bit-mask which enables polarity inversion for each IO line
- *               in the expander.  Setting the bit at position n inverts
- *               the polarity of that IO line, while clearing it results
- *               in normal polarity. For chips with fewer than 16 IO pins,
- *               high-end bits are ignored.
  * @reset_during_probe: If set to true, the driver will trigger a full
  *                      reset of the chip at the beginning of the probe
  *                      in order to place it in a known state.
@@ -113,7 +108,6 @@ struct sx150x_platform_data {
 	bool     oscio_is_gpo;
 	u16      io_pullup_ena;
 	u16      io_pulldn_ena;
-	u16      io_polarity;
 	bool     reset_during_probe;
 };
 
@@ -654,9 +648,15 @@ static int sx150x_init_hw(struct sx150x_chip *chip,
 		return err;
 
 	if (chip->dev_cfg->model == SX150X_789) {
+		u32 io_polarity = 0;
+
+		of_property_read_u32(chip->client->dev.of_node,
+				     "semtech,io-polarity",
+				     &io_polarity);
+
 		err = sx150x_init_io(chip,
-				chip->dev_cfg->pri.x789.reg_polarity,
-				pdata->io_polarity);
+				     chip->dev_cfg->pri.x789.reg_polarity,
+				     (u16)io_polarity);
 		if (err < 0)
 			return err;
 	} else if (chip->dev_cfg->model == SX150X_456) {
-- 
2.5.5

