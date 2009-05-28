From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 15:18:02 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.0905281457170.3397@localhost.localdomain>
References: <fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com> <ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com> <20090527150527.GK6805@pengutronix.de> <87vdnm8sec.fsf@macbook.be.48ers.dk> <4A1D6901.2090508@freescale.com>
 <20090527175609.GB31861@flint.arm.linux.org.uk> <4A1D8FBA.6040802@freescale.com> <20090527192909.GA32398@flint.arm.linux.org.uk> <20090527205218.GA5591@sirena.org.uk> <fa686aa40905271405pc2f1738gc8dd139f61a0e27@mail.gmail.com>
 <20090528124307.GN22742@pengutronix.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1762580AbZE1NUj@vger.kernel.org>
In-Reply-To: <20090528124307.GN22742@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Russell King <rmk+lkml@arm.linux.org.uk>, devicetree-discuss <devicetree-discuss@ozlabs.org>, linux-kernel@vger.kernel.org, Timur Tabi <timur@freescale.com>, Scott Wood <scottwood@freescale.com>, Janboe Ye <yuan-bo.ye@motorola.com>, linux-arm-kernel@lists.arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

On Thu, 28 May 2009, Sascha Hauer wrote:
> > There is the advantage of easy multiplatform support.  I regularly
> > build a single kernel image which boots on all my MPC5200 boards, and
> > on my MPC83xx boards.
> 
> That is not necessarily an advantage of a device tree. On ARM you can
> also build a kernel which runs on 20+ PXA platforms at the same time.
> (And I'm sure it can be done to even support say i.MX and PXA at the
> same time, but this is another story)

Well, you can run it on 20+ PXA platforms which have all their own
machine number, but you have all the little details of each platform
hardcoded into the kernel.

That does not help at all when your board has 5 variants just
different in subtle details which can not be probed or enumerated by
inspection. That's a common scenario in the embedded world.

So you either have 5 board numbers and all the details harcoded again
or you add some extra magic to deduce on which variant you are running
on.

We have seen almost everything in the weirdness range from poking in
some hardcoded FLASH cells over weird command line parsers up to a XML
parser which were added to work around the limitations of the machine
number model.

With a device tree you can avoid that crap and provide a standardized
interface for such cases.

I'm not saying that the device tree will make all those problems go
away magically, but it's orders of magnitudes better than what people
do now.

There is no need to force switch all of ARM to the device tree, but
adding support for it would be a good move. Nobody wants to enforce it
and both models can live happily side by side and we'll see which
variant turns out to be the long term favourite solution.

Thanks,

	tglx
