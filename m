From: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Wed, 20 Nov 2013 17:43:58 +0000
Message-ID: <alpine.DEB.2.02.1311201737410.3198@kaball.uk.xensource.com>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail. com> <20131115095717.GC1709@e106331-lin.cambridge.arm.com> <20131120134942.95DBFC4079D@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131120134942.95DBFC4079D-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 20 Nov 2013, Grant Likely wrote:
> On Fri, 15 Nov 2013 09:57:17 +0000, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> > On Fri, Nov 15, 2013 at 01:44:10AM +0000, Olof Johansson wrote:
> > > The more I start to see early UEFI/ACPI code, the more I am certain
> > > that we want none of that crap in the kernel. It's making things
> > > considerably messier, while we're already very busy trying to convert
> > > everything over and enable DT -- we'll be preempting that effort just
> > > to add even more boilerplate everywhere and total progress will be
> > > hurt.
> > 
> > We are certainly under a lot of pressure with the device tree migration,
> > and I agree that adding another information source is going to be a
> > source of pain. However, I'd argue that we're going to encounter pain
> > regardless of which approach we take.
> > 
> > I'm of the opinion that the only way we should support ACPI is as a
> > first-class citizen. We don't need to modify every driver and subsystem
> > to support ACPI, only those necessary to support the minimal set of
> > platforms using ACPI. ACPI is new in the arm space, and we can enforce
> > quality standards on ACPI _now_ above what we're allowing for DT, and
> > avoid future problems.
> 
> Translated ACPI tables really don't make any sense at all. While the
> models are similar in some regards, they are very different in others
> and any translator (I suspect) would become very complicated to deal
> with all the edge cases.
 
If it turns out that we can't translate the ACPI tables dynamically, we
could maintain a repository of "manually" translated DTSes for all the
systems that do not ship with device tree.  Given that DTBs are fairly
small, we could stick them all in an initrd or another binary loaded by
the bootloader so that Linux and/or Xen can select the right one at boot
time.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
