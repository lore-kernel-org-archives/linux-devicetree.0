From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 06/12] arm64: dts: h3ulcb: enable SDHI0
Date: Thu, 1 Sep 2016 13:15:03 +0200
Message-ID: <CAMuHMdXkm1t4Hdc8oG59_8MA+jftNu0ypnBN395ff9JjJC7Qig@mail.gmail.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472637799-14819-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdWakZuEu-gTo5=3VWxRdSc8V9gpL28yhjrVhHh1oZVu+Q@mail.gmail.com> <00baa7ae-3e8b-46c4-515f-81d7f12e2d77@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <00baa7ae-3e8b-46c4-515f-81d7f12e2d77@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Thu, Sep 1, 2016 at 12:41 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> On 01.09.2016 11:11, Geert Uytterhoeven wrote:
>>> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
>>> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
>>> @@ -82,6 +118,18 @@
>>>          status = "okay";
>>>   };
>>>
>>> +&sdhi0 {
>>> +       pinctrl-0 = <&sdhi0_pins_3v3>;
>>> +       pinctrl-1 = <&sdhi0_pins_1v8>;
>>> +       pinctrl-names = "default", "state_uhs";
>>> +
>>> +       vmmc-supply = <&vcc_sdhi0>;
>>> +       vqmmc-supply = <&vccq_sdhi0>;
>>> +       cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
>>> +       bus-width = <4>;
>>> +       status = "okay";
>>> +};
>>
>> According to the schematics, SD0_WP is wired, so I think you want to add
>
> No, it is not wired (I look on rev0.40 and rev0.46).
> The microSD card connector CN6 does not have WP on H3ULCB board.
>>
>>      wp-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
>
> The GPIO GP_3_13 just pulled up to 3.3V power rail.

You're right, I missed that the signal goes to D3.3V instead of to the
connector.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
