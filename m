From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 4/6] pinctrl: rockchip: add bindings for rk3399 pinctrl
Date: Wed, 17 Feb 2016 15:23:14 +0800
Message-ID: <56C41FE2.8020800@rock-chips.com>
References: <1455673992-16469-1-git-send-email-jay.xu@rock-chips.com>
 <1455673992-16469-5-git-send-email-jay.xu@rock-chips.com>
 <19942952.P4nUQKPo3g@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19942952.P4nUQKPo3g@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=D4=DA 17/02/2016 14:47, Heiko Stuebner =D0=B4=B5=C0:
> Hi Jianqun,
>
> Am Mittwoch, 17. Februar 2016, 09:53:10 schrieb jianqun.xu:
>> From: Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> Add devicetree bindings for pinctrl found on rk3399
>> processors from rockchip.
>>
>> Signed-off-by: Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt | 2=
 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
>> b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt ind=
ex
>> 0cd701b..c68b955 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
>> @@ -22,7 +22,7 @@ Required properties for iomux controller:
>>     - compatible: one of "rockchip,rk2928-pinctrl",
>> "rockchip,rk3066a-pinctrl" "rockchip,rk3066b-pinctrl",
>> "rockchip,rk3188-pinctrl"
>>   		       "rockchip,rk3228-pinctrl", "rockchip,rk3288-pinctrl"
>> -		       "rockchip,rk3368-pinctrl"
>> +		       "rockchip,rk3368-pinctrl", "rockchip,rk3399-pinctrl"
>>     - rockchip,grf: phandle referencing a syscon providing the
>>   	 "general register files"
>
> that is already contained in David's core pinctrl patch that already =
got
> applied to the pinctrl tree.
>
Sorry very much, I forgot it after a long time of spring holiday
thanks
>
> Heiko
>
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
