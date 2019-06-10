From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [next PATCH] Revert "usb: mtu3: fix up undefined reference to usb_debug_root"
Date: Mon, 10 Jun 2019 10:52:29 +0800
Message-ID: <1560135149-9647-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

It's not needed after [1] is applied, because usb_debug_root is created
by usb common core but not usbcore now.

[1] 812086d362a1 ("USB: move usb debugfs directory creation to the usb common core")

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_debugfs.c b/drivers/usb/mtu3/mtu3_debugfs.c
index 3ed666f94dd9..c96e5dab0a48 100644
--- a/drivers/usb/mtu3/mtu3_debugfs.c
+++ b/drivers/usb/mtu3/mtu3_debugfs.c
@@ -528,7 +528,8 @@ void ssusb_dr_debugfs_init(struct ssusb_mtk *ssusb)
 
 void ssusb_debugfs_create_root(struct ssusb_mtk *ssusb)
 {
-	ssusb->dbgfs_root = debugfs_create_dir(dev_name(ssusb->dev), NULL);
+	ssusb->dbgfs_root =
+		debugfs_create_dir(dev_name(ssusb->dev), usb_debug_root);
 }
 
 void ssusb_debugfs_remove_root(struct ssusb_mtk *ssusb)
-- 
2.21.0
