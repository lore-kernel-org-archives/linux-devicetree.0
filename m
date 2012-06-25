From: Alexandre Pereira da Silva <aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 1/2] usb: gadget: lpc32xx_udc: Propagate devicetree information
Date: Mon, 25 Jun 2012 17:21:43 -0300
Message-ID: <1340655704-30398-2-git-send-email-aletes.xgr@gmail.com>
References: <1340655704-30398-1-git-send-email-aletes.xgr@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340655704-30398-1-git-send-email-aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Alexandre Pereira da Silva <aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fills the gadget.dev.of_node, so gadget drivers can use devicetree nodes

Signed-off-by: Alexandre Pereira da Silva <aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/gadget/lpc32xx_udc.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/lpc32xx_udc.c b/drivers/usb/gadget/lpc32xx_udc.c
index 93a901b..551c0e9 100644
--- a/drivers/usb/gadget/lpc32xx_udc.c
+++ b/drivers/usb/gadget/lpc32xx_udc.c
@@ -3005,6 +3005,7 @@ static int lpc32xx_start(struct usb_gadget_driver *driver,
 
 	udc->driver = driver;
 	udc->gadget.dev.driver = &driver->driver;
+	udc->gadget.dev.of_node = udc->dev->of_node;
 	udc->enabled = 1;
 	udc->selfpowered = 1;
 	udc->vbus = 0;
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
