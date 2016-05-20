From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: fixes the spi compatible for
 rk3036
Date: Fri, 20 May 2016 21:09:55 +0800
Message-ID: <3c1e174e-035b-78ae-b045-fe89990826da@rock-chips.com>
References: <1463702182-5188-1-git-send-email-wxt@rock-chips.com>
 <1463702182-5188-3-git-send-email-wxt@rock-chips.com>
 <8f662b3b-e359-efdf-72e5-c4f862dd1cf6@kernel-upstream.org>
 <28155403.nCsUkeXQB1@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <28155403.nCsUkeXQB1@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016/5/20 20:58, Heiko Stuebner wrote:
> Am Freitag, 20. Mai 2016, 20:35:53 schrieb Shawn Lin:
>> =E5=9C=A8 2016/5/20 7:56, Caesar Wang =E5=86=99=E9=81=93:
>>> That's seem the incorrect string to match the spi driver.
>>
>> Will it break the backward compatibility for some dtb if not
>> falling back to "rockchip,rockchip-spi" ?
>
> in what dtb did you see "rockchip,rockchip-spi"?

I'm not 100% sure, but I remember we toke this name on local
branch for rk3036 when we were developing this Soc.

> I.e. it isn't part of any current _mainline_ devicetree files.
>

Caesar, Could you check our develop-3.10 branch to see if it does
exist?

Anyway, "rockchip,rockchip-spi" isn't a part of mainline dt property.


>
> Heiko
>
>>
>>> Fixes commit f629fcfab2cd
>>> ("ARM: dts: rockchip: support the spi for rk3036")
>>>
>>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>> Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>>> Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>>
>>> ---
>>>
>>> Changes in v2: None
>>>
>>>  arch/arm/boot/dts/rk3036.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/rk3036.dtsi
>>> b/arch/arm/boot/dts/rk3036.dtsi index d0f4bb7..a30700a 100644
>>> --- a/arch/arm/boot/dts/rk3036.dtsi
>>> +++ b/arch/arm/boot/dts/rk3036.dtsi
>>> @@ -431,7 +431,7 @@
>>>
>>>  	};
>>>  =09
>>>  	spi: spi@20074000 {
>>>
>>> -		compatible =3D "rockchip,rockchip-spi";
>>> +		compatible =3D "rockchip,rk3036-spi";
>>>
>>>  		reg =3D <0x20074000 0x1000>;
>>>  		interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>>>  		clocks =3D<&cru PCLK_SPI>, <&cru SCLK_SPI>;
>
>


--=20
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
