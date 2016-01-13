From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/4] mtd: atmel_nand: Add support for NAND Flash on
 SAMA5D2
Date: Wed, 13 Jan 2016 12:46:32 +0100
Message-ID: <56963918.7040809@atmel.com>
References: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
 <56951F91.1090101@atmel.com>
 <CAGkQfmOmgiKwziQ+HuJTN1Qk1aHEXBWYcE1LT+XT2d-Xv7kxNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGkQfmOmgiKwziQ+HuJTN1Qk1aHEXBWYcE1LT+XT2d-Xv7kxNw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 12/01/2016 17:55, Romain Izard a =C3=A9crit :
> Hi Nicolas,
>=20
> 2016-01-12 16:45 GMT+01:00 Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>:
>>
>> The maintainers for this driver changed very recently, so you'll hav=
e to
>> includes these names to your CC list:
>>
>> M:      Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> M:      Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>
>=20
> Ok. It might be a good idea to update the MAINTAINERS file, as Josh W=
u's atmel
> address now bounces, and it is still referenced there.

It's already done and pushed to arm-soc. It's in linux-next:
http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/MA=
INTAINERS#n2000

It will appear in Linus' tree in a couple of days ;-)

>> I also think that Wenyou did some work regarding this support. So yo=
u'll
>> have to coordinat together.
>=20
> Is it possible to know what are the developments in progress regardin=
g SAMA5D2
> drivers? The github repository does not expose any working trees, and=
 only the

Which github repository are you talking about?

The Linux4SAM github contains all that is need to work with sama5d2
(linux-4.1-at91 branch):
https://github.com/linux4sam/linux-at91/tree/linux-4.1-at91

Developments in progress are listed in the Linux4SAM page:
http://www.at91.com/linux4sam/bin/view/Linux4SAM/Sama5d2XplainedMainPag=
e

I admit that it's not copleted, but you'll have an idea here as well:
http://www.at91.com/linux4sam/bin/view/Linux4SAM/Sama5d2XplainedMainPag=
e

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
