From: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform driver
Date: Wed, 24 Oct 2012 20:18:12 +0200
Message-ID: <5363783.RUh94aZCKb@bender>
References: <Pine.LNX.4.44L0.1210241358090.1282-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1210241358090.1282-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 24 October 2012 14:04:12 Alan Stern wrote:
> On Wed, 24 Oct 2012, Florian Fainelli wrote:
> 
> > As long as no one enables both ehci-platform and ehci-ppc-of at the same time
> > there is no problem. ehci-ppc-of should be removed in favor of ehci-platform
> > and make sure that the specific quirk in ehci-ppc-of also gets ported, other 
> > that I see no issue using "usb-ehci" as the least detailed compatible property
> > name.
> 
> Suppose a DT board file is created for a oontroller which ehci-platform
> can't handle.  Then by your proposal, the board file shouldn't have
> "usb-ehci" in its compatible property.
> 
> Now later on, suppose ehci-platform is enhanced so that it can manage
> that controller.  It's too late to update the board file because the
> information has already been written to various firmwares.  The
> enhanced ehci-platform would have to include a special entry to match
> the controller.

In any case you are supposed to use a compatible property which describes
as much as possible your hardware, and this one should have the precedence
if a special treatment is required, so I see no problem with this approach.

> 
> Since this reasoning applies every time ehci-platform is updated, it 
> seems reasonable to use the same approach right from the beginning.
> 
> Alan Stern
> 
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
