From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 03/11] nfc: st-nci: Fix non accurate comment for st_nci_i2c_read
Date: Fri, 14 Aug 2015 22:33:32 +0200
Message-ID: <1439584420-5446-4-git-send-email-christophe-h.ricard@st.com>
References: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Due to a copy and paste error st_nci_i2c_read still contain st21nfca header
comment.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st-nci/i2c.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index a15144d..707ed2e 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -118,15 +118,10 @@ static int st_nci_i2c_write(void *phy_id, struct sk_buff *skb)
 /*
  * Reads an ndlc frame and returns it in a newly allocated sk_buff.
  * returns:
- * frame size : if received frame is complete (find ST_NCI_SOF_EOF at
- * end of read)
- * -EAGAIN : if received frame is incomplete (not find ST_NCI_SOF_EOF
- * at end of read)
+ * 0 : if received frame is complete
  * -EREMOTEIO : i2c read error (fatal)
  * -EBADMSG : frame was incorrect and discarded
- * (value returned from st_nci_i2c_repack)
- * -EIO : if no ST_NCI_SOF_EOF is found after reaching
- * the read length end sequence
+ * -ENOMEM : cannot allocate skb, frame dropped
  */
 static int st_nci_i2c_read(struct st_nci_i2c_phy *phy,
 				 struct sk_buff **skb)
-- 
2.1.4
