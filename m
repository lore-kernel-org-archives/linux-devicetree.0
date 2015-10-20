From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 26/30] nfc: st21nfca: Add few code style fixes
Date: Tue, 20 Oct 2015 23:48:17 +0200
Message-ID: <1445377701-8353-27-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a minor code style fixes

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st21nfca/i2c.c      | 1 +
 drivers/nfc/st21nfca/st21nfca.c | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index b2c914b..84c2cb0 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -94,6 +94,7 @@ struct st21nfca_i2c_phy {
 	int hard_fault;
 	struct mutex phy_lock;
 };
+
 static u8 len_seq[] = { 16, 24, 12, 29 };
 static u16 wait_tab[] = { 2, 3, 5, 15, 20, 40};
 
diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index 0e84ce6..76ef9cf 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -164,7 +164,6 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 		r = nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
 					ST21NFCA_DM_GETINFO, pipe_info,
 					sizeof(pipe_info), &skb_pipe_info);
-
 		if (r)
 			continue;
 
@@ -984,7 +983,6 @@ int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
 	 * persistent info to discriminate 2 identical chips
 	 */
 	dev_num = find_first_zero_bit(dev_mask, ST21NFCA_NUM_DEVICES);
-
 	if (dev_num >= ST21NFCA_NUM_DEVICES)
 		return -ENODEV;
 
-- 
2.1.4
