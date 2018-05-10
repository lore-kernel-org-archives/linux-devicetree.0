From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 1/7] usb: mtu3: avoid TX data length truncated in SS/SSP mode
Date: Thu, 10 May 2018 13:47:06 +0800
Message-ID: <6b82c11302a81368bd6936424d081ede3340b431.1525930818.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The variable of 'count' is declared as u8, this will cause an issue
due to value truncated when works in SS or SSP mode and data length
is greater than 255, so change it as u32.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_gadget_ep0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index ebdcf7a..d67b540 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -546,7 +546,7 @@ static void ep0_tx_state(struct mtu3 *mtu)
 	struct usb_request *req;
 	u32 csr;
 	u8 *src;
-	u8 count;
+	u32 count;
 	u32 maxp;
 
 	dev_dbg(mtu->dev, "%s\n", __func__);
-- 
1.9.1
