From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH 3/6] usb: bdc: driver may fail to get USB PHY
Date: Thu, 20 Jun 2019 17:09:48 -0400
Message-ID: <1561064991-16874-4-git-send-email-alcooperx@gmail.com>
References: <1561064991-16874-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561064991-16874-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Initialization order is important for the USB PHY and the PHY clients.
The init order is based on the build order of the drivers in the
makefiles and the PHY drivers are built early to help with
dependencies, but the new SCMI based clock subsystem has the side
effect of making some additional drivers DEFER until the clock
is ready. This is causing the USB PHY driver to defer which is causing
some PHY clients to fail when they try to get the PHY. The fix is to have
the client driver return DEFER when it's "get phy" routine returns DEFER.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/usb/gadget/udc/bdc/bdc_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 11a43de6c1c6..c794890d785b 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -543,9 +543,13 @@ static int bdc_probe(struct platform_device *pdev)
 			dev, dev->of_node, phy_num);
 		if (IS_ERR(bdc->phys[phy_num])) {
 			ret = PTR_ERR(bdc->phys[phy_num]);
+			if (ret == -EPROBE_DEFER) {
+				dev_dbg(bdc->dev, "DEFER, waiting for PHY\n");
+				return ret;
+			}
 			dev_err(bdc->dev,
 				"BDC phy specified but not found:%d\n", ret);
-			return ret;
+			goto clk_cleanup;
 		}
 	}
 
-- 
1.9.0.138.g2de3478
