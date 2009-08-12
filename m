From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: ARM clock API to PowerPC
Date: Thu, 13 Aug 2009 07:56:32 +1000
Message-ID: <1250114192.3587.41.camel@pasglop>
References: <1250063825.15143.43.camel@pasglop>
	<20090812123551.GC11227@sirena.org.uk>
	<1250112847.3587.26.camel@pasglop>
	<20090812214444.GA4731@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20090812214444.GA4731-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Cc: John Jacques <john.jacques-M7mHMAq9Yzo@public.gmane.org>, linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Torez Smith <torez-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2009-08-12 at 22:44 +0100, Mark Brown wrote:
> On Thu, Aug 13, 2009 at 07:34:07AM +1000, Benjamin Herrenschmidt wrote:
> > On Wed, 2009-08-12 at 13:35 +0100, Mark Brown wrote:
> 
> > > What happens if another clock gets added or the list gets reordered for
> > > some reason?
> 
> > The device-tree is mostly static in that regard. I'm not sure what you
> > mean. Clocks are referenced by IDs so if you want to add more clocks you
> > can just add them to the end. The "NULL" case is typically for things
> > that have only one clock (which seems to be reasonably common in ARM
> > land).
> 
> The issue I'm worrying about here is what happens if the device has only
> one clock in current revisions of the hardware but another revision of
> the same hardware is produced which adds another clock.  When that
> happens your NULL lookup gets confused.

Well, then don't use clk_get() with NULL :-) I mean, ARM devices do that
today (ie, calling with NULL), it makes sense in the context of a
device-tree binding to provide a defined behaviour for it (pick the
first clock in the order it appears in the device-tree is one way to do
it), but we can also recommend to driver writers not to do it :-)

But if one was to use an existing driver that does it, then we need to
cater for it.

Note that adding a new clock in the future isn't a big deal. As long as
the first one in the list is the one the driver that calls clk_get with
NULL expects to obtain.

Maybe we can make clock-names non-optional though in the DT as an
incentive not to use the simple 1-clock "NULL" path.

> > I think it's reasonable to ask whoever produces the device-tree to keep
> > the two properties in sync.
> 
> It's not just the device tree, it's also the drivers which have to be
> able to cope with whatever random device tree that's thrown at them.

Well, the clocks are named. At some stage, the binding for a given
device will define what clock names it expects. I don't see that
differing from what the ARM folks do.

> This is less of a problem on ARM where it's fairly straightforward to
> adjust the users at the same time as the driver but if you've got a
> device tree delivered via a completely different distribution mechanism
> it gets more sticky.

Possibly yes, and that's a reason why we tend to discourage that ;-) But
again, it boils down to settling with a naming convention for a given
device. If clocks are added later on, the driver will have to cope with
the new clocks not existing, of course, or the platform can cater for
it.

That's also one of the reason why I want to make clk_get() go through
ppc_md. first, so that the platform can always override the behaviour,
and for example, fill-in in case the device-tree is incomplete or
incorrect.

> The problem with the API at the minute in this regard is that there is
> no standard way of registering new clocks.  Only something that knows
> about the magic sauce for a given architecture (if any) is able to add
> clocks.  My concern here is that if PowerPC moves in this direction
> without some general agreement from elsewhere then there may be problems
> for drivers.

Well, the idea is to allow to register clock-providers associated with
device nodes. I think we should keep the rest in the hand of platforms
for now, and possibly make it evolve later.

Do you have maybe a precise example scenario where your above statement
about the lack of facility for registering new clocks is a problem ? I'm
curious to see a real life example so I can think better about how it
can be solved (or whether it needs to be solved).

Cheers,
Ben.
