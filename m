From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 1/2] USB: Update EHCI-platform driver to devicetree.
Date: Sat, 20 Oct 2012 10:31:02 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1210201027280.24222-100000@netrider.rowland.org>
References: <2209384.BKaXW2gI8I@bender>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2209384.BKaXW2gI8I@bender>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 20 Oct 2012, Florian Fainelli wrote:

> Hi Tony,
> 
> On Saturday 20 October 2012 16:17:32 Tony Prisk wrote:
> > This patch adds devicetree support to the EHCI-platform driver,
> > and removes the now unneeded ehci-vt8500.c
> > 
> > Existing platform properties are maintained, with the exception
> > the power_(on/off) and suspend function pointers.
> 
> Ok, so I have recently sent a bit patchset to remove most OHCI/EHCI drivers
> that could be converted to the generic variants, series starts here:
> 1349701906-16481-1-git-send-email-florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
> 
> in this patchset I added a new property to the EHCI platform data:
> need_io_watchdog, which needs to be handled too from DT ideally.

Actually the new property is "no_io_watchdog".  See

	http://marc.info/?l=linux-usb&m=134970247511140&w=2

> Adding device tree bindings is on my TODO after having a generic way
> to pass clocks to the ehci/ohci platform drivers, so you are right on time :)

At some point we'll need a way to handle the power_{on,off,suspend} 
callbacks.  I don't know how that should be done.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
