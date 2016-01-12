From: zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 2/3] soc: rockchip: power-domain: Modify power domain
 driver for rk3368
Date: Tue, 12 Jan 2016 00:57:08 -0800
Message-ID: <5694BFE4.1070200@rock-chips.com>
References: <1452508600-3512-1-git-send-email-zhangqing@rock-chips.com> <1452508600-3512-3-git-send-email-zhangqing@rock-chips.com> <5693ADD1.4000207@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5693ADD1.4000207-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

hi Caesar Wang

you need check the datasheet again.
 > The rk3368 datasheet:
 > PMU_PMU_BUS_IDLE_ST  ----->ack_vio[8]----->ack status
			----->idle_vio[24]----->idle status
 > PMU_PMU_BUS_IDLE_REQ ---->idle_req_vio[8]----->idle req

On 01/11/2016 05:27 AM, Caesar Wang wrote:
> Hi zhangqin,
>
>  From my datasheet "Rockchip RK3368 TRM V2.0.pdf"
> Maybe i'm missing something.
>
>
> =E5=9C=A8 2016=E5=B9=B401=E6=9C=8811=E6=97=A5 18:36, zhangqing =E5=86=
=99=E9=81=93:
>> This driver is modified to support RK3368 SoC.
>>
>> Signed-off-by: zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>   drivers/soc/rockchip/pm_domains.c | 33
>> +++++++++++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/drivers/soc/rockchip/pm_domains.c
>> b/drivers/soc/rockchip/pm_domains.c
>> index 534c589..6cdffb1 100644
>> --- a/drivers/soc/rockchip/pm_domains.c
>> +++ b/drivers/soc/rockchip/pm_domains.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/regmap.h>
>>   #include <linux/mfd/syscon.h>
>>   #include <dt-bindings/power/rk3288-power.h>
>> +#include <dt-bindings/power/rk3368-power.h>
>>   struct rockchip_domain_info {
>>       int pwr_mask;
>> @@ -75,6 +76,9 @@ struct rockchip_pmu {
>>   #define DOMAIN_RK3288(pwr, status, req)        \
>>       DOMAIN(pwr, status, req, req, (req) + 16)
>> +#define DOMAIN_RK3368(pwr, status, req)        \
>> +    DOMAIN(pwr, status, req, (req) + 16, req)
>> +
>
> You should  remove it, that's seem same with the rk3288.
>
> The rk3368 datasheet:
> PMU_PMU_BUS_IDLE_ST  ----->idle_vio[24]----->ack
> PMU_PMU_BUS_IDLE_REQ ---->idle_req_vio[8]----->idle
>
>>   static bool rockchip_pmu_domain_is_idle(struct rockchip_pm_domain =
*pd)
>>   {
>>       struct rockchip_pmu *pmu =3D pd->pmu;
>> @@ -444,6 +448,14 @@ static const struct rockchip_domain_info
>> rk3288_pm_domains[] =3D {
>>       [RK3288_PD_GPU]        =3D DOMAIN_RK3288(9, 9, 2),
>>   };
>> +static const struct rockchip_domain_info rk3368_pm_domains[] =3D {
>> +    [RK3368_PD_PERI]    =3D DOMAIN_RK3368(13, 12, 6),
>> +    [RK3368_PD_VIO]        =3D DOMAIN_RK3368(15, 14, 8),
>> +    [RK3368_PD_VIDEO]    =3D DOMAIN_RK3368(14, 13, 7),
>> +    [RK3368_PD_GPU_0]    =3D DOMAIN_RK3368(16, 15, 2),
>> +    [RK3368_PD_GPU_1]    =3D DOMAIN_RK3368(17, 16, 2),
>> +};
>> +
>>   static const struct rockchip_pmu_info rk3288_pmu =3D {
>>       .pwr_offset =3D 0x08,
>>       .status_offset =3D 0x0c,
>> @@ -461,11 +473,32 @@ static const struct rockchip_pmu_info rk3288_p=
mu
>> =3D {
>>       .domain_info =3D rk3288_pm_domains,
>>   };
>> +static const struct rockchip_pmu_info rk3368_pmu =3D {
>> +    .pwr_offset =3D 0x0c,
>> +    .status_offset =3D 0x10,
>> +    .req_offset =3D 0x3c,
>> +    .idle_offset =3D 0x40,
>> +    .ack_offset =3D 0x40,
>> +
>> +    .core_pwrcnt_offset =3D 0x48,
>> +    .gpu_pwrcnt_offset =3D 0x50,
>> +
>> +    .core_power_transition_time =3D 24,
>> +    .gpu_power_transition_time =3D 24,
>> +
>> +    .num_domains =3D ARRAY_SIZE(rk3368_pm_domains),
>> +    .domain_info =3D rk3368_pm_domains,
>> +};
>> +
>>   static const struct of_device_id rockchip_pm_domain_dt_match[] =3D=
 {
>>       {
>>           .compatible =3D "rockchip,rk3288-power-controller",
>>           .data =3D (void *)&rk3288_pmu,
>>       },
>> +    {
>> +        .compatible =3D "rockchip,rk3368-power-controller",
>> +        .data =3D (void *)&rk3368_pmu,
>> +    },
>>       { /* sentinel */ },
>>   };
>>
>> --
>> Thanks,
>> Caesar
>
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
