From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 11/11] usb: mtu3: add a function to switch mailbox state to string
Date: Wed, 6 Mar 2019 19:46:23 +0800
Message-ID: <1551872783-13707-12-git-send-email-chunfeng.yun@mediatek.com>
References: <1551872783-13707-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551872783-13707-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

By introducing mailbox_state_string(), allow to make debug
log more readable

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_dr.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index 82913120622b..5fcb71af875a 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -21,6 +21,22 @@ enum mtu3_vbus_id_state {
 	MTU3_VBUS_VALID,
 };
 
+static char *mailbox_state_string(enum mtu3_vbus_id_state state)
+{
+	switch (state) {
+	case MTU3_ID_FLOAT:
+		return "ID_FLOAT";
+	case MTU3_ID_GROUND:
+		return "ID_GROUND";
+	case MTU3_VBUS_OFF:
+		return "VBUS_OFF";
+	case MTU3_VBUS_VALID:
+		return "VBUS_VALID";
+	default:
+		return "UNKNOWN";
+	}
+}
+
 static void toggle_opstate(struct ssusb_mtk *ssusb)
 {
 	if (!ssusb->otg_switch.is_u3_drd) {
@@ -140,8 +156,8 @@ static void ssusb_set_mailbox(struct otg_switch_mtk *otg_sx,
 		container_of(otg_sx, struct ssusb_mtk, otg_switch);
 	struct mtu3 *mtu = ssusb->u3d;
 
-	dev_dbg(ssusb->dev, "mailbox state(%d)\n", status);
-	mtu3_dbg_trace(ssusb->dev, "mailbox %d", status);
+	dev_dbg(ssusb->dev, "mailbox %s\n", mailbox_state_string(status));
+	mtu3_dbg_trace(ssusb->dev, "mailbox %s", mailbox_state_string(status));
 
 	switch (status) {
 	case MTU3_ID_GROUND:
-- 
2.20.1
