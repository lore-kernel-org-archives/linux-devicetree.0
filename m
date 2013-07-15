From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: DT binding review for Armada display subsystem
Date: Mon, 15 Jul 2013 22:35:34 +0200
Message-ID: <1854596.j2AmPXyF76@flatron>
References: <20130712164428.AC3D2FAAE9@dev.laptop.org>
 <51E1D1DA.8080102@gmail.com> <20130713230955.GQ24642@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130713230955.GQ24642-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, Jiada Wang <jiada_wang-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sunday 14 of July 2013 00:09:55 Russell King - ARM Linux wrote:
> On Sun, Jul 14, 2013 at 12:16:58AM +0200, Sylwester Nawrocki wrote:
> > On 07/13/2013 11:02 PM, Russell King - ARM Linux wrote:
> >> On Sat, Jul 13, 2013 at 10:43:29PM +0200, Sylwester Nawrocki wrote:
> >>> I wasn't aware of it, thanks. I've seen a patch from Jiada Wang, it
> >>> seems they're working on v4 with clock object reference counting.
> >>> Presumably we need both clk_get() to be taking reference on the
> >>> module and reference counted clk free, e.g. in cases where clock
> >>> provider is a hot-pluggable device. It might be too paranoid
> >>> though, I haven't seen hardware configurations where a clock source
> >>> could be unplugged safely when whole system is running.
> >> 
> >> I'm not going to accept refcounting being thrown into clk_get().  The
> >> clkdev API already has refcounting, as much as it needs to.  It just
> >> needs people to use the hooks that I provided back in 2008 when I
> >> created the clkdev API for doing _precisely_ this job.
> >> 
> >> Have a read through these commits, which backup my statement above:
> >> 
> >> 0318e693d3a56836632bf1a2cfdafb7f34bcc703 - initial commit of the
> >> clkdev API d72fbdf01fc77628c0b837d0dd2fd564fa26ede6 - converting
> >> Integrator to clkdev API
> >> 
> >> and it will show you how to do refcounting.  The common clk API just
> >> needs to stop defining __clk_get() and __clk_put() to be an empty
> >> function and implement them appropriately for it's clk
> >> implementation,
> >> like they were always meant to be.
> > 
> > Sure, I've already seen the above commits. This is how I understood it
> > as well - __clk_get(), __clk_put() need to be defined by the common
> > clk
> > API, since it is going to replace all the arch specific
> > implementations.> 
> >> __clk_get() and __clk_put() are the clk-implementation specific parts
> >> of the clkdev API, because the clkdev API is utterly divorsed from
> >> the
> >> internals of what a 'struct clk' actually is.  clkdev just treats a
> >> 'struct clk' as a completely opaque type and never bothers poking
> >> about inside it.
> > 
> > OK, but at the clock's implementation side we may need, e.g. to use
> > kref to keep track of the clock's state, and free it only when it is
> > unprepared, all its children are unregistered, etc. ? Is it not what
> > you stated in your comment to patch [1] ?
> 
> If you want to do refcounting on a clock (which you run into problems
> as I highlighted earlier in this thread) then yes, you need to use a
> kref, and take a reference in __clk_get() and drop it in __clk_put()
> to make things safe.
> 
> Whether you also take a reference on the module supplying the clock or
> not depends whether you need to keep the code around to manipulate that
> clock while there are users of it.
> 
> As I've already said - consider the possibilities with this scenario.
> Here's one:
> 
>   A clock consumer is using a clock, but the clock supplier has been
>   removed.  The clock consumer wants to change the state of the clock
>   in some way - eg, system is suspending.  clk_disable() doesn't fail,
>   but on resume, clk_enable() does... (and how many people assume that
>   clk_enable() never fails?)  And who knows what rate the clock is now
>   producing or whether it's even producing anything...
> 
> I'm not saying don't do the refcounting thing I mentioned back in June.
> I'm merely pointing out the issues that there are.  There isn't a one
> right answer here because each has their own advantages and
> disadvantages (and problems.)

What about having Mike on CC for such clock-related discussion?

Best regards,
Tomasz
