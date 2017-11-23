From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795: Move nodes which have no
 reg property out of bus
Date: Thu, 23 Nov 2017 10:49:13 +0100
Message-ID: <CAMuHMdX4voo+HOx69Wj7B+kDwyqb8KNSQVwWnUcCqLR_27aBiA@mail.gmail.com>
References: <20171120110125.12267-1-horms+renesas@verge.net.au>
 <CAMuHMdXqPqhiCZFseBGFDEh9R+_kFcrmjWWgCSudtnHkuXoFgw@mail.gmail.com> <20171123094657.r2wjbmvrn24ohrn6@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171123094657.r2wjbmvrn24ohrn6-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Thu, Nov 23, 2017 at 10:46 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> On Thu, Nov 23, 2017 at 10:27:55AM +0100, Geert Uytterhoeven wrote:
>> On Mon, Nov 20, 2017 at 12:01 PM, Simon Horman
>> <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
>> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> > @@ -126,6 +126,86 @@
>>
>> The node above is called "cpus".
>>
>> >                 };
>> >         };
>> >
>> > +       pmu_a57 {
>>
>> > +       };
>> > +
>> > +       pmu_a53 {
>>
>> > +       };
>> > +
>> > +       timer {
>>
>> > +       };
>> > +
>> > +       thermal-zones {
>>
>> > +       };
>> > +
>> >         extal_clk: extal {
>> >                 compatible = "fixed-clock";
>> >                 #clock-cells = <0>;
>>
>> Any sorting rules (alphabetically?) for nodes at the root level?
>
> Now would be a good time to decide on an alternate on an order as
> I plan to submit similar patches for several other SoCs.
>
> I took used order they were already present (with other nodes) in the
> cpu node. They appear to be sorted alphabetically. Should I keep that
> sort order relative to existing nodes present in the root node?

I think you should.

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
