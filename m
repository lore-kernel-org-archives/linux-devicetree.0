From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] doc/devicetree: Add Aspeed VIC bindings
Date: Fri, 20 May 2016 15:13:31 -0500
Message-ID: <CAL_Jsq+EL-syhXoG2fBztaYSD4MXt488JVPh7kyxBT9iA4ipiA@mail.gmail.com>
References: <462797239-14765-1-git-send-email-joel@jms.id.au>
 <1462802317-27086-1-git-send-email-joel@jms.id.au> <1462802317-27086-2-git-send-email-joel@jms.id.au>
 <20160511143313.GA7426@rob-hp-laptop> <1463014882.20290.203.camel@kernel.crashing.org>
 <CAL_JsqJDGmvDxm1kN1w6NQZs0JLeA-V=X_BWi=VOaMTwftLn-w@mail.gmail.com> <CACPK8Xe6TDdV3dC=gizXLxLjUziDFhsupUbXSuYsn6bcrAxahQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8Xe6TDdV3dC=gizXLxLjUziDFhsupUbXSuYsn6bcrAxahQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 18, 2016 at 8:50 AM, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
> On Fri, May 13, 2016 at 2:50 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Wed, May 11, 2016 at 8:01 PM, Benjamin Herrenschmidt
>> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>>> On Wed, 2016-05-11 at 09:33 -0500, Rob Herring wrote:
>>>> > +- interrupt-controller : Identifies the node as an interrupt controller
>>>> > +- #interrupt-cells : Specifies the number of cells needed to encode an
>>>> > +  interrupt source. The value shall be 1.
>>>>
>>>> No need for level vs. edge flags?
>>>
>>> That's an open question. Most interrupts are fixed. A handful of GPIOs
>>> can be configured either way. For now I am relying on uboot setting up
>>> the right config for them and I read it back at boot time, but we could
>>> make it part of the binding I suppose.
>>
>> It is almost standard to just use 2 cells here even if reserved for
>> future use. Especially since the IP block seems to have registers to
>> control that.
>
> Yep, makes sense. I've added this to the bindings document.
>
> I was trying to use the second cell in our driver:
>
>   static struct irq_domain_ops avic_dom_ops = {
>           .map = avic_map,
>          .xlate = irq_domain_xlate_twocell,
>   };
>
>  So we have irq_domain_xlate_twocell to parse the device tree and
> grabs the type property from the second cell.
>
> In avic_map we set the irq handler:
>
>          if (vic->edge_sources[sidx] & sbit) {
>                  /* TODO: Check aginst type from dt and warn if not edge */
>                  irq_set_chip_and_handler(irq, &avic_chip, handle_edge_irq);
>          } else {
>                  /* TODO: Check aginst type from dt and warn if not level */
>                  irq_set_chip_and_handler(irq, &avic_chip, handle_level_irq);
>          }
>
> However, we don't have the type here, so we can't use it to check that
> we're setting the correct edge/level callback (or use it to set the
> register in the future if we want to use the device tree to override
> the bootloader settings).
>
> I had a look at some other drivers and they don't seem to use the dt
> property when mapping the irq. What am I missing here?

The type will be set by the irqdomain core when the mapping is created
and this should result in irq_set_type() being called on your irqchip.
The map function doesn't need to deal with type.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
