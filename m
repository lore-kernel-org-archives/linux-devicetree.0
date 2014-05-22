From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: [Patch v5 0/7] Introduce keystone reset driver
Date: Thu, 22 May 2014 16:58:22 +0300
Message-ID: <537E027E.6040602@ti.com>
References: <1400766516-14537-1-git-send-email-ivan.khoronzhuk@ti.com> <537E011B.9090902@ti.com> <5069120.YZWxxyxdrl@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5069120.YZWxxyxdrl@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, w-kwok2-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 05/22/2014 04:54 PM, Arnd Bergmann wrote:
> On Thursday 22 May 2014 09:52:27 Santosh Shilimkar wrote:
>> On Thursday 22 May 2014 09:48 AM, Ivan Khoronzhuk wrote:
>>> These patches introduce keystone reset driver.
>>>
>>> The keystone SoC can be rebooted in several ways. By external reset
>>> pin, by soft and by watchdogs. This driver allows software reset and reset
>>> by one of the watchdogs. Also added opportunity to set soft/hard reset type.
>>>
>>> Based on linux-next/master
>>>
>>> v5..v4
>>>    power: reset: keystone-reset: introduce keystone reset driver
>>>        - changed to get rsmux and rspll offsets from DT
>>>    clock: keystone-pllctrl: add bindings for keystone pll controller
>>>        - new patch
>>>    mfd: ti-keystone-devctrl: add bindings for device state control
>>>        - new patch
>>>    power: reset: add bindings for keystone reset driver
>>>        - corrected description of "ti,syscon-pll", "ti,syscon-dev" properties
>>>        - corrected examples
>>>    ARM: dts: keystone: update reset node to work with reset driver
>>>        - added nodes for pll-controller and device-state-controll
>>>        - added offsets to "ti,syscon-pll", "ti,syscon-dev" properties
>>>
>> Looks like you haven't collected Arnd's Reviewed-by tag on the patches.
>> Can be added later as well while applying.
>>
>>
> I was going to comment the same. Anyway here you have it for the remaining
> patches:
>
> Reviewed-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Thanks!

-- 
Regards,
Ivan Khoronzhuk

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
