From: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform
 driver
Date: Wed, 24 Oct 2012 17:26:52 +0200
Message-ID: <20121024152652.GG4368@breakpoint.cc>
References: <5086F8D6.5050605@gmail.com>
 <Pine.LNX.4.44L0.1210241013310.1481-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1210241013310.1481-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 24, 2012 at 10:57:00AM -0400, Alan Stern wrote:
> Under the circumstances, do we really need a new binding document for 
> the ehci-platform driver?  We should be able to use the existing 
> usb-ehci binding, perhaps with some new properties added:
> 
> 	has-synopsys-hc-bug
> 	no-io-watchdog
> 	has-tt

On the PCI side we have VID, PID which is used for quirks. Sometimes we have a
revision ID which can be used to figure out if "this quirk" is still required.
The PCI driver probes by class so the ehci driver does not have a large table
of VID/PID for each controller out there. And the USB controller in two
different Intel boards has a different PID so a quirk, if required, could be
applied only to the specific mainboard.

Based on this we need atleast two compatible entries one "HW-Specific"
followed by a generic one (similar to PCI class).
Doing it the PCI way we would have to have table and figure out which
HW-specific compatible entry sets the TT flag and which one does the
no-io-watchdog. Having has-tt in compatible isn't right.

I'm all with Alan here, to make a shortcut and allow Linux specific properties
which describe a specific quirk in less code lines. Other OS can just ignore
those and build their table based on the compatible entry if they want to.

So usb-ehci should be fine. It is a generic USB-EHCI controller after all.
Quirks or no quirks, the register layout is the same, the functionality is the
same. If you can't map memory >4GiB then you need a quirk for this but you may
discover it way too late.
If your platform driver requires extra code for the PHY then it is still an
EHCI controller. The PHY wasn't setup by the bootloader / bios so Linux has to
deal with it.

> We probably can omit has-synopsys-hc-bug, as that is specific to one
> type of MIPS ATH79 controller.  The driver can check for it explicitly,
> if necessary.
> 
> In fact, it's not clear that these new properties need to be added now.  
> They can be added over time as needed, as existing drivers are
> converted over to DT.  Or is it preferable to document these things
> now, preemptively as it were?

I would add it only if required / has users.

> Alan Stern

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
