From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 1/6] watchdog: davinci: change driver to use WDT core
Date: Tue, 26 Nov 2013 04:10:16 -0800
Message-ID: <52948FA8.7000609@roeck-us.net>
References: <1385388285-10553-1-git-send-email-ivan.khoronzhuk@ti.com> <1385388285-10553-2-git-send-email-ivan.khoronzhuk@ti.com> <52948184.50604@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52948184.50604-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/26/2013 03:09 AM, Grygorii Strashko wrote:
> On 11/25/2013 04:04 PM, Ivan Khoronzhuk wrote:
>> To reduce code duplicate and increase code readability use WDT core
>> code to handle WDT interface.
>>
>> Remove io_lock as the WDT core uses mutex to lock each wdt device.
>> Remove wdt_state as the WDT core tracks state with its own variable.
>>
>> The watchdog_init_timeout() can read timeout value from timeout-sec
>> property if the passed value is out of bounds. The heartbeat is
>> initialized in next way. If heartbeat is not set thought module
>> parameter, try to read it's value from WDT node timeout-sec property.
>> If node has no one, use default value.
>>
>> The heartbeat is hold in wdd->timeout by WDT core, so use it in
>> order to set timeout period.
>>
>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
>> Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
>> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>> ---
>>   arch/arm/mach-davinci/da8xx-dt.c      |    2 +-
>>   arch/arm/mach-davinci/devices-da8xx.c |    4 +-
>>   arch/arm/mach-davinci/devices.c       |    2 +-
>>   drivers/watchdog/Kconfig              |    2 +
>>   drivers/watchdog/davinci_wdt.c        |  151 ++++++++-------------------------
>>   5 files changed, 43 insertions(+), 118 deletions(-)
>
> Pls note, that this patch contains both changes in platform and driver code to fix regression reported by Sekhar Nori on v2 of this series and caused by driver name changing.
>
> Is it ok?
>
> It can be splitted, but then both patches will introduce regression by itself and thing will work only if both of them will be applied together.
>
Splitting it would break bisect, even if applied together, so I don't think this would be a good idea.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
