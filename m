From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Configurable interrupt sources, and DT bindings
Date: Tue, 29 Nov 2011 12:30:55 +1100
Message-ID: <20111129013055.GH3508@truffala.fritz.box>
References: <4ED40B5F.6030603@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
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

On Mon, Nov 28, 2011 at 03:29:51PM -0700, Stephen Warren wrote:
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

Um.. why?  These new properties don't appear to give any information
that isn't already in the interrupts property (albeit in irq
controller dependent form).

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

Auto-configuration is the only one that actually seems to do something
new.  It is a potentially interesting problem, one example of a fairly
common class with modern device tree bindings, where things
traditionally assumed to be fixed properties of the hardware are often
runtime configurable in modern setups.

The first question is, is there actually any point to runtime
configuring this, rather than just picking a reasonable option at
device tree creation time.

> Related, having this negotiation followed by a request_irq() passing the
> flags back to the sink seems a little redundant, but I suppose if the
> sink is configurable and unconstrained, this is necessary.
> 

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
