From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 0/5] Update Davinci watchdog driver
Date: Wed, 4 Dec 2013 23:40:13 +0530
Message-ID: <529F7005.9010904@ti.com>
References: <1385556508-3935-1-git-send-email-ivan.khoronzhuk@ti.com> <5298943D.8010608@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5298943D.8010608-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/29/2013 6:48 PM, Grygorii Strashko wrote:
> Hi Sekhar,
> 
> On 11/27/2013 02:48 PM, Ivan Khoronzhuk wrote:
>> These patches are intended to update Davinci watchdog to use WDT core
>> and reuse driver for keystone arch, because Keystone uses the similar
>> IP like Davinci.
>>
>> See Documentation:
>> Davinci DM646x - http://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
>> Keystone - http://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
>>
>> Also:
>>   - improved to support GET_TIMELEFT option.
>>   - added "clocks" and "timeout-sec" properties to DT.
> 
> Do you have any additional comments to this series?

I have one comment I just sent out and apart from that the series looks
good to go from my side.

> 
> By the way patch "[PATCH] watchdog: davinci: rename platform driver to davinci-wdt"
> https://lkml.org/lkml/2013/11/27/201 can be applied as before as after this series
> without conflicts.

Yes, I want to queue it from DaVinci tree just because of the amount of
DaVinci code that patch touches, but need ack from Wim before I do that.

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
