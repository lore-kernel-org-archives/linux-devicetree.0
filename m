From: Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add rk3288-firefly-reload
Date: Wed, 10 Aug 2016 09:12:35 +0800
Message-ID: <522097f6-8b5c-ee6d-c1b1-a63840228a0e@rock-chips.com>
References: <1549971.ctkvOGm2xW@diego>
 <CAFLEztTROearSEcgzV3EVHFcRcMQpLhAQ6BXP-dDyRDAWybaxg@mail.gmail.com>
 <C2BE77CA-A59B-4128-8802-E3E36FACDABA@rock-chips.com>
 <13761657.UM4fvlJBBq@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <13761657.UM4fvlJBBq@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: =?UTF-8?B?6ZmI6LGq?= <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/09/2016 06:58 PM, Heiko Stübner wrote:
> Am Dienstag, 9. August 2016, 18:06:33 schrieb Randy Li:
>> 從我的 iPad 傳送
>>
>>> 陈豪 <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 於 2016年8月9日 下午6:02 寫道：
>>>
>>> well，it has already been added....
>>>
>>> The root cause is not act8846. Firefly have a bug with sdmmc and it
>>> seems they didn't fix it in firefly-reload.
>>>
>>> http://bbs.t-firefly.com/forum.php?mod=viewthread&tid=256
> Thanks Jacob for pointing out this issue - I was always wondering why it
> wasn't working :-) .
>
>
>> Yes, Jacob is right. Those high speed options need the voltage down to 1.8v.
>> They should be removed.
> Randy, can you provide a follow-up patch that removes these excess properties
> please?
I will send a patch in weekend. I need some time to confirm whether
the sdio wifi would meet the same problem in firefly reload.
I found those patches are not been merged yet, should I just send
a new version or just a patch remove those incorrect excess properties?
>
>
> Thanks
> Heiko
>

-- 
Randy Li
The third produce department


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
