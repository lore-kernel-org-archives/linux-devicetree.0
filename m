From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform driver
Date: Wed, 24 Oct 2012 10:48:35 -0600
Message-ID: <50881BE3.9020702@wwwdotorg.org>
References: <Pine.LNX.4.44L0.1210241238570.1282-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1210241238570.1282-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/24/2012 10:44 AM, Alan Stern wrote:
> On Wed, 24 Oct 2012, Stephen Warren wrote:
> 
>> We should absolutely avoid Linux-specific properties where possible.
>>
>> That said, what Linux-specific properties are you talking about? The
>> properties discussed here (has-synopsys-hc-bug, no-io-watchdog, has-tt)
>> are all purely a description of HW, aren't they.
> 
> "has-tt" is definitely a description of the HW.

OK.

> "has-synopsys-hc-bug" is too, although determining whether or not it 
> should apply to a particular controller might be difficult.  I'm 
> inclined not to include it among the properties.
> 
> "no-io-watchdog" is not the greatest name.  It describes to controllers 
> that always do generate IRQs for I/O events when they are supposed to 
> (and hence the driver doesn't need to set up a watchdog timer to detect 
> I/O completions that didn't generate an IRQ).  So while the concept is 
> HW-specific, the name refers to a driver implementation issue.  A 
> better name might be something like "reliable-IRQs".  Again, it's not 
> such an easy thing to test for.  Almost all the existing drivers leave 
> it unset.

OK, I'd be inclined to drive those last two by quirks then, since they
aren't architectural features of EHCI but rather implementation issues.
And indeed have the quirk table have a "reliable IRQs" field instead of
"no IO watchdog", to minimize the table size.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
