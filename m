From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v7 2/4] MIPS: Octeon: Setup irq_domains for interrupts.
Date: Fri, 30 Mar 2012 15:54:30 -0600
Message-ID: <20120330215430.47FAA3E04D5@localhost>
References: <1332790281-9648-1-git-send-email-ddaney.cavm@gmail.com>
 <1332790281-9648-3-git-send-email-ddaney.cavm@gmail.com>
 <4F711E69.1080302@gmail.com> <4F7205F3.3000108@cavium.com>
 <20120328222246.8AFA83E0CFE@localhost> <4F73BDAF.7020206@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F73BDAF.7020206-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Cc: "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 28 Mar 2012 18:41:03 -0700, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org> wrote:
> On 03/28/2012 03:22 PM, Grant Likely wrote:
> > On Tue, 27 Mar 2012 11:24:51 -0700, David Daney<david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>  wrote:
> >> On 03/26/2012 06:56 PM, Rob Herring wrote:
> >>> On 03/26/2012 02:31 PM, David Daney wrote:
> >>>> From: David Daney<david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> >> [...]
> >>>> +static int octeon_irq_ciu_map(struct irq_domain *d,
> >>>> +			      unsigned int virq, irq_hw_number_t hw)
> >>>> +{
> >>>> +	unsigned int line = hw>>   6;
> >>>> +	unsigned int bit = hw&   63;
> >>>> +
> >>>> +	if (virq>= 256)
> >>>> +		return -EINVAL;
> >>>
> >>> Drop this. You should not care what the virq numbers are.
> >>
> >>
> >> I care that they don't overflow the width of octeon_irq_ciu_to_irq (a u8).
> >>
> >> So really I want to say:
> >>
> >>      if (virq>= (1<<  sizeof (octeon_irq_ciu_to_irq[0][0]))) {
> >>          WARN(...);
> >>          return -EINVAL;
> >>      }
> >>
> >>
> >> I need a map external to any one irq_domain.  The irq handling code
> >> handles sources that come from two separate irq_domains, as well as irqs
> >> that are not part of any domain.
> >
> > You can get past this limitation by using the struct irq_data .hwirq and
> > .domain members for the irq ==>  hwirq translation, and for hwirq ==>
> > irq the code should already have the context to know which user it is.
> >
> > For the irqs that are not covered by an irq_domain, the driver is free
> > to set the .hwirq value directly.  Ultimately however, it will
> > probably be best to add an irq domain for those users also.
> >
> > ...
> >
> > Howver, I don't understand where the risk is in overflowing
> > octeon_irq_ciu_to_irq[][].  From what I can see, the virq value isn't
> > used at all to calculate the array dereference.  line and bit are
> > calculated from the hwirq value.  What am I missing?
> >
> 
> We do the opposite.  We extract the hwirq value from the interrupt 
> controller and then look up virq in the table.  If the range of virq 
> overflows the width of u8, we would end up calling do_IRQ() with a bad 
> value.  Also this dispatch code is not aware of the various irq_domains 
> and non irq_domain irqs, it is a single function that handles them all 
> calling do_IRQ() with whatever it looks up in the table.
> 
> We could use a wider type for this lookup array, but that would increase 
> the cache footprint of the irq dispatcher...

Ah, I missed that octeon_irq_ciu_to_irq was a u8.  You're using Linux
though; your cache footprint is already trashed.  :-) Please just use
unsigned int for all irq storage since that is the type used by all
core interrupt handling code.  Anything else smells like premature
optimization.  :-)

Besides, now that we have it you should plan to switch to the common
mechanism of irq_domain for hwirq->irq reverse mapping anyway.  It
doesn't make any sense for each platform to reinvent it's own reverse
mapping scheme.

g.
