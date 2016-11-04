From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: stm32f429: add LSI and LSE clocks
Date: Fri, 4 Nov 2016 11:16:52 +0100
Message-ID: <57d580c4-5a3c-4ba3-54f1-a26297796394@st.com>
References: <1478249577-25999-1-git-send-email-gabriel.fernandez@st.com>
 <1478249577-25999-2-git-send-email-gabriel.fernandez@st.com>
 <3974b516-d698-ab7f-efba-d768eccbd56f@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3974b516-d698-ab7f-efba-d768eccbd56f-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Alexandre,


On 11/04/2016 11:15 AM, Alexandre Torgue wrote:
> Gabriel,
>
> On 11/04/2016 09:52 AM, gabriel.fernandez-qxv4g6HH51o@public.gmane.org wrote:
>> From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
>>
>> This patch adds lsi / lse oscillators. These clocks can be use by
>> RTC clocks.
>> The clock drivers needs to disable the power domain write protection 
>> using
>> syscon / regmap to enable these clocks.
>>
>
> Is it the same than you sent in last series ? If yes I will take it 
> directly as review has already been done.
>
Yes

BR

Gabriel.

> regards
> Alex
>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/stm32f429.dtsi | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32f429.dtsi 
>> b/arch/arm/boot/dts/stm32f429.dtsi
>> index 336ee4f..2700449 100644
>> --- a/arch/arm/boot/dts/stm32f429.dtsi
>> +++ b/arch/arm/boot/dts/stm32f429.dtsi
>> @@ -56,6 +56,18 @@
>>              compatible = "fixed-clock";
>>              clock-frequency = <0>;
>>          };
>> +
>> +        clk-lse {
>> +            #clock-cells = <0>;
>> +            compatible = "fixed-clock";
>> +            clock-frequency = <32768>;
>> +        };
>> +
>> +        clk-lsi {
>> +            #clock-cells = <0>;
>> +            compatible = "fixed-clock";
>> +            clock-frequency = <32000>;
>> +        };
>>      };
>>
>>      soc {
>> @@ -185,6 +197,11 @@
>>              interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, 
>> <23>, <40>, <41>, <42>, <62>, <76>;
>>          };
>>
>> +        pwrcfg: power-config@40007000 {
>> +            compatible = "syscon";
>> +            reg = <0x40007000 0x400>;
>> +        };
>> +
>>          pin-controller {
>>              #address-cells = <1>;
>>              #size-cells = <1>;
>> @@ -340,6 +357,7 @@
>>              compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
>>              reg = <0x40023800 0x400>;
>>              clocks = <&clk_hse>;
>> +            st,syscfg = <&pwrcfg>;
>>          };
>>
>>          dma1: dma-controller@40026000 {
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
