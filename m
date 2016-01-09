From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RESEND RFC PATCH 2/2] ARM: dts: rockchip: Update the cpu freqs
 table
Date: Sat, 9 Jan 2016 11:04:36 +0800
Message-ID: <569078C4.8080000@rock-chips.com>
References: <1452252698-16765-1-git-send-email-zhengxing@rock-chips.com>
 <1452252698-16765-3-git-send-email-zhengxing@rock-chips.com>
 <4951150.PYM4FhWu6V@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4951150.PYM4FhWu6V@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, leozwang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2016=E5=B9=B401=E6=9C=8809=E6=97=A5 03:16, Heiko Stuebner wrote:
> Hi Xing,
>
> Am Freitag, 8. Januar 2016, 19:31:38 schrieb Xing Zheng:
>> Actually, we need more cpu freqs which are 50MHz integer multiples.
>>
>> Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>>   arch/arm/boot/dts/rk3036.dtsi |   13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk303=
6.dtsi
>> index 1cb5877..1a773eb 100644
>> --- a/arch/arm/boot/dts/rk3036.dtsi
>> +++ b/arch/arm/boot/dts/rk3036.dtsi
>> @@ -79,7 +79,18 @@
>>   			resets =3D <&cru SRST_CORE0>;
>>   			operating-points =3D <
>>   				/* KHz    uV */
>> -				 816000 1000000
>> +				1200000 1200000
>> +				1100000 1200000
>> +				1000000 1200000
>> +				 900000 1200000
>> +				 800000 1200000
>> +				 700000 1200000
>> +				 600000 1200000
>> +				 500000 1200000
>> +				 400000 1200000
>> +				 300000 1200000
>> +				 200000 1200000
>> +				 100000 1200000
> what about reducing the voltage as well?
>
> >From rk3288-specific discussions I remember that reducing the freque=
ncy
> without touching the voltage, didn't really save so much energy.
> And it looks like it was running 816MHz@1.0V just fine as well.
>
> I guess you should find out which voltages are really necessary for e=
ach
> step.
>
>
> Heiko
>
Thank you for your comments. :-)

Yes, these patches currently still in draft stage. Modify the frequency=
=20
of 816MHz is for mac apll patch can be FROMLIST for Kylin Board,
and will work cpu frequency table as a start.

We know you want to set the appropriate frequency of different batches=20
of The RK3036 SoCs take some time,so I just tested a fixed
high voltage 1.2v on my evb board, the frequency of the voltage to=20
ensure that we can work needed.
We'll start work dynamically adjust the voltage.

Thanks.

- Xing Zheng


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
