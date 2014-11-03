From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/irq: Drop obsolete 'interrupts' vs
 'interrupts-extended' text
Date: Mon, 3 Nov 2014 10:25:37 -0800
Message-ID: <20141103182537.GI23619@ld-irv-0074>
References: <20141101233531.4958.96713.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20141103101516.GA29621@leverpostej>
 <5457C40F.8050407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5457C40F.8050407-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 03, 2014 at 10:06:07AM -0800, Florian Fainelli wrote:
> On 11/03/2014 02:15 AM, Mark Rutland wrote:
> > On Sat, Nov 01, 2014 at 11:35:31PM +0000, Bjorn Helgaas wrote:
> >> a9ecdc0fdc54 ("of/irq: Fix lookup to use 'interrupts-extended' property
> >> first") updated the description to say that:
> >>
> >>   - Both 'interrupts' and 'interrupts-extended' may be present
> >>   - Software should prefer 'interrupts-extended'
> >>   - Software that doesn't comprehend 'interrupts-extended' may use
> >>     'interrupts'
> >>
> >> But there is still a paragraph at the end that prohibits having both and
> >> says 'interrupts' should be preferred.
> >>
> >> Remove the contradictory text.
> >>
> >> Fixes: a9ecdc0fdc54 ("of/irq: Fix lookup to use 'interrupts-extended' property first")
> >> Signed-off-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> >> CC: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org	# v3.13+
> >> ---
> >>  .../bindings/interrupt-controller/interrupts.txt   |    4 ----
> >>  1 file changed, 4 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> >> index ce6a1a072028..8a3c40829899 100644
> >> --- a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> >> +++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> >> @@ -30,10 +30,6 @@ should only be used when a device has multiple interrupt parents.
> >>    Example:
> >>  	interrupts-extended = <&intc1 5 1>, <&intc2 1 0>;
> >>  
> >> -A device node may contain either "interrupts" or "interrupts-extended", but not
> >> -both. If both properties are present, then the operating system should log an
> >> -error and use only the data in "interrupts".
> > 
> > Why not update the binding to explain that interrupts-extended is
> > typically preferred?
> 
> Does not the following:
> 
> "Nodes that describe devices which generate interrupts must contain an
> "interrupts" property, an "interrupts-extended" property, or both. If
> both are
> present, the latter should take precedence; the former may be provided
> simply
> for compatibility with software that does not recognize the latter."
> 
> already makes it clear that 'interrupts-extended' is the preferred way
> to represent interrupts?

I'm not sure I understand Mark's original question fully, because I'm
not sure what he means by "typically preferred."

I wouldn't actually say that interrupts-extended is "preferred" in
general. It should be "preferred" by the consumer of the device tree
(e.g., Linux) because it is more descriptive. And that's what commit
a9ecdc0fdc54aa ("of/irq: Fix lookup to use 'interrupts-extended'
property first") was all about.

But when constructing a device tree, it actually makes sense to "prefer"
the simplest possible description. So if you have a single interrupt
parent, it makes sense to choose the existing ePAPR "interrupts"
property.

Anyway, I agree with the principle of Florian's response; that the
current documentation (minus the contradictory statement) is sufficient.
But I'd point to this existing piece of the doc:

    "interrupts-extended" should only be used when a device has multiple
    interrupt parents.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
