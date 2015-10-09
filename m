From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: Juno: Add support for the PCIe host bridge on
 Juno R1
Date: Fri, 9 Oct 2015 15:18:14 +0100
Message-ID: <20151009141814.GR26278@arm.com>
References: <1444398323-17354-1-git-send-email-Liviu.Dudau@arm.com>
 <1444398323-17354-4-git-send-email-Liviu.Dudau@arm.com>
 <CAL_JsqJsb53VXiUfjGBXK37dBEi1r-PXVohg-c-7_x63R04VMA@mail.gmail.com>
 <20151009141107.GD3394@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151009141107.GD3394-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, device-tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 03:11:07PM +0100, Liviu Dudau wrote:
> On Fri, Oct 09, 2015 at 08:54:33AM -0500, Rob Herring wrote:
> > On Fri, Oct 9, 2015 at 8:45 AM, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wrote:
> > > Juno R1 board sports a functional PCIe host bridge that is
> > > compliant with the SBSA standard found here[1]. With the right
> > > firmware that initialises the XpressRICH3 controller one can
> > > use the generic Host Bridge driver to use the PCIe hardware.
> > >
> > > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> > >
> > > [1] http://infocenter.arm.com/help/topic/com.arm.doc.den0029a/
> > > ---
> > >  arch/arm64/boot/dts/arm/juno-r1.dts | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
> > > index c627511..a702a6b 100644
> > > --- a/arch/arm64/boot/dts/arm/juno-r1.dts
> > > +++ b/arch/arm64/boot/dts/arm/juno-r1.dts
> > > @@ -109,6 +109,26 @@
> > >
> > >         #include "juno-base.dtsi"
> > >
> > > +       pcie-controller@40000000 {
> > > +               compatible = "pci-host-ecam-generic";
> > 
> > I think this is the first case of real h/w using this. We should have
> > a specific compatible here additionally.
> 
> Or maybe I can claim the use of the string on account on being the first
> on arm64 ;)

This is already being used on arm64 with kvmtool, qemu, the ARM fastmodel
and AMD Seattle.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
