From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 32/35] nfc: st21nfca: Add error messages when an unexpected HCI event occurs
Date: Mon, 26 Oct 2015 07:50:12 +0100
Message-ID: <1445842215-28403-33-git-send-email-christophe-h.ricard@st.com>
References: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445842215-28403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Potentially an unexpected HCI event may occur because of a firmware bug.
It could be transparent for the user but at least log this.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/core.c | 2 ++
 drivers/nfc/st21nfca/dep.c  | 1 +
 drivers/nfc/st21nfca/se.c   | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index d36e290..dd8b150 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -893,6 +893,8 @@ static int st21nfca_admin_event_received(struct nfc_hci_dev *hdev, u8 event,
 			}
 		}
 	break;
+	default:
+		nfc_err(&hdev->ndev->dev, "Unexpected event on admin gate\n");
 	}
 	kfree_skb(skb);
 	return 0;
diff --git a/drivers/nfc/st21nfca/dep.c b/drivers/nfc/st21nfca/dep.c
index c011712..798a32b 100644
--- a/drivers/nfc/st21nfca/dep.c
+++ b/drivers/nfc/st21nfca/dep.c
@@ -435,6 +435,7 @@ int st21nfca_dep_event_received(struct nfc_hci_dev *hdev,
 			return r;
 		return 0;
 	default:
+		nfc_err(&hdev->ndev->dev, "Unexpected event on card f gate\n");
 		return 1;
 	}
 	kfree_skb(skb);
diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
index e04f603..c79d99b 100644
--- a/drivers/nfc/st21nfca/se.c
+++ b/drivers/nfc/st21nfca/se.c
@@ -344,6 +344,7 @@ int st21nfca_connectivity_event_received(struct nfc_hci_dev *hdev, u8 host,
 		r = nfc_se_transaction(hdev->ndev, host, transaction);
 		break;
 	default:
+		nfc_err(&hdev->ndev->dev, "Unexpected event on connectivity gate\n");
 		return 1;
 	}
 	kfree_skb(skb);
@@ -375,6 +376,9 @@ int st21nfca_apdu_reader_event_received(struct nfc_hci_dev *hdev,
 		mod_timer(&info->se_info.bwi_timer, jiffies +
 				msecs_to_jiffies(info->se_info.wt_timeout));
 		break;
+	default:
+		nfc_err(&hdev->ndev->dev, "Unexpected event on apdu reader gate\n");
+		return 1;
 	}
 
 exit:
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
