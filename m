From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 0/5] Update Davinci watchdog driver
Date: Thu, 26 Dec 2013 13:20:56 -0500
Message-ID: <52BC7388.3040302@ti.com>
References: <1386185970-14488-1-git-send-email-ivan.khoronzhuk@ti.com> <52A5EF6B.6060700@ti.com> <52ACAED4.7000305@ti.com> <52BC6D76.7000400@ti.com> <20131226181725.GL10136@spo001.leaseweb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131226181725.GL10136-1F/o1hAF34+bEvaWgpTR7kEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 26 December 2013 01:17 PM, Wim Van Sebroeck wrote:
> Hi Santosh,
> 
>>>> On Wednesday 04 December 2013 02:39 PM, Ivan Khoronzhuk wrote:
>>>>> These patches are intended to update Davinci watchdog to use WDT core
>>>>> and reuse driver for keystone arch, because Keystone uses the similar
>>>>> IP like Davinci.
>>>>>
>>>>
>>>> [..]
>>>>
>>>>> v4..v5:
>>>>> - watchdog: davinci: change driver to use WDT core
>>>>> 	switched off CONFIG_WATCHDOG_NOWAYOUT option
>>>>>
>>>> Can you please apply the series to your watchdog tree ?
>>>> Do let me know if you want us to prepare a git branch
>>>> to pull from.
>>>>
>>> ping..
>>>
>> I haven't heard anything on this yet from you Wim.
>>
>> Guenter,
>> I have seen you actively reviewing the $subject patch series.
>> Will you be able to pick the series up for 3.14 merge window
>> considering almost no response from Wim so far on it ?
> 
> I have review the patches and they will go in my tree tomorrow.

Thanks Wim.

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
