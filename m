From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 01/11] usb: mtu3: check return value of devm_extcon_register_notifier()
Date: Wed, 6 Mar 2019 19:46:13 +0800
Message-ID: <1551872783-13707-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1551872783-13707-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551872783-13707-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Check the return value of devm_extcon_register_notifier() and
add error handling.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_dr.c   | 13 +++++++++----
 drivers/usb/mtu3/mtu3_plat.c |  8 +++++++-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index ac60e9c8564e..61694c40e101 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -238,14 +238,18 @@ static int ssusb_extcon_register(struct otg_switch_mtk *otg_sx)
 	otg_sx->vbus_nb.notifier_call = ssusb_vbus_notifier;
 	ret = devm_extcon_register_notifier(ssusb->dev, edev, EXTCON_USB,
 					&otg_sx->vbus_nb);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(ssusb->dev, "failed to register notifier for USB\n");
+		return ret;
+	}
 
 	otg_sx->id_nb.notifier_call = ssusb_id_notifier;
 	ret = devm_extcon_register_notifier(ssusb->dev, edev, EXTCON_USB_HOST,
 					&otg_sx->id_nb);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(ssusb->dev, "failed to register notifier for USB-HOST\n");
+		return ret;
+	}
 
 	dev_dbg(ssusb->dev, "EXTCON_USB: %d, EXTCON_USB_HOST: %d\n",
 		extcon_get_state(edev, EXTCON_USB),
@@ -415,6 +419,7 @@ void ssusb_set_force_mode(struct ssusb_mtk *ssusb,
 int ssusb_otg_switch_init(struct ssusb_mtk *ssusb)
 {
 	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
+	int ret = 0;
 
 	INIT_WORK(&otg_sx->id_work, ssusb_id_work);
 	INIT_WORK(&otg_sx->vbus_work, ssusb_vbus_work);
@@ -422,9 +427,9 @@ int ssusb_otg_switch_init(struct ssusb_mtk *ssusb)
 	if (otg_sx->manual_drd_enabled)
 		ssusb_debugfs_init(ssusb);
 	else
-		ssusb_extcon_register(otg_sx);
+		ret = ssusb_extcon_register(otg_sx);
 
-	return 0;
+	return ret;
 }
 
 void ssusb_otg_switch_exit(struct ssusb_mtk *ssusb)
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index e086630e41a9..dee31d5eefe1 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -401,7 +401,11 @@ static int mtu3_probe(struct platform_device *pdev)
 			goto gadget_exit;
 		}
 
-		ssusb_otg_switch_init(ssusb);
+		ret = ssusb_otg_switch_init(ssusb);
+		if (ret) {
+			dev_err(dev, "failed to initialize switch\n");
+			goto host_exit;
+		}
 		break;
 	default:
 		dev_err(dev, "unsupported mode: %d\n", ssusb->dr_mode);
@@ -411,6 +415,8 @@ static int mtu3_probe(struct platform_device *pdev)
 
 	return 0;
 
+host_exit:
+	ssusb_host_exit(ssusb);
 gadget_exit:
 	ssusb_gadget_exit(ssusb);
 comm_exit:
-- 
2.20.1
