From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND controller
Date: Sat, 7 Mar 2015 22:48:28 +0100
Message-ID: <CACna6rwMv0HcyfThhsQucHviG_-vamtbig_PxGUY-t+WGESqsA@mail.gmail.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
	<1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
	<CACna6rzkEQu+LYchckFpLLxkvyMYK7N84nrGu8p0rjRsRbFzfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6rzkEQu+LYchckFpLLxkvyMYK7N84nrGu8p0rjRsRbFzfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7 March 2015 at 18:39, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> On 7 March 2015 at 02:18, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>> This core originated in Set-Top Box chips (BCM7xxx) but is used in a
>> variety of other Broadcom chips, including some BCM63xxx, BCM33xx, a=
nd
>> iProc/Cygnus. It's been used only on ARM and MIPS SoCs, so restrict =
it
>> to those architectures.
>>
>> There are multiple revisions of this core throughout the years, and
>> almost every version broke register compatibility in some small way,=
 but
>> with some effort, this driver is able to support v4.0, v5.0, v6.x, v=
7.0,
>> and v7.1. It's been tested on v5.0, v6.0, v7.0, and v7.1 recently, s=
o
>> there hopefully are no more lurking inconsistencies.
>
> Unfortunately, it seems I can't make this driver work with my BCM4708
> based router. This is a SoC with 6.01 controller.
>
> Sometimes I get this:
> [    0.478443] brcmstb_nand 18028000.nand: timeout waiting for comman=
d 255 (9)
> [    0.485385] brcmstb_nand 18028000.nand: intfc status f0000000
> [    0.588393] brcmstb_nand 18028000.nand: timeout waiting for comman=
d 144 (7)
> [    0.595326] brcmstb_nand 18028000.nand: intfc status f0000000
> [    0.698392] brcmstb_nand 18028000.nand: timeout waiting for comman=
d 144 (7)
> [    0.705322] brcmstb_nand 18028000.nand: intfc status f0000000
> [    0.711051] nand: second ID read did not match 20,20 against 20,00
> [    0.717197] nand: No NAND device found
>
> Other time:
> [    0.478441] brcmstb_nand 18028000.nand: timeout waiting for comman=
d 255 (9)
> [    0.485385] brcmstb_nand 18028000.nand: intfc status f0000000
> [    0.588396] brcmstb_nand 18028000.nand: timeout waiting for comman=
d 144 (7)
> [    0.595327] brcmstb_nand 18028000.nand: intfc status f0000000
> [    0.698393] brcmstb_nand 18028000.nand: timeout waiting for comman=
d 144 (7)
> [    0.705321] brcmstb_nand 18028000.nand: intfc status f0000000
> [    0.808394] brcmstb_nand 18028000.nand: timeout waiting for comman=
d 144 (7)
> [    0.815326] brcmstb_nand 18028000.nand: intfc status f0000000
> [    0.918392] brcmstb_nand 18028000.nand: timeout waiting for comman=
d 144 (7)
> [    0.925322] brcmstb_nand 18028000.nand: intfc status f0000000
> [    0.931047] nand: No NAND device found
>
> (Btw. I guess you could use 0x%x instead of %d for printing commands)=
=2E
>
> It seems that brcmnand_ctlrdy_irq never fires on my device. Just like
> controller was never generating any IRQ.

Oh, damn, I was doing sth stupid. I copied example from Documentation
which has "brcm,nandcs" with reg =3D <1>;. That was wrong of course.
after changing chip from 1 to 0 I got:

[    1.688413] brcmstb_nand 18028000.nand: timeout waiting for command =
255 (9)
[    1.695355] brcmstb_nand 18028000.nand: intfc status f0000000
[    1.808384] brcmstb_nand 18028000.nand: timeout waiting for command =
144 (7)
[    1.815320] brcmstb_nand 18028000.nand: intfc status f0000000
[    1.928385] brcmstb_nand 18028000.nand: timeout waiting for command =
144 (7)
[    1.935312] brcmstb_nand 18028000.nand: intfc status f0000000
[    2.048460] brcmstb_nand 18028000.nand: timeout waiting for command =
144 (7)
[    2.055392] brcmstb_nand 18028000.nand: intfc status f0000000
[    2.168386] brcmstb_nand 18028000.nand: timeout waiting for command =
144 (7)
[    2.175315] brcmstb_nand 18028000.nand: intfc status f0000000
[    2.185640] nand: device found, Manufacturer ID: 0x92, Chip ID: 0xf1
[    2.191967] nand: Eon NAND 128MiB 3,3V 8-bit
[    2.196221] nand: 128 MiB, SLC, erase size: 128 KiB, page size:
2048, OOB size: 64
[    2.203784] brcmstb_nand 18028000.nand: detected 128MiB total,
128KiB blocks, 2KiB pages, 16B OOB, 8-bit, BCH-8

So there is still problem with lacking IRQ (and timeouts), but at
least communication with chip looks OK in general.

Of course the lost of log is also spammed in these "timeout waiting"
and driver is unusable.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
