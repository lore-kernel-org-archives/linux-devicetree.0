From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/6] ARM: dts: bcm283x: Define standard pinctrl
 groups in the gpio node.
Date: Tue, 13 Sep 2016 08:34:38 +0200
Message-ID: <1473748478.11547.19.camel@redhat.com>
References: <1473668576-22256-1-git-send-email-kraxel@redhat.com>
         <1473668576-22256-3-git-send-email-kraxel@redhat.com>
         <1273800480.83718.15854341-2f8e-4e20-95f4-e76f81e6fd56.open-xchange@email.1und1.de>
         <103847685.101383.df740dd1-92f3-4978-9442-1f1b3a81e9da.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <103847685.101383.df740dd1-92f3-4978-9442-1f1b3a81e9da.open-xchange-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

  Hi,

> > > +			emmc_gpio48: emmc_gpio48 {
> > > +				brcm,pins = <48 49 50 51 52 53>;
> > > +				brcm,function = <BCM2835_FSEL_ALT3>;
> > > +			};
> > 
> > Sorry, i didn't notice this before. The naming of these groups suggest 3 muxes
> > for the same eMMC interface. I thought there is a eMMC interface and a SD host
> > interface with different DMA channels.
> > 
> > > +
> > > ...
> > > +
> > > +			sdhost_gpio48: sdhost_gpio48 {
> > > +				brcm,pins = <48 49 50 51 52 53>;
> > > +				brcm,function = <BCM2835_FSEL_ALT0>;
> > > +			};
> > 
> > I think this incorrect. There is no function ALT0 for these pins, only ALT3.
> 
> please forget my last 2 comments. According to this page [1] eMMC is selected by
> ALT3 and sdhost is selected by ALT0.
> 
> Do you know a reliable source where all muxes for both interface are documented?
> The datasheet isn't very helpful here.

No, I don't know any source better than the datasheet @ github.
Yes, I tried to double-check things with the sheet too.

IIRC Eric mentioned a while back in some mail or patch that he checked
something for the rpi device tree with non-public docs, not fully sure
though whenever it was emmc/sdhost or something else.  But I'm basically
trusting Eric here ...

cheers,
  Gerd

PS: This is exactly why I think it us useful to have all those entries
    in the dt file even if unused:  To serve as documentation.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
