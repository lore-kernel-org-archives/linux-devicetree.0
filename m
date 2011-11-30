From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Configurable interrupt sources, and DT bindings
Date: Wed, 30 Nov 2011 16:31:46 +1100
Message-ID: <20111130053146.GH5435@truffala.fritz.box>
References: <4ED40B5F.6030603@nvidia.com> <4ED417F2.1030900@gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFD60@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174FDAFD60-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 29, 2011 at 06:24:06PM -0800, Stephen Warren wrote:
> Rob Herring wrote at Monday, November 28, 2011 4:24 PM:
> > On 11/28/2011 04:29 PM, Stephen Warren wrote:
> > > Many interrupt sinks support various of active high/low, rising/falling
> > > edge. This can already be configured by setting #interrupt-cells
> > > appropriately, and defining an interrupt-controller-specific binding for
> > > the additional cells.
> > >
> > > At least some interrupt sources have similar configurability in HW. An
> > > example is the WM8903 audio codec, which can generate both active high
> > > and active low interrupt signals.
> > >
> > > One possibility is to describe this directly in the binding for each
> > > interrupt source....
> ...
> > > However, given that interrupt sinks already know which signaling methods
> > > they support, and may be configured to accept a specific method per
> > > interrupt input using extra interrupt cells, perhaps the solution isn't
> > > to create a binding that the interrupt sink parses in isolation, but
> > > rather to create a new API within the kernel where the interrupt source
> > > can query the interrupt sink for a list of supported signaling methods,
> > > and pick one that it also supports, and use it. This list could be
> > > restricted based on the interrupts property's extra cells.
> > >
> > > What are people's thoughts here; should we go down this
> > > auto-configuration route, or just explicitly configure interrupt sources
> > > using a binding other than the interrupts property?
> > >
> > > Related, having this negotiation followed by a request_irq() passing the
> > > flags back to the sink seems a little redundant, but I suppose if the
> > > sink is configurable and unconstrained, this is necessary.
> > 
> > I think adding another property is the wrong approach. The information
> > is already there in the interrupt binding. irq_create_of_mapping almost
> > does what you need. Perhaps it could be extended to return the type as
> > part of the irq resource. There are already defined resource bits for this:
> > 
> > /* PnP IRQ specific bits (IORESOURCE_BITS) */
> > #define IORESOURCE_IRQ_HIGHEDGE		(1<<0)
> > #define IORESOURCE_IRQ_LOWEDGE		(1<<1)
> > #define IORESOURCE_IRQ_HIGHLEVEL	(1<<2)
> > #define IORESOURCE_IRQ_LOWLEVEL		(1<<3)
> > 
> > It may be a bit problematic to change irq_create_of_mapping as Sparc has
> > a different version.
> 
> Taking a look at the code, I think it can work like this:
> 
> * Except for SPARC, irq_of_parse_and_map() calls irq_create_of_mapping(),
>   which calls the IRQ chip's dt_translate() function which can return the
>   type from the interrupt specifier in DT, and if it did, the type is
>   passed to irq_set_irq_type().
> 
> * SPARC's custom irq_of_parse_and_map() doesn't call irq_set_irq_type()
>   as far as I can tell. I think we can just ignore this for now; if SPARC
>   wants to participate in this scheme, its custom irq_of_parse_and_map()
>   could be enhanced appropriately.
> 
> * I assert that all IRQ chips that want to participate must define an
>   interrupt specifier DT binding that defines the trigger type; e.g.
>   that implemented by using irq_domain_add_simple() and #interrupt-cells
>   greater than 1.

This changes nothing w.r.t. the DT binding.  The irq chip driver
already needs to determine the irq type from the dt irq specifier.
But that doesn't imply that #interrupt-cells must be >1, nor even that
the irq specifier encodes the type information.  e.g. if an irq chip
_only_ supports active-low level interrupts, then the type info need
no appear in its irq specifiers, but it can still correctly pass the
type info to irq_set_irq_type().

> * I assert that all IRQ chips that want to participate must call
>   irqd_set_trigger_type() from their irq_set_type op. This will cache the
>   type for later access. This call is missing from Tegra's GPIO interrupt
>   controller, but can easily be added.
> 
> * Create a new function that drivers can call on their Linux interrupt ID,
>   which internally calls irqd_get_trigger_type(). This will return the
>   configured type, and they can adjust their interrupt output pin
>   appropriately, or fail to probe if they can't support the selected type.

AFAICT this is essentially a means for the irq chip driver to
communicate the type info back to the driver for the irq source.  It
sounds reasonable at first glance.

> * We can probably remove any platform data fields that configure a device's
>   interrupt output type (e.g. WM8903 has an irq_active_low field in pdata)
>   and replace it with this scheme. If that won't work, we can have drivers
>   call the new API only when instantiated from DT, so they continue to
>   work unchanged in the non-DT case.

I don't see how there is anything DT related here at all.  It's just
about communicating between different parts of the kernel.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
