From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: [Patch v5 3/7] mfd: ti-keystone-devctrl: add bindings for device
 state control
Date: Thu, 22 May 2014 19:14:06 +0300
Message-ID: <537E224E.3060601@ti.com>
References: <1400766516-14537-1-git-send-email-ivan.khoronzhuk@ti.com> <1400766516-14537-4-git-send-email-ivan.khoronzhuk@ti.com> <20140522141432.GA19747@lee--X1> <537E0A87.5010408@ti.com> <20140522153309.GB19747@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140522153309.GB19747@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, santosh.shilimkar-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, w-kwok2-l0cyMroinI0@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 05/22/2014 06:33 PM, Lee Jones wrote:
>>> Why do I only have this patch?  Where is the rest of the set?  Also,
>>> it's on v5 and I don't recall seeing the other 4 versions?
>> It's strange I've sent whole series on
>>
>> linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>
>> v4 is also was sent to lists in question:
>> https://lkml.org/lkml/2014/5/21/359
> But did you send them to me?  I don't parse the list.
>

Sorry.
Becouse /scripts/get_maintainer.pl  patches/reset_driver_v6/* hadn't 
been listed you
It's because there is no patch with "code" for the bindings you've comment.

I should check it by hand for mtd.

The bindings for mtd device_state_control were added only on v5
And it's added only to describe what is the node we've used in a 
keystone DT.
The node is planned to be used only via syscon phandle, there is no 
driver for it,
and compatible string for "ti,keystone-devctrl" added only to be matched by
a high-level device driver if needed.

I'll send new v6 series to you also.
Once again sorry.

-- 
Regards,
Ivan Khoronzhuk

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
