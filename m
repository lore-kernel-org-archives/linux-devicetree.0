From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 17:55:43 +1000
Message-ID: <1243497343.3171.158.camel@pasglop>
References: <87vdnm8sec.fsf@macbook.be.48ers.dk>
	<4A1D6901.2090508@freescale.com>
	<20090527175609.GB31861@flint.arm.linux.org.uk>
	<4A1D8FBA.6040802@freescale.com>
	<9e4733910905271213k7f4b93e7i7e6f2af24d85f@mail.gmail.com>
	<20090527192116.GA31110@n2100.arm.linux.org.uk>
	<20090527193927.GD30039@game.jcrosoft.org>
	<fa686aa40905271322x2f62c3dcs355374b30b4db3ca@mail.gmail.com>
	<20090527235704.GQ6805@pengutronix.de>
	<fa686aa40905272021w18a148caqd2b73c4448da2b28@mail.gmail.com>
	<20090528063445.GA12004@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090528063445.GA12004-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jon Smirl <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2009-05-28 at 08:34 +0200, Wolfram Sang wrote:
> 
> > OTOH, if it is appropriate for the device, then the binding can be defined to
> > include things like page size and flags encoded explicitly in additional
> > properties.
> 
> ..., so I think a property like "page-size" could really be argumented for.

Most definitely. And it's in fact reasonably easy to define such
bindings. And if somebody later decide do invent a fancier property
called "page-data" that contains more structured informations, the
driver can still fall back to using "page-size" when the later is not
found. It's rarely needed but the technique works reasonably well.

> Actually, I am quite optimistic that there could be agreement on it. Maybe we
> could also reuse the "read-only" property which is used for partitions. Still,
> this discussion has to be done, and that is additional work for mainlining.

Well, it depends. You don't need to have defined all the bindings for
all possible devices on the planet before adding to your architecture
the core bits to have the ability to use device-trees :-)

However, it does make sense for a platform using it, to at least try
to make sure that bindings for the devices it uses are in reasonable
shape.

Again, no solution is ever perfect and whatever the technique is,
somebody can make a mess of it. But my experience is that most of
the time, those things come pretty easily out of common sense when
talking about bindings for a -device-. Bindings for -busses- take
a bit more thoughts, I agree.

> Also, this would be _another_ wrapper to collect data from the device tree and
> pass it into platform_data.
>  I think it is difficult to maintain.

It's easier to have -one- piece of code taking data for device type X
to create the platform data and than all platforms around having C code
spread around that manufactures that platform data in 36 different ways.

So here, I disagree.

>  If somebody
> extends at24 and forgets about the of-wrapper, it may easily get broken.

No. If somebody adds new fields and not knowing about them doesn't break
existing users, then only the first person to try to use the new
functionality will discover the need for a new property and update the
wrapper.

If somebody however changes the platform data in incompatible ways, that
person is supposed to fix all users right ? So grep all platforms etc...
and the wrapper will show up in that grep.

Also, it might be a lot easier to change just the wrapper don't you
think ? :-)
  
>  Plus,at least for me, coding always very similar stuff, feels like bloating the
> kernel. I did it a few times now, and that made me really wonder if we can't
> have a more generic solution to that problem. Sadly, I could neither come up
> with anything useful :(

Well, the device-tree does avoid a -lot- of code duplication... you can
see that easily when you look at our 4xx based platforms today vs. what
they were in arch/ppc

Cheers,
Ben.
