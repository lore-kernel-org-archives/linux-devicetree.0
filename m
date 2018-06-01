From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 1/3] arm64: allwinner: a64: add R_I2C controller
Date: Fri, 1 Jun 2018 10:30:00 -0700
Message-ID: <CA+E=qVfH3wWsSdzGn353q0Jf-PQ8cjU-i5osLOV1c4qWVGrR5A@mail.gmail.com>
References: <20180601062901.8052-1-anarsoul@gmail.com>
 <20180601062901.8052-2-anarsoul@gmail.com>
 <20180601091631.wqctilk55fcmggwv@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180601091631.wqctilk55fcmggwv@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 1, 2018 at 2:16 AM, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> Hi,
>
> On Thu, May 31, 2018 at 11:28:59PM -0700, Vasily Khoruzhick wrote:
>> From: Icenowy Zheng <icenowy@aosc.io>
>>
>> Allwinner A64 has a I2C controller, which is in the R_ MMIO zone and has
>> two groups of pinmuxes on PL bank, so it's called R_I2C.
>>
>> Add support for this I2C controller and the pinmux which doesn't conflict
>> with RSB.
>>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>
> You should have your SoB there.

OK, will do.

>> ---
>>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> index 1b2ef28c42bd..b5e903ccf0ec 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> @@ -46,6 +46,7 @@
>>  #include <dt-bindings/clock/sun8i-r-ccu.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/reset/sun50i-a64-ccu.h>
>> +#include <dt-bindings/reset/sun8i-r-ccu.h>
>>
>>  / {
>>       interrupt-parent = <&gic>;
>> @@ -655,6 +656,17 @@
>>                       #reset-cells = <1>;
>>               };
>>
>> +             r_i2c: i2c@1f02400 {
>> +                     compatible = "allwinner,sun6i-a31-i2c";
>
> You should add an a64 compatible here

We don't have it for regular i2c, why should I add it here?

>> +                     reg = <0x01f02400 0x400>;
>> +                     interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&r_ccu CLK_APB0_I2C>;
>> +                     resets = <&r_ccu RST_APB0_I2C>;
>> +                     status = "disabled";
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +             };
>> +
>>               r_pio: pinctrl@1f02c00 {
>>                       compatible = "allwinner,sun50i-a64-r-pinctrl";
>>                       reg = <0x01f02c00 0x400>;
>> @@ -670,6 +682,11 @@
>>                               pins = "PL0", "PL1";
>>                               function = "s_rsb";
>>                       };
>> +
>> +                     r_i2c_pins_a: i2c-a {
>> +                             pins = "PL8", "PL9";
>> +                             function = "s_i2c";
>> +                     };
>
> This should be ordered by alphabetical order

OK

> If this is the only muxing option, you can also add it to the i2c DT
> node.

It's not the only option, but other option conflicts with rsb. Should
I still add it to i2c DT node?

>
> Thanks!
> Maxime
>
> --
> Maxime Ripard, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
