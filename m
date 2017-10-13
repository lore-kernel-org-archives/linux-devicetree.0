From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 3/9] usb: xhci-mtk: check clock stability of U3_MAC
Date: Fri, 13 Oct 2017 16:26:35 +0800
Message-ID: <afc5cff346c5a349177990999df3dd7604966de4.1507882470.git.chunfeng.yun@mediatek.com>
References: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1507882470.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1507882470.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is useful to find out the root cause when the Super Speed doesn't
work. Such as when the T-PHY is switched to PCIe or SATA, and affects
Super Speed function, the check will fail.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
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
