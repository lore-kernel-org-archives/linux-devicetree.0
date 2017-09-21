From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 04/18] arm64: dts: m3ulcb-kf: initial device tree
Date: Thu, 21 Sep 2017 11:10:58 +0200
Message-ID: <CAMuHMdU87p0xjtfOtaoHPcqZZxVvxJc-b1jdP_iJYBwHv1=ebw@mail.gmail.com>
References: <1505398732-4614-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdX-7MG2fCzJ-K5iQLnJcmZBaWjqMhmOhCxEemmWTh9pvw@mail.gmail.com> <1505983900.23573.76.camel@hp800z>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505983900.23573.76.camel@hp800z>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

On Thu, Sep 21, 2017 at 10:51 AM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> On Wed, 2017-09-20 at 14:32 +0200, Geert Uytterhoeven wrote:
>> On Thu, Sep 14, 2017 at 4:18 PM, Vladimir Barinov
>> <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
>> > +#include "ulcb-kf.dtsi"
>>
>> As the Kingfisher is actually an expansion board for H3ULCB (with R-Car H3
>> ES1.1 and ES2.0) and M3ULCB (with R-Car M3-W), turning ulcb-kf.dtsi into a
>> DT overlay would make sense.
>> That would also solve the issue of the 3 extra DTSes needed for all possible
>> combinations of ULCB and Kingfisher (r8a7795-es1-h3ulcb-kf.dts,
>> r8a7795-h3ulcb-kf.dts, r8a7796-h3ulcb-kf.dts (perhaps more to follow?)).
>>
>> But that's too premature, without upstream support for the easy loading of
>> DT overlays.
>>
>
> Sigh, yes.
>
>> > +/ {
>> > +       model = "Renesas M3ULCB Kingfisher board based on r8a7796";
>> > +       compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
>> > +                    "renesas,r8a7796";
>> > +};
>>
>> And how to support from an overlay the addition of "shimafuji,kingfisher" to
>> (not replacement of!) the main compatible value?
>
> You can hack something in DT but it will be gross indeed.
>
> Ideally you'd want a += operator, but it's going to take a lot of
> changes starting from DTB blob format.
>
> In yaml we could easily do this with an append tag type
>
> compatible: [ "renesas,m3ulcb", "renesas,r8a7796" ]
>
> compatible: !append "shimafuji,kingfisher"

As we already have /delete-property/, we could add /append-property/ and
/prepend-property/? Would be useful for a .dts including and enhancing
an .dtsi, too.

That doesn't solve the DTB blob format issue yet, though.

> Are you going to be at ELCE? I have a bunch of thing to ask you about
> your DT usage patterns.

Yes, and registered for the Device Tree Workshop.

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
