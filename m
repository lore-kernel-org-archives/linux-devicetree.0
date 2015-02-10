From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: add disable-wakeup property for gpio-charger
Date: Tue, 10 Feb 2015 13:14:48 +0100
Message-ID: <6846904.0gWUOTnQ0A@diego>
References: <1423555945-24289-1-git-send-email-zyw@rock-chips.com> <1423555945-24289-2-git-send-email-zyw@rock-chips.com> <20150210120030.GD6659@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150210120030.GD6659@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 10. Februar 2015, 12:00:30 schrieb Mark Rutland:
> On Tue, Feb 10, 2015 at 08:12:24AM +0000, Chris Zhong wrote:
> > add disable-wakeup for gpio-charger, if you set this property, system
> > will not wakeup by gpio-charger.
> > 
> > Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > ---
> > 
> >  Documentation/devicetree/bindings/power_supply/gpio-charger.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/power_supply/gpio-charger.txt
> > b/Documentation/devicetree/bindings/power_supply/gpio-charger.txt index
> > adbb5dc..a46e9bc 100644
> > --- a/Documentation/devicetree/bindings/power_supply/gpio-charger.txt
> > +++ b/Documentation/devicetree/bindings/power_supply/gpio-charger.txt
> > 
> > @@ -4,6 +4,7 @@ Required properties :
> >   - compatible : "gpio-charger"
> >   - gpios : GPIO indicating the charger presence.
> >   
> >     See GPIO binding in bindings/gpio/gpio.txt .
> > 
> > + - gpio-charger,disable-wakeup : Boolean, charger does not wake-up the
> > system.
> When would the system wake up otherwise?

a response for patch 2/2 suggested to move this to userspace (as deciding if 
the charger should be a wakeup source is not a hardware property) and Chris 
responded that he'll try to move it as suggested.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
