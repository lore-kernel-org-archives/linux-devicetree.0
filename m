From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] bcma: use device from DT (brcm,bus-gpio) for SoC GPIO
 chip
Date: Sat, 27 Sep 2014 22:47:43 +0200
Message-ID: <5427226F.8080601@hauke-m.de>
References: <1411741733-13888-1-git-send-email-zajec5@gmail.com>	<2539898.4te2VKk57a@wuerfel>	<CACna6rwwfJOdnxhmnW7MUuUC1YBPx8bmDbiaSy1+G39hF4p7OA@mail.gmail.com>	<54267661.5000401@hauke-m.de> <CACna6rwYcSh7-uFYA+paNehNwrqddmn2az+a9ZwggVGofbDR7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6rwYcSh7-uFYA+paNehNwrqddmn2az+a9ZwggVGofbDR7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/27/2014 12:37 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 27 September 2014 10:33, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org> wrote:
>> I would make GPIO a subdevive of chipcommon. The chipcommon core has=
 an
>> own IRQ which is also used for GPIO.
>=20
> Which ChipCommon do yo mean?
> 1) chipcommonA (compatible =3D "simple-bus")
> 2) chipcommon@0 (child of axi@18000000 AKA brcm,bus-axi)

We should combine this (both are describing the same core) I added
chipcommonA to get some serial without adding bcma support first. When
we have dts support added to bcma, I would like to remove chipcommonA
from dtsi and add a chipcommon as a child of axi.

>=20
> It seems that for some reason both of them use IRQ 85, while the IRQ
> for ChipCommon is 117 I believe.

That's the same.

In the dtsi file it says:
interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
this will result in the IRQ number 117, when it is GIC_SPI you have to
add 32 to the irq number to get the actual number which will be given t=
o
request_irq().

Hauke
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
