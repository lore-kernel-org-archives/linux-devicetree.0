From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 11/11] nfc: netlink: Add check on NFC_ATTR_VENDOR_DATA
Date: Fri, 14 Aug 2015 22:33:40 +0200
Message-ID: <1439584420-5446-12-git-send-email-christophe-h.ricard@st.com>
References: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

NFC_ATTR_VENDOR_DATA is an optional vendor_cmd argument.
The current code was potentially using a non existing argument leading
to potential catastrophic results.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 net/nfc/netlink.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index f85f37e..dcb858e 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -1450,8 +1450,6 @@ nla_put_failure:
 free_msg:
 	nlmsg_free(msg);
 	kfree(ctx);
-
-	return;
 }
 
 static int nfc_genl_se_io(struct sk_buff *skb, struct genl_info *info)
@@ -1518,8 +1516,8 @@ static int nfc_genl_vendor_cmd(struct sk_buff *skb,
 	if (!dev || !dev->vendor_cmds || !dev->n_vendor_cmds)
 		return -ENODEV;
 
-	data = nla_data(info->attrs[NFC_ATTR_VENDOR_DATA]);
-	if (data) {
+	if (info->attrs[NFC_ATTR_VENDOR_DATA]) {
+		data = nla_data(info->attrs[NFC_ATTR_VENDOR_DATA]);
 		data_len = nla_len(info->attrs[NFC_ATTR_VENDOR_DATA]);
 		if (data_len == 0)
 			return -EINVAL;
@@ -1529,7 +1527,6 @@ static int nfc_genl_vendor_cmd(struct sk_buff *skb,
 
 	for (i = 0; i < dev->n_vendor_cmds; i++) {
 		cmd = &dev->vendor_cmds[i];
-
 		if (cmd->vendor_id != vid || cmd->subcmd != subcmd)
 			continue;
 
-- 
2.1.4
