From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to automatically
 determine bus width
Date: Sat, 30 Nov 2013 08:17:22 -0300
Message-ID: <20131130111721.GA2330@localhost>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131127012158.GR9468@ld-irv-0074.broadcom.com>
 <20131127012338.GS9468@ld-irv-0074.broadcom.com>
 <20131129122551.GC2815@localhost>
 <20131130091556.GD29397@norris.computersforpeace.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131130091556.GD29397-7ciq9WCbhwJWVhifINYOO1poFGfAdsVx5NbjCUgZEJk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Pekon Gupta <pekon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Brian,

On Sat, Nov 30, 2013 at 01:15:56AM -0800, Brian Norris wrote:
>=20
> > Can anyone help me understand if there's *any* valid use case where=
 we
> > want to specify a-priori the bus width, considering it's completely
> > discoverable at run-time?
>=20
> I think the primary use case should be to reflect a limitation in the
> hardware (besides just the flash chip). It can mean that the controll=
er
> itself only supports one bus width, or that the board is only wired u=
p
> for x8, for instance.
>=20

What do you mean by "reflect a limitation" of the hardware?

Maybe I'm not really following you, but it sounds as you're mixing up
the NAND device buswidth and the memory controller buswidth. At least
I consider them as two different parameters for two different pieces
of hardware.

Consider OMAP, just as an example. We currently have two DT properties:

1. nand-bus-width: not related to OMAP but kernel wide. It's supposed
   to specify the devices buswidth.

2. gpmc,device-width: It specifies how the controller should be
   configured (it doesn't really specify hardware, but configuration,
   sadly).

I now realise maybe this piece of DT binding is not a good example of D=
T.

Anyway, once again: Why would we need to set "nand-bus-width" to specif=
y
the flash device width given we can discover that as soon as the NAND
is detected?

Notice, that this discussion is independent of the discussion about rem=
oving
the NAND_BUSWIDTH_AUTO. It's just about removing a DT property for a
parameter that's runtime configurable.
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
