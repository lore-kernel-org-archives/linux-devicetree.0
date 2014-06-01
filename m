From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] pinctrl: pinctrl-abx500.c:  Cleaning up uninitialized variables
Date: Sun,  1 Jun 2014 14:54:00 +0200
Message-ID: <1401627240-16524-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There is a risk that the variable will be used without being initialized.

This was largely found by using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 drivers/pinctrl/pinctrl-abx500.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-abx500.c b/drivers/pinctrl/pinctrl-abx500.c
index 163da9c..57802be 100644
--- a/drivers/pinctrl/pinctrl-abx500.c
+++ b/drivers/pinctrl/pinctrl-abx500.c
@@ -164,7 +164,7 @@ static int abx500_gpio_set_bits(struct gpio_chip *chip, u8 reg,
 static int abx500_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct abx500_pinctrl *pct = to_abx500_pinctrl(chip);
-	bool bit;
+	bool bit = 0;
 	bool is_out;
 	u8 gpio_offset = offset - 1;
 	int ret;
-- 
1.7.10.4
