From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2] watchdog: add Alphascale asm9260-wdt driver
Date: Mon, 23 Nov 2015 07:47:01 -0800
Message-ID: <565334F5.7020803@roeck-us.net>
References: <20151027023132.GA1270@roeck-us.net>
 <1446714416-22587-1-git-send-email-linux@rempel-privat.de>
 <1446714416-22587-2-git-send-email-linux@rempel-privat.de>
 <20151105204301.GA15806@rob-hp-laptop> <5652BC30.7060803@rempel-privat.de>
 <5652BFA5.9010101@roeck-us.net> <5652E1A7.2090108@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5652E1A7.2090108-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/23/2015 01:51 AM, Oleksij Rempel wrote:

>>>>
>>>> Seems like this should be a generic wdog property.
>>>>
>>>
>>> what do you mean?
>>> Using "mode" instead of "alphascale,mode" and implement it in WD
>>> framework?
>>>
>>
>> You should still read the property in the driver, even it if is made
>> generic.
>> The watchdog framework can't really use the information, most drivers don't
>> support selecting the mode. We can consider moving it into the framework
>> if/when it benefits other drivers.
>>
>> On a side note, I would suggest "software" and "hardware" instead of sw
>> / hw,
>> but that is just a personal preference.
>
> Ok, then i will leave it for now as is. If "mode" will be introduced, it
> can brake compatibility. Using "alphascale,mode" feels save :)
>
Not sure I understand. Using a generic property name doesn't mean anything
about its implementation. Devicetree properties are supposed to be OS and
implementation independent, no ?

Guenter

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
