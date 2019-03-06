From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 03/11] usb: mtu3: remove unnecessary local variable @req
Date: Wed, 6 Mar 2019 19:46:15 +0800
Message-ID: <1551872783-13707-4-git-send-email-chunfeng.yun@mediatek.com>
References: <1551872783-13707-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551872783-13707-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The local variable @req is unnecessary in qmu_tx_zlp_error_handler,
so remove it.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_qmu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
index 09f19f70fe8f..f4b5431264c1 100644
--- a/drivers/usb/mtu3/mtu3_qmu.c
+++ b/drivers/usb/mtu3/mtu3_qmu.c
@@ -382,16 +382,13 @@ static void qmu_tx_zlp_error_handler(struct mtu3 *mtu, u8 epnum)
 	struct mtu3_gpd_ring *ring = &mep->gpd_ring;
 	void __iomem *mbase = mtu->mac_base;
 	struct qmu_gpd *gpd_current = NULL;
-	struct usb_request *req = NULL;
 	struct mtu3_request *mreq;
 	dma_addr_t cur_gpd_dma;
 	u32 txcsr = 0;
 	int ret;
 
 	mreq = next_request(mep);
-	if (mreq && mreq->request.length == 0)
-		req = &mreq->request;
-	else
+	if (mreq && mreq->request.length != 0)
 		return;
 
 	cur_gpd_dma = read_txq_cur_addr(mbase, epnum);
@@ -402,7 +399,7 @@ static void qmu_tx_zlp_error_handler(struct mtu3 *mtu, u8 epnum)
 		return;
 	}
 
-	dev_dbg(mtu->dev, "%s send ZLP for req=%p\n", __func__, req);
+	dev_dbg(mtu->dev, "%s send ZLP for req=%p\n", __func__, mreq);
 
 	mtu3_clrbits(mbase, MU3D_EP_TXCR0(mep->epnum), TX_DMAREQEN);
 
-- 
2.20.1
