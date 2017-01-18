From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/6] usb: mtu3: get resources that cause deferred probe earlier
Date: Wed, 18 Jan 2017 14:08:22 +0800
Message-ID: <1484719707-12107-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some resources such as regulator, clock usually cause deferred
probe, get them earlier to avoid more ineffective processing.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/mtu3/mtu3_plat.c |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 7833678..6344859 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -204,6 +204,18 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	int i;
 	int ret;
 
+	ssusb->vusb33 = devm_regulator_get(&pdev->dev, "vusb33");
+	if (IS_ERR(ssusb->vusb33)) {
+		dev_err(dev, "failed to get vusb33\n");
+		return PTR_ERR(ssusb->vusb33);
+	}
+
+	ssusb->sys_clk = devm_clk_get(dev, "sys_ck");
+	if (IS_ERR(ssusb->sys_clk)) {
+		dev_err(dev, "failed to get sys clock\n");
+		return PTR_ERR(ssusb->sys_clk);
+	}
+
 	ssusb->num_phys = of_count_phandle_with_args(node,
 			"phys", "#phy-cells");
 	if (ssusb->num_phys > 0) {
@@ -230,18 +242,6 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 		return PTR_ERR(ssusb->ippc_base);
 	}
 
-	ssusb->vusb33 = devm_regulator_get(&pdev->dev, "vusb33");
-	if (IS_ERR(ssusb->vusb33)) {
-		dev_err(dev, "failed to get vusb33\n");
-		return PTR_ERR(ssusb->vusb33);
-	}
-
-	ssusb->sys_clk = devm_clk_get(dev, "sys_ck");
-	if (IS_ERR(ssusb->sys_clk)) {
-		dev_err(dev, "failed to get sys clock\n");
-		return PTR_ERR(ssusb->sys_clk);
-	}
-
 	ssusb->dr_mode = usb_get_dr_mode(dev);
 	if (ssusb->dr_mode == USB_DR_MODE_UNKNOWN) {
 		dev_err(dev, "dr_mode is error\n");
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
