From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [RFC v2 08/17] nfc: st21nfcb: remove st21nfcb_nci_i2c_disable in st21nfcb_nci_i2c_remove
Date: Sat,  6 Jun 2015 13:16:44 +0200
Message-ID: <1433589413-19680-9-git-send-email-christophe-h.ricard@st.com>
References: <1433589413-19680-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1433589413-19680-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, devicetree@vger.kernel.org, christophe.ricard@gmail.com, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

ndlc_remove already call st21nfcb_nci_i2c_disable and phy->powered is
already set to 0.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st21nfcb/i2c.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/nfc/st21nfcb/i2c.c b/drivers/nfc/st21nfcb/i2c.c
index 4bc15ec..c44f8cf 100644
--- a/drivers/nfc/st21nfcb/i2c.c
+++ b/drivers/nfc/st21nfcb/i2c.c
@@ -359,9 +359,6 @@ static int st21nfcb_nci_i2c_remove(struct i2c_client *client)
 
 	ndlc_remove(phy->ndlc);
 
-	if (phy->powered)
-		st21nfcb_nci_i2c_disable(phy);
-
 	return 0;
 }
 
-- 
2.1.4
