From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: Regarding hw irq to Linux irq mapping on ARM
Date: Wed, 22 Sep 2010 08:02:26 +1000
Message-ID: <1285106546.30449.158.camel@pasglop>
References: <AANLkTi=6nCJnfLB1uc0uLGOvOm0CX_R=j-8GQWTzmmep@mail.gmail.com>
	<AANLkTimp7+BLNBwZyBiPS0JgB_mno+gp8+mK=VdOd3+_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTimp7+BLNBwZyBiPS0JgB_mno+gp8+mK=VdOd3+_-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eric Miao <eric.miao-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2010-09-21 at 16:57 -0300, Grant Likely wrote:
> On Tue, Sep 21, 2010 at 7:25 AM, Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Hi Grant
> >
> > Since there does not exist a mechanism to map the hw irq to linux irq
> > on ARM (device tree), I would like to discuss  with you the plans or
> > ideas to implement the same.

Note that the powerpc hw -> linux IRQ mapping (virtualized irq numbering
scheme) is orthogonal to the device-tree. It can be used without the
device-tree and the device-tree doesn't mandate such a scheme.

However, when used together, it does provide some nice features such as
making most cases of cascaded controllers totally trivial.

> I don't have any immediate plans, but this topic has come up a lot in
> the last two weeks, so I guess I need to focus on it.  :-)  [cc'ing
> devicetree-discuss and linux-arm-kernel as well as Lorenzo and Eric
> since this is a conversation that should be had publically]
> 
> > Can you share with me your thoughts on it?
> > I have browsed through the power pc code for the same. But not sure
> > the same approach is usable on ARM as well.
> 
> I haven't thought deeply about the powerpc implementation of virqs to
> determine if it is suitable for other architectures or not, but the
> concept behind it is sound.  We need a method of mapping controller
> specific IRQ (or hw irq) numbers into the global Linux irq space
> (referred to a virqs from this point on).  First it requires a
> per-controller reference which can be a pointer to a per-controller
> data structure, or any other unique identifier.  It could even be the
> interrupt controller device tree node pointer.  Just so long as there
> is a reliable method to derive the virq from the controller reference
> + hw irq number.

I like keeping it somewhat orthogonal. See how I do that on powerpc.
That way, you can still exploit it, map interrupts etc... even if your
device-tree happens to be deficient or missing.

The main grief one could have with my scheme is the naming of irq_host
which has confused people in the past. It should probably be irq_domain
to make clear what it is. It generally have a 1:1 relationship to the
irq_chip but there are cases where that isn't the case (essentially
where you have multiple irq_chip per domain) for various reasons so it's
better to keep those separate.

> There also needs to be a method for each interrupt controller to
> register itself and allocate a portion of the virq range.  This
> shouldn't be too hard.  PowerPC handles this with the irq_map[] flat
> table.  This approach is limited to whatever NR_IRQs is set to, and
> could potentially be limited by that, but on the other hand the number
> of discrete IRQ sources in a system is limited so a flat table
> (instead of a dynamic hash table) is probably sufficient.  It is
> certainly simpler to implement.

It's an implementation detail. We can make sure nothing accesses the
table directly so we can turn it into something else if needed.

> I think the first step is to simply try generalizing the code in
> arch/powerpc/kernel/irq.c.  It isn't very complex and it would give a
> better impression of what needs to be done.  The ARM interrupt
> controller drivers would need to be modified to register with the virq
> infrastructure.  None of this is either ARM or OF specific; it would
> be useful for any system than need to dynamically allocate IRQ
> numbers.  I could see some x86 use cases (Xilinx FPGAs) where this
> would be useful.

Right.

Cheers
Ben.
