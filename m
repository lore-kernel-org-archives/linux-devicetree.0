From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Configurable interrupt sources, and DT bindings
Date: Fri, 2 Dec 2011 16:38:14 +1100
Message-ID: <20111202053814.GH5427@truffala.fritz.box>
References: <4ED40B5F.6030603@nvidia.com>
 <20111129013055.GH3508@truffala.fritz.box>
 <20111129105538.GC2851@opensource.wolfsonmicro.com>
 <20111130051349.GG5435@truffala.fritz.box>
 <20111130093305.GB2791@opensource.wolfsonmicro.com>
 <20111130133140.GL5435@truffala.fritz.box>
 <20111201110738.GA2915@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111201110738.GA2915-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
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

On Thu, Dec 01, 2011 at 11:07:39AM +0000, Mark Brown wrote:
> On Thu, Dec 01, 2011 at 12:31:40AM +1100, David Gibson wrote:
> > On Wed, Nov 30, 2011 at 09:33:06AM +0000, Mark Brown wrote:
> 
> > > I'm sorry, I'm not following you.  In what way is this duplicating
> > > information that's already there,
> 
> > Each interrupt source device has an 'interrupts' property which is an
> > array of irq specifiers.  Each irq specifier contains enough
> > information for the irq controller driver to handle it - that is, both
> > the irq number and the type (if applicable for this irq controller).
> > The irq controller driver must already know how to interpret these irq
> > specifiers, or nothing would work.
> 
> So when you say the information is already there you mean that
> controllers can define something in the type field but there's no
> defined meaning for that.

Roughly, yes.  In fact even the existence and layout of a "type" field
is up to the controller.

> > > and for what reason is it not possible
> > > to specify different information per IRQ?
> 
> > IIUC, the binding you proposed had individual boolean properties for
> > the trigger types / polarities.  Those properties would have to be on
> > or off for the whole node, but that node might have multiple irqs.
> 
> Right, but you could stuff those in an enormous array or whatever - the
> point was to describe the per interrupt information.

Well, ok, but that's not what you proposed.  In any case putting
important irq type information anywhere othrt than the irq specifers
listed in the 'interrupts' property is not a good idea.  It would be
breakin to overall model of the DT interrupt tree with poor
justification.

> > > (and all the
> > > more reason to come up with a standard binding so they don't have to
> > > think)
> 
> > Well, we kind of have one already.  I believe the binding for several
> > recently defined PICs is source # in the first cell, trigger/polarity
> > in the second, encoded using the same values as the corresponding
> > Linux constants.
> 
> Well, then it'd be good if we could get that written up as a spec and
> factor out the parsing code then start pushing back very strongly on any
> new bindings that don't follow the spec.  

Well, write up a best practice document and get it up on
devicetree.org.  I think you overestimate the problem though.  The
specific case you've described can be handled with an in-kernel
mechanism for the irq controller driver to advertise the irq type back
to the irq source's driver - no DT change necessary, and it even
handles all the legacy cases.

> > > but this all seems so far off base that I fear there must be some
> > > fundamental misunderstaniding here.
> 
> > I tend to agree.
> 
> I don't think so really - it seems like what you're saying is "there's a
> place where people could put this information in a device specific
> fashion" and I'm looking for something that's not device specific as
> this is a general need and we shouldn't have to be doing device specific 
> things here.

It'd be nice, but it's just not worth breaking away from existing
practice to achieve it.  Remember that more or less by definition, we
*already have* code to interpret the device specific tokens (in the
irq controller driver).

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
