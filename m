From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 22/35] nfc: st-nci: Add error messages when an unexpected HCI event occurs
Date: Sun, 25 Oct 2015 22:54:37 +0100
Message-ID: <1445810090-18403-23-git-send-email-christophe-h.ricard@st.com>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445810090-18403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Potentially an unexpected HCI event may occur because of a firmware bug.
It could be transparent for the user but at least log this.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st-nci/se.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index 7ec4dba..2812884 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -280,6 +280,8 @@ static void st_nci_hci_admin_event_received(struct nci_dev *ndev,
 			}
 		}
 	break;
+	default:
+		nfc_err(&ndev->nfc_dev->dev, "Unexpected event on admin gate\n");
 	}
 }
 
@@ -303,6 +305,9 @@ static int st_nci_hci_apdu_reader_event_received(struct nci_dev *ndev,
 		mod_timer(&info->se_info.bwi_timer, jiffies +
 			  msecs_to_jiffies(info->se_info.wt_timeout));
 	break;
+	default:
+		nfc_err(&ndev->nfc_dev->dev, "Unexpected event on apdu reader gate\n");
+		return 1;
 	}
 
 	kfree_skb(skb);
@@ -357,6 +362,7 @@ static int st_nci_hci_connectivity_event_received(struct nci_dev *ndev,
 		r = nfc_se_transaction(ndev->nfc_dev, host, transaction);
 		break;
 	default:
+		nfc_err(&ndev->nfc_dev->dev, "Unexpected event on connectivity gate\n");
 		return 1;
 	}
 	kfree_skb(skb);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
