From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] NFC: nci: Add T1T support notification
Date: Sun, 25 May 2014 22:35:40 +0200
Message-ID: <1401050140-15050-4-git-send-email-christophe-h.ricard@st.com>
References: <1401050140-15050-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401050140-15050-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add T1T matching with Jewel during notification.
It was causing "the target found does not have the desired protocol"
to show up.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/nci/ntf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index f8f6af2..df91bb9 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -166,7 +166,9 @@ static int nci_add_new_protocol(struct nci_dev *ndev,
 	struct rf_tech_specific_params_nfcf_poll *nfcf_poll;
 	__u32 protocol;
 
-	if (rf_protocol == NCI_RF_PROTOCOL_T2T)
+	if (rf_protocol == NCI_RF_PROTOCOL_T1T)
+		protocol = NFC_PROTO_JEWEL_MASK;
+	else if (rf_protocol == NCI_RF_PROTOCOL_T2T)
 		protocol = NFC_PROTO_MIFARE_MASK;
 	else if (rf_protocol == NCI_RF_PROTOCOL_ISO_DEP)
 		if (rf_tech_and_mode == NCI_NFC_A_PASSIVE_POLL_MODE)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
