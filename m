From: Yixun Lan <yixun.lan@amlogic.com>
Subject: Re: [PATCH 1/6] ARM64: dts: meson-axg: uart: drop legacy compatible
 name from EE UART
Date: Fri, 5 Jan 2018 21:11:12 +0800
Message-ID: <9463e936-922b-b9ed-69c2-06cee127b2c1@amlogic.com>
References: <20180105095621.196472-1-yixun.lan@amlogic.com>
 <20180105095621.196472-2-yixun.lan@amlogic.com>
 <1515148228.5048.25.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515148228.5048.25.camel@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org
Cc: yixun.lan@amlogic.com, Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/05/2018 06:30 PM, Jerome Brunet wrote:
> On Fri, 2018-01-05 at 17:56 +0800, Yixun Lan wrote:
>> For the UART controller in EE domain, they require 'pclk' to work.
> 
> they ? "the driver" maybe ?
> 
>> Current logic of the code will force to go for legacy clock probe
>> if it found current compatible string match to 'amlogic,meson-ao-uart'.
> 
> did you mean "amlogic,meson-uart" instead ?
> 
good catch! it's "amlogic,meson-uart"


> Apart from that
> 
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
> 
>>
>> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> index e2b8a9c8bf0b..1c6002b3fe34 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> @@ -142,14 +142,14 @@
>>  			};
>>  
>>  			uart_A: serial@24000 {
>> -				compatible = "amlogic,meson-gx-uart", "amlogic,meson-uart";
>> +				compatible = "amlogic,meson-gx-uart";
>>  				reg = <0x0 0x24000 0x0 0x14>;
>>  				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
>>  				status = "disabled";
>>  			};
>>  
>>  			uart_B: serial@23000 {
>> -				compatible = "amlogic,meson-gx-uart", "amlogic,meson-uart";
>> +				compatible = "amlogic,meson-gx-uart";
>>  				reg = <0x0 0x23000 0x0 0x14>;
>>  				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
>>  				status = "disabled";
> 
> .
> 
