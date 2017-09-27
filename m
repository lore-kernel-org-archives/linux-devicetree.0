From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/9] usb: xhci-mtk: check clock stability of U3_MAC
Date: Wed, 27 Sep 2017 17:22:59 +0800
Message-ID: <afc5cff346c5a349177990999df3dd7604966de4.1506503879.git.chunfeng.yun@mediatek.com>
References: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1506503879.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1506503879.git.chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is useful to find out the root cause when the Super Speed doesn't
work. Such as when the T-PHY is switched to PCIe or SATA, and affects
Super Speed function, the check will fail.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/host/xhci-mtk.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 9502ca4..7a92bb7 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -43,6 +43,7 @@
 
 /* ip_pw_sts1 register */
 #define STS1_IP_SLEEP_STS	BIT(30)
+#define STS1_U3_MAC_RST	BIT(16)
 #define STS1_XHCI_RST		BIT(11)
 #define STS1_SYS125_RST	BIT(10)
 #define STS1_REF_RST		BIT(8)
@@ -125,6 +126,9 @@ static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
 	check_val = STS1_SYSPLL_STABLE | STS1_REF_RST |
 			STS1_SYS125_RST | STS1_XHCI_RST;
 
+	if (mtk->num_u3_ports)
+		check_val |= STS1_U3_MAC_RST;
+
 	ret = readl_poll_timeout(&ippc->ip_pw_sts1, value,
 			  (check_val == (value & check_val)), 100, 20000);
 	if (ret) {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
