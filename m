From: David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org>
Subject: RE: [PATCH v2 06/11] phy: da8xx-usb: new driver for DA8XX SoC USB
 PHY
Date: Thu, 24 Mar 2016 14:01:10 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6D548EB59F@AcuExch.aculab.com>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <1458181615-27782-7-git-send-email-david@lechnology.com>
 <56F2D0AD.4040005@ti.com> <56F2DB41.7010708@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F2DB41.7010708-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'David Lechner' <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, =?Windows-1252?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Lechner
> Sent: 23 March 2016 18:07
> On 03/23/2016 12:21 PM, Sekhar Nori wrote:
> >> +/* DA8xx CFGCHIP2 (USB PHY Control) register bits */
> >> +#define PHYCLKGD		(1 << 17)
> >> +#define VBUSSENSE		(1 << 16)
> >> +#define RESET			(1 << 15)
> >> +#define OTGMODE_MASK		(3 << 13)
> >> +#define NO_OVERRIDE		(0 << 13)
> >> +#define FORCE_HOST		(1 << 13)
> >> +#define FORCE_DEVICE		(2 << 13)
> >> +#define FORCE_HOST_VBUS_LOW	(3 << 13)

I think I'd define the above as:
#define OTG_MODE(x) ((x) << 13)
#define OTGMODE_MASK		OTG_MODE(3)
#define NO_OVERRIDE		OTG_MODE(0)
#define FORCE_HOST		OTG_MODE(1)
#define FORCE_DEVICE		OTG_MODE(2)
#define FORCE_HOST_VBUS_LOW	OTG_MODE(3)
Then realise that all the names need changing (to include OTG).

> >> +#define USB1PHYCLKMUX		(1 << 12)
> >> +#define USB2PHYCLKMUX		(1 << 11)
> >> +#define PHYPWRDN		(1 << 10)
> >> +#define OTGPWRDN		(1 << 9)
> >> +#define DATPOL			(1 << 8)
> >> +#define USB1SUSPENDM		(1 << 7)
> >> +#define PHY_PLLON		(1 << 6)
> >> +#define SESENDEN		(1 << 5)
> >> +#define VBDTCTEN		(1 << 4)
> >> +#define REFFREQ_MASK		(0xf << 0)
> >> +#define REFFREQ_12MHZ		(1 << 0)
> >> +#define REFFREQ_24MHZ		(2 << 0)
> >> +#define REFFREQ_48MHZ		(3 << 0)
> >> +#define REFFREQ_19_2MHZ		(4 << 0)
> >> +#define REFFREQ_38_4MHZ		(5 << 0)
> >> +#define REFFREQ_13MHZ		(6 << 0)
> >> +#define REFFREQ_26MHZ		(7 << 0)
> >> +#define REFFREQ_20MHZ		(8 << 0)
> >> +#define REFFREQ_40MHZ		(9 << 0)

I'd define these similarly to the OTGxxx values.

> > Many of these register bits are unused. I guess opinion varies around
> > this, but I get confused with unnecessary bit definitions and register
> > offsets. I tend to search for it and its sort of disappointing to see
> > that its basically unused. Of course, you should wait for PHY
> > maintainers preference.

It can be useful to see what isn't being set.
Sometimes this can be very useful when making changes to a driver.
For status values it is particularly important to know what all the bits mean.

> My thinking was that since this driver *owns* the CFGCHIP2 register that
> is would eventually register clocks using the common clock framework, in
> which case, it would use many of these registers.
> 
> But, based on feedback on another commit, if we go the syscon route,
> then yes, I will remove the unused values.
> 
> 
> >> +EXPORT_SYMBOL_GPL(da8xx_usb20_phy_set_mode);
> >
> > Hmm, since this driver exports this symbol, I think it should also
> > provide an include file in include/linux/phy for users of the symbol. Or
> > perhaps there should be a generic API around this since it looks like
> > most USB phys will need something similar?
> >
> 
> The reason I didn't make a header file is that this function is only
> meant to be use in one place and would likely cause a crash if used
> anywhere else.

And a compilation error if compiled with -Wmissing-prototypes.

Sounds like you need a header file just for this driver's 'private' exports.

IMHO .c files shouldn't contain 'extern' anywhere.
I removed a load from some local code and found quite a few lurking bugs
where the types didn't match.

	David

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
