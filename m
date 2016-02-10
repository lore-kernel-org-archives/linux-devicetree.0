From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: replace gpio-key,wakeup with
 wakeup-source property
Date: Wed, 10 Feb 2016 09:51:32 +0000
Message-ID: <56BB0824.2030900@arm.com>
References: <1454968512-11956-1-git-send-email-sudeep.holla@arm.com>
 <48510660.EJbbczq5fX@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <48510660.EJbbczq5fX@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 09/02/16 23:32, Heiko Stuebner wrote:
> Hi Sudeep,
>
> Am Montag, 8. Februar 2016, 21:55:12 schrieb Sudeep Holla:

[..]

>> Hi Heiko,
>>
>> You can reviewed this, however there are couple of ARM64 dts additions.
>> Also most of the other platform/SoC maintainers preferred to take it via
>> their tree and few of these got missed during v4.5 merge window.
>> Can you take it via your tree for v4.6 ?
>
> I've split the patch in two, as the 32 and 64 bit devicetree parts go
> through separate branches and applied both to their respective branches for
> v4.6

Thanks for splitting up the patch yourself.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
