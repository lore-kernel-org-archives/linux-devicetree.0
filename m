From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: sm1: set gpio interrupt controller compatible
Date: Fri, 06 Sep 2019 10:47:30 +0200
Message-ID: <1jmufh3j6l.fsf@starbuckisacylon.baylibre.com>
References: <20190902160334.14321-1-jbrunet@baylibre.com> <7hpnkeqxxy.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7hpnkeqxxy.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 05 Sep 2019 at 13:40, Kevin Hilman <khilman@baylibre.com> wrote:

> Jerome Brunet <jbrunet@baylibre.com> writes:
>
>> Set the appropriate gpio interrupt controller compatible for the
>> sm1 SoC family. This newer version of the controller can now
>> trig irq on both edge of the input signal
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Queued.
>
> I may do a late round for the dev cycle of v5.4, otherwise this will go
> for v5.5.

No problem

> If it goes for v5.5, it should probably have a Fixes tag, no?

Maybe, but then every change to meson-sm1.dtsi would be some kind of fix
on what is provided by meson-g12-common.dtsi.

Not sure this really qualify as a fix but I'll do as you prefer, just
let me know


>
> Kevin
>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> index 521573f3a5ba..6152e928aef2 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> @@ -134,6 +134,11 @@
>>  	power-domains = <&pwrc PWRC_SM1_ETH_ID>;
>>  };
>>  
>> +&gpio_intc {
>> +	compatible = "amlogic,meson-sm1-gpio-intc",
>> +		     "amlogic,meson-gpio-intc";
>> +};
>> +
>>  &pwrc {
>>  	compatible = "amlogic,meson-sm1-pwrc";
>>  };
>> -- 
>> 2.21.0
