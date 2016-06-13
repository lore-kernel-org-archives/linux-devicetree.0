From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: sd_600eval: Fix eMMC lockup issue
Date: Mon, 13 Jun 2016 17:21:16 +0100
Message-ID: <575EDD7C.8010504@linaro.org>
References: <1465582795-30266-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1465582795-30266-2-git-send-email-srinivas.kandagatla@linaro.org>
 <20160612044736.GS1256@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160612044736.GS1256@tuxbot>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Parth Pancholi <parth.pancholi-7dMfbm5N4krDzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 12/06/16 05:47, Bjorn Andersson wrote:
> On Fri 10 Jun 11:19 PDT 2016, Srinivas Kandagatla wrote:
>
>> From: Parth Pancholi <parth.pancholi-7dMfbm5N4krDzftRWevZcw@public.gmane.org>
>>
>> This board locks up if we stress test the eMMC, as the regulator s4 is
>> unable to supply enough current for all the peripherials attached to it.
>> As this supply is wired up to most of the peripherials including DDR,
>> it resulted in such lockup.
>>
>> This patch fixes this issue by setting s4 regulator correctly with
>> Auto power mode.
>>
>> Reported-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> [Srinivas Kandagatla: rewrote the change log]
>> Tested-by: Girish Sharma <girish.sharma-7dMfbm5N4krDzftRWevZcw@public.gmane.org>
>> Signed-off-by: Parth Pancholi <parth.pancholi-7dMfbm5N4krDzftRWevZcw@public.gmane.org>
>
> If I read the msm-3.4 tree correctly most (perhaps all) 8064 devices
> should have this setup.
>
I agree, we should patch other boards as well with the same value.


> Acked-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

thanks,
srini
>
> Regards,
> Bjorn
>
>> ---
>>   arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts b/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
>> index 7df0108..39ae2bc 100644
>> --- a/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
>> @@ -1,6 +1,7 @@
>>   #include "qcom-apq8064-v2.0.dtsi"
>>   #include "qcom-apq8064-arrow-sd-600eval-pins.dtsi"
>>   #include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/mfd/qcom-rpm.h>
>>
>>   / {
>>   	model = "Arrow Electronics, APQ8064 SD_600eval";
>> @@ -82,7 +83,8 @@
>>   				s4 {
>>   					regulator-min-microvolt	= <1800000>;
>>   					regulator-max-microvolt	= <1800000>;
>> -					qcom,switch-mode-frequency = <3200000>;
>> +					qcom,switch-mode-frequency = <1600000>;
>> +					qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
>>   					bias-pull-down;
>>   					regulator-always-on;
>>   				};
>> --
>> 2.8.3
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
