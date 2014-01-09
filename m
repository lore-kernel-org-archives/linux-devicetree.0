From: Andreas Larsson <andreas@gaisler.com>
Subject: [PATCH 4/6] usb: gadget: gr_udc: Use of_property_read_u32_index to access arrays
Date: Thu,  9 Jan 2014 11:54:16 +0100
Message-ID: <1389264858-32664-5-git-send-email-andreas@gaisler.com>
References: <1389264858-32664-1-git-send-email-andreas@gaisler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389264858-32664-1-git-send-email-andreas@gaisler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

Use an appropriate accessor function for property arrays to make the code nicer
and make the code correct if it would ever run on little endian architectures.
Suggested by Mark Rutland.

Signed-off-by: Andreas Larsson <andreas@gaisler.com>
---
 drivers/usb/gadget/gr_udc.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/gr_udc.c b/drivers/usb/gadget/gr_udc.c
index e471db3..8df35fc 100644
--- a/drivers/usb/gadget/gr_udc.c
+++ b/drivers/usb/gadget/gr_udc.c
@@ -2026,9 +2026,7 @@ static int gr_udc_init(struct gr_udc *dev)
 	u32 dmactrl_val;
 	int i;
 	int ret = 0;
-	u32 *bufsizes;
 	u32 bufsize;
-	int len;
 
 	gr_set_address(dev, 0);
 
@@ -2039,19 +2037,17 @@ static int gr_udc_init(struct gr_udc *dev)
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
