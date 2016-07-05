From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3] arm64: dts: rockchip: add the power domain node for
 rk3399
Date: Tue, 05 Jul 2016 08:44:03 +0800
Message-ID: <577B02D3.3050608@rock-chips.com>
References: <1467635644-16798-1-git-send-email-wxt@rock-chips.com> <1904131.irFlfKsH8m@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1904131.irFlfKsH8m@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


=E4=BA=8E 2016=E5=B9=B407=E6=9C=8805=E6=97=A5 08:24, Heiko Stuebner =E5=
=86=99=E9=81=93:
> Am Montag, 4. Juli 2016, 20:34:04 schrieb Caesar Wang:
>> From: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> In order to meet low power requirements, a power management unit (PM=
U) is
>> designed for controlling power resources in RK3399. The RK3399 PMU i=
s
>> dedicated for managing the power of the whole chip.
>>
>> 1. add pd node for RK3399 Soc
>> 2. create power domain tree
>> 3. add qos node for domain
>>
>>  From the DT/binds and driver can get more detail information:
>> The driver:
>>          drivers/soc/rockchip/pm_domains.c
>> The document:
>>          Documentation/devicetree/bindings/soc/rockchip/power_domain=
=2Etxt
>>
>> Note:
>> As the TRM lists many voltage domains and power domains, then this p=
atch
>> adds some domains for driver. Due to some domains
>> (e.g. emmc, usb, core)...We can't turned off it on
>> bootup, or says some device driver can't handle the power domain eno=
ugh.
>> Maybe We will add more other domains in the future or later.
> I talked with Caesar about that today and for example the gmac domain=
 seems
> to cause problems right now when only using the generic power-domain
> handling the kernel provides on probe and remove.
>
> So while this gets investigated, I'm probably ok with only using the =
stable
> power-domains, but will give the us-people a chance to also respond o=
n
> wednesday :-) .
>
>
>> Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>>
>> ---
>>
>> Changes in v3:
>> - As some commnets on https://patchwork.kernel.org/patch/9209205/
>> - according to the alphabetically sort
>> - %s/RK3399_PD_VOP/RK3399_PD_VOPL, %s/RK3399_PD_IE/RK3399_PD_IEP
>>
>> Changes in v2:
>> - As Doug/Heiko commnets on https://patchwork.kernel.org/patch/92064=
15/.
>>    drop the debugfs-dump and Add the comments for alphabetical order=
=2E
>>
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 179
>> +++++++++++++++++++++++++++++++ 1 file changed, 179 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index a6dd623..4559c04 10=
0644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -45,6 +45,7 @@
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/interrupt-controller/irq.h>
>>   #include <dt-bindings/pinctrl/rockchip.h>
>> +#include <dt-bindings/power/rk3399-power.h>
>>   #include <dt-bindings/thermal/thermal.h>
>>
>>   / {
>> @@ -594,6 +595,184 @@
>>   		status =3D "disabled";
>>   	};
>>
>> +	qos_hdcp: qos_hdcp@ffa90000 {
> I guess I'll just rename that to qos_hdcp: qos@ffa90000
> (similar for the other nodes), as the block itself is the same for al=
l qos
> instances. So if that stays the only comment, there is no need to res=
end, as
> I can do the change myself.

Yep, that's better.
Thanks.

-Caesar

>
>> +		compatible =3D "syscon";
>> +		reg =3D <0x0 0xffa90000 0x0 0x20>;
>> +	};
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--=20
caesar wang | software engineer | wxt-TNX95d0MmH73oGB3hsPCZA@public.gmane.org


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
