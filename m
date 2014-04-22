From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH RFC v11 5/6] dma: mpc512x: add device tree binding
 document
Date: Tue, 22 Apr 2014 20:27:25 +0200
Message-ID: <20140422182725.GB3528@book.gsilab.sittig.org>
References: <1397559250-17680-1-git-send-email-a13xp0p0v88@gmail.com>
 <1397559250-17680-6-git-send-email-a13xp0p0v88@gmail.com>
 <20140416204410.GP3528@book.gsilab.sittig.org>
 <CAF0T0X4TqhZ=niKRgArG-s1cD6uRH0UZDqGyTLpde_aHBFTVtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF0T0X4TqhZ=niKRgArG-s1cD6uRH0UZDqGyTLpde_aHBFTVtw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-04-18 at 15:29 +0400, Alexander Popov wrote:
> 
> 2014-04-17 0:44 GMT+04:00 Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>:
> > On Tue, 2014-04-15 at 14:54 +0400, Alexander Popov wrote:
> >>
> >> +- reg: Address and size of the DMA controller's register set
> >> +- interrupts: Interrupt for the DMA controller. Generic interrupt client node
> >> +     is described in interrupt-controller/interrupts.txt
> >
> > 'interrupts' only works in combinations with 'interrupt-parent',
> > that actual .dts files don't have the latter in the nodes is an
> > implementation detail but not a binding's requirement
> Excuse me, I didn't understand your point.
> 
> > and an alternative method of specifying interrupts was introduced
> > recently, a reference to the common binding without naming one
> > specific property name could be most appropriate
> Excuse me, I haven't found such an example.

The 'interrupts' property is not enough in itself, it always
needs the 'interrupt-parent' property, too.  Because the parent
(the interrupt controller) often is the same for multiple
interrupts, it usually gets "factored out" into a parent node in
the tree, and thus often gets missed in discussions.  Still the
'interrupt-parent' is strictly required for 'interrupts' to work.
Splitting both properties and putting them into nodes that are
rather distant from each other is just an implementation detail
of .dts files.  This should not be reflected in bindings.

The 'interrupts-extended' property was introduced only recently.
See bindings/interrupt-controller/interrupts.txt for details.
Although the motivation was to reference several parents from one
client node, I very much like the idea of having all of the
interrupt spec within a single property.  Being explicit is a
good thing, especially in setups with cascades.  I consider this
approach an improvement in readability and maintenance.

You might just want to document in the binding that interrupt
specs are required (or optional), which interrupts these are (the
above text could be sufficient if there is only one interrupt for
this IP block), and refer to the common binding for the syntax.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
