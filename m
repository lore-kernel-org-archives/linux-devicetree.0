From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 0/9] ARM: dts: Add compatible property to "partitions" node
Date: Wed, 23 Dec 2015 15:21:29 +0100
Message-ID: <CAMuHMdVJY6+vFvO44kQkzbPJGDkY8SfRz3Dwt4-_RVJL2o=pdw@mail.gmail.com>
References: <1450694033-27717-1-git-send-email-geert+renesas@glider.be>
	<20151222212350.GF30172@localhost>
	<87egedfmsm.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87egedfmsm.fsf-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Olof, Gregory,

On Wed, Dec 23, 2015 at 12:04 PM, Gregory CLEMENT
<gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>  On mar., d=C3=A9c. 22 2015, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>> On Mon, Dec 21, 2015 at 11:33:44AM +0100, Geert Uytterhoeven wrote:
>>> As of commit e488ca9f8d4f62c2 ("doc: dt: mtd: partitions: add compa=
tible
>>> property to "partitions" node"), which is in v4.4-rc6, the "partiti=
ons"
>>> subnode of an SPI FLASH device node must have a compatible property=
=2E The
>>> partitions are no longer detected if it is not present.
>>>
>>> However, several DTSes in -next have already been converted to the
>>> "partitions" subnode without "compatible" property, introduced by
>>> commits 5cfdedb7b9a0fe38 ("mtd: ofpart: move ofpart partitions to a
>>> dedicated dt node") and fe2585e9c29a650a ("doc: dt: mtd: support
>>> partitions in a special 'partitions' subnode"). Hence all of these =
are
>>> now broken in -next, and will be broken in upstream during the merg=
e
>>> window.
>>
>> So, if I understand this correctly, the partitions format was added =
for v4.4,
>> then this non-backwards compatible change was added in -rc6. But, th=
ere were
>> also DT files that had the new-for-v4.4 partitions nodes in them tha=
t then
>> stopped working in -rc6?
>
> At least for the mvebu dts, the change was added for v4.5 not
> v4.4. Currently it is only in the next branches (and also in your
> arm-soc tree in next/dt).

The same is true for the shmobile changes: they are queued up for v4.5.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
