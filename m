From: Frans Klaver <frans.klaver@xsens.com>
Subject: Re: [RFC PATCH 1/2] sbs-battery: add forced instantiation from
 device tree
Date: Wed, 24 Sep 2014 17:14:48 +0200
Message-ID: <20140924151448.GD22872@ci00147.xsens-tech.local>
References: <1411564278-17207-1-git-send-email-frans.klaver@xsens.com>
 <1411564278-17207-2-git-send-email-frans.klaver@xsens.com>
 <20140924131655.GG5729@leverpostej>
 <20140924142222.GC22872@ci00147.xsens-tech.local>
 <20140924143848.GH5729@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140924143848.GH5729@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 24, 2014 at 03:38:49PM +0100, Mark Rutland wrote:
> On Wed, Sep 24, 2014 at 03:22:22PM +0100, Frans Klaver wrote:
> > On Wed, Sep 24, 2014 at 02:16:55PM +0100, Mark Rutland wrote:
> > > On Wed, Sep 24, 2014 at 02:11:17PM +0100, Frans Klaver wrote:
> > > > In some cases you want to instantiate a battery even before it is
> > > > attached; it is perfectly reasonable for a device to start up on
> > > > wall-power and be connected to a battery later. The current advice is to
> > > > instantiate a device explicitly in the kernel, or probe for the device
> > > > from userspace. The downside of these approaches is that the user needs
> > > > to keep the information related to the i2c battery in different places,
> > > > which is inconvenient.
> > > 
> > > This really sounds like a Linux policy issue rather than something that
> > > should be described in dt.
> > > 
> > > Presumably there's a reason we sanity cehck this in the first place.
> > > What happens while the battery isn't plugged in? What can fail, and how?
> > 
> > It was introduced in a22b41a31e53 "sbs-battery: Probe should try talking
> > to the device", saying:
> > 
> >   "this driver doesn't actually try talking to the device at probe time,
> >   so if it's incorrectly configured in the device tree or platform data
> >   (or if the battery has been removed from the system), then probe will
> >   succeed and every access will sit there and time out. The end result
> >   is a possibly laggy system that thinks it has a battery but can never
> >   read status, which isn't very useful."
> > 
> > That's a reasonable thing to do, but it breaks just the feature I need.
> > Besides that, the driver provides us with a gpio that indicates battery
> > presence, which will also be useless if the device isn't present at
> > probe time. That commit also doesn't take into account the fact that a
> > battery could be removed after probing without any problems, leaving the
> > system in the same state as before the probe change.
> > 
> > Now if the battery isn't plugged in, it is never detected after it has
> > been attached, unless you take action from userspace. Basically you
> > don't know your battery level until it has been explicitly probed.
> > 
> > We might also reduce the severity of the sanity check failure to produce
> > a warning instead of an error. This would achieve that a developer might
> > be warned that the battery isn't present, but also allow my use case
> > where the battery may not be present at boot time. Was that what you
> > meant with policy by the way?
> 
> In general, properties in general shouldn't tell the kernel what to do.
> They should tell the kernel details of the hardware that it can then use
> to make informed decisions. In this case, the suggested property is
> purely a software detail, as the hardware isn't any different in
> situations you would or would not want the property.

Ok, that makes sense.

> You mention that there's a GPIO that can be used to detect the battery
> presence. Why can't the driver always probe and then on check for the
> presence of the battery dynamically using that GPIO? That should cover
> both cases.

I would say that this was the case before [1] was done. The GPIO is
optional and if not configured, the presence or absence of the battery
is detected by checking a status register much like probe() currently
does. It seems all cases were covered before that patch. If you worry
about speed, you should use the GPIO. I wonder if we might be able to
revert [1] without doing much harm.

Thanks,
Frans

[1] a22b41a31e53 "sbs-battery: Probe should try talking to the device"
