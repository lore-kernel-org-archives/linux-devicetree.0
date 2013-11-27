From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/12] memory: davinci-aemif: introduce AEMIF driver
Date: Tue, 26 Nov 2013 16:37:07 -0800
Message-ID: <20131127003707.GQ9468@ld-irv-0074.broadcom.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1384187188-5776-8-git-send-email-ivan.khoronzhuk@ti.com>
 <4F5844B3A985794BA902E12C070812375F8D2E@DNCE04.ent.ti.com>
 <52944BD3.90105@ti.com>
 <5294B8C4.6040803@ti.com>
 <5294D8AD.5030106@ti.com>
 <5294E7E4.3060600@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5294E7E4.3060600-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "Khoronzhuk, Ivan" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 26, 2013 at 01:26:44PM -0500, Santosh Shilimkar wrote:
> On Tuesday 26 November 2013 12:21 PM, Sekhar Nori wrote:
> > On 11/26/2013 8:35 PM, Santosh Shilimkar wrote:
> >> On Tuesday 26 November 2013 02:20 AM, Sekhar Nori wrote:
> >>> On Monday 11 November 2013 10:36 PM, Khoronzhuk, Ivan wrote:
> >>>> +static int davinci_aemif_probe(struct platform_device *pdev)
> >>>> +{
> >>>> +       int ret  = -ENODEV, i;
> >>>> +       struct resource *res;
> >>>> +       struct device *dev = &pdev->dev;
> >>>> +       struct device_node *np = dev->of_node;
> >>>> +
> >>>> +       if (np == NULL)
> >>>> +               return 0;
> >>>> +
> >>>> +       if (aemif) {
> >>>> +               dev_err(dev, "davinci_aemif driver is in use currently\n");
> >>>> +               return -EBUSY;
> >>>> +       }
> >>>
> >>> Why expressly prevent multiple AEMIF devices? Its entirely conceivable
> >>> to have two memories like NAND and NOR flash connect to two different
> >>> AEMIF interfaces.
> >>>
> >> Ivan wanted me to clarify the Keystone hardware which supports
> >> 1 instance of controller with 4 CS. That allows already four
> >> devices to be connected. Currently NAND and NOR are connected on it
> >> and two more slots are free.
> >>
> >> Since driver support what hardware is, lets not build a driver for
> >> hardware which don't exist. And if at all such a support would be
> >> needed in future, we can always add it.
> > 
> > I understand the lack of hardware part, but its common to write the
> > driver such that it can handle multiple instances. Is there any gain on
> > current hardware because of this check? From what I am hearing, the code
> > in question wont be exercised at all. So why go all the way and add it
> > in first place?
> > 
> Fair enough. The check can be dropped.

Hmm, while the sentiment expressed by Sekhar is noble (to avoid
unnecessarily constraining the driver), removing the check is not
enough. You're still using a global static variable 'aemif', and it is
important not to accidentally re-use this struct if a second device ever
becomes available. So for the current implementation, the check is
necessary IMO. If instead, you were to make 'aemif' a per-device struct
(like with platform_set_drvdata()), then you would not have this issue.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
