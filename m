From: <sean.wang@mediatek.com>
Subject: [PATCH 3/6] Bluetooth: mediatek: fix up an error path to restore bdev->tx_state
Date: Fri, 15 Feb 2019 07:19:35 +0800
Message-ID: <b1a496748170af6a89d8ba19db9412787ef53668.1550184473.git.sean.wang@mediatek.com>
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

Restore bdev->tx_state with clearing bit BTMTKUART_TX_WAIT_VND_EVT
when there is an error on waiting for the corresponding event.

Fixes: 7237c4c9ec92 ("Bluetooth: mediatek: Add protocol support for MediaTek serial devices")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtkuart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index b8ea011b82d8..9f8177b216b6 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -115,11 +115,13 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev, u8 op, u8 flag, u16 plen,
 				  TASK_INTERRUPTIBLE, HCI_INIT_TIMEOUT);
 	if (err == -EINTR) {
 		bt_dev_err(hdev, "Execution of wmt command interrupted");
+		clear_bit(BTMTKUART_TX_WAIT_VND_EVT, &bdev->tx_state);
 		return err;
 	}
 
 	if (err) {
 		bt_dev_err(hdev, "Execution of wmt command timed out");
+		clear_bit(BTMTKUART_TX_WAIT_VND_EVT, &bdev->tx_state);
 		return -ETIMEDOUT;
 	}
 
-- 
2.18.0
