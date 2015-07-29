From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v1 3/7] ARM: dts: apq8064-ifc6410: add heart-beat led
 support.
Date: Wed, 29 Jul 2015 15:02:00 +0100
Message-ID: <55B8DCD8.9050404@linaro.org>
References: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org> <1438088040-17437-1-git-send-email-srinivas.kandagatla@linaro.org> <55B7BDB8.7090103@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <55B7BDB8.7090103@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, linux-arm-msm@vger.kernel.org
Cc: agross@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 28/07/15 18:36, Andreas F=E4rber wrote:
> Am 28.07.2015 um 14:54 schrieb Srinivas Kandagatla:
>> This patch adds heart-beat led support on IFC6410.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 22 ++++++++++++++++++=
++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/b=
oot/dts/qcom-apq8064-ifc6410.dts
>> index df560cf..1fc2ea5 100644
>> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> @@ -207,6 +207,19 @@
>>   			status =3D "okay";
>>   		};
>>
>> +		leds {
>> +			compatible =3D "gpio-leds";
>> +			pinctrl-names =3D "default";
>> +			pinctrl-0 =3D <&notify_led>;
>> +
>> +			led@1 {
>> +				label =3D "apq8064:green:user1";
>> +				gpios =3D <&pm8921_gpio 18 GPIO_ACTIVE_HIGH>;
>> +				linux,default-trigger =3D "heartbeat";
>
> Can we please drop the heartbeat default? While that's nice as proof =
of
> concept, it's annoying to deliver it that way in Linux distros. Users
> can enable that trigger with a simple boot script writing to /sys.
>
Thanks for the input, I will change to be none, Let the users decide th=
e=20
trigger.

thanks,
srini
> Thanks,
> Andreas
>
>> +				default-state =3D "on";
>> +			};
>> +		};
>> +
>>   		qcom,ssbi@500000 {
>>   			pmicintc: pmic@0 {
>>   				pm8921_gpio: gpio@150 {
> [snip]
>
