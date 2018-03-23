From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 3/5] gpiolib: Change bitmap allocation to kmalloc_array
Date: Fri, 23 Mar 2018 09:34:51 -0700
Message-ID: <20180323163453.96495-4-swboyd@chromium.org>
References: <20180323163453.96495-1-swboyd@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323163453.96495-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Timur Tabi <timur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: devicetree@vger.kernel.org

We don't need to clear out these bits when we set them immediately
after. Use kmalloc_array() to skip clearing the bits.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cc0e1519da45..db3788d17ba0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -341,7 +341,7 @@ static unsigned long *gpiochip_allocate_mask(struct gpio_chip *chip)
 {
 	unsigned long *p;
 
-	p = kcalloc(BITS_TO_LONGS(chip->ngpio), sizeof(long), GFP_KERNEL);
+	p = kmalloc_array(BITS_TO_LONGS(chip->ngpio), sizeof(*p), GFP_KERNEL);
 	if (!p)
 		return NULL;
 
-- 
Sent by a computer through tubes
