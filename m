From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] clocksource: arch_timer: Allow the device tree to
 specify the physical timer
Date: Tue, 16 Sep 2014 12:03:21 +0100
Message-ID: <20140916110321.GD27273@arm.com>
References: <5411D528.4050605@arm.com>
 <CAD=FV=XMmizxJFPj0FEhJ7Gk4ZcQaUJDxf_Qq5kGKSvxDFVmzg@mail.gmail.com>
 <5411DA67.2040402@arm.com>
 <CAD=FV=UQfo4J3P4wGjOhQZQ5KXKgYAdjPsi1ykKZxQw-FwJz8w@mail.gmail.com>
 <5411DF5D.8060906@arm.com>
 <5412DC48.7030708@codeaurora.org>
 <5412E3BB.9030800@arm.com>
 <54134291.3040700@codeaurora.org>
 <20140915111055.GD1577@arm.com>
 <54174CFF.7050504@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54174CFF.7050504-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 15, 2014 at 09:33:03PM +0100, Stephen Boyd wrote:
> On 09/15/14 04:10, Catalin Marinas wrote:
> > On Fri, Sep 12, 2014 at 07:59:29PM +0100, Stephen Boyd wrote:
> >> On 09/12/14 05:14, Marc Zyngier wrote:
> >>> We surely can handle the UNDEF and do something there. We just can't do
> >>> it the way Doug described it above.
> >> I suggested doing that for something else a while ago and Will and Dave
> >> we're not thrilled[1]. The suggestion back then was to use DT to
> >> indicate what mode the kernel is running in.
> >>
> >> [1]
> >> http://lists.infradead.org/pipermail/linux-arm-kernel/2012-June/105321.html
> > I think the context was slightly different. As I re-read the thread, it
> > seems that the discussion was around whether to use some SMC interface
> > or not based on whether the kernel is running secure or non-secure. The
> > argument made by Will was to actually specify the type of the firmware
> > SMC interface in the DT and use it in the kernel (and probably assume
> > the kernel is running in secure mode if no smc interface is specified in
> > the DT; you could have both though, running in secure mode and also
> > having firmware).
> >
> > In this arch timer case, we need to work around a firmware bug (or
> > feature as 32-bit ARM kernels never required CNTVOFF initialisation by
> > firmware, no matter how small such firmware is). We don't expect a
> > specific SMC call to initialise CNTVOFF, so we can't describe it in the
> > DT.
> 
> Agreed, we can't described SMC calls that don't exist. From my
> perspective it's just another part of the cpu boot sequence that needs
> to be handled in the kernel, so describing the requirement via the
> cpu-boot method seems appropriate. It seems like we're making it harder
> than it should be by handling the undef when we could have slightly
> different SMP boot code (and suspend/resume code) depending on the boot
> method property.

For 32-bit ARM SoCs, I think you can describe this via some specific
enable-method property. What I don't like though is the multitude of
enable methods (trying to reduce them on arm64) and the fact that
registers like CNTVOFF are rather architecture than SoC specific.

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
