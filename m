From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Configurable interrupt sources, and DT bindings
Date: Sat, 3 Dec 2011 01:31:07 +1100
Message-ID: <20111202143107.GJ5427@truffala.fritz.box>
References: <20111129013055.GH3508@truffala.fritz.box>
 <20111129105538.GC2851@opensource.wolfsonmicro.com>
 <20111130051349.GG5435@truffala.fritz.box>
 <20111130093305.GB2791@opensource.wolfsonmicro.com>
 <20111130133140.GL5435@truffala.fritz.box>
 <20111201110738.GA2915@opensource.wolfsonmicro.com>
 <20111202053814.GH5427@truffala.fritz.box>
 <20111202112722.GG8245@opensource.wolfsonmicro.com>
 <20111202122418.GI5427@truffala.fritz.box>
 <20111202133413.GR8245@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111202133413.GR8245-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 02, 2011 at 01:34:13PM +0000, Mark Brown wrote:
> On Fri, Dec 02, 2011 at 11:24:18PM +1100, David Gibson wrote:
> 
> > No, you suggested it be a global property of the interrupt source.
> > Same problem, just less so.
> 
> Cite?

My apologies.  I was mixing up who said what.  It was Stephen who made
this proposal, kicking off the thread.

SW> One possibility is to describe this directly in the binding for each
SW> interrupt source. I originally proposed the following for the WM8903:

SW> * Interrupt output is active high by default.
SW> * Presence of an "irq-active-low" property selects an active low
SW> * output
SW> instead.

SW> Mark Brown pointed out that we probably want to standardize the
SW> binding,
SW> so that every interrupt source doesn't do something different.

SW> Perhaps one of:

SW> irq-active-low;
SW> irq-active-high;
SW> irq-edge-falling;
SW> irq-edge-rising;

And he does go on to suggest another alternative that does allow
multiple interrupts to be described.

> > > Not in the real world, in the real world we don't have device tree
> > > bindings for most of the interrupt controllers out there and therefore
> > > no code exists to parse them.  There's a fairly small set of current
> > > systems using device tree and a very large set of systems which have
> > > never used it before and are currently working on implementing it.
> 
> > If we support the PIC at all, it must know how to determine the
> > interrupt types.  When DT support is added to the PIC, that will
> > include determining the type from the interrupt specifiers.  If we
> > don't support the PIC, we don't care.
> 
> *sigh*  We do care because as I say in the paragraph you quote above
> people are trying to roll device tree out onto new platforms.  The
> coverage on PowerPC and SPARC is near 100% but the coverage on ARM is
> very far away from that so we're going to have to create a large number
> of new bindings.

I guess, but irq spec bindings are so trivial, it's just not a big
deal.  As I say, by all means write a best-current-practice document
with a suggested binding.  But if people go their own way it really
doesn't hurt much.  And there are situations where people would
reasonably want different irq specifiers.  e.g. including polarity
information wouldn't make much sense for a PIC which only handled
message signalled interrupts.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
