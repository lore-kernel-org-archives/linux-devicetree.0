From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: Extending wdt-gpio to be used on non-of (no DT) platforms
Date: Mon, 31 Mar 2014 17:13:53 -0700
Message-ID: <20140401001353.GB30453@roeck-us.net>
References: <CACna6rwRzw1fo2_DyV3T4fa4+cA3=LTcFHRpRsfZWwR2ugQn_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACna6rwRzw1fo2_DyV3T4fa4+cA3=LTcFHRpRsfZWwR2ugQn_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 29, 2014 at 12:54:40PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> Hi guys,
>=20
> I've noticed gpio_wdt was added to the kernel to support some devices
> based on devicetree.
> We used to have our own (not mainlined) gpio_wdt in OpenWrt project:
> http://git.openwrt.org/?p=3Dopenwrt.git;a=3Dblob;f=3Dtarget/linux/gen=
eric/patches-3.10/990-gpio_wdt.patch;hb=3DHEAD
>=20
> The main difference is that the mainlined one uses OF, while OpenWrt'=
s
> one uses plain platform API (with struct gpio_wdt_platform_data).
>=20
> I wanted to bring a topic of mainlining OpenWrt's solution. We
> definitely need that and at the same time our device(s) don't use OF =
/
> DT.
>=20
> Do you think we should extend wdt-gpio to handle that? Or do you thin=
k
> this driver is so small, it's not worth it and we should submit a
> separated one?
>=20
> Apart from API being used, one other difference I see is OpenWrt
> supports different values for "first tick" and "interval". But that
> could be easily handled.
>=20
If you can sort out those differences, I would suggest to add platform =
data
support to the existing upstream driver.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
