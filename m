From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v6 1/2] drivers: watchdog: add a driver to support SAMA5D4
 watchdog timer
Date: Thu, 27 Aug 2015 19:57:56 -0700
Message-ID: <55DFCE34.3030508@roeck-us.net>
References: <1438856146-2459-1-git-send-email-wenyou.yang@atmel.com> <1438856206-2503-1-git-send-email-wenyou.yang@atmel.com> <55C4CDEB.9020505@roeck-us.net> <B256D81BAE5131468A838E5D7A243641C9F967D2@penmbx01>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <B256D81BAE5131468A838E5D7A243641C9F967D2@penmbx01>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org" <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org" <sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/27/2015 06:30 PM, Yang, Wenyou wrote:
>
>
>> -----Original Message-----
>> From: Guenter Roeck [mailto:linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org]
>> Sent: 2015=C4=EA8=D4=C27=C8=D5 23:26
>> To: Yang, Wenyou; wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; pawel.moll@arm.=
com;
>> mark.rutland-5wv7dgnIgG8@public.gmane.org; ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org; galak@codeauror=
a.org
>> Cc: sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org; Ferre, Nicolas; boris.brezillon@fre=
e-
>> electrons.com; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TasMV2rI37PzA@public.gmane.org=
org; linux-
>> watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [PATCH v6 1/2] drivers: watchdog: add a driver to suppo=
rt SAMA5D4
>> watchdog timer
>>
>> On 08/06/2015 03:16 AM, Wenyou Yang wrote:
>>> >From SAMA5D4, the watchdog timer is upgrated with a new feature,
>>> which is describled as in the datasheet, "WDT_MR can be written unt=
il
>>> a LOCKMR command is issued in WDT_CR".
>>> That is to say, as long as the bootstrap and u-boot don't issue a
>>> LOCKMR command, WDT_MR can be written more than once in the driver.
>>>
>>> So the SAMA5D4 watchdog driver's implementation is different from t=
he
>>> at91sam9260 watchdog driver implemented in file at91sam9_wdt.c.
>>> The user application open the device file to enable the watchdog ti=
mer
>>> hardware, and close to disable it, and set the watchdog timer timeo=
ut
>>> by seting WDV and WDD fields of WDT_MR register, and ping the watch=
dog
>>> by issuing WDRSTT command to WDT_CR register with hard-coded key.
>>>
>>> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>
>> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>
> Hi Vim,
>
> Can this patch series be merged? Could you please?
>
It is included in the pull request I sent to Wim last week.

Guenter


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
