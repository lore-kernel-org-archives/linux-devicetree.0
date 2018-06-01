From: Levin <djw@t-chip.com.cn>
Subject: Re: [PATCH v3 2/5] gpio: syscon: rockchip: add GPIO_MUTE support for
 rk3328
Date: Fri, 1 Jun 2018 10:05:24 +0800
Message-ID: <0d08ba26-77f2-6c42-8fb1-214aaf6085e9@t-chip.com.cn>
References: <1527737273-8387-1-git-send-email-djw@t-chip.com.cn>
 <1527737273-8387-3-git-send-email-djw@t-chip.com.cn>
 <CAL_JsqJK4vrmLBeN_ZeGCXAyqshshL16B0KN_+8uvt+=-O9TEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJK4vrmLBeN_ZeGCXAyqshshL16B0KN_+8uvt+=-O9TEw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Wayne Chou <zxf@t-chip.com.cn>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Levin <djw@t-chip.com.cn>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 2018-05-31 10:45 PM, Rob Herring wrote:
> On Wed, May 30, 2018 at 10:27 PM,  <djw@t-chip.com.cn> wrote:
>> From: Levin Du <djw@t-chip.com.cn>
>>
>> In Rockchip RK3328, the output only GPIO_MUTE pin, originally for codec
>> mute control, can also be used for general purpose. It is manipulated by
>> the GRF_SOC_CON10 register.
>>
>> Signed-off-by: Levin Du <djw@t-chip.com.cn>
>>
>> ---
>>
>> Changes in v3:
>> - Change from general gpio-syscon to specific rk3328-gpio-mute
>>
>> Changes in v2:
>> - Rename gpio_syscon10 to gpio_mute in doc
>>
>> Changes in v1:
>> - Refactured for general gpio-syscon usage for Rockchip SoCs.
>> - Add doc rockchip,gpio-syscon.txt
>>
>>   .../bindings/gpio/rockchip,rk3328-gpio-mute.txt    | 28 +++++++++++++++++++
>>   drivers/gpio/gpio-syscon.c                         | 31 ++++++++++++++++++++++
>>   2 files changed, 59 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-gpio-mute.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,rk3328-gpio-mute.txt b/Documentation/devicetree/bindings/gpio/rockchip,rk3328-gpio-mute.txt
>> new file mode 100644
>> index 0000000..10bc632
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/rockchip,rk3328-gpio-mute.txt
>> @@ -0,0 +1,28 @@
>> +Rockchip RK3328 GPIO controller dedicated for the GPIO_MUTE pin.
>> +
>> +In Rockchip RK3328, the output only GPIO_MUTE pin, originally for codec mute
>> +control, can also be used for general purpose. It is manipulated by the
>> +GRF_SOC_CON10 register.
>> +
>> +Required properties:
>> +- compatible: Should contain "rockchip,rk3328-gpio-mute".
>> +- gpio-controller: Marks the device node as a gpio controller.
>> +- #gpio-cells: Should be 2. The first cell is the pin number and
>> +  the second cell is used to specify the gpio polarity:
>> +    0 = Active high,
>> +    1 = Active low.
>> +
>> +Example:
>> +
>> +       grf: syscon@ff100000 {
>> +               compatible = "rockchip,rk3328-grf", "syscon", "simple-mfd";
>> +
>> +               gpio_mute: gpio-mute {
> Node names should be generic:
>
> gpio {
>
> This also means you can't add another GPIO node in the future and
> you'll have to live with "rockchip,rk3328-gpio-mute" covering more
> than 1 GPIO if you do need to add more GPIOs.

As the first line describes, this GPIO controller is dedicated for the 
GPIO_MUTE pin.
There's only one GPIO pin in the GRF_SOC_CON10 register. Therefore the 
gpio_mute
name is proper IMHO.

>> +                       compatible = "rockchip,rk3328-gpio-mute";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +               };
>> +       };
>> +
>> +Note: The gpio_mute node should be declared as the child of the GRF (General
>> +Register File) node. The GPIO_MUTE pin is referred to as <&gpio_mute 0>.
> This is wrong because you should have 2 cells. The phandle doesn't
> count as a cell.
>
> Rob
>
Thanks for pointing that out. So it should be:

    The GPIO_MUTE pin is referred to as <&gpio_mute 0 POLARITY>.


Thanks,
Levin
