From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH -next 2/3] usb: mtu3: make the reference clock optional
Date: Tue, 7 Feb 2017 14:13:32 +0800
Message-ID: <1486448013-8784-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1486448013-8784-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486448013-8784-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Make the reference clock optional for DTS backward compatibility
and ignore the error if it does not exist.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/mtu3/mtu3_plat.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 19a345d..c3125da 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -225,10 +225,17 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 		return PTR_ERR(ssusb->sys_clk);
 	}
 
+	/*
+	 * reference clock is usually a "fixed-clock", make it optional
+	 * for backward compatibility and ignore the error if it does
+	 * not exist.
+	 */
 	ssusb->ref_clk = devm_clk_get(dev, "ref_ck");
 	if (IS_ERR(ssusb->ref_clk)) {
-		dev_err(dev, "failed to get ref clock\n");
-		return PTR_ERR(ssusb->ref_clk);
+		if (PTR_ERR(ssusb->ref_clk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		ssusb->ref_clk = NULL;
 	}
 
 	ssusb->num_phys = of_count_phandle_with_args(node,
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
