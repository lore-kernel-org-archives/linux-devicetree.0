From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform
 driver
Date: Wed, 24 Oct 2012 13:57:08 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1210241347570.1282-100000@iolanthe.rowland.org>
References: <50882882.1090806@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50882882.1090806-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 24 Oct 2012, Rob Herring wrote:

> On 10/24/2012 11:44 AM, Alan Stern wrote:
> > On Wed, 24 Oct 2012, Stephen Warren wrote:
> > 
> >> We should absolutely avoid Linux-specific properties where possible.
> >>
> >> That said, what Linux-specific properties are you talking about? The
> >> properties discussed here (has-synopsys-hc-bug, no-io-watchdog, has-tt)
> >> are all purely a description of HW, aren't they.
> > 
> > "has-tt" is definitely a description of the HW.
> 
> Can you spell out tt.

It stands for Transaction Translator.  The acronym is a standard one, 
used in the USB specs.

> > "has-synopsys-hc-bug" is too, although determining whether or not it 
> > should apply to a particular controller might be difficult.  I'm 
> > inclined not to include it among the properties.
> 
> What happens when there are 2 synopsys hc bugs? Something more specific
> about what the bug is would be better.

We will leave it out.

> > "no-io-watchdog" is not the greatest name.  It describes to controllers 
> > that always do generate IRQs for I/O events when they are supposed to 
> > (and hence the driver doesn't need to set up a watchdog timer to detect 
> > I/O completions that didn't generate an IRQ).  So while the concept is 
> > HW-specific, the name refers to a driver implementation issue.  A 
> > better name might be something like "reliable-IRQs".  Again, it's not 
> > such an easy thing to test for.  Almost all the existing drivers leave 
> > it unset.
> 
> Shouldn't the default be reliable irqs? What about "unreliable-irqs"?

I don't know why the default was set the way it was.  That was before 
my time as EHCI maintainer.  Right now only a few EHCI drivers claim to 
have reliable IRQs.

Avoiding the watchdog timer is a fairly minor optimization in any case.  
It fires only once every 100 ms, and only while I/O is in progress.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
