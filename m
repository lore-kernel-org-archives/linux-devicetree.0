From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH 2/4] ARM: sunxi: Drop
 mmc0_cd_pin_reference_design pinmux setting
Date: Wed, 19 Apr 2017 23:49:30 +0800
Message-ID: <CAGb2v66jgUYHWzdhysznst6jPF=jtTVw3jZ7x3qh1X36FPPp1A@mail.gmail.com>
References: <20170419050919.6762-1-wens@csie.org> <20170419050919.6762-3-wens@csie.org>
 <442479d213a83c73cd7ff44538d234ea@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <442479d213a83c73cd7ff44538d234ea-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 19, 2017 at 11:36 PM,  <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> 在 2017-04-19 13:09，Chen-Yu Tsai 写道：
>>
>> As part of our effort to move pinctrl/GPIO interlocking into the
>> driver where it belongs, this patch drops the definition and usage
>> of the mmc0_cd_pin_reference_design pinmux setting for the default
>> mmc0 card detect GPIO pin.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

[...]

>> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi
>> b/arch/arm/boot/dts/sun7i-a20.dtsi
>> index 93aa55970bd7..c03b59aaec82 100644
>> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
>> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
>> @@ -1190,12 +1190,6 @@
>>                                 bias-pull-up;
>>                         };
>>
>> -                       mmc0_cd_pin_reference_design: mmc0_cd_pin@0 {
>> -                               pins = "PH1";
>> -                               function = "gpio_in";
>> -                               bias-pull-up;
>
>
> It needs pull up, so shouldn't be dropped.
>
> (Although there may be external pull-up resistors on the board;
> however last time we removed the pull-up on MMC node many boards
> failed, so we cannot rely on external pull-up resistors)

I checked the boards that I have schematics, and the reference design.
All have proper external pull-up resistors for this pin, unlike the
other mmc pins.

If some board doesn't, it really needs to be singled out and handled
separately. Have you encountered any issues?

Regards
ChenYu

>
>> -                       };
>> -
>>                         mmc2_pins_a: mmc2@0 {
>>                                 pins = "PC6", "PC7", "PC8",
>>                                        "PC9", "PC10", "PC11";
>
>
> --
> You received this message because you are subscribed to the Google Groups
> "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
