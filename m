From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/3] spi/rockchip: add rk3036/rk3228/rk3368 socs for spi document
Date: Thu, 19 May 2016 18:20:58 +0200
Message-ID: <3828505.WBLtTjjB7h@phil>
References: <1463672824-15367-1-git-send-email-wxt@rock-chips.com> <3685935.dKdIbE8hXb@phil> <573DE3F7.6070300@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <573DE3F7.6070300-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 20. Mai 2016, 00:04:07 schrieb Caesar Wang:
> =E5=9C=A8 2016=E5=B9=B405=E6=9C=8819=E6=97=A5 23:51, Heiko Stuebner =E5=
=86=99=E9=81=93:
> > Am Donnerstag, 19. Mai 2016, 23:47:02 schrieb Caesar Wang:
> >> We had supported the rk3036/rk3066/rk3188/rk3228/rk3288/rk3368/rk3=
399
> >> family SoCs in linux kernel.
> >>=20
> >> Let's add the other SoCs, in order to a better understanding from =
the
> >> rockchip spi document.
> >>=20
> >> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> >> Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >> ---
> >>=20
> >>   Documentation/devicetree/bindings/spi/spi-rockchip.txt | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.tx=
t
> >> b/Documentation/devicetree/bindings/spi/spi-rockchip.txt index
> >> 1b14d69..305b542 100644
> >> --- a/Documentation/devicetree/bindings/spi/spi-rockchip.txt
> >> +++ b/Documentation/devicetree/bindings/spi/spi-rockchip.txt
> >> @@ -6,9 +6,12 @@ and display controllers using the SPI communicati=
on
> >>=20
> >> interface. Required Properties:
> >>   - compatible: should be one of the following.
> >>=20
> >> +    "rockchip,rk3036-spi" for rk3036.
> >=20
> > shouldn't the rk3036 also get the rk3066 fallback. Looking at the d=
river
> > part (patch2) the rk3036 still is the same IP as for every other so=
c in
> > here.
>=20
> Yep, the same IP.
>=20
> Do you think we should keep the below style?
>=20
> 1)
> "rockchip,rk3036-spi", "rockchip,rk3066-spi" for rk3036.
>   "rockchip,rk3066-spi" for rk3066.
>   "rockchip,rk3188-spi", "rockchip,rk3066-spi" for rk3188.
> ...
>=20
> or
> 2)
>   "rockchip,rk3066-spi" for rk3066.
> "rockchip,rk3036-spi", "rockchip,rk3066-spi" for rk3036.
>   "rockchip,rk3188-spi", "rockchip,rk3066-spi" for rk3188
> ..
>=20
> or
> 3)
> "rockchip, rockchip-spi" for rk3036 rk3066.......
>=20
> Think about the 1) will be googd select.

or
(4) drop the fallbacks. We match against each compatible all the time=20
anyway, so you could also simply do

  "rockchip,rk3036-spi" for rk3036
  "rockchip,rk3066-spi" for rk3066
  "rockchip,rk3188-spi" for rk3188

Maybe leave the fallbacks for existing socs, and just add the new ones=20
without the fallbacks.

rockchip,rockchip-spi is not future proof ... i.e. in some future soc=20
somebody might want to exchange the IP block against a different one, s=
o=20
being specific saves us from hassle then :-)


Heiko

> >>       "rockchip,rk3066-spi" for rk3066.
> >>       "rockchip,rk3188-spi", "rockchip,rk3066-spi" for rk3188.
> >>=20
> >> +    "rockchip,rk3228-spi", "rockchip,rk3066-spi" for rk3228.
> >>=20
> >>       "rockchip,rk3288-spi", "rockchip,rk3066-spi" for rk3288.
> >>=20
> >> +    "rockchip,rk3368-spi", "rockchip,rk3066-spi" for rk3368.
> >>=20
> >>       "rockchip,rk3399-spi", "rockchip,rk3066-spi" for rk3399.
> >>  =20
> >>   - reg: physical base address of the controller and length of mem=
ory
> >>=20
> >> mapped region.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
