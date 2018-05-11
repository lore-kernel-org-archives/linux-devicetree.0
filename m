From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v1 3/5] arm64: dts: rockchip: Add gpio-syscon10 to rk3328
Date: Fri, 11 May 2018 07:24:43 -0500
Message-ID: <CAL_JsqLujC0nx9LpkWuSR0+fsZn4UJL9Ln6SHWyBmZ-7ErMzfw@mail.gmail.com>
References: <1525943800-14095-1-git-send-email-djw@t-chip.com.cn>
 <1525943800-14095-4-git-send-email-djw@t-chip.com.cn> <76f2bbde-e158-a186-f136-9fb610a810c5@arm.com>
 <3fdfcc9b-90b5-191c-37e0-c99389a4e872@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3fdfcc9b-90b5-191c-37e0-c99389a4e872@t-chip.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Levin Du <djw@t-chip.com.cn>
Cc: Robin Murphy <robin.murphy@arm.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Wayne Chou <zxf@t-chip.com.cn>, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sugar Zhang <sugar.zhang@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, David Wu <david.wu@rock-chips.com>, William Wu <william.wu@rock-chips.com>, Rocky Hao <rocky.hao@rock-chips.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 10, 2018 at 10:45 PM, Levin Du <djw@t-chip.com.cn> wrote:
> On 2018-05-10 8:50 PM, Robin Murphy wrote:
>>
>> On 10/05/18 10:16, djw@t-chip.com.cn wrote:
>>>
>>> From: Levin Du <djw@t-chip.com.cn>
>>>
>>> Adding a new gpio controller named "gpio-syscon10" to rk3328, providing
>>> access to the pins defined in the syscon GRF_SOC_CON10.
>>
>>
>> This is the GPIO_MUTE pin, right? The public TRM is rather vague, but
>> cross-referencing against the datasheet and schematics implies that it's the
>> "gpiomut_*" part of the GRF bit names which is most significant.
>>
>> It might be worth using a more descriptive name here, since "syscon10" is
>> pretty much meaningless at the board level.
>>
>> Robin.
>>
> Previously I though other bits might be able to reference from syscon10,
> other than GPIO_MUTE alone.
> If it is renamed to gpio-mute, then the GPIO_MUTE pin is accessed as
> `<&gpio-mute 1>`. Yet other
> bits in syscon10 can also be referenced, say, `<&gpio-mute 10>`, which is
> not good.
>
> I'd like to add a `gpio,syscon-bit` property to gpio-syscon, which overrides
> the properties
> of bit_count,  data_bit_offset and dir_bit_offset in the driver. For

No. Once you are describing individual register bits, it is too low
level for DT.

> example:
>
>                 gpio_mute: gpio-mute {
>                         compatible = "rockchip,gpio-syscon";
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         gpio,syscon-dev = <0 0x0428 0>;
>                         gpio,syscon-bit = <1 1 0>;
>                 };
>
> That way, the mute pin is strictly specified as <&gpio_mute 0>, and
> <&gpio_mute 1> will be invalid.
> I think that is neat, and consistent with the gpio_mute name.
>
> Thanks
> Levin
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
