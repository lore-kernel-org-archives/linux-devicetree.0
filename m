From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH] usb: devio: update max count of DPs per interval for ISOC
Date: Fri, 28 Dec 2018 18:27:44 +0800
Message-ID: <1545992864-9530-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The host shall be able to accept and send up to 96 DPs for
devices operating at Gen 2 speed.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/core/devio.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index a75bc0b8a50f..82c16210e34c 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1564,12 +1564,10 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
 		}
 		for (totlen = u = 0; u < number_of_packets; u++) {
 			/*
-			 * arbitrary limit need for USB 3.0
-			 * bMaxBurst (0~15 allowed, 1~16 packets)
-			 * bmAttributes (bit 1:0, mult 0~2, 1~3 packets)
-			 * sizemax: 1024 * 16 * 3 = 49152
+			 * arbitrary limit need for USB 3.1 Gen2
+			 * sizemax: 96 DPs at SSP, 96 * 1024 = 98304
 			 */
-			if (isopkt[u].length > 49152) {
+			if (isopkt[u].length > 98304) {
 				ret = -EINVAL;
 				goto error;
 			}
-- 
2.19.1
