From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Sun, 31 May 2009 11:52:42 +0100
Message-ID: <20090531105242.GE18650@n2100.arm.linux.org.uk>
References: <4A1D6901.2090508@freescale.com>
	<20090527175609.GB31861@flint.arm.linux.org.uk>
	<4A1D8FBA.6040802@freescale.com>
	<20090527192909.GA32398@flint.arm.linux.org.uk>
	<20090527205218.GA5591@sirena.org.uk>
	<fa686aa40905271405pc2f1738gc8dd139f61a0e27@mail.gmail.com>
	<20090528124307.GN22742@pengutronix.de>
	<alpine.LFD.2.00.0905281457170.3397@localhost.localdomain>
	<20090528150409.GO22742@pengutronix.de>
	<1243558274.17903.21.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1243558274.17903.21.camel@pasglop>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 29, 2009 at 10:51:14AM +1000, Benjamin Herrenschmidt wrote:
> On Thu, 2009-05-28 at 17:04 +0200, Sascha Hauer wrote:
> > 
> > We normally hide these subtle details behind a baseboard= kernel
> > parameter. I agree with you that it's far better to have a
> > standardized
> > way to specify this. For my taste the oftree is too bloated for this
> > purpose.
> 
> Define "bloated" ?
> 
> We got a lot of push back on powerpc initially with this exact same
> argument "too bloated" but that was never backed up with facts and
> numbers, and I would mostly say that nobody makes it anymore now
> that it's there and people use it.

It really depends how you look at it.

If you look at the amount of supporting code required for one platform
on ARM, it's typically fairly small - mostly just declaration of data
structures (platform devices, platform device data), and possibly a few
small functions to handle the quirkyness of the platform.  That's of the
order of a few K of data and code combined - that's on average about 4K.
Add in the SoC platform device declaration code, and maybe add another
10K.

So, about 14K of code and data.

The OF support code in drivers/of is about 3K.  The code posted at the
start of this thread I suspect will be about 4K or so, which gives us a
running total of maybe 7K.

What's now missing is conversion of drivers and the like to be DT
compatible, or creation of the platform devices to translate DT into
platform devices and their associated platform device data.  Plus
some way to handle the platforms quirks, which as discussed would be
hard to represent in DT.

So I suspect it's actually marginal whether DT turns out to be larger
than our current approach.  So I agree with BenH - I don't think there's
an argument to be made about 'bloat' here.

What /does/ concern me is what I percieve as the need to separate the
platform quirks from the description of the platform - so rather than
having a single file describing the entire platform (eg,
arch/arm/mach-pxa/lubbock.c) we would need:

- a file to create the DT information
- a separate .c file in the kernel containing code to handle the
  platforms quirks, or a bunch of new DT drivers to do the same
- ensure both DT and quirks are properly in-sync.

But... we need to see how Grant gets on with his PXA trial before we
can properly assess this.
