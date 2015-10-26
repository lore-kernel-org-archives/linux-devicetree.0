From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 1/9] NFC: nfcmrvl: remove unneeded version defines
Date: Mon, 26 Oct 2015 10:27:37 +0100
Message-ID: <1445851665-2497-2-git-send-email-cuissard@marvell.com>
References: <1445851665-2497-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445851665-2497-1-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 drivers/nfc/nfcmrvl/main.c | 7 ++-----
 drivers/nfc/nfcmrvl/usb.c  | 5 +----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 4a8866d..77e292f 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -1,7 +1,7 @@
 /*
  * Marvell NFC driver: major functions
  *
- * Copyright (C) 2014, Marvell International Ltd.
+ * Copyright (C) 2014-2015 Marvell International Ltd.
  *
  * This software file (the "File") is distributed by Marvell International
  * Ltd. under the terms of the GNU General Public License Version 2, June 1991
@@ -25,8 +25,6 @@
 #include <net/nfc/nci_core.h>
 #include "nfcmrvl.h"
 
-#define VERSION "1.0"
-
 static int nfcmrvl_nci_open(struct nci_dev *ndev)
 {
 	struct nfcmrvl_private *priv = nci_get_drvdata(ndev);
@@ -252,6 +250,5 @@ int nfcmrvl_parse_dt(struct device_node *node,
 EXPORT_SYMBOL_GPL(nfcmrvl_parse_dt);
 
 MODULE_AUTHOR("Marvell International Ltd.");
-MODULE_DESCRIPTION("Marvell NFC driver ver " VERSION);
-MODULE_VERSION(VERSION);
+MODULE_DESCRIPTION("Marvell NFC driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index 7d1fe43..5e624d1 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -23,8 +23,6 @@
 #include <net/nfc/nci_core.h>
 #include "nfcmrvl.h"
 
-#define VERSION "1.0"
-
 static struct usb_device_id nfcmrvl_table[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x1286, 0x2046,
 					USB_CLASS_VENDOR_SPEC, 4, 1) },
@@ -469,6 +467,5 @@ static struct usb_driver nfcmrvl_usb_driver = {
 module_usb_driver(nfcmrvl_usb_driver);
 
 MODULE_AUTHOR("Marvell International Ltd.");
-MODULE_DESCRIPTION("Marvell NFC-over-USB driver ver " VERSION);
-MODULE_VERSION(VERSION);
+MODULE_DESCRIPTION("Marvell NFC-over-USB driver");
 MODULE_LICENSE("GPL v2");
-- 
2.2.0.33.gc18b867

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
