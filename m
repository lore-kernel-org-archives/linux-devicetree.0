From: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 4/7] usb: gadget: gr_udc: Use of_property_read_u32_index to access arrays
Date: Thu, 27 Mar 2014 16:15:56 +0100
Message-ID: <1395933359-7109-5-git-send-email-andreas@gaisler.com>
References: <1395933359-7109-1-git-send-email-andreas@gaisler.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395933359-7109-1-git-send-email-andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use an appropriate accessor function for property arrays to make the code nicer
and make the code correct if it would ever run on little endian architectures.
Suggested by Mark Rutland.

Signed-off-by: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
---
Differences since v1: none

 drivers/usb/gadget/gr_udc.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/gr_udc.c b/drivers/usb/gadget/gr_udc.c
index 7a99254..0f3a953 100644
--- a/drivers/usb/gadget/gr_udc.c
+++ b/drivers/usb/gadget/gr_udc.c
@@ -2020,9 +2020,7 @@ static int gr_udc_init(struct gr_udc *dev)
 	u32 dmactrl_val;
 	int i;
 	int ret = 0;
-	u32 *bufsizes;
 	u32 bufsize;
-	int len;
 
 	gr_set_address(dev, 0);
 
@@ -2033,19 +2031,17 @@ static int gr_udc_init(struct gr_udc *dev)
 	INIT_LIST_HEAD(&dev->ep_list);
 	gr_set_ep0state(dev, GR_EP0_DISCONNECT);
 
-	bufsizes = (u32 *)of_get_property(np, "epobufsizes", &len);
-	len /= sizeof(u32);
 	for (i = 0; i < dev->nepo; i++) {
-		bufsize = (bufsizes && i < len) ? bufsizes[i] : 1024;
+		if (of_property_read_u32_index(np, "epobufsizes", i, &bufsize))
+			bufsize = 1024;
 		ret = gr_ep_init(dev, i, 0, bufsize);
 		if (ret)
 			return ret;
 	}
 
-	bufsizes = (u32 *)of_get_property(np, "epibufsizes", &len);
-	len /= sizeof(u32);
 	for (i = 0; i < dev->nepi; i++) {
-		bufsize = (bufsizes && i < len) ? bufsizes[i] : 1024;
+		if (of_property_read_u32_index(np, "epibufsizes", i, &bufsize))
+			bufsize = 1024;
 		ret = gr_ep_init(dev, i, 1, bufsize);
 		if (ret)
 			return ret;
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
