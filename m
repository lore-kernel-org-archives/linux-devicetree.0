From: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add the needed timer for rk3368
 SoC
Date: Fri, 18 Sep 2015 09:16:53 +0800
Message-ID: <55FB6605.80601@gmail.com>
References: <1442476272-31723-1-git-send-email-wxt@rock-chips.com> <1442476272-31723-4-git-send-email-wxt@rock-chips.com> <10188118.z6mI84Cd5Z@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10188118.z6mI84Cd5Z@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 2015=E5=B9=B409=E6=9C=8818=E6=97=A5 03:01, Heiko St=C3=BCbner=
 =E5=86=99=E9=81=93:
> Am Donnerstag, 17. September 2015, 15:51:12 schrieb Caesar Wang:
>> There is a need of a broadcast timer in this case to ensure proper
>> wakeup when the cpus are in sleep mode and a timer expires.
>>
>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>>   arch/arm64/boot/dts/rockchip/rk3368.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3368.dtsi index a712bea..99edbaa 10=
0644
>> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
>> @@ -214,6 +214,12 @@
>>   			(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
>>   	};
>>
>> +	timer@ff810000 {
>> +		compatible =3D "rockchip,rk3288-timer";
> you probably want a
> 		compatible =3D "rockchip,rk3368-timer", "rockchip,rk3288-timer";

Done.

More consideration for the future.
Although the "rk3288-timer" is working for 3368, agreed to add the=20
'rk3368-timer' for the rk3368-spec  timer in the future.

>
>> +		reg =3D <0x0 0xff810000 0x0 0x20>;
>> +		interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +
>>   	xin24m: oscillator {
>>   		compatible =3D "fixed-clock";
>>   		clock-frequency =3D <24000000>;
>
>
>
>
> --=20
> Thanks,
> Caesar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
