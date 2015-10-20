From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 19/30] nfc: netlink: Add missing NFC_ATTR comments
Date: Tue, 20 Oct 2015 23:48:10 +0200
Message-ID: <1445377701-8353-20-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

NFC_CMD_ACTIVATE_TARGET and NFC_ATTR_SE_PARAMS comments are missing.

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
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
