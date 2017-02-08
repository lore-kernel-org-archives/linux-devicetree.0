From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Wed, 8 Feb 2017 14:59:57 +0100
Message-ID: <20170208135957.GA916@kroah.com>
References: <1486543976-28006-1-git-send-email-richard.leitner@skidata.com>
 <1486560068.2133.395.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1486560068.2133.395.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard Leitner <richard.leitner@skidata.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, stern@rowland.harvard.edu, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

On Wed, Feb 08, 2017 at 03:21:08PM +0200, Andy Shevchenko wrote:
> On Wed, 2017-02-08 at 09:52 +0100, Richard Leitner wrote:
> > From: Richard Leitner <dev@g0hl1n.net>
> 
> If you want to fix the above you have to fix your Git configuration.
> 
> 
> > This patch adds a driver for configuration of the Microchip
> > USB251xB/xBi
> > USB 2.0 hub controller series with USB 2.0 upstream connectivity,
> > SMBus
> > configuration interface and two to four USB 2.0 downstream ports.
> > 
> > Furthermore add myself as a maintainer for this driver.
> > 
> > The datasheet can be found at the manufacturers website, see [1]. All
> > device-tree exposed configuration features have been tested on a i.MX6
> > platform with a USB2512B hub.
> 
> > +++ b/drivers/usb/misc/usb251xb.c
> > @@ -0,0 +1,674 @@
> 
> > +#include <linux/i2c.h>
> > +#include <linux/gpio.h>
> > +#include <linux/delay.h>
> > +#include <linux/slab.h>
> > +#include <linux/module.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/of_device.h>
> > +#include <linux/nls.h>
> 
> Alphabetical order?

Ick, no, who cares, really.  It's whatever order the author wants, don't
be so picky.

> > +#define DRIVER_NAME "usb251xb"
> > +#define DRIVER_DESC "Microchip USB 2.0 Hi-Speed Hub Controller"
> > +#define DRIVER_VERSION "1.0"
> 
> Is it my MUA, or all above indentations are broken?

What do you mean?

> > +static inline void set_bit_in_byte(u8 bit, u8 *val)
> > +{
> > +	if (bit < 8)
> > +		*val |= (1 << bit);
> > +}
> > +
> > +static inline void clr_bit_in_byte(u8 bit, u8 *val)
> > +{
> > +	if (bit < 8)
> > +		*val &= ~(1 << bit);
> > +}
> 
> Above doesn't make much sense. Why not to use
> 
> | BIT(bit) 
> 
> and
> 
> & ~BIT(bit)
> 
> in place?

I thought we already had functions to do this for you.  Don't write new
ones "by hand" either wya.

> > +		/* the first data byte transferred tells the hub how
> > many data
> > +		 * bytes will follow (byte count)
> > +		 */
> 
> I'm not sure this is good formatted comment for USB subsystem.

Looks fine to me, why do you think it is incorrect?

> > +	/* the following parameters are currently not exposed to
> > devicetree, but
> > +	 * may be as soon as needed
> > +	 */
> 
> Style of multi-line comment.

Nope, it's fine.

> > +#else /* CONFIG_OF */
> > +static int usb251xb_get_ofdata(struct usb251xb *hub,
> > +			       struct usb251xb_data *data)
> > +{
> > +	return 0;
> > +}
> > +#endif /* CONFIG_OF */
> 
> I don't think it's a good idea to have those ugly #ifdef.

How can it be removed?

> > +static int usb251xb_probe(struct usb251xb *hub)
> > +{
> > +	struct device *dev = hub->dev;
> > +	struct device_node *np = dev->of_node;
> > +	const struct of_device_id *of_id =
> > of_match_device(usb251xb_of_match,
> > +							   dev);
> > +	int err;
> > +
> 
> > +	dev_info(dev, DRIVER_DESC " " DRIVER_NAME "\n");
> 
> Useless.

Agreed.

thanks,

greg k-h
