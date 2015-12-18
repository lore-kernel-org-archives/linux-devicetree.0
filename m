From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH linux-next 0/5] mtd: spi-nor: add driver for Atmel QSPI
 controller
Date: Thu, 17 Dec 2015 16:41:29 -0800
Message-ID: <20151218004129.GF10460@google.com>
References: <cover.1449494420.git.cyrille.pitchen@atmel.com>
 <20151207193441.GO120110@google.com>
 <A765B125120D1346A63912DDE6D8B6310BF53437@NTXXIAMBX02.xacn.micron.com>
 <20151218002901.GE10460@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151218002901.GE10460-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "marex-ynQEQJNshbs@public.gmane.org" <marex-ynQEQJNshbs@public.gmane.org>, "vigneshr-l0cyMroinI0@public.gmane.org" <vigneshr-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 17, 2015 at 04:29:01PM -0800, Brian Norris wrote:
> On Tue, Dec 08, 2015 at 06:21:00AM +0000, Bean Huo =E9=9C=8D=E6=96=8C=
=E6=96=8C wrote:

> OK, so I think your patch is broken:
>=20
> > >     commit 548cd3ab54da ("mtd: spi-nor: Add quad I/O support for =
Micron
> > >     SPI NOR")
>=20
> How did you test this? Specifically, this can't possibly have worked
> with a regular drivers/spi/ controllers, since:
>=20
>  (a) you're enabling 4/4/4 (i.e., "Quad mode") on the flash but
>  (b) m25p80_read() only sets .rx_bits for the data; i.e., it's using
>  1/1/4 (i.e., "Extended mode")
>=20
> I'm tempted to essentially revert that, as it looks essentially
> untested. It would be nice to have a cleaner baseline before trying t=
o
> extend it with Cyrille's work.
>=20
> Cyrille, what do you think? Is my analysis at all correct here? (Sorr=
y
> if this is addressed elsewhere; there's a lot of text in this
> conversation, but I'm getting hung up very early.) And if so, does it
> hurt to just drop Micron "Quad mode" (4/4/4)?

It looks like you address some of this in patch 2, where you (as I do)
claim that Micron support is broken. It seems to me that it could be
better to kill it than to try to fix it. But maybe that's just the
frustrated maintainer in me speaking.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
