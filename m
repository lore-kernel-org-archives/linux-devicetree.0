From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 28/35] nfc: netlink: Add mode parameter to deactivate_target functions
Date: Sun, 25 Oct 2015 22:54:43 +0100
Message-ID: <1445810090-18403-29-git-send-email-christophe-h.ricard@st.com>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445810090-18403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to manage in a better way the nci poll mode state machine, add
mode parameter to deactivate_target functions. This way we can manage
different target state. mode parameter make sense only in nci core.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nfc.h  |  2 +-
 net/nfc/core.c         |  4 ++--
 net/nfc/digital_core.c |  3 ++-
 net/nfc/hci/core.c     |  3 ++-
 net/nfc/nci/core.c     | 15 +++++++++++----
 net/nfc/netlink.c      |  2 +-
 net/nfc/nfc.h          |  5 ++++-
 net/nfc/rawsock.c      |  3 ++-
 8 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
index 30afc9a..dcfcfc9 100644
--- a/include/net/nfc/nfc.h
+++ b/include/net/nfc/nfc.h
@@ -68,7 +68,7 @@ struct nfc_ops {
 	int (*activate_target)(struct nfc_dev *dev, struct nfc_target *target,
 			       u32 protocol);
 	void (*deactivate_target)(struct nfc_dev *dev,
-				  struct nfc_target *target);
+				  struct nfc_target *target, u8 mode);
 	int (*im_transceive)(struct nfc_dev *dev, struct nfc_target *target,
 			     struct sk_buff *skb, data_exchange_cb_t cb,
 			     void *cb_context);
diff --git a/net/nfc/core.c b/net/nfc/core.c
index cff3f16..1fe3d3b 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -449,7 +449,7 @@ error:
  * @dev: The nfc device that found the target
  * @target_idx: index of the target that must be deactivated
  */
-int nfc_deactivate_target(struct nfc_dev *dev, u32 target_idx)
+int nfc_deactivate_target(struct nfc_dev *dev, u32 target_idx, u8 mode)
 {
 	int rc = 0;
 
@@ -476,7 +476,7 @@ int nfc_deactivate_target(struct nfc_dev *dev, u32 target_idx)
 	if (dev->ops->check_presence)
 		del_timer_sync(&dev->check_pres_timer);
 
-	dev->ops->deactivate_target(dev, dev->active_target);
+	dev->ops->deactivate_target(dev, dev->active_target, mode);
 	dev->active_target = NULL;
 
 error:
diff --git a/net/nfc/digital_core.c b/net/nfc/digital_core.c
index 009bcf3..23c2a11 100644
--- a/net/nfc/digital_core.c
+++ b/net/nfc/digital_core.c
@@ -631,7 +631,8 @@ static int digital_activate_target(struct nfc_dev *nfc_dev,
 }
 
 static void digital_deactivate_target(struct nfc_dev *nfc_dev,
-				      struct nfc_target *target)
+				      struct nfc_target *target,
+				      u8 mode)
 {
 	struct nfc_digital_dev *ddev = nfc_get_drvdata(nfc_dev);
 
diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index 6e061da..2b0f0ac 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -678,7 +678,8 @@ static int hci_activate_target(struct nfc_dev *nfc_dev,
 }
 
 static void hci_deactivate_target(struct nfc_dev *nfc_dev,
-				  struct nfc_target *target)
+				  struct nfc_target *target,
+				  u8 mode)
 {
 }
 
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 0909720..b7f548b 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -802,9 +802,11 @@ static int nci_activate_target(struct nfc_dev *nfc_dev,
 }
 
 static void nci_deactivate_target(struct nfc_dev *nfc_dev,
-				  struct nfc_target *target)
+				  struct nfc_target *target,
+				  __u8 mode)
 {
 	struct nci_dev *ndev = nfc_get_drvdata(nfc_dev);
+	u8 nci_mode = NCI_DEACTIVATE_TYPE_IDLE_MODE;
 
 	pr_debug("entry\n");
 
@@ -815,9 +817,14 @@ static void nci_deactivate_target(struct nfc_dev *nfc_dev,
 
 	ndev->target_active_prot = 0;
 
+	switch (mode) {
+	case NFC_TARGET_MODE_SLEEP:
+		nci_mode = NCI_DEACTIVATE_TYPE_SLEEP_MODE;
+		break;
+	}
+
 	if (atomic_read(&ndev->state) == NCI_POLL_ACTIVE) {
-		nci_request(ndev, nci_rf_deactivate_req,
-			    NCI_DEACTIVATE_TYPE_IDLE_MODE,
+		nci_request(ndev, nci_rf_deactivate_req, nci_mode,
 			    msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
 	}
 }
@@ -851,7 +858,7 @@ static int nci_dep_link_down(struct nfc_dev *nfc_dev)
 	pr_debug("entry\n");
 
 	if (nfc_dev->rf_mode == NFC_RF_INITIATOR) {
-		nci_deactivate_target(nfc_dev, NULL);
+		nci_deactivate_target(nfc_dev, NULL, NCI_DEACTIVATE_TYPE_IDLE_MODE);
 	} else {
 		if (atomic_read(&ndev->state) == NCI_LISTEN_ACTIVE ||
 		    atomic_read(&ndev->state) == NCI_DISCOVERY) {
diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index f040532..f58c1fb 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -885,7 +885,7 @@ static int nfc_genl_activate_target(struct sk_buff *skb, struct genl_info *info)
 	target_idx = nla_get_u32(info->attrs[NFC_ATTR_TARGET_INDEX]);
 	protocol = nla_get_u32(info->attrs[NFC_ATTR_PROTOCOLS]);
 
-	nfc_deactivate_target(dev, target_idx);
+	nfc_deactivate_target(dev, target_idx, NFC_TARGET_MODE_SLEEP);
 	rc = nfc_activate_target(dev, target_idx, protocol);
 
 	nfc_put_device(dev);
diff --git a/net/nfc/nfc.h b/net/nfc/nfc.h
index 5c93e84..c20b784 100644
--- a/net/nfc/nfc.h
+++ b/net/nfc/nfc.h
@@ -25,6 +25,9 @@
 #include <net/nfc/nfc.h>
 #include <net/sock.h>
 
+#define NFC_TARGET_MODE_IDLE 0
+#define NFC_TARGET_MODE_SLEEP 1
+
 struct nfc_protocol {
 	int id;
 	struct proto *proto;
@@ -147,7 +150,7 @@ int nfc_dep_link_down(struct nfc_dev *dev);
 
 int nfc_activate_target(struct nfc_dev *dev, u32 target_idx, u32 protocol);
 
-int nfc_deactivate_target(struct nfc_dev *dev, u32 target_idx);
+int nfc_deactivate_target(struct nfc_dev *dev, u32 target_idx, u8 mode);
 
 int nfc_data_exchange(struct nfc_dev *dev, u32 target_idx, struct sk_buff *skb,
 		      data_exchange_cb_t cb, void *cb_context);
diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
index e9a9148..e386e6c 100644
--- a/net/nfc/rawsock.c
+++ b/net/nfc/rawsock.c
@@ -321,7 +321,8 @@ static void rawsock_destruct(struct sock *sk)
 
 	if (sk->sk_state == TCP_ESTABLISHED) {
 		nfc_deactivate_target(nfc_rawsock(sk)->dev,
-				      nfc_rawsock(sk)->target_idx);
+				      nfc_rawsock(sk)->target_idx,
+				      NFC_TARGET_MODE_IDLE);
 		nfc_put_device(nfc_rawsock(sk)->dev);
 	}
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
