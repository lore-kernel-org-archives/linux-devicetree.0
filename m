From: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform driver
Date: Wed, 24 Oct 2012 18:36:08 +0200
Message-ID: <4072275.SyhkJA9fPe@flexo>
References: <5086F8D6.5050605@gmail.com> <20121024152652.GG4368@breakpoint.cc> <5088145F.1040504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5088145F.1040504-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 24 October 2012 10:16:31 Stephen Warren wrote:
> On 10/24/2012 09:26 AM, Sebastian Andrzej Siewior wrote:
> > On Wed, Oct 24, 2012 at 10:57:00AM -0400, Alan Stern wrote:
> >> Under the circumstances, do we really need a new binding document for 
> >> the ehci-platform driver?
> 
> It seems reasonable to add the new properties to usb-ehci.txt, since
> they do describe the HW.
> 
> >> We should be able to use the existing 
> >> usb-ehci binding, perhaps with some new properties added:
> >>
> >> 	has-synopsys-hc-bug
> >> 	no-io-watchdog
> >> 	has-tt
> 
> That sounds fine to me.
> 
> However, there is an implementation issue here. I believe the way Linux
> searches for a driver for a particular node is:
> 
> for every driver that's registered
>     if the driver's supported compatible list matches the device
>         use the driver
> 
> (See drivers/base/platform.c:platform_match() which implements the if
> statement above, and I assume the driver core implements the outer for
> loop above)
> 
> That means that if the generic driver supports compatible="usb-ehci", it
> may "steal" device nodes that have
> compatible="something-custom","usb-ehci", even if there's a driver
> specifically for "something-custom". We would need to re-arrange the
> driver matching code to:
> 
> for each compatible value in the node:
>     for each driver that's registered:
>         if the driver supports the compatible value:
>             use the driver.
> 
> > On the PCI side we have VID, PID which is used for quirks. Sometimes we have a
> > revision ID which can be used to figure out if "this quirk" is still required.
> > The PCI driver probes by class so the ehci driver does not have a large table
> > of VID/PID for each controller out there. And the USB controller in two
> > different Intel boards has a different PID so a quirk, if required, could be
> > applied only to the specific mainboard.
> > 
> > Based on this we need atleast two compatible entries one "HW-Specific"
> > followed by a generic one (similar to PCI class).
> > Doing it the PCI way we would have to have table and figure out which
> > HW-specific compatible entry sets the TT flag and which one does the
> > no-io-watchdog. Having has-tt in compatible isn't right.
> 
> Yes, the driver could easily bind to anything compatible with
> "usb-ehci", then use the HW-specific compatible value to index into a
> quirk table in the same way that specific PCI IDs index into a quirk table.

Sounds good.

> 
> I agree that having separate compatible values like usb-ehci and
> usb-ehci-with-tt probably doesn't make sense here.
> 
> > I'm all with Alan here, to make a shortcut and allow Linux specific properties
> > which describe a specific quirk in less code lines. Other OS can just ignore
> > those and build their table based on the compatible entry if they want to.
> 
> We should absolutely avoid Linux-specific properties where possible.
> 
> That said, what Linux-specific properties are you talking about? The
> properties discussed here (has-synopsys-hc-bug, no-io-watchdog, has-tt)
> are all purely a description of HW, aren't they.

has-tt and has-synopsys-hc-bug are certainly hardware properties, while
no-io-watchdog is a Linux driver software workaround for a hardware issue,
so that's kind of in a grey zone to decide whether this describes hardware or
not. Let's just assume that this is a hardware issue :)

> 
> > So usb-ehci should be fine. It is a generic USB-EHCI controller after all.
> > Quirks or no quirks, the register layout is the same, the functionality is the
> > same. If you can't map memory >4GiB then you need a quirk for this but you may
> > discover it way too late.
> > If your platform driver requires extra code for the PHY then it is still an
> > EHCI controller. The PHY wasn't setup by the bootloader / bios so Linux has to
> > deal with it.
> > 
> >> We probably can omit has-synopsys-hc-bug, as that is specific to one
> >> type of MIPS ATH79 controller.  The driver can check for it explicitly,
> >> if necessary.
> >>
> >> In fact, it's not clear that these new properties need to be added now.  
> >> They can be added over time as needed, as existing drivers are
> >> converted over to DT.  Or is it preferable to document these things
> >> now, preemptively as it were?
> 
> It's best to define the binding up-front so it doesn't churn, where
> possible. This will also ensure that multiple people don't try to update
> the binding document to add the same feature in different ways.

Agreed, we do support these properties in the non-DT case, so I see no reason
why we should not document them in the binding too.

> 
> > I would add it only if required / has users.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
