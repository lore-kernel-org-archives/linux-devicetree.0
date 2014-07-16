From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: rockchip: add debug uart used by rk3288
Date: Wed, 16 Jul 2014 11:11:22 +0200
Message-ID: <4054962.m70Hhy4CVc@diego>
References: <1471578.ILeMmG2DL6@diego> <2866950.oXmKFGy9mh@diego> <CAD=FV=W3aWeT3RP5_g9r8kV8ToeHfyn57JY-py2zGVW9DF_7RQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=W3aWeT3RP5_g9r8kV8ToeHfyn57JY-py2zGVW9DF_7RQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 15. Juli 2014, 21:13:10 schrieb Doug Anderson:
> Heiko,
>=20
> On Tue, Jul 15, 2014 at 4:00 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wr=
ote:
> > The uarts on rk3288 are still compatible with the dw_8250, but loca=
ted
> > at a different position and need DEBUG_UART_8250_WORD enabled.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > ---
> >=20
> >  arch/arm/Kconfig.debug | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> > index 8f90595..f68def0 100644
> > --- a/arch/arm/Kconfig.debug
> > +++ b/arch/arm/Kconfig.debug
> > @@ -613,6 +613,14 @@ choice
> >=20
> >                   Say Y here if you want kernel low-level debugging
> >                   support
> >                   on Rockchip based platforms.
> >=20
> > +       config DEBUG_RK32_UART2
>=20
> It's slightly confusing that you didn't rename the old "DEBUG_RK3X_UA=
RT2".

My problem is, to what :-) ... DEBUG_RK30_UART2 ?

RK30xx and RK31xx share these, but I guess at least the description sho=
uld be=20
adapted.


>=20
> Other than that:
>=20
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
