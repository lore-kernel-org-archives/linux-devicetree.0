From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/2] watchdog: Add Aspeed watchdog driver
Date: Tue, 10 May 2016 06:25:09 -0700
Message-ID: <5731E135.8000100@roeck-us.net>
References: <1462797277-14969-1-git-send-email-joel@jms.id.au>
 <1462797277-14969-3-git-send-email-joel@jms.id.au>
 <5730A339.80006@roeck-us.net>
 <CACPK8XfK4Qt2GaSL7eVoNkCawbtXqFX9bGRcgyAyq7R2yuSZkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8XfK4Qt2GaSL7eVoNkCawbtXqFX9bGRcgyAyq7R2yuSZkA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Joel,

On 05/10/2016 04:10 AM, Joel Stanley wrote:

[ ... ]

>>> +
>>> +       /*
>>> +        * The ast2400 wdt can run at PCLK, or 1MHz. The ast2500 only
>>> +        * runs at 1MHz. We chose to always run at 1MHz, as there's no
>>> +        * good reason to have a faster watchdog counter.
>>> +        */
>>> +       wdt->rate = 1000000;
>>
>>
>> Why not just use a define ?
>
> I will add one.
>
> The comment is informative though for people who read the ast2400
> datasheet and wonder why we don't provide the option clocking with
> pclk, I will leave it in.
>

The comment is ok. I just find it unnecessary to have a variable
instead of a constant.

[ ... ]
>
>> ctrl is really static except for the enable flag. Not really sure
>> if having a variable for it has any real benefits - you might as well
>> just read the register and update the enable flag instead as needed when
>> starting or stopping the watchdog. Is there a reason for not doing that ?
>
> Not really. I find it cleaner to keep a copy of the register instead
> of read-modify-write, but if you feel strongly about it I can change.
>

No worries. Not worth arguing about.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
