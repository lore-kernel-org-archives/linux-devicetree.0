From: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/6] usb: gadget: gr_udc: OF and ep.maxpacket_limit related improvements
Date: Thu,  9 Jan 2014 11:54:12 +0100
Message-ID: <1389264858-32664-1-git-send-email-andreas@gaisler.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds some OF related improvements suggested by Mark
Rutland.

This patchset also adds ep.maxpacket_limit to the debugfs file and adds
a check if gr_ep_enable is called with a maxpacket value greater than
ep.maxpacket_limit.

Andreas Larsson (6):
  usb: gadget: gr_udc: Make struct platform_device variable name
    clearer
  usb: gadget: gr_udc: Expand devicetree documentation
  usb: gadget: gr_udc: Use platform_get_irq instead of
    irq_of_parse_and_map
  usb: gadget: gr_udc: Use of_property_read_u32_index to access arrays
  usb: gadget: gr_udc: Add ep.maxpacket_limit to debugfs information
  usb: gadget: gr_udc: Return error code when trying to set
    ep.maxpacket > ep.maxpacket_limit

 Documentation/devicetree/bindings/usb/gr-udc.txt |   22 ++++++----
 drivers/usb/gadget/gr_udc.c                      |   49 ++++++++++++----------
 2 files changed, 40 insertions(+), 31 deletions(-)

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
