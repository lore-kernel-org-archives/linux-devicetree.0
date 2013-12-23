From: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4] usb: gadget: Add UDC driver for Aeroflex Gaisler GRUSBDC
Date: Mon, 23 Dec 2013 13:16:02 +0100
Message-ID: <52B82982.4040906@gaisler.com>
References: <1387456805-16610-1-git-send-email-andreas@gaisler.com> <52B31149.7020503@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52B31149.7020503-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/19/2013 04:31 PM, Robert Baldyga wrote:
> Hi Andreas,
>
> According to changes in gadget API, which I did in this patch
> http://permalink.gmane.org/gmane.linux.usb.general/100108 you should
> initialize endpoints with ep_set_maxpacket_limit() function.
>
> I described needed changes in your code (in gr_ep_init() function).

Hi!

Thank you for the feedback! Added to v5.

Best regards,
Andreas Larsson


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
