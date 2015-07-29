From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 1/2] drivers: watchdog: at91sam9_wdt: add new feature
 support
Date: Tue, 28 Jul 2015 18:22:41 -0700
Message-ID: <55B82AE1.2050906@roeck-us.net>
References: <1438066825-21923-1-git-send-email-wenyou.yang@atmel.com> <1438066825-21923-2-git-send-email-wenyou.yang@atmel.com> <55B72BC0.8070206@roeck-us.net> <B256D81BAE5131468A838E5D7A243641C9F820CB@penmbx01>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <B256D81BAE5131468A838E5D7A243641C9F820CB@penmbx01>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org" <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org" <sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/28/2015 05:38 PM, Yang, Wenyou wrote:
> Hi Guenter,
>
> Thank you very much for your review.
>
>> -----Original Message-----
>> From: Guenter Roeck [mailto:linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org]
>> Sent: 2015=C4=EA7=D4=C228=C8=D5 15:14
>> To: Yang, Wenyou; wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; pawel.moll@arm.=
com;
>> mark.rutland-5wv7dgnIgG8@public.gmane.org; ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org; galak@codeauror=
a.org
>> Cc: sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org; Ferre, Nicolas; boris.brezillon@fre=
e-
>> electrons.com; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TasMV2rI37PzA@public.gmane.org=
org; linux-
>> watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Subject: Re: [PATCH 1/2] drivers: watchdog: at91sam9_wdt: add new fe=
ature
>> support
>>
>> On 07/28/2015 12:00 AM, Wenyou Yang wrote:
>>> In the datasheet, the new feature is describled as "WDT_MR can be
>>> written until a LOCKMR command is issued in WDT_CR".
>>> That is to say, as long as the bootstrap and u-boot don't issue a
>>> LOCKMR command, WDT_MR can be written in kernel.
>>>
>>> So the driver can enable/disable the watchdog timer hardware, set
>>> WDV(Watchdog Counter Value) and WDD(Watchdog Delta Value) fields of
>>> WDT_MR register to set the watchdog timer timeout.
>>>
>>> The timer is not necessary that regularly sends a keepalive ping to
>>> the watchdog timer hardware.
>>>
>>> It is introduced from sama5d4 SoCs.
>>>
>> Since there are so many changes, I wonder is a separate driver would=
 make more
>> sense.
> Yes, a bit many changes.
> I thought reuse the driver code.
> If a separate driver, I am afraid it includes much duplicated code.
> After all, it is for the same device with different feature.
>
> I don't think it is necessary to have multiple drivers for the same p=
eripheral with different feature.
>

The concept for the two mechanisms is all different: In one, the watchd=
og keepalive is triggered
from timer code. In the other, the watchdog timeout is triggered direct=
ly from the heartbeat
function. One assumes that the watchdog is always running, and that it =
must be pinged even
if closed. The other disables the watchdog on close.

What I _can_ see is that the driver is becoming an unmaintainable mess,=
 with lots of if/else
in pretty much every function. I consider this much less desirable than=
 a bit of code
duplication - if there is any. Seriously, most of the added code might =
as well be for
a completely different chip.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
