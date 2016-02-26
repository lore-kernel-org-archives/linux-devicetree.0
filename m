From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: r8a7795: Add CAN external clock support
Date: Fri, 26 Feb 2016 16:54:58 +0100
Message-ID: <CAMuHMdWEkNcBSdm42pZCRxmETvJpT_=PNx2E-AjTBSG4yH973A@mail.gmail.com>
References: <1456496023-16240-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
	<CAMuHMdXJRN2kF2r=bqcY8v87aYHj_OKr2=5vzcfoHwvr02Y2CA@mail.gmail.com>
	<SG2PR06MB1038B995B4C12A01C280DFC4C3A70@SG2PR06MB1038.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1038B995B4C12A01C280DFC4C3A70@SG2PR06MB1038.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Ramesh,

On Fri, Feb 26, 2016 at 4:00 PM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram@bp.renesas.com> wrote:
>> On Fri, Feb 26, 2016 at 3:13 PM, Ramesh Shanmugasundaram
>> <ramesh.shanmugasundaram@bp.renesas.com> wrote:
>> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> > @@ -115,6 +115,13 @@
>> >                 clock-frequency = <0>;
>> >         };
>> >
>> > +       /* External CAN clock - to be overridden by boards that provide
>> it */
>> > +       can_clk: can {
>> > +               compatible = "fixed-clock";
>> > +               #clock-cells = <0>;
>> > +               clock-frequency = <0>;
>>
>> As this is an optional clock, it should have
>>
>>         status = "disabled";
>
> Yes, I too thought the same but the status property is not obeyed. The
> "disabled" clock still shows up in clk_tree and clk_xxx apis works just fine
> (Is this a DT bug?). Hence left the ambiguous "status". In code I use
> clk_get_rate(can_clk) != 0 to see if it's enabled, which seems logical.
>
> If you add this as a child of soc node, status property is obeyed. But all
> external clocks are defined outside soc (correctly) and I followed the same.

You're right. That's clearly a bug. I sent a patch to fix that.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
