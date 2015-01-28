From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v2 12/14] NFC: nci: Change NCI state machine to LISTEN_ACTIVE and ignore parameters in rf_intf_activated_ntf
Date: Wed, 28 Jan 2015 21:17:29 +0100
Message-ID: <1422476251-25972-13-git-send-email-christophe-h.ricard@st.com>
References: <1422476251-25972-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422476251-25972-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When receiving a intf_activated notification, if the rf interface is
NCI_RF_INTERFACE_NFCEE_DIRECT, we need to ignore the next parameters and
change the NCI state machine to NCI_LISTEN_ACTIVE.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/nci/ntf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 4cdb95d..19eaf52 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -545,6 +545,13 @@ static void nci_rf_intf_activated_ntf_packet(struct nci_dev *ndev,
 	pr_debug("rf_tech_specific_params_len %d\n",
 		 ntf.rf_tech_specific_params_len);
 
+	/* If this contains a value of 0x00 (NFCEE Direct RF
+	 * Interface) then all following parameters SHALL contain a
+	 * value of 0 and SHALL be ignored.
+	 */
+	if (ntf.rf_interface == NCI_RF_INTERFACE_NFCEE_DIRECT)
+		goto listen;
+
 	if (ntf.rf_tech_specific_params_len > 0) {
 		switch (ntf.activation_rf_tech_and_mode) {
 		case NCI_NFC_A_PASSIVE_POLL_MODE:
@@ -660,6 +667,7 @@ exit:
 			nci_req_complete(ndev, err);
 		}
 	} else {
+listen:
 		/* Listen mode */
 		atomic_set(&ndev->state, NCI_LISTEN_ACTIVE);
 		if (err == NCI_STATUS_OK &&
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
