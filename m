From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3] watchdog: GPIO-controlled watchdog
Date: Fri, 06 Dec 2013 23:14:35 -0800
Message-ID: <52A2CADB.2070700@roeck-us.net>
References: <1385798072-3886-1-git-send-email-shc_work@mail.ru> <20131207105258.b9597225842794cadd15e08f@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131207105258.b9597225842794cadd15e08f-JGs/UdohzUI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/06/2013 10:52 PM, Alexander Shiyan wrote:
> On Sat, 30 Nov 2013 11:54:32 +0400
> Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org> wrote:
>
>> This patch adds a watchdog driver for devices controlled through GPIO,
>> (Analog Devices ADM706, Maxim MAX823, National NE555 etc).
>>
>> Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
>> ---
>>   .../devicetree/bindings/watchdog/gpio-wdt.txt      |  23 ++
>>   drivers/watchdog/Kconfig                           |   8 +
>>   drivers/watchdog/Makefile                          |   1 +
>>   drivers/watchdog/gpio_wdt.c                        | 254 +++++++++++++++++++++
>>   4 files changed, 286 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
>>   create mode 100644 drivers/watchdog/gpio_wdt.c
> ...
>
> Ping.
>

Wim typically only finds the time to look at pending patches a couple of weeks before
the next commit window opens. I'll send him a reminder with all patches I am aware of
in a week or so. I have this one in my list.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
