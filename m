From: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: Fwd: [PATCH 1/8] watchdog: davinci: change driver to use WDT
 core
Date: Mon, 18 Nov 2013 17:15:12 +0200
Message-ID: <528A2F00.7090302@ti.com>
References: <1383680783-12114-2-git-send-email-ivan.khoronzhuk@ti.com> <527A287C.2090401@ti.com> <5287D5A7.7060702@roeck-us.net> <5289FE60.2040207@ti.com> <528A24DE.1010507@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <528A24DE.1010507-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/18/2013 04:31 PM, Guenter Roeck wrote:
> On 11/18/2013 03:47 AM, ivan.khoronzhuk wrote:
>
>>>>    MODULE_LICENSE("GPL");
>>>> -MODULE_ALIAS_MISCDEV(WATCHDOG_MINOR);
>>>>    MODULE_ALIAS("platform:watchdog");
>>>>
>>> You might want to rename the platform driver to something like
>>> davinci-wdt and change the MODULE_ALIAS
>>> accordingly.
>>>
>>
>> Yes, it could be changed but not in this patch.
>>
> Seems to me this would be the perfect time to change it, as you switch
> to use
> the watchdog core which permits more than one active watchdog in the
> system.
>
> Guenter
>

... Yes, you are right. I'll rename it.
-- 
Regards,
Ivan Khoronzhuk
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
