From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH v3 06/12] arm64: dts: h3ulcb: enable SDHI0
Date: Thu, 1 Sep 2016 13:41:27 +0300
Message-ID: <00baa7ae-3e8b-46c4-515f-81d7f12e2d77@cogentembedded.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472637799-14819-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdWakZuEu-gTo5=3VWxRdSc8V9gpL28yhjrVhHh1oZVu+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWakZuEu-gTo5=3VWxRdSc8V9gpL28yhjrVhHh1oZVu+Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 01.09.2016 11:11, Geert Uytterhoeven wrote:
> Hi Vladimir,
>
> On Wed, Aug 31, 2016 at 12:03 PM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
>> This supports SDHI0 on H3ULCB board SD card slot
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Thanks for your patch!
>
>> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
>> @@ -82,6 +118,18 @@
>>          status = "okay";
>>   };
>>
>> +&sdhi0 {
>> +       pinctrl-0 = <&sdhi0_pins_3v3>;
>> +       pinctrl-1 = <&sdhi0_pins_1v8>;
>> +       pinctrl-names = "default", "state_uhs";
>> +
>> +       vmmc-supply = <&vcc_sdhi0>;
>> +       vqmmc-supply = <&vccq_sdhi0>;
>> +       cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
>> +       bus-width = <4>;
>> +       status = "okay";
>> +};
> According to the schematics, SD0_WP is wired, so I think you want to add
No, it is not wired (I look on rev0.40 and rev0.46).
The microSD card connector CN6 does not have WP on H3ULCB board.
>
>      wp-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
The GPIO GP_3_13 just pulled up to 3.3V power rail.
>
> As you add UHS pins, I think you want to add
>
>      sd-uhs-sdr50
>
> too.
Thank you for pointing to this.
Yes.
I will respin this patch with this added.

Regards,
Vladimir
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
