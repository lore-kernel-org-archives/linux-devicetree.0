From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 1/3] pinctrl: sx150x: use correct registers for reg_sense (sx1502 and sx1508)
Date: Thu, 24 Nov 2016 21:45:18 +0100
Message-ID: <1480020320-28354-2-git-send-email-peda@axentia.se>
References: <1480020320-28354-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480020320-28354-1-git-send-email-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

All other registers on these chips are 8-bit, but reg_sense is 16-bits
and therefore needs to be moved down one notch.
This was apparently overlooked in the conversion to regmap, which only
updated the register locations for the 16-bit chips.

Fixes: 6489677f86c3 ("pinctrl-sx150x: Replace sx150x_*_cfg by means of regmap API")
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/pinctrl/pinctrl-sx150x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index f9e559e22537..a19c814843aa 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -156,7 +156,7 @@ static const struct sx150x_device_data sx1508q_device_data = {
 	.reg_data	= 0x08,
 	.reg_irq_mask	= 0x09,
 	.reg_irq_src	= 0x0c,
-	.reg_sense	= 0x0b,
+	.reg_sense	= 0x0a,
 	.pri.x789 = {
 		.reg_drain	= 0x05,
 		.reg_polarity	= 0x06,
@@ -221,7 +221,7 @@ static const struct sx150x_device_data sx1502q_device_data = {
 	.reg_data	= 0x00,
 	.reg_irq_mask	= 0x05,
 	.reg_irq_src	= 0x08,
-	.reg_sense	= 0x07,
+	.reg_sense	= 0x06,
 	.pri.x123 = {
 		.reg_pld_mode	= 0x10,
 		.reg_pld_table0	= 0x11,
-- 
2.1.4
