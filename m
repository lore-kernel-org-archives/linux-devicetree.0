From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ARM: hip04: set ARCH_NR_GPIO to 128
Date: Mon, 01 Dec 2014 15:47:03 +0100
Message-ID: <2571535.P78Okb1jGf@wuerfel>
References: <1417156188-500-1-git-send-email-wangzhou.bry@gmail.com> <547971BF.1050706@gmail.com> <CACRpkdb1nZN-vOXLC-QFUAT9wDGM2Nm5YeH0qY_u2JV9toOaVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdb1nZN-vOXLC-QFUAT9wDGM2Nm5YeH0qY_u2JV9toOaVg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 01 December 2014 15:04:49 Linus Walleij wrote:
> On Sat, Nov 29, 2014 at 8:11 AM, Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> > On 2014=E5=B9=B411=E6=9C=8828=E6=97=A5 17:33, Arnd Bergmann wrote:
> >> On Friday 28 November 2014 14:29:47 Zhou Wang wrote:
>=20
> >>>          default 264 if MACH_H4700
> >>> +       default 128 if ARCH_HIP04
> >>>          default 0
> >>>          help
> >>>            Maximum number of GPIOs in the system.
> >>>
> >>
> >> If I remember correctly, you don't actually need to set this if al=
l gpio
> >> clients are using the new gpio descriptor interfaces instead of gp=
io
> >> numbers. Would that work for you? You'd have to know which devices
> >
> > If I don't set this, it will use the default ARCH_NR_GPIO(512), the=
n
> > the range of GPIO number will be 384~511 which is very strange to u=
sers,
> > because Hip04 based machines can only support 128 GPIOs.
>=20
> That is a totally different problem.
>=20
> Not that these numbers have ever been stable...

Right, in particular, it would be different between hisi_defconfig
and multi_v7_defconfig.

> Think of a patch to gpiochip_find_base() in
> drivers/gpio/gpiolib.c to fix this so that numbers are
> assigned a better way rather than doing
> random hacks with numbers like this.

Maybe we can find the highest number that is ever allocated
statically by any driver (since it's all from source code), and do
the dynamic allocations forward from that number instead of allocating
backward?

Or could we try to find the drivers that use DT /and/ allocate a static
number and then see if we can avoid the need for static numbers for
those?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
