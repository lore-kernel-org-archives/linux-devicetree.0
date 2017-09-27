From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 08/12] usb: mtu3: get optional vbus for host only mode
Date: Wed, 27 Sep 2017 18:58:37 +0800
Message-ID: <454a6fe891b5dae507337cdaa0c80834fcf78990.1506509659.git.chunfeng.yun@mediatek.com>
References: <fe8df8503f602586bcea4b1598eb09678b1525e3.1506509658.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fe8df8503f602586bcea4b1598eb09678b1525e3.1506509658.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When dr_mode is set as USB_DR_MODE_HOST, it's better to try to
get optional vbus, this can increase flexibility, although we
can set vbus as always on for regulator or put it in host driver
to turn it on.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_plat.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 1e473b0..7ca81f4e 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -300,10 +300,6 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	of_property_read_u32(node, "mediatek,u3p-dis-msk",
 			     &ssusb->u3p_dis_msk);
 
-	if (ssusb->dr_mode != USB_DR_MODE_OTG)
-		return 0;
-
-	/* if dual-role mode is supported */
 	vbus = devm_regulator_get(&pdev->dev, "vbus");
 	if (IS_ERR(vbus)) {
 		dev_err(dev, "failed to get vbus\n");
@@ -311,6 +307,10 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	}
 	otg_sx->vbus = vbus;
 
+	if (ssusb->dr_mode == USB_DR_MODE_HOST)
+		return 0;
+
+	/* if dual-role mode is supported */
 	otg_sx->is_u3_drd = of_property_read_bool(node, "mediatek,usb3-drd");
 	otg_sx->manual_drd_enabled =
 		of_property_read_bool(node, "enable-manual-drd");
-- 
1.7.9.5
