From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: powerpc/opal-irqchip: Use interrupt names if present
Date: Sat, 3 Jun 2017 16:04:44 +0200
Message-ID: <CAMuHMdUWM+5U=gngX9V5y8yNzfW5JM_DYQm_jC4uEWdX3asPJw@mail.gmail.com>
References: <20170222190235.92E5F661CEB@gitolite.kernel.org>
 <CAMuHMdWGZYkM_aQ=vXr5J9-KFGzzWgq3hf+ZRY-n-+8-ghG5nQ@mail.gmail.com> <1496412702.2842.11.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496412702.2842.11.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ben,

On Fri, Jun 2, 2017 at 4:11 PM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Fri, 2017-06-02 at 14:39 +0200, Geert Uytterhoeven wrote:
>> > diff --git a/arch/powerpc/platforms/powernv/opal-irqchip.c b/arch/powerpc/platforms/powernv/opal-irqchip.c
>> > index 998316bf2dad..ecdcba9d1220 100644
>> > --- a/arch/powerpc/platforms/powernv/opal-irqchip.c
>> > +++ b/arch/powerpc/platforms/powernv/opal-irqchip.c
>> > @@ -183,8 +183,9 @@ void opal_event_shutdown(void)
>> > +       /* It's not an error for the names to be missing */
>> > +       of_property_read_string_array(opal_node, "opal-interrupts-names",
>> > +                                     names, opal_irq_count);
>>
>> Just double-checking, as it's different from the standard "interrupt-names":
>> is "opal-interrupts-names" the correct name?
>
> Yes, because the property it refers to isn't a standard "interrupts"
> property... it's ... complicated :-)

I'm aware it's a different property.

> It could have been mind you, but the decision for that was made years
> ago... it's a bunch of interrupts OPAL is interested in, which Linux
> requests and sets up a handler for which just calls back into OPAL.
>
> In any case, firmwares with that property are out now.

Thanks for the confirmation!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
