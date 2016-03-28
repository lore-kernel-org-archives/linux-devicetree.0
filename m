From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: add bindings for rk3399 clock controller
Date: Mon, 28 Mar 2016 11:24:47 +0800
Message-ID: <56F8A3FF.6090800@rock-chips.com>
References: <1458974276-10325-1-git-send-email-zhengxing@rock-chips.com> <1458974276-10325-3-git-send-email-zhengxing@rock-chips.com> <1507551.YPleCY5ZQt@phil> <3689505.b0IKY6iWOt@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3689505.b0IKY6iWOt@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, elaine.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2016=E5=B9=B403=E6=9C=8828=E6=97=A5 08:07, Heiko Stuebner wrote:
> Hi Xing,
>
> Am Montag, 28. M=C3=A4rz 2016, 01:52:12 schrieb Heiko St=C3=BCbner:
>> Am Samstag, 26. M=C3=A4rz 2016, 14:37:54 schrieb Xing Zheng:
>>> Add devicetree bindings for Rockchip cru which found on
>>> Rockchip SoCs.
>>>
>>> Signed-off-by: Xing Zheng<zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>> Signed-off-by: Jianqun Xu<jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>> Acked-by: Rob Herring<robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> ---
>>>
>>> Changes in v5: None
>>> Changes in v3: None
>>> Changes in v2: None
>>>
>>>   .../bindings/clock/rockchip,rk3399-cru.txt         |   83
>>>
>>> ++++++++++++++++++++ 1 file changed, 83 insertions(+)
>>>
>>>   create mode 100644
>>>
>>> Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk339=
9-
>> cru.txt
>>
>>> b/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt n=
ew
>>> file mode 100644
>>> index 0000000..9427caa
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.t=
xt
>>> @@ -0,0 +1,83 @@
>>> +* Rockchip RK3399 Clock and Reset Unit
>>> +
>>> +The RK3399 clock controller generates and supplies clock to variou=
s
>>> +controllers within the SoC and also implements a reset controller =
for
>>> SoC +peripherals.
>>> +
>>> +Required Properties:
>>> +
>>> +- compatible: PMU for CRU should be "rockchip,rk3399-pmucru"
>>> +- compatible: CRU should be "rockchip,rk3399-cru"
>>> +- reg: physical base address of the controller and length of memor=
y
>> mapped
>>
>>> +  region.
>>> +- #clock-cells: should be 1.
>>> +- #reset-cells: should be 1.
>>> +
>>> +Optional Properties:
>>> +
>>> +- rockchip,grf: phandle to the syscon managing the "general regist=
er
>> files"
>>
>>> +  If missing, pll rates are not changeable, due to the missing pll=
 lock
>>> status. +
>> the rk3399 doesn't need the GRF, so we should drop this block for no=
w
> actually, I just saw that the GRF is needed for the static settings d=
uring
> init. So the rockchip,grf should stay but also move up to required
> properties?
>
> Same for the grf-comment in the examples-section.
>
>
I check the setting of the pclk_alive and pclk_pmu_src are not gating=20
default on the PMUGRF_SOC_CON0,
so I think that we don't need to do the static settings to re-enable=20
them in the clock driver any more.

Thanks.

--=20
- Xing Zheng


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
