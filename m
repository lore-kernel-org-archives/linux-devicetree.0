From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] musb: Add pre and post root port reset end callbacks
Date: Sun, 29 Mar 2015 12:50:47 +0200
Message-ID: <1427626248-6257-3-git-send-email-hdegoede@redhat.com>
References: <1427626248-6257-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBF5S36UAKGQE723JAWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1427626248-6257-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

The sunxi otg phy has a bug where it wrongly detects a high speed squelch
when reset on the root port gets de-asserted with a lo-speed device.

The workaround for this is to disable squelch detect before de-asserting
reset, and re-enabling it after the reset de-assert is done.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/musb/musb_core.h    | 16 ++++++++++++++++
 drivers/usb/musb/musb_virthub.c |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
index 444b936..19d7b8c 100644
--- a/drivers/usb/musb/musb_core.h
+++ b/drivers/usb/musb/musb_core.h
@@ -163,6 +163,8 @@ struct musb_io;
  * @vbus_status: returns vbus status if possible
  * @set_vbus:	forces vbus status
  * @adjust_channel_params: pre check for standard dma channel_program func
+ * @pre_root_reset_end: called before the root usb port reset flag gets cleared
+ * @post_root_reset_end: called after the root usb port reset flag gets cleared
  */
 struct musb_platform_ops {
 
@@ -205,6 +207,8 @@ struct musb_platform_ops {
 	int	(*adjust_channel_params)(struct dma_channel *channel,
 				u16 packet_sz, u8 *mode,
 				dma_addr_t *dma_addr, u32 *len);
+	void	(*pre_root_reset_end)(struct musb *musb);
+	void	(*post_root_reset_end)(struct musb *musb);
 };
 
 /*
@@ -592,4 +596,16 @@ static inline int musb_platform_exit(struct musb *musb)
 	return musb->ops->exit(musb);
 }
 
+static inline void musb_platform_pre_root_reset_end(struct musb *musb)
+{
+	if (musb->ops->pre_root_reset_end)
+		musb->ops->pre_root_reset_end(musb);
+}
+
+static inline void musb_platform_post_root_reset_end(struct musb *musb)
+{
+	if (musb->ops->post_root_reset_end)
+		musb->ops->post_root_reset_end(musb);
+}
+
 #endif	/* __MUSB_CORE_H__ */
diff --git a/drivers/usb/musb/musb_virthub.c b/drivers/usb/musb/musb_virthub.c
index 3c87fd7..e613f8c 100644
--- a/drivers/usb/musb/musb_virthub.c
+++ b/drivers/usb/musb/musb_virthub.c
@@ -195,8 +195,10 @@ void musb_port_reset(struct musb *musb, bool do_reset)
 				      msecs_to_jiffies(50));
 	} else {
 		dev_dbg(musb->controller, "root port reset stopped\n");
+		musb_platform_pre_root_reset_end(musb);
 		musb_writeb(mbase, MUSB_POWER,
 				power & ~MUSB_POWER_RESET);
+		musb_platform_post_root_reset_end(musb);
 
 		power = musb_readb(mbase, MUSB_POWER);
 		if (power & MUSB_POWER_HSMODE) {
-- 
2.3.4
