From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform
 driver
Date: Wed, 24 Oct 2012 15:30:43 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1210241525550.1282-100000@iolanthe.rowland.org>
References: <5088399F.2000102@firmworks.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5088399F.2000102-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 24 Oct 2012, Mitch Bradley wrote:

> >> Ah, now I'm starting to get the picture.
> >>
> >> So by listing "usb-ehci" in its device ID table, a driver would
> >> essentially be saying that it can handle _all_ USB EHCI controllers.  
> 
> 
> Actually, it means that the driver can handle at least USB EHCI
> controllers that are 100% compatible with the EHCI spec (requiring
> nothing extra).  The driver might be able to handle almost-compatible
> controllers, possibly with the help of additional properties.

Unfortunately that's not saying very much.  The EHCI spec describes
only PCI-based controllers.  Every other sort does require something
extra.

> If a DT node lists "usb-ehci" as a "fallback", it's not guaranteed that
> a given version of that driver will work, but it's worth a try in the
> event that no more-specific driver is matched.

While I haven't checked in detail, it seems quite likely that this 
would not work with some of the devices that have "usb-ehci" listed in 
their compatible values.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
