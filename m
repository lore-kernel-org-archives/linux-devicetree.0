From: "David.Wu" <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clk: rockchip: add rv1108 ACLK_GAMC and PCLK_GMAC
 ID
Date: Mon, 21 Aug 2017 19:15:18 +0800
Message-ID: <4765221b-e122-b67d-cec2-dffbeeadc379@rock-chips.com>
References: <1503303367-17915-1-git-send-email-zhangqing@rock-chips.com>
 <1503303367-17915-2-git-send-email-zhangqing@rock-chips.com>
 <f51160d5-32cc-a63c-3877-76ea91fb6e8b@rock-chips.com>
 <19279521.prAVXYBsZ9@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19279521.prAVXYBsZ9@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wdc-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

在 2017/8/21 18:32, Heiko Stuebner 写道:
> Hi David,
> 
> Am Montag, 21. August 2017, 18:22:31 CEST schrieb David.Wu:
>> Hi Elaine,
>>
>> 在 2017/8/21 16:16, Elaine Zhang 写道:
>>> This patch exports gmac aclk and pclk for dts reference.
>>>
>>> Signed-off-by: Elaine Zhang<zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>> ---
>>>    include/dt-bindings/clock/rv1108-cru.h | 2 ++
>>>    1 file changed, 2 insertions(+)
>>
>> Acked-by: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> Acked-by is mainly meant for cross-maintainer stuff (changes
> for one subsystem going through a different tree etc).
> 
> If you want to show that the change is correct and you have reviewed
> the patch, please use "Reviewed-by".
> 

Yeap, my intent is that the patches are correct. And change the tag here.🙂
So for the series:

Reviewed-by: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

> 
> Heiko
> 
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
