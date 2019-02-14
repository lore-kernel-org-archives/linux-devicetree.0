From: <sean.wang@mediatek.com>
Subject: [PATCH 2/6] Bluetooth: mediatek: trivial typo fix
Date: Fri, 15 Feb 2019 07:19:34 +0800
Message-ID: <fe55645efb173ef11cad6e43c194b400226b7a2f.1550184473.git.sean.wang@mediatek.com>
References: <cover.1550184473.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550184473.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

add a trivial typo fix from speicfic to specific

Fixes: 7237c4c9ec92 ("Bluetooth: mediatek: Add protocol support for MediaTek serial devices")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtkuart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index 4593baff2bc9..b8ea011b82d8 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -107,7 +107,7 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev, u8 op, u8 flag, u16 plen,
 	 * Complete as with usual HCI command flow control.
 	 *
 	 * After sending the command, wait for BTMTKUART_TX_WAIT_VND_EVT
-	 * state to be cleared. The driver speicfic event receive routine
+	 * state to be cleared. The driver specific event receive routine
 	 * will clear that state and with that indicate completion of the
 	 * WMT command.
 	 */
-- 
2.18.0
