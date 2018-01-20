From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/8] watchdog: JZ4740: Register a restart handler
Date: Sat, 20 Jan 2018 21:34:35 +0530
Message-ID: <CANc+2y52ObW773=20=-gbztvoH0DSRSO1N5Srf3WYcKLZbPNBg@mail.gmail.com>
References: <20171228162939.3928-2-paul@crapouillou.net> <20171230135108.6834-1-paul@crapouillou.net>
 <20171230135108.6834-3-paul@crapouillou.net> <CANc+2y7CT150cO61RfRgc6hCLEasx+NmqCacZtaFPKLgTPyt4w@mail.gmail.com>
 <20061de8-fa1f-93eb-eb9b-089c699018aa@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20061de8-fa1f-93eb-eb9b-089c699018aa-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,

On 20 January 2018 at 21:15, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On 01/19/2018 11:31 PM, PrasannaKumar Muralidharan wrote:
>>
>> Hi Paul,
>>
>> On 30 December 2017 at 19:21, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org> wrote:
>>>
>>> The watchdog driver can restart the system by simply configuring the
>>> hardware for a timeout of 0 seconds.
>>>
>>> Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
>>> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>> ---
>>>   drivers/watchdog/jz4740_wdt.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>>   v2: No change
>>>
>>> diff --git a/drivers/watchdog/jz4740_wdt.c
>>> b/drivers/watchdog/jz4740_wdt.c
>>> index 92d6ca8ceb49..fa7f49a3212c 100644
>>> --- a/drivers/watchdog/jz4740_wdt.c
>>> +++ b/drivers/watchdog/jz4740_wdt.c
>>> @@ -130,6 +130,14 @@ static int jz4740_wdt_stop(struct watchdog_device
>>> *wdt_dev)
>>>          return 0;
>>>   }
>>>
>>> +static int jz4740_wdt_restart(struct watchdog_device *wdt_dev,
>>> +                             unsigned long action, void *data)
>>> +{
>>> +       wdt_dev->timeout = 0;
>>> +       jz4740_wdt_start(wdt_dev);
>>> +       return 0;
>>> +}
>>> +
>>>   static const struct watchdog_info jz4740_wdt_info = {
>>>          .options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
>>> WDIOF_MAGICCLOSE,
>>>          .identity = "jz4740 Watchdog",
>>> @@ -141,6 +149,7 @@ static const struct watchdog_ops jz4740_wdt_ops = {
>>>          .stop = jz4740_wdt_stop,
>>>          .ping = jz4740_wdt_ping,
>>>          .set_timeout = jz4740_wdt_set_timeout,
>>> +       .restart = jz4740_wdt_restart,
>>>   };
>>>
>>>   #ifdef CONFIG_OF
>>> --
>>> 2.11.0
>>>
>>>
>>
>> Noticed that min_timeout of the watchdog device is set to 1 but this
>> function calls start with timeout set to 0. Even though this works I
>> feel it is better to set min_timeout to 0.
>>
>
> No. That would be wrong. If you want to be pedantic, write a new function
> __jz4740_wdt_set_timeout(u16 clock_div, u16 timeout_value) and call it
> instead, but don't mess with min_timeout.
>
> Guenter

What is the effect of changing min_timeout? I could see only
validation checks with it.

Thanks,
PrasannaKumar
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
