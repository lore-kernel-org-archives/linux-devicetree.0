From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 23/35] nfc: netlink: Add missing NFC_ATTR comments
Date: Mon, 26 Oct 2015 07:50:03 +0100
Message-ID: <1445842215-28403-24-git-send-email-christophe-h.ricard@st.com>
References: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445842215-28403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

NFC_CMD_ACTIVATE_TARGET and NFC_ATTR_SE_PARAMS comments are missing.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 include/uapi/linux/nfc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/nfc.h b/include/uapi/linux/nfc.h
index dd3f753..399f39f 100644
--- a/include/uapi/linux/nfc.h
+++ b/include/uapi/linux/nfc.h
@@ -86,6 +86,7 @@
  *	for this event is the application ID (AID).
  * @NFC_CMD_GET_SE: Dump all discovered secure elements from an NFC controller.
  * @NFC_CMD_SE_IO: Send/Receive APDUs to/from the selected secure element.
+ * @NFC_CMD_ACTIVATE_TARGET: Request NFC controller to reactivate target.
  * @NFC_CMD_VENDOR: Vendor specific command, to be implemented directly
  *	from the driver in order to support hardware specific operations.
  */
@@ -156,6 +157,7 @@ enum nfc_commands {
  * @NFC_ATTR_APDU: Secure element APDU
  * @NFC_ATTR_TARGET_ISO15693_DSFID: ISO 15693 Data Storage Format Identifier
  * @NFC_ATTR_TARGET_ISO15693_UID: ISO 15693 Unique Identifier
+ * @NFC_ATTR_SE_PARAMS: Parameters data from an evt_transaction
  * @NFC_ATTR_VENDOR_ID: NFC manufacturer unique ID, typically an OUI
  * @NFC_ATTR_VENDOR_SUBCMD: Vendor specific sub command
  * @NFC_ATTR_VENDOR_DATA: Vendor specific data, to be optionally passed
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
