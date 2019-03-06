From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 04/11] usb: mtu3: rebuild the code of getting vbus regulator
Date: Wed, 6 Mar 2019 19:46:16 +0800
Message-ID: <1551872783-13707-5-git-send-email-chunfeng.yun@mediatek.com>
References: <1551872783-13707-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551872783-13707-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Remove local variable @vbus and use @dev instead of @pdev->dev

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 3a4a80f15957..a326b1d6006a 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -228,7 +228,6 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	struct device_node *node = pdev->dev.of_node;
 	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
 	struct device *dev = &pdev->dev;
-	struct regulator *vbus;
 	struct resource *res;
 	int i;
 	int ret;
@@ -299,12 +298,11 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	of_property_read_u32(node, "mediatek,u3p-dis-msk",
 			     &ssusb->u3p_dis_msk);
 
-	vbus = devm_regulator_get(&pdev->dev, "vbus");
-	if (IS_ERR(vbus)) {
+	otg_sx->vbus = devm_regulator_get(dev, "vbus");
+	if (IS_ERR(otg_sx->vbus)) {
 		dev_err(dev, "failed to get vbus\n");
-		return PTR_ERR(vbus);
+		return PTR_ERR(otg_sx->vbus);
 	}
-	otg_sx->vbus = vbus;
 
 	if (ssusb->dr_mode == USB_DR_MODE_HOST)
 		goto out;
-- 
2.20.1
