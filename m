From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 05/13] musb: Fix platform code being unable
 to override ep access ops
Date: Fri, 20 Mar 2015 20:11:14 +0100
Message-ID: <1426878682-14521-6-git-send-email-hdegoede@redhat.com>
References: <1426878682-14521-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORB4XBWGUAKGQECWHJTLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1426878682-14521-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

musb-core was setting the ops to the default indexed or flat handlers after
checking for platform overrides. Reverse the order of this so that platform
overrides actually work.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/musb/musb_core.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 016b5b9..6e9b839 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2021,13 +2021,7 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
 	if (musb->ops->quirks)
 		musb->io.quirks = musb->ops->quirks;
 
-	/* At least tusb6010 has it's own offsets.. */
-	if (musb->ops->ep_offset)
-		musb->io.ep_offset = musb->ops->ep_offset;
-	if (musb->ops->ep_select)
-		musb->io.ep_select = musb->ops->ep_select;
-
-	/* ..and some devices use indexed offset or flat offset */
+	/* Set default ep access to indexed offset or flat offset ops */
 	if (musb->io.quirks & MUSB_INDEXED_EP) {
 		musb->io.ep_offset = musb_indexed_ep_offset;
 		musb->io.ep_select = musb_indexed_ep_select;
@@ -2035,6 +2029,11 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
 		musb->io.ep_offset = musb_flat_ep_offset;
 		musb->io.ep_select = musb_flat_ep_select;
 	}
+	/* And override them with platform specific ops if specified. */
+	if (musb->ops->ep_offset)
+		musb->io.ep_offset = musb->ops->ep_offset;
+	if (musb->ops->ep_select)
+		musb->io.ep_select = musb->ops->ep_select;
 
 	if (musb->ops->fifo_mode)
 		fifo_mode = musb->ops->fifo_mode;
-- 
2.3.3
