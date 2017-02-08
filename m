From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v4] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Wed, 08 Feb 2017 21:20:44 +0200
Message-ID: <1486581644.2133.409.camel@linux.intel.com>
References: <1486543976-28006-1-git-send-email-richard.leitner@skidata.com>
         <1486560068.2133.395.camel@linux.intel.com>
         <20170208135957.GA916@kroah.com>
         <96c8a6f9-3b93-8ba0-22b1-502e22dac31c@skidata.com>
         <1486572009.2133.406.camel@linux.intel.com>
         <80e533b6-4eb3-0019-fe18-82dd0d7aaa1c@g0hl1n.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <80e533b6-4eb3-0019-fe18-82dd0d7aaa1c-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>, Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-02-08 at 19:45 +0100, Richard Leitner wrote:
> On 02/08/2017 05:40 PM, Andy Shevchenko wrote:
> > On Wed, 2017-02-08 at 16:17 +0100, Richard Leitner wrote:
> > > On 02/08/2017 02:59 PM, Greg KH wrote:
> > > > On Wed, Feb 08, 2017 at 03:21:08PM +0200, Andy Shevchenko wrote:
> > > > > On Wed, 2017-02-08 at 09:52 +0100, Richard Leitner wrote:

> > > > > Above doesn't make much sense. Why not to use
> > > > > 
> > > > > > BIT(bit)
> > > > > 
> > > > > and
> > > > > 
> > > > > & ~BIT(bit)
> > > > > 
> > > > > in place?
> > > > 
> > > > I thought we already had functions to do this for you.  Don't
> > > > write
> > > > new
> > > > ones "by hand" either wya.
> > > 
> > > Which functions do you mean? I only found set_bit() and
> > > clear_bit()
> > > from
> > > atomic_ops. But those operate on "unsigned long" variables. From
> > > the
> > > documentation:
> > > 	Native atomic bit operations are defined to operate
> > > 	on objects aligned to the size of an "unsigned long"
> > > 	C data type, and are least of that size.
> > 
> > __set_bit(), __clear_bit() -- non-atomic variants, but you are
> > right,
> > that (unsigned long) exactly the point I didn't propose them.
> 
> So the preferred solution is the BIT() stuff?

I think BIT() macro in place. Otherwise you'll need a temporary unsigned
long variable. If you already have one, then __*_bit() would work.

> +		/* the first data byte transferred tells
> > > > > > the
> > > > > > hub how
> > > > > > many data
> > > > > > +		 * bytes will follow (byte count)
> > > > > > +		 */
> > > > > 
> > > > > I'm not sure this is good formatted comment for USB subsystem.
> > > > 
> > > > Looks fine to me, why do you think it is incorrect?
> > 
> > I would do like
> > 
> > /*
> >  * The multi-line
> >  * comment.
> >  */
> > 
> > Capital letter, period at the end, first empty line (unlike in net
> > subsystem).
> 
> So what's the preferred format? Empty line at the beginning or not?

Both fine to me. It's not a real code anyway.

> > > > > > +static int usb251xb_get_ofdata(struct usb251xb *hub,
> > > > > > +			       struct usb251xb_data *data)
> > > > > > +{
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +#endif /* CONFIG_OF */
> > > > > 
> > > > > I don't think it's a good idea to have those ugly #ifdef.
> > > > 
> > > > How can it be removed?
> > 
> > __maybe_unused for function, device_property_*() instead of
> > of_property_*() calls.
> > 
> > Something like that. But if you are insisting this is *only* OF
> > available hardware or we don't care, I'll not object.
> 
> In usb3503.c and usb4604.c we have that #ifdef CONFIG_OF too. IMHO
> those 
> drivers should use the same solution here. But you guys are the ones 
> with tons of kernel coding experience, so just say how it should be
> done :-)

I'll agree with whatever Greg wants here.

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
