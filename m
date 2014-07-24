From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/3] usb: host: st-hcd: Add USB HCD support for STi SoCs
Date: Thu, 24 Jul 2014 18:26:48 +0200
Message-ID: <5840432.YNRZREIYz5@wuerfel>
References: <1406199616-10533-1-git-send-email-peter.griffin@linaro.org> <5967609.vndF2bDyS1@wuerfel> <20140724141412.GA21823@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140724141412.GA21823@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 24 July 2014 15:14:12 Peter Griffin wrote:

> > > > Depending on what kind of special requirements the ST version has,
> > > > this can be done either by using the generic ohci/ehci bindings
> > > > with extensions where necessary, or by creating a new binding and
> > > > new driver files that use 'ohci_init_driver'/'ehci_init_driver'
> > > > to inherit from the common code.
> > > > 
> > > > The first of the two approaches is preferred.
> > > 
> > > We don't have anything particularly special, just a couple of reset lines,
> > > clock, phy, etc.
> > 
> > Ok, good. Please see Documentation/devicetree/bindings/usb/usb-?hci.txt
> > then. You might actually be able to just use the existing drivers
> > without new code by just adding the proper DT nodes that follow these
> > bindings.
> 
> The only issues I can see with the generic versions are: -
> 1) We also have a powerdown line in addition to the reset line both of which are 
> exposed via reset controller API, so I would need to add that into ehci-platform
> and ohci-platform.

Ok, adding this would not be too hard.

> 2) We have a magic poke in st_ehci_configure_bus of the current driver to configure
> the AHB to ST bus protocol convertor IP. I'm not quite sure where I could hook that
> in (sorry... slightly pulling back on my "nothing special comment" a bit ;-).

Hmm, doing this would require adding some form of quirk, either by compatible
string or using an extra DT property for detection.

> 3) We also set the rate of the ohci clock, which the generic driver doesn't do.

Hmm, I guess this is the reason why sometimes it's nice to have names associated
with the clocks. The generic driver assumes that all clocks just need to be
turned on, and we decided not to use any naming when that binding was introduced.

Each of these seems solvable, but the combination of these sounds like it
would be better to create a new pair of drivers. I'd suggest you start by making
a copy of ohci-platform and removing everything you don't need, then add support
for the three things above. Give the clock a name, in case we want to merge the
drivers again later.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
