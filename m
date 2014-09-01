From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 3/7] bcm47xx-sprom: add Broadcom sprom parser driver
Date: Mon, 1 Sep 2014 11:24:40 +0200
Message-ID: <CACna6rzx4uc3V=pxK-B-TvDov9A4sMSs=TDP+7=XpdqfTOFoHw@mail.gmail.com>
References: <1408915485-8078-1-git-send-email-hauke@hauke-m.de>
	<1408915485-8078-5-git-send-email-hauke@hauke-m.de>
	<8344390.rjnOcYBCET@wuerfel>
	<53FCFCF0.2010704@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53FCFCF0.2010704-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26 August 2014 23:32, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org> wrote:
> On 08/25/2014 09:52 AM, Arnd Bergmann wrote:
>> On Sunday 24 August 2014 23:24:41 Hauke Mehrtens wrote:
>>>  drivers/misc/Kconfig                               |  14 +
>>>  drivers/misc/Makefile                              |   1 +
>>>  drivers/misc/bcm47xx-sprom.c                       | 690 +++++++++++++++++++++
>>
>> On a similar note, putting the driver into drivers/misc seems
>> suboptimal: misc drivers should by definition be something that
>> is for some odd hardware with no external dependencies on it,
>> whereas your driver seems to be used by multiple other drivers.
>>
>> Would it make sense to put it into drivers/bcma when that is the
>> only bus it is used on?
>
> As Jonas already said this code should be used for the bcm53xx ARM code
> and the bcm47xx MIPS code and it is needed for drivers/bcma/ and
> drivers/ssb/ (ssb only for old mips devices). Do you have any better
> idea than putting this to drivers/misc/ ? For the mips SoC we need the
> code very early and will not use the driver interface but probably
> directly call the function name.

Ping? Does anyone have any better idea?

Both: nvram and sprom drivers will be used by bcm47xx (mips) and
bcm53xx (arm). They can't be put in drivers/bcma, as they are used by
drivers/ssb as well.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
