From: Levin Du <djw@t-chip.com.cn>
Subject: Re: [PATCH v1 3/5] arm64: dts: rockchip: Add gpio-syscon10 to rk3328
Date: Mon, 14 May 2018 09:22:35 +0800
Message-ID: <5218da3c-40d3-a44f-2b82-13cd4c522a1f@t-chip.com.cn>
References: <1525943800-14095-1-git-send-email-djw@t-chip.com.cn>
 <1525943800-14095-4-git-send-email-djw@t-chip.com.cn>
 <CAL_JsqLK6S0iA=K1o=gpuJAxD6HxCSzHaJ6ZchuCz=GZ-Zb=Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLK6S0iA=K1o=gpuJAxD6HxCSzHaJ6ZchuCz=GZ-Zb=Dg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Wayne Chou <zxf@t-chip.com.cn>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, David Wu <david.wu@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>, Finley Xiao <finley.xiao@rock-chips.com>, William Wu <william.wu@rock-chips.com>, Sugar Zhang <sugar.zhang@rock-chips.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rocky Hao <rocky.hao@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 2018-05-11 8:22 PM, Rob Herring wrote:
> On Thu, May 10, 2018 at 4:16 AM,  <djw@t-chip.com.cn> wrote:
>> From: Levin Du <djw@t-chip.com.cn>
>>
>> Adding a new gpio controller named "gpio-syscon10" to rk3328, providing
>> access to the pins defined in the syscon GRF_SOC_CON10.
>>
>> Boards using these special pins to control regulators or LEDs, can now
>> utilize existing drivers like gpio-regulator and leds-gpio.
>>
>> Signed-off-by: Levin Du <djw@t-chip.com.cn>
>>
>> ---
>>
>> Changes in v1:
>> - Split from V0 and add to rk3328.dtsi for general use.
>>
>>   arch/arm64/boot/dts/rockchip/rk3328.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>> index b8e9da1..73a822d 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>> @@ -309,6 +309,12 @@
>>                          mode-loader = <BOOT_BL_DOWNLOAD>;
>>                  };
>>
>> +               gpio_syscon10: gpio-syscon10 {
> GPIO controller nodes should be named just 'gpio'.

'gpio' is a general name, and there're already gpio0~gpio3 for pinctrl 
GPIOs.

>> +                       compatible = "rockchip,gpio-syscon";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio,syscon-dev = <0 0x0428 0>;
> This property is not documented and takes a phandle.
See PATCH1 which allows fetching syscon from parent node .
This is also documented in 
Documentation/devicetree/bindings/gpio/rockchip,gpio-syscon.txt
in PATCH2.

Thanks
Levin
