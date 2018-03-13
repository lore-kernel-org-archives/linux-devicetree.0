Return-Path: <SRS0=7cs9=GD=gmail.com=ykaneko0929@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXB+WCwC7cOpQF-4fPD7VN2UUCDTfgvy6B0cS1UWWx4yw@mail.gmail.com>
References: <1520799995-26347-1-git-send-email-ykaneko0929@gmail.com>
 <1520799995-26347-4-git-send-email-ykaneko0929@gmail.com> <CAMuHMdXB+WCwC7cOpQF-4fPD7VN2UUCDTfgvy6B0cS1UWWx4yw@mail.gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Wed, 14 Mar 2018 01:41:08 +0900
Message-ID: <CAH1o70LsCUxJSzJcbcqRP7a_B82BHJCrD2wxO6bOb1zHM7OKQw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a77995: add thermal device support
Content-Type: text/plain; charset="UTF-8"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Geert-san,

Thanks for your review.

2018-03-12 19:56 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
> Hi Kaneko-san,
>
> On Sun, Mar 11, 2018 at 9:26 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> Thanks for your patch!
>
>> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
>> @@ -402,5 +402,36 @@
>>                         #phy-cells = <0>;
>>                         status = "disabled";
>>                 };
>> +
>> +               thermal: thermal@e61f0000 {
>
> According to the Hard User Manual rev. 0.80, the base address is e6190000?

You are correct.
I will update this patch to fix it.

>
>> +                       compatible = "renesas,thermal-r8a77995",
>> +                                    "renesas,rcar-thermal";
>
> I would drop the fallback property, cfr. my comments on the DT binding
> patch.

Yes. I will do it.

>
>> +                       reg = <0 0xe61f0000 0 0x10>, <0 0xe61f0100 0 0x38>;
>
> 0xe619... (twice)

I will fix it.


Thanks,
Kaneko

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
