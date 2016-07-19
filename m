From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: add spiX aliases for rk3399
Date: Tue, 19 Jul 2016 12:29:14 -0700
Message-ID: <20160719192912.GA142821@google.com>
References: <1468545873-134339-1-git-send-email-briannorris@chromium.org>
 <20160719063955.GE5368@pengutronix.de>
 <2679180.WfB7C6de5F@diego>
 <20160719192754.GA140860@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160719192754.GA140860-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 19, 2016 at 12:27:54PM -0700, Brian Norris wrote:
> + Rob

+ Rob for real

> Hi,
>=20
> On Tue, Jul 19, 2016 at 08:56:47PM +0200, Heiko Stuebner wrote:
> > Am Dienstag, 19. Juli 2016, 08:39:55 schrieb Uwe Kleine-K=F6nig:
> > > On Thu, Jul 14, 2016 at 06:24:33PM -0700, Brian Norris wrote:
> > > > It's nicer to see this:
> > > >     # ls -l /sys/bus/spi/devices/
> > > >     total 0
> > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi0.0 ->
> > > >     ../../../devices/platform/ff1c0000.spi/spi_master/spi0/spi0=
=2E0
> > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi1.0 ->
> > > >     ../../../devices/platform/ff1d0000.spi/spi_master/spi1/spi1=
=2E0
> > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi2.0 ->
> > > >     ../../../devices/platform/ff1e0000.spi/spi_master/spi2/spi2=
=2E0
> > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi5.0 ->
> > > >     ../../../devices/platform/ff200000.spi/spi_master/spi5/spi5=
=2E0>=20
> > > > than this:
> > > >     # ls -l /sys/bus/spi/devices/
> > > >     total 0
> > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32763.0 ->
> > > >     ../../../devices/platform/ff200000.spi/spi_master/spi32763/=
spi32763.0
> > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32764.0 ->
> > > >     ../../../devices/platform/ff1e0000.spi/spi_master/spi32764/=
spi32764.0
> > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32765.0 ->
> > > >     ../../../devices/platform/ff1d0000.spi/spi_master/spi32765/=
spi32765.0
> > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32766.0 ->
> > > >     ../../../devices/platform/ff1c0000.spi/spi_master/spi32766/=
spi32766.0>=20
> > > > With the latter, it's much clearer which bus devices are on.
> > > >=20
> > > > Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > ---
> > > >=20
> > > >  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >=20
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > > b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index
> > > > 4c84229789ef..b04abbfd4898 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > > @@ -70,6 +70,12 @@
> > > >=20
> > > >  		serial2 =3D &uart2;
> > > >  		serial3 =3D &uart3;
> > > >  		serial4 =3D &uart4;
> > > >=20
> > > > +		spi0 =3D &spi0;
> > > > +		spi1 =3D &spi1;
> > > > +		spi2 =3D &spi2;
> > > > +		spi3 =3D &spi3;
> > > > +		spi4 =3D &spi4;
> > > > +		spi5 =3D &spi5;
> > >=20
> > > Note that Rob Herring (with his dt-maintainer hat on) doesn't lik=
e these
> > > aliases.
> > > See for example:
> > > 	http://mid.gmane.org/20160705140546.GA10601@rob-hp-laptop
>=20
> But why? I believe half the arguments in the linked thread were
> Catch-22's -- there were no "mainline" users (which is a false target
> IMO anyway, as Christer Weinigel mentioned somewhere in the thread Ro=
b
> linked), and so we couldn't accept more documentation (or users) for =
the
> feature. FWIW, my quick grep now shows there are currently 43 mainlin=
e
> users.
>=20
> This feature is very useful. Some of the thread Rob pointed to argued
> that the indexing isn't HW documentation; in this case, it most
> certainly is. The RK3399 TRM explicitly has these SPI buses named SPI=
0,
> SPI1, SPI2, SPI3, SPI4, and SPI5, and schematics that I've seen use t=
he
> same terminology. It is therefore *much* nicer to have my device show=
 up
> as 'spi2.0' (reflecting their correct HW name) rather than spi32764.0=
=2E
> Sometimes I can't even get as far as mounting sysfs to check what thi=
s
> maps to, but having spi2.0 in the kernel log can clearly tell me what
> device is causing problems.
>=20
> If Rob can support a better alternative solution, I'd be happy to
> switch. But I don't understand why we can't use a useful (not just to
> me, but presumably to at least 43 other independent users, and many
> more out of tree), existing, and long-supported feature here.
>=20
> > thanks for the heads up on this. I've dropped this patch again.
>=20
> :(
>=20
> Regards,
> Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
