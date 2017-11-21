From: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Subject: Re: [PATCH v3 4/5] pinctrl: mcp23s08: configure irq polarity using irq data
Date: Tue, 21 Nov 2017 17:04:51 +0100
Message-ID: <2197074.iKMxQHLgca@ws-stein>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au> <c191a9d6-3ebb-e95b-7342-aa18598ddf2b@electromag.com.au> <20171121152142.zg3r57gl2kenjwgi@earth>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171121152142.zg3r57gl2kenjwgi@earth>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tuesday, November 21, 2017, 4:21:42 PM CET Sebastian Reichel wrote:
>[...]
> --------------------------------------------
> gpio: host-gpio {
>     random-properties;
> }
> 
> inv: line-inverter {
>     /*
>      * configure the gpio controller input to be active low
>      * and the inverter interrupt output to be active low
>      */
>     interrupts = <&gpio ACTIVE_LOW>;
> };
> 
> mcp23xxx {
>     random-properties;
> 
>     /*
>      * configure the chip interrupt output to be active high 
>      * and the inverter interrupt input to be active high
>      */
>     interrupts = <&inv ACTIVE_HIGH>;
> }
> --------------------------------------------
> 
> versus
> 
> --------------------------------------------
> gpio: host-gpio {
>     random-properties;
> }
> 
> mcp23xxx {
>     random-properties;
> 
>     /* configure host interrupt input pin to be active low */
>     interrupts = <&gpio ACTIVE_LOW>;
> 
>     /* configure chip interrupt output pin to be active high */
>     microchip,irq-active-high;
> }
> --------------------------------------------
> 
> I think this is something, that Rob should comment on. Obviously at
> least in the mainline kernel nobody implemented the first solution
> (since there is no fitting interrupt-invert driver), but there are
> a few instances of the second variant. On the other hand the first
> solution describes the hardware more detailed.
>
> > And if someone is relying on that implicit behaviour are we allowed
> > to break things? Probably ok with this one as it's currently not possible
> > due to code patch 1 removes.
> > 
> > If we need to model the invert to get the patches accepted I look into that.
> > I don't actually need it for my system as I can set open-drain with overrides
> > the active-high control on this device, while have active high irq consumer.
> > :)
> 
> IMHO the explicit line-inverter is a bit over-engineered and
> implicit line-inverter is enough, but I'm fine with both solutions.
> I think the DT binding maintainers should comment on this though,
> since it's pretty much a core decision about interrupt specifiers.

Once you have a hardware, where one of several IRQ users is not attached to the
inverter you need this inverter node anyway, caused by the mixed polarities.
Also some IRQ controllers, like ARM GIC, only support rising edge interrupts
(also level high).
This might get important if there are dedicated IRQ pads connected to several
users.

Just my 2 cents.
Alexander

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
