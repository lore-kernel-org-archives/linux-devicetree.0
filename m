From: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH V8 1/6] power: reset: Add generic SYSCON register mapped reset
Date: Wed, 9 Jul 2014 14:15:44 -0700
Message-ID: <CAL85gmB9wRXXrza3g0MBFWUi5w3_eCEhxdSd2FfmoB_SkGA8Ww@mail.gmail.com>
References: <1404872153-3594-1-git-send-email-fkan@apm.com>
	<1404872153-3594-2-git-send-email-fkan@apm.com>
	<53BCBCEC.7010306@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53BCBCEC.7010306-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 8, 2014 at 8:54 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On 07/08/2014 07:15 PM, Feng Kan wrote:
>>
>> Add a generic SYSCON register mapped reset mechanism.
>>
>> Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
>> ---
>>   drivers/power/reset/Kconfig         |  6 +++
>>   drivers/power/reset/Makefile        |  1 +
>>   drivers/power/reset/syscon-reboot.c | 91
>> +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 98 insertions(+)
>>   create mode 100644 drivers/power/reset/syscon-reboot.c
>>
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index bdcf517..5877b38 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -80,3 +80,9 @@ config POWER_RESET_KEYSTONE
>>         help
>>           Reboot support for the KEYSTONE SoCs.
>>
>> +config POWER_RESET_SYSCON
>> +       bool "Generic SYSCON regmap reset driver"
>> +       depends on ARM || ARM64 || COMPILE_TEST
>
>
> As written, this driver is really not generic but very arm specific.
> I don't think COMPILE_TEST is a good idea either, since arm_pm_restart
> is only defined for the arm architecture. Did you try compiling allmodconfig
> or allyesconfig for, say, x86_64 with this patch applied ?
>
> I think this might benefit from using [1], which would make it really
> generic.
>
> Guenter
>
> [1] http://www.spinics.net/lists/kernel/msg1780939.html
This is great, I will base off this list. Did it make it to a branch anywhere?

>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
