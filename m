From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 24/30] nfc: netlink: Add suspend_target handler and nfc_reactivate_target
Date: Tue, 20 Oct 2015 23:48:15 +0200
Message-ID: <1445377701-8353-25-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to manage in a better way the nci poll mode state machine, add
a suspend_target handler. In this way the netlink nfc_genl_activate_target
rely on a new function nfc_reactivate_target calling suspend_target handler
if available (only in nci core).

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nfc.h |  2 ++
 net/nfc/core.c        | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 net/nfc/nci/core.c    | 23 +++++++++++++++++++----
 net/nfc/netlink.c     |  3 +--
 net/nfc/nfc.h         |  2 ++
 5 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
index 30afc9a..380ab8b 100644
--- a/include/net/nfc/nfc.h
+++ b/include/net/nfc/nfc.h
@@ -67,6 +67,8 @@ struct nfc_ops {
 	int (*dep_link_down)(struct nfc_dev *dev);
 	int (*activate_target)(struct nfc_dev *dev, struct nfc_target *target,
 			       u32 protocol);
+	void (*suspend_target)(struct nfc_dev *dev,
+			       struct nfc_target *target);
 	void (*deactivate_target)(struct nfc_dev *dev,
 				  struct nfc_target *target);
 	int (*im_transceive)(struct nfc_dev *dev, struct nfc_target *target,
diff --git a/net/nfc/core.c b/net/nfc/core.c
index cff3f16..70276b6 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -485,6 +485,52 @@ error:
 }
 
 /**
+ * nfc_reactivate_target - reactivate the target for data exchange
+ *
+ * @dev: The nfc device that found the target
+ * @target_idx: index of the target that must be activated
+ * @protocol: nfc protocol that will be used for data exchange
+ */
+int nfc_reactivate_target(struct nfc_dev *dev, u32 target_idx, u32 protocol)
+{
+	int rc = 0;
+
+	pr_debug("dev_name=%s target_idx=%u\n",
+		 dev_name(&dev->dev), target_idx);
+
+	device_lock(&dev->dev);
+
+	if (!device_is_registered(&dev->dev)) {
+		rc = -ENODEV;
+		goto error;
+	}
+
+	if (!dev->active_target) {
+		rc = -ENOTCONN;
+		goto error;
+	}
+
+	if (dev->active_target->idx != target_idx) {
+		rc = -ENOTCONN;
+		goto error;
+	}
+
+	if (dev->ops->check_presence)
+		del_timer_sync(&dev->check_pres_timer);
+
+	if (dev->ops->suspend_target)
+		dev->ops->suspend_target(dev, dev->active_target);
+
+	dev->active_target = NULL;
+	device_unlock(&dev->dev);
+
+	return nfc_activate_target(dev, target_idx, protocol);
+error:
+	device_unlock(&dev->dev);
+	return rc;
+}
+
+/**
  * nfc_data_exchange - transceive data
  *
  * @dev: The nfc device that found the target
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 943889b..b45d6e3 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -800,8 +800,9 @@ static int nci_activate_target(struct nfc_dev *nfc_dev,
 	return rc;
 }
 
-static void nci_deactivate_target(struct nfc_dev *nfc_dev,
-				  struct nfc_target *target)
+static void nci_deactivate_target_mode(struct nfc_dev *nfc_dev,
+				       struct nfc_target *target,
+				       __u8 mode)
 {
 	struct nci_dev *ndev = nfc_get_drvdata(nfc_dev);
 
@@ -815,12 +816,25 @@ static void nci_deactivate_target(struct nfc_dev *nfc_dev,
 	ndev->target_active_prot = 0;
 
 	if (atomic_read(&ndev->state) == NCI_POLL_ACTIVE) {
-		nci_request(ndev, nci_rf_deactivate_req,
-			    NCI_DEACTIVATE_TYPE_IDLE_MODE,
+		nci_request(ndev, nci_rf_deactivate_req, mode,
 			    msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
 	}
 }
 
+static void nci_deactivate_target(struct nfc_dev *nfc_dev,
+				  struct nfc_target *target)
+{
+	nci_deactivate_target_mode(nfc_dev, target,
+				   NCI_DEACTIVATE_TYPE_IDLE_MODE);
+}
+
+static void nci_suspend_target(struct nfc_dev *nfc_dev,
+			       struct nfc_target *target)
+{
+	nci_deactivate_target_mode(nfc_dev, target,
+				   NCI_DEACTIVATE_TYPE_SLEEP_MODE);
+}
+
 static int nci_dep_link_up(struct nfc_dev *nfc_dev, struct nfc_target *target,
 			   __u8 comm_mode, __u8 *gb, size_t gb_len)
 {
@@ -979,6 +993,7 @@ static struct nfc_ops nci_nfc_ops = {
 	.dep_link_up = nci_dep_link_up,
 	.dep_link_down = nci_dep_link_down,
 	.activate_target = nci_activate_target,
+	.suspend_target = nci_suspend_target,
 	.deactivate_target = nci_deactivate_target,
 	.im_transceive = nci_transceive,
 	.tm_send = nci_tm_send,
diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 853172c..bb0e098 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -885,8 +885,7 @@ static int nfc_genl_activate_target(struct sk_buff *skb, struct genl_info *info)
 	target_idx = nla_get_u32(info->attrs[NFC_ATTR_TARGET_INDEX]);
 	protocol = nla_get_u32(info->attrs[NFC_ATTR_PROTOCOLS]);
 
-	nfc_deactivate_target(dev, target_idx);
-	rc = nfc_activate_target(dev, target_idx, protocol);
+	rc = nfc_reactivate_target(dev, target_idx, protocol);
 
 	nfc_put_device(dev);
 	return 0;
diff --git a/net/nfc/nfc.h b/net/nfc/nfc.h
index 5c93e84..6250c6e 100644
--- a/net/nfc/nfc.h
+++ b/net/nfc/nfc.h
@@ -147,6 +147,8 @@ int nfc_dep_link_down(struct nfc_dev *dev);
 
 int nfc_activate_target(struct nfc_dev *dev, u32 target_idx, u32 protocol);
 
+int nfc_reactivate_target(struct nfc_dev *dev, u32 target_idx, u32 protocol);
+
 int nfc_deactivate_target(struct nfc_dev *dev, u32 target_idx);
 
 int nfc_data_exchange(struct nfc_dev *dev, u32 target_idx, struct sk_buff *skb,
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
