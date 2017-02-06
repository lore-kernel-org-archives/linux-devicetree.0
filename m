From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v2] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Mon, 6 Feb 2017 12:55:52 +0100
Message-ID: <20170206115552.GA31808@kroah.com>
References: <1486119324-9362-1-git-send-email-richard.leitner@skidata.com>
 <20170205074216.GA314@kroah.com>
 <686ee231-57b2-036f-f97a-dad508e94e39@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <686ee231-57b2-036f-f97a-dad508e94e39-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 06, 2017 at 12:19:40PM +0100, Richard Leitner wrote:
> On 02/05/2017 08:42 AM, Greg KH wrote:
> > On Fri, Feb 03, 2017 at 11:55:24AM +0100, Richard Leitner wrote:
> >> +/**
> >> + * ascii2utf16le() - Helper routine for producing UTF-16LE string descriptors
> >> + * @s: Null-terminated ASCII (actually ISO-8859-1) string
> >> + * @buf: Buffer for UTF-16LE string
> >> + * @len: Length (in bytes; may be odd) of UTF-16LE buffer.
> >> + *
> >> + * Return: The number of bytes filled in: 2*strlen(s) or @len, whichever is less
> >> + *
> >> + * Note:
> >> + * The UTF-16LE USB String descriptors can contain at most 31 characters (as
> >> + * specified in the datasheet); input strings longer than that are truncated.
> >> + *
> >> + * Based on ascii2desc from drivers/usb/core/hcd.c
> >> + */
> > 
> > Don't we have a kernel function for this already?  If we need to export
> > ascii2desc() from the USB core, we can do that, or better yet, move both
> > of them to a string library function in the core part of the kernel.  We
> > shouldn't have to duplicate this type of thin in an individual driver.
> 
> Ok. So I'll move the ascii2utf16le function to lib/string.c (?) and call
> it from ascii2desc in drivers/usb/core/hcd.c (due to the fact ascii2desc
> also prepends 2 bytes) and the USB251xB driver? Would that be OK?

That sounds good to me.

> >> --- /dev/null
> >> +++ b/include/linux/platform_data/usb251xb.h
> >> @@ -0,0 +1,33 @@
> > 
> > Do you need a platform data structure here?  Shouldn't we be only using
> > DT now?
> 
> I don't need the platform data support at all. I just added it because
> it is also available in the USB3503 driver. So if it's OK for you I'd be
> glad to remove it.

Great, please remove it! :)

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
