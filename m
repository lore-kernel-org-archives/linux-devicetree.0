From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 7/7] usb: mtu3: fix uncontinuous SeqN issue after disable EP
Date: Thu, 10 May 2018 13:47:12 +0800
Message-ID: <5d0d535b9a86a07d9b1bddfbca62b54e7d96a702.1525930818.git.chunfeng.yun@mediatek.com>
References: <6b82c11302a81368bd6936424d081ede3340b431.1525930818.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6b82c11302a81368bd6936424d081ede3340b431.1525930818.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Reset EP when disable it to reset data toggle for U2 EP, and
SeqN, flow control status etc for U3 EP, this can avoid
issue of uncontinuous SeqN

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2:
    add this patch
---
 drivers/usb/mtu3/mtu3_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 65ff53a..0bc2b39 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -400,6 +400,10 @@ void mtu3_deconfig_ep(struct mtu3 *mtu, struct mtu3_ep *mep)
 		mtu3_setbits(mbase, U3D_QIECR0, QMU_RX_DONE_INT(epnum));
 	}
 
+	/* reset: u2 - data toggle, u3 - SeqN, flow control status etc */
+	mtu3_setbits(mbase, U3D_EP_RST, EP_RST(mep->is_in, epnum));
+	mtu3_clrbits(mbase, U3D_EP_RST, EP_RST(mep->is_in, epnum));
+
 	ep_fifo_free(mep);
 
 	dev_dbg(mtu->dev, "%s: %s\n", __func__, mep->name);
-- 
1.9.1
