From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [RFC 3/7] bcm47xx-sprom: add Broadcom sprom parser driver
Date: Mon, 25 Aug 2014 17:01:27 +0200
Message-ID: <CAOiHx=kcnZqkUxTc64oWWnyet2wXZe+3A1Lt2C5kvjgVjgwcVw@mail.gmail.com>
References: <1408915485-8078-1-git-send-email-hauke@hauke-m.de>
 <1408915485-8078-5-git-send-email-hauke@hauke-m.de> <8344390.rjnOcYBCET@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8344390.rjnOcYBCET@wuerfel>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 25, 2014 at 9:52 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Sunday 24 August 2014 23:24:41 Hauke Mehrtens wrote:
>> This driver needs an nvram driver and fetches the sprom values from the
>> nvram and provides it to any other driver. The calibration data for the
>> wifi chip the mac address and some more board description data is
>> stores in the sprom.
>>
>> This is based on a copy of arch/mips/bcm47xx/sprom.c and my plan is to
>> make the bcm47xx MIPS SoCs also use this driver some time later.
>
>> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
>> ---
>>  .../devicetree/bindings/misc/bcm47xx-sprom.txt     |  16 +
>
> I'd prefer not to list the binding in a 'misc' category. Maybe we can
> have a new category and move the misc/sram.txt into the same?
>
>>  drivers/misc/Kconfig                               |  14 +
>>  drivers/misc/Makefile                              |   1 +
>>  drivers/misc/bcm47xx-sprom.c                       | 690 +++++++++++++++++++++
>
> On a similar note, putting the driver into drivers/misc seems
> suboptimal: misc drivers should by definition be something that
> is for some odd hardware with no external dependencies on it,
> whereas your driver seems to be used by multiple other drivers.
>
> Would it make sense to put it into drivers/bcma when that is the
> only bus it is used on?

If the driver will be used for bcm47xx/mips, it will be used for two
busses, bcma and ssb, so it will need to be at a common
location.


Jonas
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
