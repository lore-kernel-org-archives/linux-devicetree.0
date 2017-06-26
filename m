From: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add A20 LCD0 RGB888 pins
Date: Mon, 26 Jun 2017 22:47:57 +1000
Message-ID: <CANwerB33m7JnmE6Ex5rPjXf=TPCp0qV1mvxEeQFpQ8wq2vJQQA@mail.gmail.com>
References: <20170626124249.9475-1-net147@gmail.com> <20170626144540.9af644d8ab6140f7f4718d06@bidouilliste.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170626144540.9af644d8ab6140f7f4718d06-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Emmanuel,

On 26 June 2017 at 22:45, Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org> wrote:
> On Mon, 26 Jun 2017 22:42:49 +1000
> Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> The LCD0 controller on the A20 can do RGB output up to 8 bits per
>> channel. Add the pins for RGB888 output.
>>
>> Signed-off-by: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun7i-a20.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
>> index 96bee776e145..09a0e89bed11 100644
>> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
>> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
>> @@ -1183,6 +1183,17 @@
>>                               function = "ir1";
>>                       };
>>
>> +                     lcd0_rgb888_pins: lcd0_rgb888@0 {
>> +                             allwinner,pins = "PD0", "PD1", "PD2", "PD3",
>> +                                              "PD4", "PD5", "PD6", "PD7",
>> +                                              "PD8", "PD9", "PD10", "PD11",
>> +                                              "PD12", "PD13", "PD14", "PD15",
>> +                                              "PD16", "PD17", "PD18", "PD19",
>> +                                              "PD20", "PD21", "PD22", "PD23",
>> +                                              "PD24", "PD25", "PD26", "PD27";
>> +                             allwinner,function = "lcd0";
>> +                     };
>> +
>
>  We switch to standard pinctrl bindings so you need to use 'pins' and
> 'function' (i.e. without the 'allwinner,' prefix).
>

Thanks, I will change it for V2.

>>                       mmc0_pins_a: mmc0@0 {
>>                               pins = "PF0", "PF1", "PF2",
>>                                      "PF3", "PF4", "PF5";
>> --
>> 2.13.1
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
> --
> Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org> <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>

Regards,
Jonathan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
