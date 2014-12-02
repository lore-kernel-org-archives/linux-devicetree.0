From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 06/13] NFC: Add se_io NFC operand
Date: Tue,  2 Dec 2014 21:27:51 +0100
Message-ID: <1417552078-9269-7-git-send-email-christophe-h.ricard@st.com>
References: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417552078-9269-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

se_io allows to send apdu over the CLF to the embedded Secure Element.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 net/nfc/netlink.c | 47 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 9581831..44989fc 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -1310,6 +1310,51 @@ static int nfc_genl_dump_ses_done(struct netlink_callback *cb)
 	return 0;
 }
 
+static int nfc_se_io(struct nfc_dev *dev, u32 se_idx,
+		     u8 *apdu, size_t apdu_length,
+		     se_io_cb_t cb, void *cb_context)
+{
+	struct nfc_se *se;
+	int rc;
+
+	pr_debug("%s se index %d\n", dev_name(&dev->dev), se_idx);
+
+	device_lock(&dev->dev);
+
+	if (!device_is_registered(&dev->dev)) {
+		rc = -ENODEV;
+		goto error;
+	}
+
+	if (!dev->dev_up) {
+		rc = -ENODEV;
+		goto error;
+	}
+
+	if (!dev->ops->se_io) {
+		rc = -EOPNOTSUPP;
+		goto error;
+	}
+
+	se = nfc_find_se(dev, se_idx);
+	if (!se) {
+		rc = -EINVAL;
+		goto error;
+	}
+
+	if (se->state != NFC_SE_ENABLED) {
+		rc = -ENODEV;
+		goto error;
+	}
+
+	rc = dev->ops->se_io(dev, se_idx, apdu,
+			apdu_length, cb, cb_context);
+
+error:
+	device_unlock(&dev->dev);
+	return rc;
+}
+
 struct se_io_ctx {
 	u32 dev_idx;
 	u32 se_idx;
@@ -1392,7 +1437,7 @@ static int nfc_genl_se_io(struct sk_buff *skb, struct genl_info *info)
 	ctx->dev_idx = dev_idx;
 	ctx->se_idx = se_idx;
 
-	return dev->ops->se_io(dev, se_idx, apdu, apdu_len, se_io_cb, ctx);
+	return nfc_se_io(dev, se_idx, apdu, apdu_len, se_io_cb, ctx);
 }
 
 static const struct genl_ops nfc_genl_ops[] = {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
