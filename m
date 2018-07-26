From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v1] arm64: dts: sdm845: enable tsens thermal zones
Date: Thu, 26 Jul 2018 15:46:32 +0530
Message-ID: <CAHLCerNc1J_W6as4AZsRvwdvgf-ovc17qPWNhj9J6CK8xJtkLg@mail.gmail.com>
References: <cover.1531899325.git.amit.kucheria@linaro.org>
 <b3c25cedfa3a9b8a4b481e714992afe62b84ca3b.1531899325.git.amit.kucheria@linaro.org>
 <20180726004738.GU129942@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726004738.GU129942@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Douglas Anderson <dianders@chromium.org>, Eduardo Valentin <edubezval@gmail.com>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lakml <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 6:17 AM, Matthias Kaehlcke <mka@chromium.org> wrote:
> Hi Amit,
>
> On Wed, Jul 18, 2018 at 01:19:17PM +0530, Amit Kucheria wrote:
>> One thermal zone per cpu is defined
>>
>> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 170 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 170 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 01ff146..a75be7c 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -340,4 +340,174 @@
>>                       };
>>               };
>>       };
>> +
>> +     thermal-zones {
>> +             cpu0-thermal {
>> +                     polling-delay-passive = <250>;
>> +                     polling-delay = <1000>;
>
> In the context of the TSENS patches you mentioned that you are working
> on interrupt support. Can the polling delays be removed once that is merged?

Yes, that'd be the idea.

>
>> +                     thermal-sensors = <&tsens0 1>;
>> +
>> +                     trips {
>> +                             cpu_alert0: trip0 {
>> +                                     temperature = <75000>;
>> +                                     hysteresis = <2000>;
>> +                                     type = "passive";
>> +                             };
>> +
>> +                             cpu_crit0: trip1 {
>> +                                     temperature = <110000>;
>> +                                     hysteresis = <1000>;
>> +                                     type = "critical";
>> +                             };
>> +                     };
>> +             };
>> +
>> +             cpu1-thermal {
>> +                     polling-delay-passive = <250>;
>> +                     polling-delay = <1000>;
>> +
>> +                     thermal-sensors = <&tsens0 2>;
>> +
>> +                     trips {
>> +                             cpu_alert1: trip0 {
>> +                                     temperature = <75000>;
>> +                                     hysteresis = <2000>;
>> +                                     type = "passive";
>> +                             };
>> +
>> +                             cpu_crit1: trip1 {
>> +                                     temperature = <110000>;
>> +                                     hysteresis = <1000>;
>> +                                     type = "critical";
>> +                             };
>> +                     };
>> +             };
>> +
>> +             cpu2-thermal {
>> +                     polling-delay-passive = <250>;
>> +                     polling-delay = <1000>;
>> +
>> +                     thermal-sensors = <&tsens0 3>;
>> +
>> +                     trips {
>> +                             cpu_alert2: trip0 {
>> +                                     temperature = <75000>;
>> +                                     hysteresis = <2000>;
>> +                                     type = "passive";
>> +                             };
>> +
>> +                             cpu_crit2: trip1 {
>> +                                     temperature = <110000>;
>> +                                     hysteresis = <1000>;
>> +                                     type = "critical";
>> +                             };
>> +                     };
>> +             };
>> +
>> +             cpu3-thermal {
>> +                     polling-delay-passive = <250>;
>> +                     polling-delay = <1000>;
>> +
>> +                     thermal-sensors = <&tsens0 4>;
>> +
>> +                     trips {
>> +                             cpu_alert3: trip0 {
>> +                                     temperature = <75000>;
>> +                                     hysteresis = <2000>;
>> +                                     type = "passive";
>> +                             };
>> +
>> +                             cpu_crit3: trip1 {
>> +                                     temperature = <110000>;
>> +                                     hysteresis = <1000>;
>> +                                     type = "critical";
>> +                             };
>> +                     };
>> +             };
>> +
>> +             cpu4-thermal {
>> +                     polling-delay-passive = <250>;
>> +                     polling-delay = <1000>;
>> +
>> +                     thermal-sensors = <&tsens0 7>;
>> +
>> +                     trips {
>> +                             cpu_alert4: trip0 {
>> +                                     temperature = <75000>;
>> +                                     hysteresis = <2000>;
>> +                                     type = "passive";
>> +                             };
>> +
>> +                             cpu_crit4: trip1 {
>> +                                     temperature = <110000>;
>> +                                     hysteresis = <1000>;
>> +                                     type = "critical";
>> +                             };
>> +                     };
>> +             };
>> +
>> +             cpu5-thermal {
>> +                     polling-delay-passive = <250>;
>> +                     polling-delay = <1000>;
>> +
>> +                     thermal-sensors = <&tsens0 8>;
>> +
>> +                     trips {
>> +                             cpu_alert5: trip0 {
>> +                                     temperature = <75000>;
>> +                                     hysteresis = <2000>;
>> +                                     type = "passive";
>> +                             };
>> +
>> +                             cpu_crit5: trip1 {
>> +                                     temperature = <110000>;
>> +                                     hysteresis = <1000>;
>> +                                     type = "critical";
>> +                             };
>> +                     };
>> +             };
>> +
>> +             cpu6-thermal {
>> +                     polling-delay-passive = <250>;
>> +                     polling-delay = <1000>;
>> +
>> +                     thermal-sensors = <&tsens0 9>;
>> +
>> +                     trips {
>> +                             cpu_alert6: trip0 {
>> +                                     temperature = <75000>;
>> +                                     hysteresis = <2000>;
>> +                                     type = "passive";
>> +                             };
>> +
>> +                             cpu_crit6: trip1 {
>> +                                     temperature = <110000>;
>> +                                     hysteresis = <1000>;
>> +                                     type = "critical";
>> +                             };
>> +                     };
>> +             };
>> +
>> +             cpu7-thermal {
>> +                     polling-delay-passive = <250>;
>> +                     polling-delay = <1000>;
>> +
>> +                     thermal-sensors = <&tsens0 10>;
>> +
>> +                     trips {
>> +                             cpu_alert7: trip0 {
>> +                                     temperature = <75000>;
>> +                                     hysteresis = <2000>;
>> +                                     type = "passive";
>> +                             };
>> +
>> +                             cpu_crit7: trip1 {
>> +                                     temperature = <110000>;
>> +                                     hysteresis = <1000>;
>> +                                     type = "critical";
>> +                             };
>> +                     };
>
> Dumb DT question: the trip information is the same for all CPUs. Would
> it be possible to have a single node and refer to it with a phandle?

There is some work to do that for cooling maps, not for the actual
trip points though:
https://lore.kernel.org/lkml/cover.1530766981.git.viresh.kumar@linaro.org/T/#u

> I suppose the anwer is no and even if it was possible we probably
> wouldn't want it, since it would complicate overriding settings for a
> specific CPU (should that ever be needed ...) or cluster. Just wondering.
>
>> +             };
>> +     };
>>  };
>
> I don't have documentation to verify that the sensors and CPUs match,
> but it is in line with what I've seen in some Android tree, so it
> seems alright ;-)
>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Tested-by: Matthias Kaehlcke <mka@chromium.org>

Thanks Matthias.

Regards,
Amit
