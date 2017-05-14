From: ayaka <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: add missing grf phandle for rk3288
Date: Sun, 14 May 2017 23:10:48 +0800
Message-ID: <802d9787-92dd-ee9d-51a2-45e42a9ba430@soulik.info>
References: <20170507143446.11502-1-ayaka@soulik.info>
 <53387334.ADQf94xZqP@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53387334.ADQf94xZqP@phil>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 05/14/2017 10:59 PM, Heiko Stuebner wrote:
> Hi Randy,
>
> Am Sonntag, 7. Mai 2017, 22:34:46 CEST schrieb Randy Li:
>> The PWM devices need to access the grf to switch the PWM IP.
> The grf property is not part of the pwm binding and I remember
> this coming up in veyron times, when Thiery didn't want such settings
> in the pwm driver. So the kernel pwm driver does not switch anything
> right now.
OK, I see, I will contact the u-boot, submit a patch there.
>
>
>> And tsadc uses it to shutdown the system.
> No it doesn't. The tsadc on rk3288 does not do any grf settings right now,
> as it is using the v2_initialize function. Only rk3366 and rk3399 seem
> to do any grf settings in the current v4.12-rc1 . Or is there some tsadc
> patch from you pending to change that?
Not yet, there is a register CRU_GLB_RST_ST at rk3288 cru. I think I 
need to submit a patch for it.
>
>
> Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
