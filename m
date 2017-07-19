From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V2 3/9] usb: bdc: Add clock enable for new chips with a separate BDC clock
Date: Wed, 19 Jul 2017 15:11:42 -0400
Message-ID: <1500491508-9783-4-git-send-email-alcooperx@gmail.com>
References: <1500491508-9783-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500491508-9783-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Newer SoC's have added a BDC clock to the Device Tree, so get
and enable it.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/usb/gadget/udc/bdc/bdc_core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index e9bd8d4..dda7b43 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -27,6 +27,7 @@
 #include <linux/moduleparam.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
+#include <linux/clk.h>
 
 #include "bdc.h"
 #include "bdc_dbg.h"
@@ -452,8 +453,22 @@ static int bdc_probe(struct platform_device *pdev)
 	int irq;
 	u32 temp;
 	struct device *dev = &pdev->dev;
+	struct clk *clk;
 
 	dev_dbg(dev, "%s()\n", __func__);
+
+	clk = devm_clk_get(dev, "sw_usbd");
+	if (IS_ERR(clk)) {
+		dev_info(dev, "Clock not found in Device Tree\n");
+		clk = NULL;
+	}
+
+	ret = clk_prepare_enable(clk);
+	if (ret) {
+		dev_err(dev, "could not enable clock\n");
+		return ret;
+	}
+
 	bdc = devm_kzalloc(dev, sizeof(*bdc), GFP_KERNEL);
 	if (!bdc)
 		return -ENOMEM;
-- 
1.9.0.138.g2de3478
