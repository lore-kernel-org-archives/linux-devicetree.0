From: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 0/6] Update Davinci watchdog driver
Date: Mon, 25 Nov 2013 18:44:02 +0200
Message-ID: <52937E52.8070502@ti.com>
References: <1384795139-19466-1-git-send-email-ivan.khoronzhuk@ti.com> <52934B6C.4060308@ti.com> <52934E7C.9040102@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52934E7C.9040102-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Strashko Grygorii <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/25/2013 03:19 PM, ivan.khoronzhuk wrote:
> On 11/25/2013 03:06 PM, Sekhar Nori wrote:
>> On Monday 18 November 2013 10:48 PM, Ivan Khoronzhuk wrote:
>>> These patches are intended to update Davinci watchdog to use WDT core
>>> and reuse driver for keystone arch, because Keystone uses the similar
>>> IP like Davinci.
>>
>> This series causes a regression on all DaVinci platforms because after
>> the series is applied the watchdog device does not get registered at
>> all. Since you changed the device name please include a patch to fix the
>> platform references too.
>>
>> Thanks,
>> Sekhar
>>
>
> Ok, I will replace
>

Sekhar I have replaced names in new patch seria
https://lkml.org/lkml/2013/11/25/461
at watchdog: davinci: change driver to use WDT core

Is it OK for you?

-- 
Regards,
Ivan Khoronzhuk
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
