From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 02/35] nfc: st-nci: include st-nci.h instead of ndlc.h
Date: Mon, 26 Oct 2015 07:49:42 +0100
Message-ID: <1445842215-28403-3-git-send-email-christophe-h.ricard@st.com>
References: <1445842215-28403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445842215-28403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

st-nci.h already include ndlc.h.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st-nci/i2c.c  | 2 +-
 drivers/nfc/st-nci/ndlc.c | 1 -
 drivers/nfc/st-nci/spi.c  | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 707ed2e..02e585f 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -27,7 +27,7 @@
 #include <linux/nfc.h>
 #include <linux/platform_data/st-nci.h>
 
-#include "ndlc.h"
+#include "st-nci.h"
 
 #define DRIVER_DESC "NCI NFC driver for ST_NCI"
 
diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index d2cf84e..fb50007 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -19,7 +19,6 @@
 #include <linux/sched.h>
 #include <net/nfc/nci_core.h>
 
-#include "ndlc.h"
 #include "st-nci.h"
 
 #define NDLC_TIMER_T1		100
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 598a58c..9a39871 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -27,7 +27,7 @@
 #include <linux/nfc.h>
 #include <linux/platform_data/st-nci.h>
 
-#include "ndlc.h"
+#include "st-nci.h"
 
 #define DRIVER_DESC "NCI NFC driver for ST_NCI"
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
