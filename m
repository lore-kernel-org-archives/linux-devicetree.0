From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Wed, 20 Nov 2013 13:49:42 +0000
Message-ID: <20131120134942.95DBFC4079D@trevor.secretlab.ca>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail. com> <20131115095717.GC1709@e106331-lin.cambridge.arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131115095717.GC1709-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 15 Nov 2013 09:57:17 +0000, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Fri, Nov 15, 2013 at 01:44:10AM +0000, Olof Johansson wrote:
> > The more I start to see early UEFI/ACPI code, the more I am certain
> > that we want none of that crap in the kernel. It's making things
> > considerably messier, while we're already very busy trying to convert
> > everything over and enable DT -- we'll be preempting that effort just
> > to add even more boilerplate everywhere and total progress will be
> > hurt.
> 
> We are certainly under a lot of pressure with the device tree migration,
> and I agree that adding another information source is going to be a
> source of pain. However, I'd argue that we're going to encounter pain
> regardless of which approach we take.
> 
> I'm of the opinion that the only way we should support ACPI is as a
> first-class citizen. We don't need to modify every driver and subsystem
> to support ACPI, only those necessary to support the minimal set of
> platforms using ACPI. ACPI is new in the arm space, and we can enforce
> quality standards on ACPI _now_ above what we're allowing for DT, and
> avoid future problems.

Translated ACPI tables really don't make any sense at all. While the
models are similar in some regards, they are very different in others
and any translator (I suspect) would become very complicated to deal
with all the edge cases.

> I'm not sure that translating ACPI tables to dt makes any sense. If AML
> is used (even sparingly), I do not believe that we can do any sensible
> conversion to device tree. My understanding is that AML includes
> functionality for modifying ACPI tables, and I don't see how we can
> possibly support that without having to add a lot of boilerplate to all
> the code handling AML to add a device tree backend...

The dynamic features of AML would be a no-go. Basically, an AML method
can cause SSDT blocks to be loaded/unloaded at runtime. It doesn't edit
the tree provided at runtime, but it does augment it.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
