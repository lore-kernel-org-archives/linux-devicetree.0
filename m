From: Andreas Larsson <andreas@gaisler.com>
Subject: [PATCH 5/6] usb: gadget: gr_udc: Add ep.maxpacket_limit to debugfs information
Date: Thu,  9 Jan 2014 11:54:17 +0100
Message-ID: <1389264858-32664-6-git-send-email-andreas@gaisler.com>
References: <1389264858-32664-1-git-send-email-andreas@gaisler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389264858-32664-1-git-send-email-andreas@gaisler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

Add information on ep.maxpacket_limit for each endpoint in the debugfs
information.

Signed-off-by: Andreas Larsson <andreas@gaisler.com>
---
 drivers/usb/gadget/gr_udc.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/gr_udc.c b/drivers/usb/gadget/gr_udc.c
index 8df35fc..55757fc 100644
--- a/drivers/usb/gadget/gr_udc.c
+++ b/drivers/usb/gadget/gr_udc.c
@@ -143,6 +143,7 @@ static void gr_seq_ep_show(struct seq_file *seq, struct gr_ep *ep)
 	seq_printf(seq, "  wedged = %d\n", ep->wedged);
 	seq_printf(seq, "  callback = %d\n", ep->callback);
 	seq_printf(seq, "  maxpacket = %d\n", ep->ep.maxpacket);
+	seq_printf(seq, "  maxpacket_limit = %d\n", ep->ep.maxpacket_limit);
 	seq_printf(seq, "  bytes_per_buffer = %d\n", ep->bytes_per_buffer);
 	if (mode == 1 || mode == 3)
 		seq_printf(seq, "  nt = %d\n",
-- 
1.7.10.4
