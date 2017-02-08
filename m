From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Wed, 08 Feb 2017 18:40:09 +0200
Message-ID: <1486572009.2133.406.camel@linux.intel.com>
References: <1486543976-28006-1-git-send-email-richard.leitner@skidata.com>
         <1486560068.2133.395.camel@linux.intel.com>
         <20170208135957.GA916@kroah.com>
         <96c8a6f9-3b93-8ba0-22b1-502e22dac31c@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <96c8a6f9-3b93-8ba0-22b1-502e22dac31c@skidata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <richard.leitner@skidata.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, stern@rowland.harvard.edu, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

On Wed, 2017-02-08 at 16:17 +0100, Richard Leitner wrote:
> On 02/08/2017 02:59 PM, Greg KH wrote:
> > On Wed, Feb 08, 2017 at 03:21:08PM +0200, Andy Shevchenko wrote:
> > > On Wed, 2017-02-08 at 09:52 +0100, Richard Leitner wrote:
> > > > From: Richard Leitner <dev@g0hl1n.net>
> > > 
> > > If you want to fix the above you have to fix your Git
> > > configuration.
> 
> My git config is fine, just cherry-picked it from a remote and forgot
> I
> committed it from another computer with another git config ;-)
> Will fix that in v5 for sure!

OK!

> > > > +++ b/drivers/usb/misc/usb251xb.c
> > > > @@ -0,0 +1,674 @@
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/gpio.h>
> > > > +#include <linux/delay.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of_gpio.h>
> > > > +#include <linux/of_device.h>
> > > > +#include <linux/nls.h>
> > > 
> > > Alphabetical order?
> > 
> > Ick, no, who cares, really.  It's whatever order the author wants,
> > don't
> > be so picky.

That's why question mark. If author thinks it's good idea (our case,
btw) then it takes, otherwise I'm okay with it.

> 
> Ok :-)
> But somehow you're right Andy, alphabetical order seems to look better
> here (will do that in v5).
> 

> > 
> > > > +#define DRIVER_NAME "usb251xb"
> > > > +#define DRIVER_DESC "Microchip USB 2.0 Hi-Speed Hub Controller"
> > > > +#define DRIVER_VERSION "1.0"
> > > 
> > > Is it my MUA, or all above indentations are broken?
> > 
> > What do you mean?
> 
> Should the strings be aligned, like the following?
> #define DRIVER_NAME     "usb251xb"
> #define DRIVER_DESC     "Microchip USB .."
> #define DRIVER_VERSION	"1.0"

Yep, tab vs. space indentation.



> > > Above doesn't make much sense. Why not to use
> > > 
> > > > BIT(bit) 
> > > 
> > > and
> > > 
> > > & ~BIT(bit)
> > > 
> > > in place?
> > 
> > I thought we already had functions to do this for you.  Don't write
> > new
> > ones "by hand" either wya.
> 
> Which functions do you mean? I only found set_bit() and clear_bit()
> from
> atomic_ops. But those operate on "unsigned long" variables. From the
> documentation:
> 	Native atomic bit operations are defined to operate
> 	on objects aligned to the size of an "unsigned long"
> 	C data type, and are least of that size.

__set_bit(), __clear_bit() -- non-atomic variants, but you are right,
that (unsigned long) exactly the point I didn't propose them.


> > > > +		/* the first data byte transferred tells the
> > > > hub how
> > > > many data
> > > > +		 * bytes will follow (byte count)
> > > > +		 */
> > > 
> > > I'm not sure this is good formatted comment for USB subsystem.
> > 
> > Looks fine to me, why do you think it is incorrect?

I would do like

/*
 * The multi-line
 * comment.
 */

Capital letter, period at the end, first empty line (unlike in net
subsystem).

> > 
> > > > +	/* the following parameters are currently not exposed
> > > > to
> > > > devicetree, but
> > > > +	 * may be as soon as needed
> > > > +	 */
> > > 
> > > Style of multi-line comment.
> > 
> > Nope, it's fine.
> > 
> > > > +#else /* CONFIG_OF */
> > > > +static int usb251xb_get_ofdata(struct usb251xb *hub,
> > > > +			       struct usb251xb_data *data)
> > > > +{
> > > > +	return 0;
> > > > +}
> > > > +#endif /* CONFIG_OF */
> > > 
> > > I don't think it's a good idea to have those ugly #ifdef.
> > 
> > How can it be removed?

__maybe_unused for function, device_property_*() instead of
of_property_*() calls.

Something like that. But if you are insisting this is *only* OF
available hardware or we don't care, I'll not object.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
