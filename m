From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [Patch v5 03/13] USB: notify phy when root hub port connect change
Date: Wed, 13 Jun 2012 20:34:13 +0800
Message-ID: <1339590863-10564-4-git-send-email-richard.zhao@freescale.com>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1339590863-10564-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: marex-ynQEQJNshbs@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Phy may need to change settings when port connect change.

Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/core/hub.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 04fb834..e1a6d31 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -20,6 +20,7 @@
 #include <linux/usb.h>
 #include <linux/usbdevice_fs.h>
 #include <linux/usb/hcd.h>
+#include <linux/usb/otg.h>
 #include <linux/usb/quirks.h>
 #include <linux/kthread.h>
 #include <linux/mutex.h>
@@ -4034,6 +4035,13 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
 		}
 	}
 
+	if (unlikely(hcd->phy && !hdev->level)) {
+		if (portstatus & USB_PORT_STAT_CONNECTION)
+			usb_phy_notify_connect(hcd->phy, port1);
+		else
+			usb_phy_notify_disconnect(hcd->phy, port1);
+	}
+
 	/* Return now if debouncing failed or nothing is connected or
 	 * the device was "removed".
 	 */
-- 
1.7.9.5
