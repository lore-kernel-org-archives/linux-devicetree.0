From: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 1/5] watchdog: davinci: change driver to use WDT core
Date: Wed, 4 Dec 2013 21:06:43 +0200
Message-ID: <529F7D43.2030707@ti.com>
References: <1385556508-3935-1-git-send-email-ivan.khoronzhuk@ti.com> <1385556508-3935-2-git-send-email-ivan.khoronzhuk@ti.com> <529F6EBE.5050703@ti.com> <20131204182824.GA14499@roeck-us.net> <529F7797.4080100@ti.com> <20131204185837.GA16166@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131204185837.GA16166-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/04/2013 08:58 PM, Guenter Roeck wrote:
> On Wed, Dec 04, 2013 at 08:42:31PM +0200, ivan.khoronzhuk wrote:
>> On 12/04/2013 08:28 PM, Guenter Roeck wrote:
>>> On Wed, Dec 04, 2013 at 11:34:46PM +0530, Sekhar Nori wrote:
>>>> On 11/27/2013 6:18 PM, Ivan Khoronzhuk wrote:
>>>>> To reduce code duplicate and increase code readability use WDT core
>>>>> code to handle WDT interface.
>>>>>
>>>>> Remove io_lock as the WDT core uses mutex to lock each wdt device.
>>>>> Remove wdt_state as the WDT core tracks state with its own variable.
>>>>>
>>>>> The watchdog_init_timeout() can read timeout value from timeout-sec
>>>>> property if the passed value is out of bounds. The heartbeat is
>>>>> initialized in next way. If heartbeat is not set thought module
>>>>> parameter, try to read it's value from WDT node timeout-sec property.
>>>>> If node has no one, use default value.
>>>>>
>>>>> The heartbeat is hold in wdd->timeout by WDT core, so use it in
>>>>> order to set timeout period.
>>>>>
>>>>> Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
>>>>> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>>>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
>>>>> ---
>>>>>    drivers/watchdog/Kconfig       |    2 +
>>>>>    drivers/watchdog/davinci_wdt.c |  147 ++++++++++------------------------------
>>>>>    2 files changed, 37 insertions(+), 112 deletions(-)
>>>>>
>>>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>>>> index 5be6e91..eb8c89d 100644
>>>>> --- a/drivers/watchdog/Kconfig
>>>>> +++ b/drivers/watchdog/Kconfig
>>>>> @@ -271,6 +271,8 @@ config IOP_WATCHDOG
>>>>>    config DAVINCI_WATCHDOG
>>>>>    	tristate "DaVinci watchdog"
>>>>>    	depends on ARCH_DAVINCI
>>>>> +	select WATCHDOG_CORE
>>>>> +	select WATCHDOG_NOWAYOUT
>>>>
>>>> Its not clear for change log why NOWAYOUT needs to be forced on all the
>>>> time for all users of DaVinci watchdog.
>>
>> ... you are right
>>
>>>>
>>> Actually, thinking about it, it is not necessary and can be replaced with
>>>
>>> 	watchdog_set_nowayout(wdd, 1);
>>
>> Good idea, I'll replace watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT) on it.
>> And delete "select WATCHDOG_NOWAYOUT"
>>
>>>
>>> In other words, there is no need to force NOWAYOUT on _other_ watchdogs which
>>> may be present in the system. Still, you are right, it would be nice to explain
>>> in the changelog (or maybe even better as comment in the code) why it is
>>> enforced.
>>>
>>> Guenter
>>>
>>
>> Only question, should I repost only this patch or whole series?
>>
> Reposting only this patch should be sufficient if the others did not change.
>
> Thanks,
> Guenter
>

Thanks.
It is a pity, but along with this patch I have to change 2 patches,
so I'll send whole series.

-- 
Regards,
Ivan Khoronzhuk
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
