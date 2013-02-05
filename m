From: Andreas Larsson <andreas@gaisler.com>
Subject: [PATCH 1/2] gpio: gpio-generic: Fix bug in big endian bit conversion
Date: Tue,  5 Feb 2013 11:33:02 +0100
Message-ID: <1360060383-16880-2-git-send-email-andreas@gaisler.com>
References: <1360060383-16880-1-git-send-email-andreas@gaisler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360060383-16880-1-git-send-email-andreas@gaisler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

The swap to convert LE to BE in bgpio_pin2mask_be should be on byte level, not
on bit level.

Signed-off-by: Andreas Larsson <andreas@gaisler.com>
---
 drivers/gpio/gpio-generic.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index 05fcc0f..7f11537 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -112,7 +112,10 @@ static unsigned long bgpio_pin2mask(struct bgpio_chip *bgc, unsigned int pin)
 static unsigned long bgpio_pin2mask_be(struct bgpio_chip *bgc,
 				       unsigned int pin)
 {
-	return 1 << (bgc->bits - 1 - pin);
+	unsigned int bit = pin & 0x7; /* Bit number within byte */
+	unsigned int base = pin - bit; /* Pin that is bit 0 within byte */
+
+	return 1 << ((bgc->bits - base - 8) + bit); /* shifted base + bit */
 }
 
 static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
-- 
1.7.0.4
