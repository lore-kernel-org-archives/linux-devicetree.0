From: Milo Kim <woogyom.kim@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i-h3: Add UART1 pinctrl
Date: Wed, 31 Aug 2016 17:36:18 +0900
Message-ID: <e67142ab-02fe-4a46-8a50-1520746bab0f@gmail.com>
References: <1472107494-20740-1-git-send-email-woogyom.kim@gmail.com>
 <1472107494-20740-2-git-send-email-woogyom.kim@gmail.com>
 <20160826071056.GA10545@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160826071056.GA10545@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On 08/26/2016 04:10 PM, Maxime Ripard wrote:
> Hi Milo,
>
> On Thu, Aug 25, 2016 at 03:44:54PM +0900, Milo Kim wrote:
>> In H3, PA5 can be used as PWM and UART0. If the PWM is used, the console
>> UART should be moved to other port.
>> This patch enables UART1 pinctrl to support this case.
>>
>> 	PA5: PWM
>> 	PG6, PG7: debug console
>>
>> Cc: Chen-Yu Tsai <wens@csie.org>
>> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Signed-off-by: Milo Kim <woogyom.kim@gmail.com>
>> ---
>>  arch/arm/boot/dts/sun8i-h3.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
>> index 3a965fb..fdb6801 100644
>> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
>> @@ -526,6 +526,13 @@
>>  				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>>  			};
>>
>> +			uart1_pins_a: uart1@0 {
>> +				allwinner,pins = "PG6", "PG7";
>> +				allwinner,function = "uart1";
>> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>> +			};
>> +
>
> Our policy is that we don't introduce new pinctrl nodes that are not
> used by any board to avoid bloating the DT too much with unused nodes.
>
> If you have a board using it, please submit that change as well.

UART1 was already added in sun8i-h3.dtsi, so I drop this change in v2.

Commit-ID: 966c11a3b5e4

Best regards,
Milo
