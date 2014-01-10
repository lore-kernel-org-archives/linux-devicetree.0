From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 1/2] Documentation: Add GPIO reset binding to reset
 binding documentation
Date: Fri, 10 Jan 2014 12:25:36 +0100
Message-ID: <1389353136.5854.13.camel@pizza.hi.pengutronix.de>
References: <1389179464-11963-1-git-send-email-p.zabel@pengutronix.de>
	 <201401081708.26679.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201401081708.26679.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Am Mittwoch, den 08.01.2014, 17:08 +0100 schrieb Arnd Bergmann:
> On Wednesday 08 January 2014, Philipp Zabel wrote:
> > += GPIO Reset consumers =
> > +
> > +For the common case of reset lines controlled by GPIOs, the GPIO binding
> > +documented in devicetree/bindings/gpio/gpio.txt should be used:
> > +
> > +Required properties:
> > +reset-gpios or         Reset GPIO using standard GPIO bindings,
> > +<name>-reset-gpios:    optionally named to specify the reset line
> > +
> > +Optional properties:
> > +reset-boot-asserted or         Boolean. If set, the corresponding reset is
> > +<name>-reset-boot-asserted:    initially asserted and should be kept that way
> > +                               until released by the driver.
> 
> I don't get this one. Why would you use a different reset binding for the case
> where the reset line is connected to the gpio controller rather than a
> specialized reset controller?
> 
> I was expecting to see the definition of a generic reset controller that
> in turn uses gpio lines, like
> 
> 
>         reset { 
>                 compatible = "gpio-reset";
>                 /* provides three reset lines through these GPIOs */
>                 gpios = <&gpioA 1 &gpioB 7 <gpioD 17>;
>                 #reset-cells = <1>;
>         };
> 
>         foo {
>                 ...
>                 resets = <&reset 0>; /* uses first reset line of the gpio-reset controller */
>         };

That is what I initially proposed...

> I realize it would be a little more verbose, but it also seems more
> regular and wouldn't stand out from the rest of the reset interfaces.

... but it can also be argued that GPIO resets shouldn't stand out from
other GPIOs.

Mark Rutland spoke out against having a 'GPIO reset device' node in the
device tree:

http://comments.gmane.org/gmane.linux.drivers.devicetree/41596

and I see his point. Using different bindings for reset controller IPs
and for single GPIOs better describes the actual hardware and it is less
Linux specific: it still allows an OS without gpio-reset framework to
let each driver handle the GPIO itself.

Also Stephen Warren pointed out that we'll have to support the existing
GPIO bindings anyway: in the meantime there are a lot of GPIO resets in
various device trees that use the GPIO bindings.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
