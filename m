From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 05/13] NFC: netlink: Add new netlink command NFC_CMD_ACTIVATE_TARGET
Date: Tue,  2 Dec 2014 21:27:50 +0100
Message-ID: <1417552078-9269-6-git-send-email-christophe-h.ricard@st.com>
References: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417552078-9269-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some tag might get deactivated after some read or write tentative.
This may happen for example with Mifare Ultralight C tag when trying
to read the last 4 blocks (starting block 0x2c) configured as write only.
NFC_CMD_ACTIVATE_TARGET will try to reselect the tag in order to detect
if it got remove from the field or if it is still present.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/uapi/linux/nfc.h |  1 +
 net/nfc/netlink.c        | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/uapi/linux/nfc.h b/include/uapi/linux/nfc.h
index 19a75da..3c5efb1 100644
--- a/include/uapi/linux/nfc.h
+++ b/include/uapi/linux/nfc.h
@@ -116,6 +116,7 @@ enum nfc_commands {
 	NFC_EVENT_SE_TRANSACTION,
 	NFC_CMD_GET_SE,
 	NFC_CMD_SE_IO,
+	NFC_CMD_ACTIVATE_TARGET,
 /* private: internal use only */
 	__NFC_CMD_AFTER_LAST
 };
diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 43cb1c1..9581831 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -810,6 +810,31 @@ out:
 	return rc;
 }
 
+static int nfc_genl_activate_target(struct sk_buff *skb, struct genl_info *info)
+{
+	struct nfc_dev *dev;
+	u32 device_idx, target_idx, protocol;
+	int rc;
+
+	if (!info->attrs[NFC_ATTR_DEVICE_INDEX])
+		return -EINVAL;
+
+	device_idx = nla_get_u32(info->attrs[NFC_ATTR_DEVICE_INDEX]);
+
+	dev = nfc_get_device(device_idx);
+	if (!dev)
+		return -ENODEV;
+
+	target_idx = nla_get_u32(info->attrs[NFC_ATTR_TARGET_INDEX]);
+	protocol = nla_get_u32(info->attrs[NFC_ATTR_PROTOCOLS]);
+
+	nfc_deactivate_target(dev, target_idx);
+	rc = nfc_activate_target(dev, target_idx, protocol);
+
+	nfc_put_device(dev);
+	return 0;
+}
+
 static int nfc_genl_dep_link_up(struct sk_buff *skb, struct genl_info *info)
 {
 	struct nfc_dev *dev;
@@ -1455,6 +1480,11 @@ static const struct genl_ops nfc_genl_ops[] = {
 		.doit = nfc_genl_se_io,
 		.policy = nfc_genl_policy,
 	},
+	{
+		.cmd = NFC_CMD_ACTIVATE_TARGET,
+		.doit = nfc_genl_activate_target,
+		.policy = nfc_genl_policy,
+	},
 };
 
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
