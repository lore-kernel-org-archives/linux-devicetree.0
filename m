From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] extcon: int3496: Propagate error code of gpiod_to_irq()
Date: Thu, 23 Feb 2017 12:31:54 +0200
Message-ID: <20170223103156.109643-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, David Cohen <david.a.cohen@intel.com>, Felipe Balbi <balbi@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: devicetree@vger.kernel.org

gpiod_to_irq() doesn't return 0. Thus, we just adjust condition and
replace -EINVAL by actual error code it returns.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/extcon/extcon-intel-int3496.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
index a3131b036de6..38eb6cab938f 100644
--- a/drivers/extcon/extcon-intel-int3496.c
+++ b/drivers/extcon/extcon-intel-int3496.c
@@ -100,9 +100,9 @@ static int int3496_probe(struct platform_device *pdev)
 	}
 
 	data->usb_id_irq = gpiod_to_irq(data->gpio_usb_id);
-	if (data->usb_id_irq <= 0) {
+	if (data->usb_id_irq < 0) {
 		dev_err(dev, "can't get USB ID IRQ: %d\n", data->usb_id_irq);
-		return -EINVAL;
+		return data->usb_id_irq;
 	}
 
 	data->gpio_vbus_en = devm_gpiod_get_index(dev, "vbus en",
-- 
2.11.0
