From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 01/11] nfc: st-nci: Remove duplicate file include/linux/platform_data/st_nci.h
Date: Fri, 14 Aug 2015 22:33:30 +0200
Message-ID: <1439584420-5446-2-git-send-email-christophe-h.ricard@st.com>
References: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

commit "nfc: st-nci: Rename st21nfcb to st-nci" adds
include/linux/platform_data/st_nci.h duplicated with
include/linux/platform_data/st-nci.h.

Only drivers/nfc/st-nci/i2c.c uses include/linux/platform_data/st_nci.h.

Cc: stable@vger.kernel.org
Reported-by: Hauke Mehrtens <hauke@hauke-m.de>
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st-nci/i2c.c             |  2 +-
 include/linux/platform_data/st_nci.h | 29 -----------------------------
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 include/linux/platform_data/st_nci.h

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 06175ce..b2a467c 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -25,7 +25,7 @@
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/nfc.h>
-#include <linux/platform_data/st_nci.h>
+#include <linux/platform_data/st-nci.h>
 
 #include "ndlc.h"
 
diff --git a/include/linux/platform_data/st_nci.h b/include/linux/platform_data/st_nci.h
deleted file mode 100644
index d9d400a..0000000
--- a/include/linux/platform_data/st_nci.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- * Driver include for ST NCI NFC chip family.
- *
- * Copyright (C) 2014-2015  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef _ST_NCI_H_
-#define _ST_NCI_H_
-
-#define ST_NCI_DRIVER_NAME "st_nci"
-
-struct st_nci_nfc_platform_data {
-	unsigned int gpio_reset;
-	unsigned int irq_polarity;
-};
-
-#endif /* _ST_NCI_H_ */
-- 
2.1.4
