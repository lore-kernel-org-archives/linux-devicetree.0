From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 08/13] gpio-sx150x: Replace 'reset_during_probe" with DT binding
Date: Mon, 17 Oct 2016 07:27:03 -0700
Message-ID: <1476714428-11264-9-git-send-email-andrew.smirnov@gmail.com>
References: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/gpio/gpio-sx150x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index b751ff9..a63f6ea 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -90,13 +90,9 @@ struct sx150x_device_data {
  *                instead of as an oscillator, increasing the size of the
  *                GP(I)O pool created by this expander by one.  The
  *                output-only GPO pin will be added at the end of the block.
- * @reset_during_probe: If set to true, the driver will trigger a full
- *                      reset of the chip at the beginning of the probe
- *                      in order to place it in a known state.
  */
 struct sx150x_platform_data {
 	bool     oscio_is_gpo;
-	bool     reset_during_probe;
 };
 
 struct sx150x_chip {
@@ -606,7 +602,8 @@ static int sx150x_init_hw(struct sx150x_chip *chip,
 	u32 io_pullup   = 0;
 	int err = 0;
 
-	if (pdata->reset_during_probe) {
+	if (of_property_read_bool(chip->client->dev.of_node,
+				  "semtech,reset-during-probe")) {
 		err = sx150x_reset(chip);
 		if (err < 0)
 			return err;
-- 
2.5.5
