From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 14/16] arm64: dts: hikey: Add hi655x pmic dts node
Date: Tue, 12 Apr 2016 21:14:07 +0800
Message-ID: <CAFGCpxyhcQEO_t+K+XSeLLL+qky8YDQbb3ewdfYY5Y=FxRy_sw@mail.gmail.com>
References: <1459589383-16914-1-git-send-email-guodong.xu@linaro.org>
	<1459589383-16914-15-git-send-email-guodong.xu@linaro.org>
	<20160404051653.GU17806@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160404051653.GU17806@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, XinWei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Fei Wang <w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4 April 2016 at 13:16, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sat, Apr 02, 2016 at 05:29:41PM +0800, Guodong Xu wrote:
>> From: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>>
>> Add the mfd hi655x dts node and regulator support on
>> hi6220 platform.
>>
>> Signed-off-by: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> Signed-off-by: Fei Wang <w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> Reviewed-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Reviewed-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 87 ++++++++++++++++++++++++++
>>  1 file changed, 87 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
>> index 28bc646..a6dffa8 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
>> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
>> @@ -6,6 +6,7 @@
>>   */
>>
>>  /dts-v1/;
>> +#include <dt-bindings/gpio/gpio.h>
>>
>>  #include "hi6220.dtsi"
>>  #include "hikey-gpio.dtsi"
>> @@ -104,6 +105,92 @@
>>                       default-state = "off";
>>               };
>>       };
>> +
>> +     pmic: pmic@f8000000 {
>> +             compatible = "hisilicon,hi655x-pmic";
>> +             reg = <0x0 0xf8000000 0x0 0x1000>;
>> +             interrupt-controller;
>> +             #interrupt-cells = <2>;
>> +             pmic-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
>> +             status = "okay";
>> +
>> +             regulators {
>> +                     ldo2: LDO2@a21 {
>
> @a21 is not a unit address. Please drop these.

Will change these to
 +                     ldo2: LDO2 {
...
 +                     ldo7: LDO7 {
...

Thanks for review, Rob.

-Guodong

>
>> +                             regulator-name = "LDO2_2V8";
>> +                             regulator-min-microvolt = <2500000>;
>> +                             regulator-max-microvolt = <3200000>;
>> +                             regulator-enable-ramp-delay = <120>;
>> +                     };
>> +
>> +                     ldo7: LDO7@a26 {
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
