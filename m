From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] ARM: shmobile: r8a7794: add GPIO DT support
Date: Wed, 25 Feb 2015 11:27:37 +0100
Message-ID: <CAMuHMdU9QD_4UOBPm850HtUPAOOEY4JA7cztpUyKSGog6VYUNA@mail.gmail.com>
References: <6954455.LyoCrfjM8R@wasted.cogentembedded.com>
	<3082195.zNdUtZ8oMM@wasted.cogentembedded.com>
	<2292882.LbM0mNWfOj@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <2292882.LbM0mNWfOj@avalon>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms@verge.net.au>, Linux-sh list <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Wed, Feb 25, 2015 at 11:11 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>> --- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
>> +++ renesas/arch/arm/boot/dts/r8a7794.dtsi
>> @@ -50,6 +50,90 @@

>> +     gpio1: gpio@e6051000 {
>> +             compatible = "renesas,gpio-r8a7794", "renesas,gpio-rcar";
>> +             reg = <0 0xe6051000 0 0x50>;
>> +             interrupts = <0 5 IRQ_TYPE_LEVEL_HIGH>;
>> +             #gpio-cells = <2>;
>> +             gpio-controller;
>> +             gpio-ranges = <&pfc 0 32 32>;
>
> This GPIO block has 26 GPIOs only.

>> +     gpio5: gpio@e6055000 {
>> +             compatible = "renesas,gpio-r8a7794", "renesas,gpio-rcar";
>> +             reg = <0 0xe6055000 0 0x50>;
>> +             interrupts = <0 9 IRQ_TYPE_LEVEL_HIGH>;
>> +             #gpio-cells = <2>;
>> +             gpio-controller;
>> +             gpio-ranges = <&pfc 0 160 32>;
>
> This GPIO block has 28 GPIOs only.

>> +     gpio6: gpio@e6055400 {
>> +             compatible = "renesas,gpio-r8a7794", "renesas,gpio-rcar";
>> +             reg = <0 0xe6055400 0 0x50>;
>> +             interrupts = <0 10 IRQ_TYPE_LEVEL_HIGH>;
>> +             #gpio-cells = <2>;
>> +             gpio-controller;
>> +             gpio-ranges = <&pfc 0 192 32>;
>
> This GPIO block has 26 GPIOs only.

I guess you hear me coming... r8a779[01].dtsi need to be fixed, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
