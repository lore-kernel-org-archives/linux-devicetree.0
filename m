From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 01/12] usb: otg: add notify_connect/notify_disconnect
 callback
Date: Fri, 25 May 2012 10:24:14 +0800
Message-ID: <1337912665-16615-2-git-send-email-richard.zhao@freescale.com>
References: <1337912665-16615-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1337912665-16615-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: marex-ynQEQJNshbs@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This let usb phy driver has a chance to change hw settings when connect
status change.

Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 include/linux/usb/otg.h |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
index 38ab3f4..6dfdc8d 100644
--- a/include/linux/usb/otg.h
+++ b/include/linux/usb/otg.h
@@ -117,6 +117,9 @@ struct usb_phy {
 	int	(*set_suspend)(struct usb_phy *x,
 				int suspend);
 
+	/* notify phy connect status change */
+	int	(*notify_connect)(struct usb_phy *x, int port);
+	int	(*notify_disconnect)(struct usb_phy *x, int port);
 };
 
 
@@ -252,6 +255,24 @@ usb_phy_set_suspend(struct usb_phy *x, int suspend)
 }
 
 static inline int
+usb_phy_notify_connect(struct usb_phy *x, int port)
+{
+	if (x->notify_connect)
+		return x->notify_connect(x, port);
+	else
+		return 0;
+}
+
+static inline int
+usb_phy_notify_disconnect(struct usb_phy *x, int port)
+{
+	if (x->notify_disconnect)
+		return x->notify_disconnect(x, port);
+	else
+		return 0;
+}
+
+static inline int
 otg_start_srp(struct usb_otg *otg)
 {
 	if (otg && otg->start_srp)
-- 
1.7.5.4
