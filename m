From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Fri, 15 Nov 2013 19:57:35 +0100
Message-ID: <201311151957.36133.arnd@arndb.de>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com> <20131115095717.GC1709@e106331-lin.cambridge.arm.com> <20131115182826.GB14920@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131115182826.GB14920-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 15 November 2013, Jason Gunthorpe wrote:
> 
> On Fri, Nov 15, 2013 at 09:57:17AM +0000, Mark Rutland wrote:
> 
> > first-class citizen. We don't need to modify every driver and subsystem
> > to support ACPI, only those necessary to support the minimal set of
> > platforms using ACPI. ACPI is new in the arm space, and we can enforce
> > quality standards on ACPI now above what we're allowing for DT, and
> > avoid future problems.
> 
> I think to replicate the kind of 'success' ACPI sees in x86-land you
> really need to push back on the HW folks and limit what drivers will
> be supported on ACPI systems.
> 
> ACPI should be coupled with a standard basic HW environment -
> analogous to the stable APIC, PCI and HPET standards we have in
> x86. (ARMv8 only?)

timers and interrupts are pretty much standardized in ARMv8 and in
SMP-capable ARMv7 systems now, it's really the PCI argument that
matters here. Even on Intel's embedded SoCs, the integrated 
peripherals tend to be shown to software as standalone PCI devices
that don't need to talk to another internal device to set up
DMA, clocks, pinmux etc.

> Other essential devices (ethernet, graphics, etc) should fit within
> the PCI framework. Again, mostly like x86.
> 
> If you don't fit in that model then use DT.
> 
> If you need the kernel to control clk, pinctrl, regulator, etc then
> you should be using DT.

Exactly.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
