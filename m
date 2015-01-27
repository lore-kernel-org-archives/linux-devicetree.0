From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 10/14] NFC: Forward NFC_EVT_TRANSACTION up to user space
Date: Tue, 27 Jan 2015 01:28:20 +0100
Message-ID: <1422318504-10039-11-git-send-email-christophe-h.ricard@st.com>
References: <1422318504-10039-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422318504-10039-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

NFC_EVT_TRANSACTION is not managed so far.

Forward event information up to user space in order to tell an application
that some user action(s) are needed.

Forwarded information are:
- SE host generating the event
- Application IDentifier doing the operation
- Applications parameters

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/net/nfc/nfc.h    | 27 +++++++++++++++++++++++++++
 include/uapi/linux/nfc.h |  1 +
 net/nfc/core.c           | 21 +++++++++++++++++++++
 net/nfc/netlink.c        | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 net/nfc/nfc.h            |  2 ++
 5 files changed, 98 insertions(+)

diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
index 12adb81..73190e6 100644
--- a/include/net/nfc/nfc.h
+++ b/include/net/nfc/nfc.h
@@ -135,6 +135,31 @@ struct nfc_se {
 	u16 state;
 };
 
+/**
+ * nfc_evt_transaction - A struct for NFC secure element event transaction.
+ *
+ * @aid: The application identifier triggering the event
+ *
+ * @aid_len: The application identifier length [5:16]
+ *
+ * @params: The application parameters transmitted during the transaction
+ *
+ * @params_len: The applications parameters length [0:255]
+ *
+ */
+#define NFC_MIN_AID_LENGTH	5
+#define	NFC_MAX_AID_LENGTH	16
+#define NFC_MAX_PARAMS_LENGTH	255
+
+#define NFC_EVT_TRANSACTION_AID_TAG	0x81
+#define NFC_EVT_TRANSACTION_PARAMS_TAG	0x82
+struct nfc_evt_transaction {
+	u32 aid_len;
+	u8 aid[NFC_MAX_AID_LENGTH];
+	u8 params_len;
+	u8 params[NFC_MAX_PARAMS_LENGTH];
+} __packed;
+
 struct nfc_genl_data {
 	u32 poll_req_portid;
 	struct mutex genl_data_mutex;
@@ -262,6 +287,8 @@ int nfc_tm_data_received(struct nfc_dev *dev, struct sk_buff *skb);
 
 void nfc_driver_failure(struct nfc_dev *dev, int err);
 
+int nfc_se_transaction(struct nfc_dev *dev, u8 se_idx,
+		       struct nfc_evt_transaction *evt_transaction);
 int nfc_add_se(struct nfc_dev *dev, u32 se_idx, u16 type);
 int nfc_remove_se(struct nfc_dev *dev, u32 se_idx);
 struct nfc_se *nfc_find_se(struct nfc_dev *dev, u32 se_idx);
diff --git a/include/uapi/linux/nfc.h b/include/uapi/linux/nfc.h
index 8119255..c1e2e63 100644
--- a/include/uapi/linux/nfc.h
+++ b/include/uapi/linux/nfc.h
@@ -183,6 +183,7 @@ enum nfc_attrs {
 	NFC_ATTR_SE_APDU,
 	NFC_ATTR_TARGET_ISO15693_DSFID,
 	NFC_ATTR_TARGET_ISO15693_UID,
+	NFC_ATTR_SE_PARAMS,
 /* private: internal use only */
 	__NFC_ATTR_AFTER_LAST
 };
diff --git a/net/nfc/core.c b/net/nfc/core.c
index 7f1b635..cff3f16 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -932,6 +932,27 @@ int nfc_remove_se(struct nfc_dev *dev, u32 se_idx)
 }
 EXPORT_SYMBOL(nfc_remove_se);
 
+int nfc_se_transaction(struct nfc_dev *dev, u8 se_idx,
+		       struct nfc_evt_transaction *evt_transaction)
+{
+	int rc;
+
+	pr_debug("transaction: %x\n", se_idx);
+
+	device_lock(&dev->dev);
+
+	if (!evt_transaction) {
+		rc = -EPROTO;
+		goto out;
+	}
+
+	rc = nfc_genl_se_transaction(dev, se_idx, evt_transaction);
+out:
+	device_unlock(&dev->dev);
+	return rc;
+}
+EXPORT_SYMBOL(nfc_se_transaction);
+
 static void nfc_release(struct device *d)
 {
 	struct nfc_dev *dev = to_nfc_dev(d);
diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 44989fc..2fd6777 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -496,6 +496,53 @@ free_msg:
 	return -EMSGSIZE;
 }
 
+int nfc_genl_se_transaction(struct nfc_dev *dev, u8 se_idx,
+			    struct nfc_evt_transaction *evt_transaction)
+{
+	struct nfc_se *se;
+	struct sk_buff *msg;
+	void *hdr;
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	hdr = genlmsg_put(msg, 0, 0, &nfc_genl_family, 0,
+			  NFC_EVENT_SE_TRANSACTION);
+	if (!hdr)
+		goto free_msg;
+
+	se = nfc_find_se(dev, se_idx);
+	if (!se)
+		goto free_msg;
+
+	if (nla_put_u32(msg, NFC_ATTR_DEVICE_INDEX, dev->idx) ||
+	    nla_put_u32(msg, NFC_ATTR_SE_INDEX, se_idx) ||
+	    nla_put_u8(msg, NFC_ATTR_SE_TYPE, se->type) ||
+	    nla_put(msg, NFC_ATTR_SE_AID, evt_transaction->aid_len,
+		    evt_transaction->aid) ||
+	    nla_put(msg, NFC_ATTR_SE_PARAMS, evt_transaction->params_len,
+		    evt_transaction->params))
+		goto nla_put_failure;
+
+	/* evt_transaction is no more used */
+	devm_kfree(&dev->dev, evt_transaction);
+
+	genlmsg_end(msg, hdr);
+
+	genlmsg_multicast(&nfc_genl_family, msg, 0, 0, GFP_KERNEL);
+
+	return 0;
+
+nla_put_failure:
+	genlmsg_cancel(msg, hdr);
+free_msg:
+	/* evt_transaction is no more used */
+	devm_kfree(&dev->dev, evt_transaction);
+	nlmsg_free(msg);
+	return -EMSGSIZE;
+}
+
 static int nfc_genl_send_device(struct sk_buff *msg, struct nfc_dev *dev,
 				u32 portid, u32 seq,
 				struct netlink_callback *cb,
diff --git a/net/nfc/nfc.h b/net/nfc/nfc.h
index 88d6006..a8ce80b 100644
--- a/net/nfc/nfc.h
+++ b/net/nfc/nfc.h
@@ -100,6 +100,8 @@ int nfc_genl_llc_send_sdres(struct nfc_dev *dev, struct hlist_head *sdres_list);
 
 int nfc_genl_se_added(struct nfc_dev *dev, u32 se_idx, u16 type);
 int nfc_genl_se_removed(struct nfc_dev *dev, u32 se_idx);
+int nfc_genl_se_transaction(struct nfc_dev *dev, u8 se_idx,
+			    struct nfc_evt_transaction *evt_transaction);
 
 struct nfc_dev *nfc_get_device(unsigned int idx);
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
