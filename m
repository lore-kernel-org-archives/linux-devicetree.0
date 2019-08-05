From: guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: meson: sei510: Add minimal thermal
 zone
Date: Mon, 5 Aug 2019 14:48:42 +0200
Message-ID: <805dc9fd-1c1f-a23a-27a7-d91908a95a13@baylibre.com>
References: <20190731153529.30159-1-glaroque@baylibre.com>
 <20190731153529.30159-5-glaroque@baylibre.com>
 <CAFBinCD-DUEjPgfUEJmHpPjw1ShZy7nemaFBKANmM5M42XBG4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCD-DUEjPgfUEJmHpPjw1ShZy7nemaFBKANmM5M42XBG4Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: daniel.lezcano@linaro.org, khilman@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Martin,


On 8/3/19 8:29 PM, Martin Blumenstingl wrote:
> Hi Guillaume,
>
> On Wed, Jul 31, 2019 at 5:36 PM Guillaume La Roque
> <glaroque@baylibre.com> wrote:
>> Add minimal thermal zone for DDR and CPU sensor
> so high DDR (controller?) temperatures will throttle Mali and high PLL
> temperatures will throttle the CPU?
> to get things started I'm fine with this, but I think it should be
> mentioned here

i will add in commit description

>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>  .../boot/dts/amlogic/meson-g12a-sei510.dts    | 56 +++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
>> index 979449968a5f..2c16a2cba0a3 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
>> @@ -10,6 +10,7 @@
>>  #include <dt-bindings/input/input.h>
>>  #include <dt-bindings/gpio/meson-g12a-gpio.h>
>>  #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>> +#include <dt-bindings/thermal/thermal.h>
>>
>>  / {
>>         compatible = "seirobotics,sei510", "amlogic,g12a";
>> @@ -33,6 +34,53 @@
>>                 ethernet0 = &ethmac;
>>         };
>>
>> +       thermal-zones {
>> +               cpu-thermal {
>> +                       polling-delay = <1000>;
>> +                       polling-delay-passive = <100>;
>> +                       thermal-sensors = <&cpu_temp>;
>> +
>> +                       trips {
>> +                               cpu_critical: cpu-critical {
>> +                                       temperature = <110000>; /* millicelsius */
>> +                                       hysteresis = <2000>; /* millicelsius */
>> +                                       type = "critical";
>> +                               };
>> +                       };
>> +
>> +                       cooling-maps {
>> +                               map {
>> +                                       trip = <&cpu_critical>;
>> +                                       cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +                                                        <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +                                                        <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +                                                        <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +                               };
>> +                       };
>> +               };
>> +
>> +               ddr-thermal {
>> +                       polling-delay = <1000>;
>> +                       polling-delay-passive = <100>;
>> +                       thermal-sensors = <&ddr_temp>;
>> +
>> +                       trips {
>> +                               ddr_critical: ddr-critical {
>> +                                       temperature = <110000>; /* millicelsius */
>> +                                       hysteresis = <2000>; /* millicelsius */
>> +                                       type = "critical";
>> +                               };
>> +                       };
>> +
>> +                       cooling-maps {
>> +                               map {
>> +                                       trip = <&ddr_critical>;
>> +                                       cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +
>>         mono_dac: audio-codec-0 {
>>                 compatible = "maxim,max98357a";
>>                 #sound-dai-cells = <0>;
>> @@ -321,6 +369,7 @@
>>         operating-points-v2 = <&cpu_opp_table>;
>>         clocks = <&clkc CLKID_CPU_CLK>;
>>         clock-latency = <50000>;
>> +       #cooling-cells = <2>;
>>  };
>>
>>  &cpu1 {
>> @@ -328,6 +377,7 @@
>>         operating-points-v2 = <&cpu_opp_table>;
>>         clocks = <&clkc CLKID_CPU_CLK>;
>>         clock-latency = <50000>;
>> +       #cooling-cells = <2>;
>>  };
>>
>>  &cpu2 {
>> @@ -335,6 +385,7 @@
>>         operating-points-v2 = <&cpu_opp_table>;
>>         clocks = <&clkc CLKID_CPU_CLK>;
>>         clock-latency = <50000>;
>> +       #cooling-cells = <2>;
>>  };
>>
>>  &cpu3 {
>> @@ -342,6 +393,7 @@
>>         operating-points-v2 = <&cpu_opp_table>;
>>         clocks = <&clkc CLKID_CPU_CLK>;
>>         clock-latency = <50000>;
>> +       #cooling-cells = <2>;
>>  };
>>
>>  &cvbs_vdac_port {
>> @@ -368,6 +420,10 @@
>>         status = "okay";
>>  };
>>
>> +&mali {
>> +       #cooling-cells = <2>;
>> +};
> is there something device-specific in this patch? I'm wondering
> whether we can move all of this go g12a.dtsi to simplify maintenance
> in the future

this is depending of each board. actually it's same on all

but if a new one have a fan this value should be different or not.


>
>
> Martin


thanks,

Guillaume
