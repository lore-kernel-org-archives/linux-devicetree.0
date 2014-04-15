From: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/7] usb: gadget: gr_udc: OF and ep.maxpacket_limit
 improvements and fix of GFP_KERNEL in atomic context
Date: Tue, 15 Apr 2014 13:41:54 +0200
Message-ID: <534D1B02.2020804@gaisler.com>
References: <1395933359-7109-1-git-send-email-andreas@gaisler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395933359-7109-1-git-send-email-andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-03-27 16:15, Andreas Larsson wrote:
> This patchset:
>   - Adds some OF related improvements suggested by Mark
>     Rutland.
>   - Adds ep.maxpacket_limit to the debugfs file and adds a check if
>     gr_ep_enable is called with a maxpacket value greater than
>     ep.maxpacket_limit.
>   - Fixes a bug where GFP_KERNEL was used in atomic context
>
> Andreas Larsson (7):
>    usb: gadget: gr_udc: Make struct platform_device variable name
>      clearer and use platform_set/get_drvdata
>    usb: gadget: gr_udc: Expand devicetree documentation
>    usb: gadget: gr_udc: Use platform_get_irq instead of
>      irq_of_parse_and_map
>    usb: gadget: gr_udc: Use of_property_read_u32_index to access arrays
>    usb: gadget: gr_udc: Add ep.maxpacket_limit to debugfs information
>    usb: gadget: gr_udc: Return error code when trying to set
>      ep.maxpacket > ep.maxpacket_limit
>    usb: gadget: gr_udc: Use GFP_ATOMIC when allocating under help
>      spinlock
>
>   Documentation/devicetree/bindings/usb/gr-udc.txt |   22 +++++----
>   drivers/usb/gadget/gr_udc.c                      |   53 ++++++++++++----------
>   2 files changed, 42 insertions(+), 33 deletions(-)


Anyone got feedback or reasons this cannot be accepted?

Best regards,
Andreas Larsson
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
