From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Extending wdt-gpio to be used on non-of (no DT) platforms
Date: Sat, 29 Mar 2014 14:51:34 +0100
Message-ID: <CACna6rw5eryfe_yFzUs4oTv697LudngogmdOJNK-P8Qq12fJLQ@mail.gmail.com>
References: <CACna6rwRzw1fo2_DyV3T4fa4+cA3=LTcFHRpRsfZWwR2ugQn_w@mail.gmail.com>
	<1396096185.560264234@f368.i.mail.ru>
	<5336C7B8.90707@hauke-m.de>
	<1396100017.585010881@f331.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396100017.585010881-zErZ3GTiYPVsdVUOrk1QfQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, m.adam--linux-kMOp4+VwI+uzQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

2014-03-29 14:33 GMT+01:00 Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>:
> Sat, 29 Mar 2014 14:16:40 +0100 =D0=BE=D1=82 Hauke Mehrtens <hauke@ha=
uke-m.de>:
>> The Huawei E970, the only device with a bcm47xx SoC which uses this =
gpio
>> watchdog I know of, needs the gpio driver very early. It is not poss=
ible
>> to deactivate the watchdogs, so it has to get trigged very early in =
the
>
> Why it cannot be deactivated?
> The driver has been designed for ADM70x ICs, where watchdog is
> deactivated by set GPIO to tristate.

I'm not sure how to achieve tri-state with Broadcom SoC. Our code is in=
:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/bcma/driver_gpio.c

We have bcma_chipco_gpio_control that sets if GPIO is controlled by
ChipCommon (part of the SoC, one of many cores).
Maybe setting GPIO to be *not* controlled by ChipCommon will make it tr=
i-state?

Any other ideas?

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
