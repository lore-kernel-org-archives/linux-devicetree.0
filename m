From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 02/11] usb: mtu3: print useful information also for device and host modes
Date: Wed, 6 Mar 2019 19:46:14 +0800
Message-ID: <1551872783-13707-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1551872783-13707-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551872783-13707-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Print useful information not only dual-role mode but also
device mode and host mode.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index dee31d5eefe1..3a4a80f15957 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -286,7 +286,7 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 		ssusb->dr_mode = USB_DR_MODE_OTG;
 
 	if (ssusb->dr_mode == USB_DR_MODE_PERIPHERAL)
-		return 0;
+		goto out;
 
 	/* if host role is supported */
 	ret = ssusb_wakeup_of_property_parse(ssusb, node);
@@ -307,7 +307,7 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	otg_sx->vbus = vbus;
 
 	if (ssusb->dr_mode == USB_DR_MODE_HOST)
-		return 0;
+		goto out;
 
 	/* if dual-role mode is supported */
 	otg_sx->is_u3_drd = of_property_read_bool(node, "mediatek,usb3-drd");
@@ -322,6 +322,7 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 		}
 	}
 
+out:
 	dev_info(dev, "dr_mode: %d, is_u3_dr: %d, u3p_dis_msk: %x, drd: %s\n",
 		ssusb->dr_mode, otg_sx->is_u3_drd, ssusb->u3p_dis_msk,
 		otg_sx->manual_drd_enabled ? "manual" : "auto");
-- 
2.20.1
