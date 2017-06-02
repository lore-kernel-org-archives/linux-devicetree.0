From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: powerpc/opal-irqchip: Use interrupt names if present
Date: Sat, 03 Jun 2017 00:11:42 +1000
Message-ID: <1496412702.2842.11.camel@kernel.crashing.org>
References: <20170222190235.92E5F661CEB@gitolite.kernel.org>
         <CAMuHMdWGZYkM_aQ=vXr5J9-KFGzzWgq3hf+ZRY-n-+8-ghG5nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWGZYkM_aQ=vXr5J9-KFGzzWgq3hf+ZRY-n-+8-ghG5nQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2017-06-02 at 14:39 +0200, Geert Uytterhoeven wrote:
> 
> > diff --git a/arch/powerpc/platforms/powernv/opal-irqchip.c b/arch/powerpc/platforms/powernv/opal-irqchip.c
> > index 998316bf2dad..ecdcba9d1220 100644
> > --- a/arch/powerpc/platforms/powernv/opal-irqchip.c
> > +++ b/arch/powerpc/platforms/powernv/opal-irqchip.c
> > @@ -183,8 +183,9 @@ void opal_event_shutdown(void)
> > +       /* It's not an error for the names to be missing */
> > +       of_property_read_string_array(opal_node, "opal-interrupts-names",
> > +                                     names, opal_irq_count);
> 
> Just double-checking, as it's different from the standard "interrupt-names":
> is "opal-interrupts-names" the correct name?

Yes, because the property it refers to isn't a standard "interrupts"
property... it's ... complicated :-)

It could have been mind you, but the decision for that was made years
ago... it's a bunch of interrupts OPAL is interested in, which Linux
requests and sets up a handler for which just calls back into OPAL. 

In any case, firmwares with that property are out now.

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
