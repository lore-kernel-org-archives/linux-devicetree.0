From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 5/5] media: platform: rcar_drif: Add DRIF support
Date: Mon, 14 Nov 2016 21:04:39 +0100
Message-ID: <CAMuHMdW5t4irT+2kHDo8TyLcW_eE7yyDa_SYG9Y-Wj99zRN5mQ@mail.gmail.com>
References: <1478706284-59134-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <1478706284-59134-6-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <2857106.83gIJRJqtY@avalon> <20161114195200.s62ga2bnutsrocyf@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161114195200.s62ga2bnutsrocyf@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, Nov 14, 2016 at 8:52 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Nov 10, 2016 at 11:22:20AM +0200, Laurent Pinchart wrote:
>> On Wednesday 09 Nov 2016 15:44:44 Ramesh Shanmugasundaram wrote:
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/media/renesas,drif.txt
>> > @@ -0,0 +1,136 @@

>> > +Example
>> > +--------
>> > +
>> > +SoC common dtsi file
>> > +
>> > +           drif00: rif@e6f40000 {
>> > +                   compatible = "renesas,r8a7795-drif",
>> > +                                "renesas,rcar-gen3-drif";
>> > +                   reg = <0 0xe6f40000 0 0x64>;
>> > +                   interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
>> > +                   clocks = <&cpg CPG_MOD 515>;
>> > +                   clock-names = "fck";
>> > +                   dmas = <&dmac1 0x20>, <&dmac2 0x20>;
>> > +                   dma-names = "rx", "rx";
>
> rx, rx? That doesn't make sense. While we don't explicitly disallow
> this, I'm thinking we should. I wonder if there's any case this is
> valid. If not, then a dtc check for this could be added.

The device can be used with either dmac1 or dmac2.
Which one is used is decided at run time, based on the availability of
DMA channels per DMAC, which is a limited resource.

>> > +                   power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>> > +                   status = "disabled";
>> > +           };
>> > +
>> > +           drif01: rif@e6f50000 {
>> > +                   compatible = "renesas,r8a7795-drif",
>> > +                                "renesas,rcar-gen3-drif";
>> > +                   reg = <0 0xe6f50000 0 0x64>;
>> > +                   interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
>> > +                   clocks = <&cpg CPG_MOD 514>;
>> > +                   clock-names = "fck";
>> > +                   dmas = <&dmac1 0x22>, <&dmac2 0x22>;
>> > +                   dma-names = "rx", "rx";
>> > +                   power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>> > +                   status = "disabled";
>> > +           };
>> > +
>> > +           drif0: rif@0 {
>> > +                   compatible = "renesas,r8a7795-drif",
>> > +                                "renesas,rcar-gen3-drif";
>> > +                   sub-channels = <&drif00>, <&drif01>;
>> > +                   status = "disabled";
>> > +           };
>>
>> I'm afraid this really hurts my eyes, especially using the same compatible
>> string for both the channel and sub-channel nodes.
>>
>> We need to decide how to model the hardware in DT. Given that the two channels
>> are mostly independent having separate DT nodes makes sense to me. However, as
>> they share the clock and sync signals, somehow grouping them makes sense. I
>> see three ways to do so, and there might be more.
>>
>> 1. Adding an extra DT node for the channels group, with phandles to the two
>> channels. This is what you're proposing here.
>>
>> 2. Adding an extra DT node for the channels group, as a parent of the two
>> channels.
>>
>> 3. Adding phandles to the channels, pointing to each other, or possibly a
>> phandle from channel 0 pointing to channel 1.
>>
>> Neither of these options seem perfect to me. I don't like option 1 as the
>> group DT node really doesn't describe a hardware block. If we want to use a DT
>> node to convey group information, option 2 seems better to me. However, it
>> somehow abuses the DT parent-child model that is supposed to describe
>> relationships from a control bus point of view. Option 3 has the drawback of
>> not scaling properly, at least with phandles in both channels pointing to the
>> other one.
>>
>> Rob, Geert, tell me you have a fourth idea I haven't thought of that would
>> solve all those problems :-)
>
> What's the purpose/need for grouping them?
>
> I'm fine with Option 2, though I want to make sure it is really needed.

Each half of a DRIF pair is basically an SPI slave controller without TX
capability, sharing clock and chip-select between the two halves.
Hence you can use either one half to receive 1 bit per clock pulse,
or both halves to receive 2 bits per clock pulse.
You cannot use both halves for independent operation due to the signal
sharing.

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
