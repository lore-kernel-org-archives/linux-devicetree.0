From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [RFC v1 01/14] NFC: st21nfcb: Remove inappropriate kfree on a devm_kzalloc pointer
Date: Fri,  1 May 2015 22:19:24 +0200
Message-ID: <1430511577-19678-2-git-send-email-christophe-h.ricard@st.com>
References: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, devicetree@vger.kernel.org, christophe.ricard@gmail.com, stable@vger.kernel.org, Firo Yang <firogm@gmail.com>
List-Id: devicetree@vger.kernel.org

Since ndev->driver_data is allocated by devm_kzalloc(), we do not
need the inappropriate kfree to free it in driver's remove function.
Freeing will trigger when driver unloads.

Cc: stable@vger.kernel.org
Acked-by: Christophe Ricard <christophe-h.ricard@st.com>
Signed-off-by: Firo Yang <firogm@gmail.com>
---
 drivers/nfc/st21nfcb/st21nfcb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/nfc/st21nfcb/st21nfcb.c b/drivers/nfc/st21nfcb/st21nfcb.c
index ca9871a..c7dc282 100644
--- a/drivers/nfc/st21nfcb/st21nfcb.c
+++ b/drivers/nfc/st21nfcb/st21nfcb.c
@@ -131,11 +131,8 @@ EXPORT_SYMBOL_GPL(st21nfcb_nci_probe);
 
 void st21nfcb_nci_remove(struct nci_dev *ndev)
 {
-	struct st21nfcb_nci_info *info = nci_get_drvdata(ndev);
-
 	nci_unregister_device(ndev);
 	nci_free_device(ndev);
-	kfree(info);
 }
 EXPORT_SYMBOL_GPL(st21nfcb_nci_remove);
 
-- 
2.1.4
