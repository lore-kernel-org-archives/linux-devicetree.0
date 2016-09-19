From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/4] ARM: dts: r7s72100: add mmcif to device tree
Date: Mon, 19 Sep 2016 17:26:47 +0200
Message-ID: <CAMuHMdUqd4DCQsTLkZTQrxyabUH-Yj4Uroh=nKjPkccpd=B5BA@mail.gmail.com>
References: <20160915193405.26943-1-chris.brandt@renesas.com>
 <20160915193405.26943-3-chris.brandt@renesas.com> <CAMuHMdU6DKuxYUKNV_-FyczV-pPFpTLso=5HruWgNiXNOenVRQ@mail.gmail.com>
 <SG2PR06MB11655B678F23E16AB93C9B008AF30@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB11655B678F23E16AB93C9B008AF30@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Fri, Sep 16, 2016 at 3:08 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On 9/15/2016, Geert Uytterhoeven wrote:
>> > +               interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH
>> > +                             GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
>>
>> The bindings do not say anything about interrupts (hence that should be
>> added).
>
> I'm sorry, I'm confused...
> Are you saying:
>  A) I forgot to add something?
>  B) As a general statement, the renesas,mmcif.txt file doesn't say anything about interrupts?

Both ;-)

>> The driver handles either 1 combined or 2 separate interrupts.
>> The datasheet says MMC has 3 interrupt requests, though?
>
> The IP itself has 3 interrupts:
>  #1. MMC0,299: Card detect
>  #2. MMC1,300: Status Change
>  #3. MMC2,301: Error
>
> Many of the 'Linux' SoC devices that use this MMC (SH4, R-Car) are only ever going to use eMMC, so the card detection portion of the IP was irrelevant. I agree this is the same case for the RZ/A (who would ever use an MMC card now a days?????)
> The 'smaller' SoCs kept it in (SH2A, RZ/A1) but the 'bigger' SoCs left it out (SH4A, R-Car).
>
> The only way to enable that interrupt is to write to the CE_DETECT register (offset 0x70) which the driver doesn't do.
>
> However....if you look in sh_mmcif.h, you'll see that same offset (0x70) is called CE_CLK_CTRL2
>
> #define MMCIF_CE_CLK_CTRL2      0x00000070
>
> Which it only writes to if 'clk_ctrl2_enable' is designated.
>
>         if (host->clk_ctrl2_enable)
>                 sh_mmcif_writel(host->addr, MMCIF_CE_CLK_CTRL2, 0x0F0F0000);
>
> And, I see no Renesas SoC that ever sets that or would ever use it so I can't even tell you what SoC that was for (SH4, SH-Mobile, ARM)

Google and Patchwork told me this was enabled in the old board code for Lager:

  commit b77c6bcef2082a7cd96124daf15df8da5b670ebe
  Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
  Date:   Wed Jul 10 21:21:17 2013 +0200

    ARM: shmobile: lager: disable MMCIF Command Completion Signal, add CLK_CTRL2

    MMCIF on r8a7790 doesn't support Command Completion Signal, but it does
    implement a CE_CLK_CTRL2 register. Platform parameters have to be added to
    account for these features on lager.

    Signed-off-by: Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
    Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

But it was lost during the transition to DT. No idea if someone tried MMC
(not SDHI) on Lager, or any other R-Car Gen2 board, recently...

> So after all that ranting...I see no need to support card detect for MMC for the RZ/A (or any future RZ) so I'd like to just leave it as is.
>
> Do you agree?

Let's summarize...

  1) Documentation/devicetree/bindings/mmc/renesas,mmcif.txt should document
     the "interrupts" property, for both single and multiple values.
  2) If you specify 2 interrupts in DT, the driver names the first one
     "sh_mmc:error", and the second one "sh_mmc:int", while you specified them
     in reverse order (status first, error second).
     I couldn't find which of the three interrupts on R-Mobile A1 is used for
     what purpose in the datasheet, but the datasheet for SH-Mobile AG5 states
     the first (140) is MMC_ERR, and the second (141) is MMC_NOR.
     However, it still worked for you, as the driver uses the same interrupt
     handler for all interrupts.
  3) You may want to add the card detect interrupt to DT anyway, as DT
     describes the hardware, not limitations of the driver. If you do so,
     renesas,mmcif.txt should document the third interrupt value.

Wolfram, do you have any comments?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
