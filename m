From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Fri, 15 Nov 2013 11:28:26 -0700
Message-ID: <20131115182826.GB14920@obsidianresearch.com>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
 <20131115095717.GC1709@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131115095717.GC1709-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 15, 2013 at 09:57:17AM +0000, Mark Rutland wrote:

> first-class citizen. We don't need to modify every driver and subsystem
> to support ACPI, only those necessary to support the minimal set of
> platforms using ACPI. ACPI is new in the arm space, and we can enforce
> quality standards on ACPI _now_ above what we're allowing for DT, and
> avoid future problems.

I think to replicate the kind of 'success' ACPI sees in x86-land you
really need to push back on the HW folks and limit what drivers will
be supported on ACPI systems.

ACPI should be coupled with a standard basic HW environment -
analogous to the stable APIC, PCI and HPET standards we have in
x86. (ARMv8 only?)

Other essential devices (ethernet, graphics, etc) should fit within
the PCI framework. Again, mostly like x86.

If you don't fit in that model then use DT.

If you need the kernel to control clk, pinctrl, regulator, etc then
you should be using DT.

If you need a special one-off HW driver to boot to a console then you
should be using DT ;)

DT is here, it is working, it seems viable to set a strong goal for
ACPI and shift everything else to DT:

 ACPI systems should have the broad compatability we see in x86. New
 hardware bought today should still boot a 3 year old OS.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
