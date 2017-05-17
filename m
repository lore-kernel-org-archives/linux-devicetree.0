From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 2/6] pintrl: meson: document GPIO IRQ DT binding
Date: Wed, 17 May 2017 23:02:07 +0200
Message-ID: <ec9310f1-10eb-789f-e6f7-67e0340f4c64@gmail.com>
References: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
 <c5ea65c5-f604-d890-4e73-f53bdd47bd31@gmail.com>
 <1494977339.2728.8.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1494977339.2728.8.camel@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

Am 17.05.2017 um 01:28 schrieb Jerome Brunet:
> On Fri, 2017-05-12 at 21:13 +0200, Heiner Kallweit wrote:
>> Document the DT binding for GPIO IRQ support on Amlogic Meson SoC's.
>>
>> This documentation is intentionally not placed under
>> interrupt-controllers as GPIO IRQ support on these SoC's acts more
>> like an interrupt multiplexer.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> v2:
>> - remove syscon
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> index 436b8750..44422b85 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> @@ -312,6 +312,19 @@
>>  				status = "disabled";
>>  			};
>>  
>> +			gpio_irq@9880 {
>> +				compatible = "amlogic,meson-gpio-interrupt";
>> +				reg = <0x0 0x09880 0x0 0x10>;
>> +				interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
>> +					     <GIC_SPI 65 IRQ_TYPE_NONE>,
>> +					     <GIC_SPI 66 IRQ_TYPE_NONE>,
>> +					     <GIC_SPI 67 IRQ_TYPE_NONE>,
>> +					     <GIC_SPI 68 IRQ_TYPE_NONE>,
>> +					     <GIC_SPI 69 IRQ_TYPE_NONE>,
>> +					     <GIC_SPI 70 IRQ_TYPE_NONE>,
>> +					     <GIC_SPI 71 IRQ_TYPE_NONE>;
>> +			};
>> +
> 
> Already tried the same thing:
> https://marc.info/?l=devicetree&m=147758174404359&w=2
> 
> Irq maintainers reminded me that this is not correct as the device is not able
> to generate these particular irqs (it is merely routing the signal) and the
> flags are meaning less here
> 
In one review comment to your patch series Rob mentioned to be fine with using
the standard interrupts property.
However other involved people might have had a different opinion, I didn't read
all review comments.

I think the standard interrupts property is the best way.
We need mapped virq's to be used with the irq chaining. And for mapping an
interrupt we need not only the hwirq but also the IRQ domain. The interrupts
property and the related OF IRQ API calls like irq_of_parse_and_map provide
exactly what we need.

If somebody has serious objections to using the interrupts property then we
basically had to duplicate it and just give it a different name.
And such code duplication to me seems to be worse than using the interrupts
property slightly different than in the theory.

> 
>>  			watchdog@98d0 {
>>  				compatible = "amlogic,meson-gx-wdt",
>> "amlogic,meson-gxbb-wdt";
>>  				reg = <0x0 0x098d0 0x0 0x10>;
> 

