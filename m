From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Fri, 29 May 2009 19:08:00 +1000
Message-ID: <1243588080.17903.52.camel@pasglop>
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
	<20090529075238.GC24565@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090529075238.GC24565-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
Cc: Russell King <rmk+lkml-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2009-05-29 at 09:52 +0200, Sascha Hauer wrote:
> 
> I don't mean bloated in terms of kbytes but bloated in terms of complex
> code used to parse the device tree. I more than once put information in
> the device tree and wondered where this information got lost on the way
> to the driver where I wanted to use it. Back on ARM I was very happy to
> just have a simple board file which is easier for me to understand and
> maintain.
> Of course this can be solved with /me learning more about the device
> tree, that's why I said 'for my taste'.

Well, the code to walk it is trivial since once 'expanded' we reproduce
the tree structure with pointers.

Now, the problem indeed is how do you get to your node from a driver,
and that's where we are making things easy on powerpc by sticking the
node pointer in the struct device itself.

Of course that needs to be populated properly. We have code in PCI to do
it that would need to be ported over for PCI stuff (but I recommend
waiting a bit as this code is currently different on ppc32 and ppc64, a
bit messy, and Kumar is currently working on cleaning that up and
unifying it), and when device are discovered and instanciated from the
DT in the first place, then this is naturally populated.

So I don't think this is a big issue, and the amount of code involved is
relatively small and self contained.

Cheers,
Ben.
