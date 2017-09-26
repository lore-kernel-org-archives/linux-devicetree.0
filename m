From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 1/2] watchdog: dw_wdt: add stop watchdog operation
Date: Tue, 26 Sep 2017 00:06:45 -0700
Message-ID: <1bd8aa83-97bc-550b-3a2b-46ae857e21c1@roeck-us.net>
References: <20170925052531.1692-1-o.rempel@pengutronix.de>
 <20170925161643.GA32601@roeck-us.net>
 <2203f151-99c8-6c58-8766-70813fafe64d@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2203f151-99c8-6c58-8766-70813fafe64d-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/25/2017 10:17 PM, Oleksij Rempel wrote:
> Hi,
> 
> On 25.09.2017 18:16, Guenter Roeck wrote:
>> On Mon, Sep 25, 2017 at 07:25:30AM +0200, Oleksij Rempel wrote:
>>> From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>>
>>> The only way of stopping the watchdog is by resetting it.
>>> Add the watchdog op for stopping the device and reset if
>>> a reset line is provided.
>>>
>>> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> Signed-off-by: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
>>> Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>> Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> ---
>>>
>>> changes v3:
>>>   - don't return error if rst is not present and set WDOG_HW_RUNNING bit
>>>     to notify watchdog core.
>>>
>>> changes v2:
>>>   - test if dw_wdt->rst is NULL instead of IS_ERR
>>>
>>>   drivers/watchdog/dw_wdt.c | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
>>> index 36be987ff9ef..6cc56b18ee52 100644
>>> --- a/drivers/watchdog/dw_wdt.c
>>> +++ b/drivers/watchdog/dw_wdt.c
>>> @@ -135,6 +135,21 @@ static int dw_wdt_start(struct watchdog_device *wdd)
>>>       return 0;
>>>   }
>>> +static int dw_wdt_stop(struct watchdog_device *wdd)
>>> +{
>>> +    struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
>>> +
>>> +    if (!dw_wdt->rst) {
>>> +        set_bit(WDOG_HW_RUNNING, &wdd->status);
>>
>> Setting WDOG_HW_RUNNING should be dropped from dw_wdt_start().
> 
> you mean, this patch is OK, and i need to provide one more which is removing WDOG_HW_RUNNING from dw_wdt_start(). Correct?
> 

No. You are providing a stop function, thus the start function should not set the flag.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
