From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH 2/6] usb: bdc: Cleanup clock support
Date: Thu, 20 Jun 2019 17:09:47 -0400
Message-ID: <1561064991-16874-3-git-send-email-alcooperx@gmail.com>
References: <1561064991-16874-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561064991-16874-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

- Fix driver to defer on clk_get defer

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/usb/gadget/udc/bdc/bdc_core.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index ccbd1d34eb2a..11a43de6c1c6 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -490,8 +490,14 @@ static int bdc_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "%s()\n", __func__);
 
+	bdc = devm_kzalloc(dev, sizeof(*bdc), GFP_KERNEL);
+	if (!bdc)
+		return -ENOMEM;
+
 	clk = devm_clk_get(dev, "sw_usbd");
 	if (IS_ERR(clk)) {
+		if (PTR_ERR(clk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
 		dev_info(dev, "Clock not found in Device Tree\n");
 		clk = NULL;
 	}
@@ -501,11 +507,6 @@ static int bdc_probe(struct platform_device *pdev)
 		dev_err(dev, "could not enable clock\n");
 		return ret;
 	}
-
-	bdc = devm_kzalloc(dev, sizeof(*bdc), GFP_KERNEL);
-	if (!bdc)
-		return -ENOMEM;
-
 	bdc->clk = clk;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -551,7 +552,7 @@ static int bdc_probe(struct platform_device *pdev)
 	ret = bdc_phy_init(bdc);
 	if (ret) {
 		dev_err(bdc->dev, "BDC phy init failure:%d\n", ret);
-		return ret;
+		goto clk_cleanup;
 	}
 
 	temp = bdc_readl(bdc->regs, BDC_BDCCAP1);
@@ -583,6 +584,8 @@ static int bdc_probe(struct platform_device *pdev)
 	bdc_hw_exit(bdc);
 phycleanup:
 	bdc_phy_exit(bdc);
+clk_cleanup:
+	clk_disable_unprepare(bdc->clk);
 	return ret;
 }
 
-- 
1.9.0.138.g2de3478
