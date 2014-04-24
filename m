From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/10] NFC: st21nfca: Remove few useless include.
Date: Thu, 24 Apr 2014 23:19:30 +0200
Message-ID: <1398374379-17133-2-git-send-email-christophe-h.ricard@st.com>
References: <1398374379-17133-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398374379-17133-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove include done in i2c.c

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/st21nfca.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index d001e6a..201a3ea 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -16,23 +16,12 @@
  * along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <linux/crc-ccitt.h>
 #include <linux/module.h>
-#include <linux/delay.h>
-#include <linux/slab.h>
-#include <linux/miscdevice.h>
-#include <linux/interrupt.h>
-#include <linux/gpio.h>
-#include <linux/i2c.h>
-
 #include <linux/nfc.h>
 #include <net/nfc/hci.h>
 #include <net/nfc/llc.h>
 
-#include <uapi/linux/nfc.h>
-
 #include "st21nfca.h"
-#include <linux/platform_data/st21nfca.h>
 
 #define DRIVER_DESC "HCI NFC driver for ST21NFCA"
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
