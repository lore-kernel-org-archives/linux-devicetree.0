From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Thu, 21 Nov 2013 16:00:28 +0000
Message-ID: <20131121160028.45F03C406A3@trevor.secretlab.ca>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail. com> <20131115175241.GB27174@quad.lixom.net> <20131115180832.GR16735@n2100. arm.linux.org.uk> <201311152056.47846.arnd@arndb.de> <20131115232109. GT16735@n2100.arm.linux.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131115232109.GT16735-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 15 Nov 2013 23:21:09 +0000, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Fri, Nov 15, 2013 at 08:56:47PM +0100, Arnd Bergmann wrote:
> > On Friday 15 November 2013, Russell King - ARM Linux wrote:
> > > On Fri, Nov 15, 2013 at 09:52:41AM -0800, Olof Johansson wrote:
> > > > If we knew exactly what we wanted, it'd be a different story. _We
> > > > don't_. We're into year FOUR of the device tree conversion and we're just
> > > > now reaching a point where we think we know what a good solution looks
> > > > like. The first two years were easy -- they were the trivial devices we're
> > > > now talking about on ACPI. After that it got harder. Going through all
> > > > of that again with ACPI? No. No way. Microsoft gets to do it and while
> > > > they're busy sorting it out, we'll boot with device tree.
> > > 
> > > However, there's a very big danger here.  I disagree with the stance
> > > you're taking.
> > > 
> > > It seems that under ACPI and DT, we refer to properties by string names.
> > > That's good, but do we really want to have different string names for the
> > > same property.
> > 
> > For all I know, doing this in ACPI is something that is only now being
> > discussed as Intel wants to be able to reuse the existing features from
> > DT enabled drivers in the kernel and share the implementation between
> > embedded x86 SoCs and embedded ARM/PowerPC/MIPS/... SoCs. That part actually
> > isn't as crazy.
> > 
> > The existing ACPI usage however is basically all binary and cannot be
> > shared with DT, in particular it won't help for the orthogonal problem of
> > using ACPI to get "enterprise server" features on ARM64.
> 
> That's strange, because the patches I've seen from people who want to
> add ACPI support to AMBA are all based around very similar strings to
> those in DT to lookup the same data in ACPI.
> 
> What's been done there is the function which reads from DT has been
> duplicated, and instead of reading the information from DT, it reads it
> from ACPI instead using string names without the vendor prefix.

The fact that they are using different strings is a problem though. Push
back on that. As much as possible the property formats between DT and
ACPI should be identical. This is entirely new territory for ACPI and we
have significant influence over it.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
