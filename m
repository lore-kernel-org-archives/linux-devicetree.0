From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 05/15] musb: Do not use musb_read[b|w] /
 _write[b|w] wrappers in generic fifo functions
Date: Mon,  9 Mar 2015 21:40:18 +0100
Message-ID: <1425933628-9672-6-git-send-email-hdegoede@redhat.com>
References: <1425933628-9672-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBUUK7CTQKGQESHVZUMY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1425933628-9672-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

The generic fifo functions already use non wrapped accesses in various
cases through the iowrite#_rep functions, and all platforms which override
the default musb_read[b|w] / _write[b|w] functions also provide their own
fifo access functions, so we can safely drop the unnecessary indirection
from the fifo access functions.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/musb/musb_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index b71d310..47c1a0a 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -313,7 +313,7 @@ static void musb_default_write_fifo(struct musb_hw_ep *hw_ep, u16 len,
 				index += len & ~0x03;
 			}
 			if (len & 0x02) {
-				musb_writew(fifo, 0, *(u16 *)&src[index]);
+				__raw_writew(*(u16 *)&src[index], fifo);
 				index += 2;
 			}
 		} else {
@@ -323,7 +323,7 @@ static void musb_default_write_fifo(struct musb_hw_ep *hw_ep, u16 len,
 			}
 		}
 		if (len & 0x01)
-			musb_writeb(fifo, 0, src[index]);
+			__raw_writeb(src[index], fifo);
 	} else  {
 		/* byte aligned */
 		iowrite8_rep(fifo, src, len);
@@ -355,7 +355,7 @@ static void musb_default_read_fifo(struct musb_hw_ep *hw_ep, u16 len, u8 *dst)
 				index = len & ~0x03;
 			}
 			if (len & 0x02) {
-				*(u16 *)&dst[index] = musb_readw(fifo, 0);
+				*(u16 *)&dst[index] = __raw_readw(fifo);
 				index += 2;
 			}
 		} else {
@@ -365,7 +365,7 @@ static void musb_default_read_fifo(struct musb_hw_ep *hw_ep, u16 len, u8 *dst)
 			}
 		}
 		if (len & 0x01)
-			dst[index] = musb_readb(fifo, 0);
+			dst[index] = __raw_readb(fifo);
 	} else  {
 		/* byte aligned */
 		ioread8_rep(fifo, dst, len);
-- 
2.3.1
