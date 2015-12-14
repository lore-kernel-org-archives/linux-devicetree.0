From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: lpc4337-ciaa: enable SCT-PWM
Date: Mon, 14 Dec 2015 23:48:07 +0100
Message-ID: <CAGhQ9Vxqpe4QQn1+d6bOCQH9q6evignVR_+U4NK7HqSNhBg4qA@mail.gmail.com>
References: <1448282225-2635-1-git-send-email-ariel@vanguardiasur.com.ar>
	<1448282225-2635-3-git-send-email-ariel@vanguardiasur.com.ar>
	<5655A977.1040408@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5655A977.1040408-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ariel,

Sorry for the late reply. I have just started to put together my DT
for 4.5 branch now.

On 25 November 2015 at 13:28, Ariel D'Alessandro
<ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
> (+To: Joachim)
>
> El 23/11/15 a las 09:37, Ariel D'Alessandro escribi=C3=B3:
>> Enable the PWM based on the State Configurable Timer (SCT) included =
in
>> the LPC4337 SoC of the CIAA-NXP board.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/lpc4337-ciaa.dts | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/lpc4337-ciaa.dts b/arch/arm/boot/dts/=
lpc4337-ciaa.dts
>> index 03bdf77..1a23589 100644
>> --- a/arch/arm/boot/dts/lpc4337-ciaa.dts
>> +++ b/arch/arm/boot/dts/lpc4337-ciaa.dts
>> @@ -170,6 +170,10 @@
>>       pinctrl-0 =3D <&enet_rmii_pins>;
>>  };
>>
>> +&sct_pwm {
>> +     status =3D "okay";
>> +};
>> +

Isn't this a bit useless without any pinmux setup?


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
