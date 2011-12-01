From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: Configurable interrupt sources, and DT bindings
Date: Thu, 1 Dec 2011 11:07:39 +0000
Message-ID: <20111201110738.GA2915@opensource.wolfsonmicro.com>
References: <4ED40B5F.6030603@nvidia.com>
 <20111129013055.GH3508@truffala.fritz.box>
 <20111129105538.GC2851@opensource.wolfsonmicro.com>
 <20111130051349.GG5435@truffala.fritz.box>
 <20111130093305.GB2791@opensource.wolfsonmicro.com>
 <20111130133140.GL5435@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111130133140.GL5435-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 01, 2011 at 12:31:40AM +1100, David Gibson wrote:
> On Wed, Nov 30, 2011 at 09:33:06AM +0000, Mark Brown wrote:

> > I'm sorry, I'm not following you.  In what way is this duplicating
> > information that's already there,

> Each interrupt source device has an 'interrupts' property which is an
> array of irq specifiers.  Each irq specifier contains enough
> information for the irq controller driver to handle it - that is, both
> the irq number and the type (if applicable for this irq controller).
> The irq controller driver must already know how to interpret these irq
> specifiers, or nothing would work.

So when you say the information is already there you mean that
controllers can define something in the type field but there's no
defined meaning for that.

> > and for what reason is it not possible
> > to specify different information per IRQ?

> IIUC, the binding you proposed had individual boolean properties for
> the trigger types / polarities.  Those properties would have to be on
> or off for the whole node, but that node might have multiple irqs.

Right, but you could stuff those in an enormous array or whatever - the
point was to describe the per interrupt information.

> > (and all the
> > more reason to come up with a standard binding so they don't have to
> > think)

> Well, we kind of have one already.  I believe the binding for several
> recently defined PICs is source # in the first cell, trigger/polarity
> in the second, encoded using the same values as the corresponding
> Linux constants.

Well, then it'd be good if we could get that written up as a spec and
factor out the parsing code then start pushing back very strongly on any
new bindings that don't follow the spec.  

> > but this all seems so far off base that I fear there must be some
> > fundamental misunderstaniding here.

> I tend to agree.

I don't think so really - it seems like what you're saying is "there's a
place where people could put this information in a device specific
fashion" and I'm looking for something that's not device specific as
this is a general need and we shouldn't have to be doing device specific 
things here.

> I really don't see what problem you're trying to solve.

There's two issues.  One was putting this information in the device tree
at all (which is probably going to be OK already).  The other is that
we've got a lot of devices with interrupt controllers that are going to
be converting to device tree and it'd be bad for usability if they all
had different bindings for what should be pretty basic functionality.  

For system integration it's a bit of a step backwards to have to write
these things as numeric constants (though that should be something that
can be dealt with in the device tree compiler), it'd be a further step
backwards if those constants were to change depending on which chip is
being configured.  It'd be much better if we can do basic interrupt
configuration without having to look up the individual chip bindings.
