From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 1/2] usb: gadget: composite: fix delayed_status race condition when set_interface
Date: Fri, 22 Jun 2018 14:33:05 +0800
Message-ID: <4c338a129ab14ab41949da5e3c21aed0d77dff8d.1529647619.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

It happens when enable debug log, if set_alt() returns
USB_GADGET_DELAYED_STATUS and usb_composite_setup_continue()
is called before increasing count of @delayed_status,
so fix it by using spinlock of @cdev->lock.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Tested-by: Jay Hsu <shih-chieh.hsu@mediatek.com>
---
 drivers/usb/gadget/composite.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index f242c2b..d2fa071 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -1719,6 +1719,8 @@ static int fill_ext_prop(struct usb_configuration *c, int interface, u8 *buf)
 		 */
 		if (w_value && !f->get_alt)
 			break;
+
+		spin_lock(&cdev->lock);
 		value = f->set_alt(f, w_index, w_value);
 		if (value == USB_GADGET_DELAYED_STATUS) {
 			DBG(cdev,
@@ -1728,6 +1730,7 @@ static int fill_ext_prop(struct usb_configuration *c, int interface, u8 *buf)
 			DBG(cdev, "delayed_status count %d\n",
 					cdev->delayed_status);
 		}
+		spin_unlock(&cdev->lock);
 		break;
 	case USB_REQ_GET_INTERFACE:
 		if (ctrl->bRequestType != (USB_DIR_IN|USB_RECIP_INTERFACE))
-- 
1.9.1
