From: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 6/7] usb: gadget: gr_udc: Return error code when trying to set ep.maxpacket > ep.maxpacket_limit
Date: Thu, 27 Mar 2014 16:15:58 +0100
Message-ID: <1395933359-7109-7-git-send-email-andreas@gaisler.com>
References: <1395933359-7109-1-git-send-email-andreas@gaisler.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395933359-7109-1-git-send-email-andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Make gr_ep_enable fail properly when a call requests a larger ep.maxpacket than
ep.maxpacket_limit.

Signed-off-by: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
---
Differences since v1: none

 drivers/usb/gadget/gr_udc.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/gr_udc.c b/drivers/usb/gadget/gr_udc.c
index 253e608..72458be 100644
--- a/drivers/usb/gadget/gr_udc.c
+++ b/drivers/usb/gadget/gr_udc.c
@@ -1542,6 +1542,10 @@ static int gr_ep_enable(struct usb_ep *_ep,
 	} else if (max == 0) {
 		dev_err(dev->dev, "Max payload cannot be set to 0\n");
 		return -EINVAL;
+	} else if (max > ep->ep.maxpacket_limit) {
+		dev_err(dev->dev, "Requested max payload %d > limit %d\n",
+			max, ep->ep.maxpacket_limit);
+		return -EINVAL;
 	}
 
 	spin_lock(&ep->dev->lock);
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
