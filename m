From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: gic: add OF based initialization
Date: Mon, 13 Jun 2011 23:14:47 +0100
Message-ID: <20110613221447.GI13643@n2100.arm.linux.org.uk>
References: <1307456541-11026-1-git-send-email-robherring2@gmail.com>
	<1307456541-11026-3-git-send-email-robherring2@gmail.com>
	<20110613165316.GF18161@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110613165316.GF18161-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 13, 2011 at 10:53:16AM -0600, Grant Likely wrote:
> On Tue, Jun 07, 2011 at 09:22:20AM -0500, Rob Herring wrote:
> > +- interrupt-controller : Identifies the node as an interrupt controller
> > +- #interrupt-cells : Specifies the number of cells needed to encode an
> > +  interrupt source.  The type shall be a <u32> and the value shall be 1.
> > +- reg : Specifies base physical address(s) and size of the GIC registers. The
> > +  first 2 values are the GIC distributor register base and size. The 2nd 2
> > +  values are the GIC cpu interface register base and size.
> > +- irq-start : The first actual interrupt that is connected to h/w.
> 
> Drop irq-start.  That's a Linux internal implementation detail, and
> Linux can easily handle dynamic assignment of irq ranges.

Something has to be done with the IRQs on GIC, because Linux probably
won't have a 1:1 mapping between the hardware IRQ numbers and the Linux
IRQ numbers

Have you seen the patches from Marc which deal with the per-CPU
interrupts by creating individual Linux IRQ numbers for each CPU for
each per-CPU interrupt?  So you can end up with 16 per-CPU x 4 CPUs =
64 Linux interrupts for 16 "hardware" interrupts.

How would DT deal with that - and how would you specify a connection
between a per-CPU PMU and one of the per-CPU interrupts?

The sensible thing from a DT point of view I think would be to ignore
that abstraction, and have some kind of mapping layer between DT and
drivers which knew about that.  But that sounds like a world of pain.
