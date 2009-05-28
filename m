From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 17:27:11 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.0905281721140.3397@localhost.localdomain>
References: <20090527150527.GK6805@pengutronix.de>
	<87vdnm8sec.fsf@macbook.be.48ers.dk>
	<4A1D6901.2090508@freescale.com>
	<20090527175609.GB31861@flint.arm.linux.org.uk>
	<4A1D8FBA.6040802@freescale.com>
	<20090527192909.GA32398@flint.arm.linux.org.uk>
	<20090527205218.GA5591@sirena.org.uk>
	<fa686aa40905271405pc2f1738gc8dd139f61a0e27@mail.gmail.com>
	<20090528124307.GN22742@pengutronix.de>
	<alpine.LFD.2.00.0905281457170.3397@localhost.localdomain>
	<20090528150409.GO22742@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090528150409.GO22742-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Russell King <rmk+lkml-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 28 May 2009, Sascha Hauer wrote:
> > That does not help at all when your board has 5 variants just
> > different in subtle details which can not be probed or enumerated by
> > inspection. That's a common scenario in the embedded world.
> 
> We normally hide these subtle details behind a baseboard= kernel
> parameter. I agree with you that it's far better to have a standardized
> way to specify this. For my taste the oftree is too bloated for this
> purpose.

Well, with the baseboard= you still have to hack the details into the
kernel, which just adds code which needs to be maintained. I really
can do without 20 different platform structs and switch cases which
init GPIOs if there is an elegant way to describe the pin routing and
such. If you get your configuration out of OF tree then you can handle
this w/o even touching the kernel in most cases.

> > There is no need to force switch all of ARM to the device tree, but
> > adding support for it would be a good move. Nobody wants to enforce it
> > and both models can live happily side by side and we'll see which
> > variant turns out to be the long term favourite solution.
> 
> Having it as an optional feature seems a good idea for the same reasons
> you mentioned. I just wonder how optional it can be once a board
> maintainer and a person sending patches disagree on whether to use oftree
> or not.

As always it will be discussed on technical grounds. :)

Thanks,

	tglx
