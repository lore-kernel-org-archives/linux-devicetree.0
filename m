Return-Path: <SRS0=Ur2C=XK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44582 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbfIONME (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 15 Sep 2019 09:12:04 -0400
MIME-Version: 1.0
References: <20190907161634.27378-1-marek.vasut@gmail.com> <CAMuHMdXVhtE5Jmpu8QYv+P8pGtegr4MGhNGRwy4Y1wRQYmL2_Q@mail.gmail.com>
 <f1b11b42-99ee-0484-550e-8758ec6fa559@gmail.com> <CAMuHMdWz05ALM745tpw=AT2Q30nXvQV39JXTATYTEoTmH1TSRQ@mail.gmail.com>
 <ad3f986d-90bb-a47b-aa24-c326fb369202@gmail.com>
In-Reply-To: <ad3f986d-90bb-a47b-aa24-c326fb369202@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 15 Sep 2019 15:11:51 +0200
Message-ID: <CAMuHMdWohfCtb8sK73ehfSssu-q7mObqxV8Tvn0V4qHt8gOsvg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@the-dreams.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Marek,

On Sat, Sep 14, 2019 at 6:45 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 9/14/19 6:33 PM, Geert Uytterhoeven wrote:
> > On Sat, Sep 14, 2019 at 6:06 PM Marek Vasut wrote:
> >> On 9/9/19 1:18 PM, Geert Uytterhoeven wrote:
> >>> On Sat, Sep 7, 2019 at 6:16 PM Marek Vasut wrote:
> >>>> Add dma-ranges property into /soc node to describe the DMA capabilities
> >>>> of the bus. This is currently needed to translate PCI DMA ranges, which
> >>>> are limited to 32bit addresses.
> >>>
> >>>> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> >>>> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> >>>> @@ -330,6 +330,7 @@
> >>>>                 #address-cells = <2>;
> >>>>                 #size-cells = <2>;
> >>>>                 ranges;
> >>>> +               dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
> >>>
> >>> Shouldn't the length be 0x80000000 (for all SoCs)?
> >>
> >> Or should that match the amount of DRAM below 32bit boundary ?
> >
> > Which is 0x80000000, according to the memory area section for the
> > various R-Car Gen3 SoCs.
>
> What if you have a system with 1 GiB of DRAM ?

Should be covered by 0x80000000, no?
Linux will never ask a PCI device to do bus mastering to an area not
backed by populated memory, will it?

However, you ask a good question: does this property specify the limits
of the bridge, or the limits of the bridge combined with the actual
populated or available memory?

In the former case, offset and length should be "0 0x0" resp. "1 0x00000000".
In the latter case, it depends on the actual board (SiP is board, too)
configuration.
Which means U-Boot may need to update this ("AND" mask the value we
specify here?), based on what it writes into the memory node?

> >>> Or should we allow DMA to internal System RAM, too?
> >>
> >> I think we should include SRAM, yes.
> >
> > So that needs a separate range.
>
> Let's see how the discussion pans out about the placement of the
> dma-ranges in the first place.

Yep.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
