From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2] bcma: use device from DT (brcm, bus-gpio) for SoC GPIO chip
Date: Tue, 30 Sep 2014 12:28:21 +0200
Message-ID: <9255570.ha3Ad1aI6v@wuerfel>
References: <1411741733-13888-1-git-send-email-zajec5@gmail.com> <7035315.8m6ICWZ25d@wuerfel> <CACna6ry-mmc8QD-bYUNGLfTh07TcUepjZdPYqKyxLc3HbMPung@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6ry-mmc8QD-bYUNGLfTh07TcUepjZdPYqKyxLc3HbMPung-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 30 September 2014 11:56:20 Rafa=C5=82 Mi=C5=82ecki wrote:
> On 30 September 2014 11:37, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Sunday 28 September 2014 10:24:01 Rafa=C5=82 Mi=C5=82ecki wrote:
> >> @@ -17,4 +33,12 @@ Example:
> >>               ranges =3D <0x00000000 0x18000000 0x00100000>;
> >>               #address-cells =3D <1>;
> >>               #size-cells =3D <1>;
> >> +
> >> +             chipcommon@0 {
> >> +                     gpio@0 {
> >> +                             compatible =3D "brcm,bus-gpio";
> >> +                             gpio-controller;
> >> +                             #gpio-cells =3D <2>;
> >> +                     };
> >> +             };
> >
> > I think you should list the 'reg' property of the chipcommon area
> > and make that match the unit address, rather than using '0', mostly
> > for consistency.
>=20
> Do you mean this chipcommon@0? We propose this foo@offset syntax sinc=
e
> V1 which was posted 1,5 month ago, it's nothing new.

Is 'chipcommon' at the start of the 0x18000000 range? If so, that's
great, but it would still be good to have the 'reg' property in there
explicitly.

> >> @@ -218,6 +218,11 @@ int bcma_gpio_init(struct bcma_drv_cc *cc)
> >>  #if IS_BUILTIN(CONFIG_BCM47XX)
> >>       chip->to_irq            =3D bcma_gpio_to_irq;
> >>  #endif
> >> +#if IS_BUILTIN(CONFIG_OF)
> >> +     if (cc->core->bus->hosttype =3D=3D BCMA_HOSTTYPE_SOC)
> >> +             chip->of_node   =3D of_find_compatible_node(NULL, NU=
LL,
> >> +                                                       "brcm,bus-=
gpio");
> >> +#endif
> >
> > Just commenting on the general style here, I think you can skip thi=
s
> > step entirely, as mentioned above.
> >
> > You should use C syntax here:
> >
> >         if (IS_BUILTIN(CONFIG_OF) && cc->core->bus->hosttype =3D=3D=
 BCMA_HOSTTYPE_SOC))
> >                 chip->of_node =3D of_find_compatible_node(NULL, NUL=
L, "brcm,bus-gpio");
>=20
> OK
>=20
>=20
> > If CONFIG_OF is not set, of_find_compatible_node() is turned into a=
n inline
> > function that returns NULL, so you probably don't even need that.
>=20
> But I need to have of_node defined. Please check out "struct gpio_chi=
p".

I see. This is something we might want to change, but you don't need to
bother with it now, so just leave this part as it is.

> > Finally, of_find_compatible_node() is a really slow operation, and =
"brcm,bus-gpio"
> > is a much too generic name. If you need to look for something that =
is a child
> > node, use something based on for_each_available_child_of_node().
>=20
> Will see what I can do.

ok, thanks.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
