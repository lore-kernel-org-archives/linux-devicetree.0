From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 3/5] mtd: atmel_nand: Support PMECC on SAMA5D2
Date: Fri, 15 Jan 2016 09:54:07 +0100
Message-ID: <CAGkQfmO94gQ61prZvF52=B_UtOTkbYxd5nnTmDhJam4q-n3T7g@mail.gmail.com>
References: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
 <1452702857-2240-4-git-send-email-romain.izard.pro@gmail.com>
 <20160114011252.GA29778@rob-hp-laptop> <B256D81BAE5131468A838E5D7A243641D63EBC55@penmbx01>
 <CAL_JsqL9kbNYrGYeqT7QCsbMneJbPgoXfaHhCvL8S=t97YaCbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL9kbNYrGYeqT7QCsbMneJbPgoXfaHhCvL8S=t97YaCbg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob, Wenyou,

2016-01-14 14:14 GMT+01:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Wed, Jan 13, 2016 at 7:17 PM, Yang, Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>=
 wrote:
>>
>>
>>> -----Original Message-----
>>> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
>>> Sent: 2016=E5=B9=B41=E6=9C=8814=E6=97=A5 9:13
>>> To: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Yang=
, Wenyou
>>> <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>; Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>; Ferre,
>>> Nicolas <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>> Subject: Re: [PATCH v1 3/5] mtd: atmel_nand: Support PMECC on SAMA5=
D2
>>>
>>> On Wed, Jan 13, 2016 at 05:34:15PM +0100, Romain Izard wrote:
>>> > Starting with the SAMA5D2, there is a new revision of the Atmel P=
MECC
>>> > controller that can correct 32 bits in each sector. This controll=
er is
>>> > not 100% compatible with the previous revision that corrected a
>>> > maximum of 24 bits by sector, as some register addresses overlap.
>>> >
>>> > Using information from the device tree, we can configure the driv=
er to
>>> > work with both versions.
>>> >
>>> > Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> > ---
>>> >  .../devicetree/bindings/mtd/atmel-nand.txt         |  7 +++++--
>>> >  drivers/mtd/nand/atmel_nand.c                      | 23 ++++++++=
+++++++++++++-
>>> >  drivers/mtd/nand/atmel_nand_ecc.h                  |  8 ++++++--
>>> >  3 files changed, 33 insertions(+), 5 deletions(-)
>>> >
>>> > diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>>> > b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>>> > index 89b0db9801b0..90887b430f03 100644
>>> > --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>>> > +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>>> > @@ -1,7 +1,10 @@
>>> >  Atmel NAND flash
>>> >
>>> >  Required properties:
>>> > -- compatible : should be "atmel,at91rm9200-nand" or "atmel,sama5=
d4-nand".
>>> > +- compatible: The possible values are:
>>> > +   "atmel,at91rm9200-nand"
>>> > +   "atmel,sama5d2-nand"
>>> > +   "atmel,sama5d4-nand"
>>> >  - reg : should specify localbus address and size used for the ch=
ip,
>>> >     and hardware ECC controller if available.
>>> >     If the hardware ECC is PMECC, it should contain address and s=
ize for
>>> > @@ -22,7 +25,7 @@ Optional properties:
>>> >    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw=
_oob_first",
>>> >    "soft_bch".
>>> >  - atmel,has-pmecc : boolean to enable Programmable Multibit ECC =
hardware.
>>> > -  Only supported by at91sam9x5 or later sam9 product.
>>> > +  Supported by AT91SAM9x5 or later SAM9 chips, and SAMA5 chips.
>>>
>>> What compatible string would AT91SAM9x5 be?
>>
>> "atmel,at91rm9200-nand".
>
> Answer the question in the binding doc by saying which compatible
> strings a property is valid for.

I'm trying to rewrite the documentation for this point, and in the end =
it
seems to me that the line should be removed instead.

Adding the 'atmel,has-pmecc' property to a SoC device tree is the norma=
l way
to describe that it supports this type of controller. If we need to wri=
te it
in the documentation as well, it's a duplicate information that can bec=
ome
stale quite fast, as it was before.

In the end, I believe the best path is to describe better what PMECC is=
,
instead of describing as "the controller found in this kind of chip".

Best regards,
--=20
Romain Izard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
