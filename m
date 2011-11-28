From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Configurable interrupt sources, and DT bindings
Date: Mon, 28 Nov 2011 17:23:30 -0600
Message-ID: <4ED417F2.1030900@gmail.com>
References: <4ED40B5F.6030603@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4ED40B5F.6030603-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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

On 11/28/2011 04:29 PM, Stephen Warren wrote:
> Many interrupt sinks support various of active high/low, rising/falling
> edge. This can already be configured by setting #interrupt-cells
> appropriately, and defining an interrupt-controller-specific binding for
> the additional cells.
> 
> At least some interrupt sources have similar configurability in HW. An
> example is the WM8903 audio codec, which can generate both active high
> and active low interrupt signals.
> 
> One possibility is to describe this directly in the binding for each
> interrupt source. I originally proposed the following for the WM8903:
> 
> * Interrupt output is active high by default.
> * Presence of an "irq-active-low" property selects an active low output
> instead.
> 
> Mark Brown pointed out that we probably want to standardize the binding,
> so that every interrupt source doesn't do something different.
> 
> Perhaps one of:
> 
> irq-active-low;
> irq-active-high;
> irq-edge-falling;
> irq-edge-rising;
> 
> or:
> 
> interrupts-config = <"active-low"> // or "active-high", etc.
> (perhaps with indices in that list matching the interrupts property)
> 
> ... and a helper function in the kernel to parse those
> 
> However, given that interrupt sinks already know which signaling methods
> they support, and may be configured to accept a specific method per
> interrupt input using extra interrupt cells, perhaps the solution isn't
> to create a binding that the interrupt sink parses in isolation, but
> rather to create a new API within the kernel where the interrupt source
> can query the interrupt sink for a list of supported signaling methods,
> and pick one that it also supports, and use it. This list could be
> restricted based on the interrupts property's extra cells.
> 
> What are people's thoughts here; should we go down this
> auto-configuration route, or just explicitly configure interrupt sources
> using a binding other than the interrupts property?
> 
> Related, having this negotiation followed by a request_irq() passing the
> flags back to the sink seems a little redundant, but I suppose if the
> sink is configurable and unconstrained, this is necessary.
> 

I think adding another property is the wrong approach. The information
is already there in the interrupt binding. irq_create_of_mapping almost
does what you need. Perhaps it could be extended to return the type as
part of the irq resource. There are already defined resource bits for this:

/* PnP IRQ specific bits (IORESOURCE_BITS) */
#define IORESOURCE_IRQ_HIGHEDGE		(1<<0)
#define IORESOURCE_IRQ_LOWEDGE		(1<<1)
#define IORESOURCE_IRQ_HIGHLEVEL	(1<<2)
#define IORESOURCE_IRQ_LOWLEVEL		(1<<3)

It may be a bit problematic to change irq_create_of_mapping as Sparc has
a different version.

Rob
