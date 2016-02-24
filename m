From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 1/4] soc: rockchip: add bindings for Rockchip grf
Date: Wed, 24 Feb 2016 08:18:16 +0800
Message-ID: <56CCF6C8.6010602@rock-chips.com>
References: <1456210864-29037-1-git-send-email-jay.xu@rock-chips.com>
 <1456210864-29037-2-git-send-email-jay.xu@rock-chips.com>
 <20160223221555.GA7531@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160223221555.GA7531@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob

=D4=DA 24/02/2016 06:15, Rob Herring =D0=B4=B5=C0:
> On Tue, Feb 23, 2016 at 03:01:01PM +0800, jianqun.xu wrote:
>> From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> Add devicetree bindings for Rockchip grf which found on
>> Rockchip SoCs.
>>
>> Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>> changes in v2:
>> - add grf.txt (Heiko)
>>
>>   .../devicetree/bindings/soc/rockchip/grf.txt       | 35 ++++++++++=
++++++++++++
>>   1 file changed, 35 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/rockchip/=
grf.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.txt =
b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
>> new file mode 100644
>> index 0000000..7fb0410
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
>> @@ -0,0 +1,35 @@
>> +* Rockchip General Register Files (GRF)
>> +
>> +The general register file will be used to do static set by software=
, which
>> +is composed of many registers for system control.
>> +
>> +From RK3368 SoCs, the GRF is divided into two sections,
>> +- GRF, used for general non-secure system,
>> +- PMUGRF, used for always on sysyem
>
> s/sysyem/system/
>
> Otherwise:
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
ok, thanks
>> +
>> +Required Properties:
>> +
>> +- compatible: GRF should be one of the followings
>> +   - "rockchip,rk3066-grf", "syscon": for rk3066
>> +   - "rockchip,rk3188-grf", "syscon": for rk3188
>> +   - "rockchip,rk3228-grf", "syscon": for rk3228
>> +   - "rockchip,rk3288-grf", "syscon": for rk3288
>> +   - "rockchip,rk3368-grf", "syscon": for rk3368
>> +   - "rockchip,rk3399-grf", "syscon": for rk3399
>> +- compatible: PMUGRF should be one of the followings
>> +   - "rockchip,rk3368-pmugrf", "syscon": for rk3368
>> +   - "rockchip,rk3399-pmugrf", "syscon": for rk3399
>> +- reg: physical base address of the controller and length of memory=
 mapped
>> +  region.
>> +
>> +Example: GRF and PMUGRF of RK3399 SoCs
>> +
>> +	pmugrf: syscon@ff320000 {
>> +		compatible =3D "rockchip,rk3399-pmugrf", "syscon";
>> +		reg =3D <0x0 0xff320000 0x0 0x1000>;
>> +	};
>> +
>> +	grf: syscon@ff770000 {
>> +		compatible =3D "rockchip,rk3399-grf", "syscon";
>> +		reg =3D <0x0 0xff770000 0x0 0x10000>;
>> +	};
>> --
>> 1.9.1
>>
>>
>
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
