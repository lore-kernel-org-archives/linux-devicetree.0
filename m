From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: add spiX aliases for rk3399
Date: Wed, 20 Jul 2016 10:11:11 +0200
Message-ID: <3484113.eKHnDqRbfE@diego>
References: <1468545873-134339-1-git-send-email-briannorris@chromium.org> <20160719192912.GA142821@google.com> <1841177.NDa9D09EGz@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1841177.NDa9D09EGz@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <briannorris@chromium.org>
Cc: Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org, Caesar Wang <wxt@rock-chips.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 20. Juli 2016, 00:18:40 schrieb Heiko St=FCbner:
> Am Dienstag, 19. Juli 2016, 12:29:14 schrieb Brian Norris:
> > On Tue, Jul 19, 2016 at 12:27:54PM -0700, Brian Norris wrote:
> > > + Rob
> >=20
> > + Rob for real
> >=20
> > > Hi,
> > >=20
> > > On Tue, Jul 19, 2016 at 08:56:47PM +0200, Heiko Stuebner wrote:
> > > > Am Dienstag, 19. Juli 2016, 08:39:55 schrieb Uwe Kleine-K=F6nig=
:
> > > > > On Thu, Jul 14, 2016 at 06:24:33PM -0700, Brian Norris wrote:
> > > > > > It's nicer to see this:
> > > > > >     # ls -l /sys/bus/spi/devices/
> > > > > >     total 0
> > > > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi0.0 ->
> > > > > >     ../../../devices/platform/ff1c0000.spi/spi_master/spi0/=
spi0.0
> > > > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi1.0 ->
> > > > > >     ../../../devices/platform/ff1d0000.spi/spi_master/spi1/=
spi1.0
> > > > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi2.0 ->
> > > > > >     ../../../devices/platform/ff1e0000.spi/spi_master/spi2/=
spi2.0
> > > > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi5.0 ->
> > > > > >     ../../../devices/platform/ff200000.spi/spi_master/spi5/=
spi5.0>
> > > > > >=20
> > > > > > than this:
> > > > > >     # ls -l /sys/bus/spi/devices/
> > > > > >     total 0
> > > > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32763.0 ->
> > > > > >     ../../../devices/platform/ff200000.spi/spi_master/spi32=
763/spi
> > > > > >     32
> > > > > >     763.0
> > > > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32764.0 ->
> > > > > >     ../../../devices/platform/ff1e0000.spi/spi_master/spi32=
764/spi
> > > > > >     32
> > > > > >     764.0
> > > > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32765.0 ->
> > > > > >     ../../../devices/platform/ff1d0000.spi/spi_master/spi32=
765/spi
> > > > > >     32
> > > > > >     765.0
> > > > > >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32766.0 ->
> > > > > >     ../../../devices/platform/ff1c0000.spi/spi_master/spi32=
766/spi
> > > > > >     32
> > > > > >     766.0>
> > > > > >=20
> > > > > > With the latter, it's much clearer which bus devices are on=
=2E
> > > > > >=20
> > > > > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > > > > > ---
> > > > > >=20
> > > > > >  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 6 ++++++
> > > > > >  1 file changed, 6 insertions(+)
> > > > > >=20
> > > > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > > > > b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index
> > > > > > 4c84229789ef..b04abbfd4898 100644
> > > > > > --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > > > > @@ -70,6 +70,12 @@
> > > > > >=20
> > > > > >  		serial2 =3D &uart2;
> > > > > >  		serial3 =3D &uart3;
> > > > > >  		serial4 =3D &uart4;
> > > > > >=20
> > > > > > +		spi0 =3D &spi0;
> > > > > > +		spi1 =3D &spi1;
> > > > > > +		spi2 =3D &spi2;
> > > > > > +		spi3 =3D &spi3;
> > > > > > +		spi4 =3D &spi4;
> > > > > > +		spi5 =3D &spi5;
> > > > >=20
> > > > > Note that Rob Herring (with his dt-maintainer hat on) doesn't=
 like
> > > > > these
> > > > > aliases.
> > > > >=20
> > > > > See for example:
> > > > > 	http://mid.gmane.org/20160705140546.GA10601@rob-hp-laptop
> > >=20
> > > But why? I believe half the arguments in the linked thread were
> > > Catch-22's -- there were no "mainline" users (which is a false ta=
rget
> > > IMO anyway, as Christer Weinigel mentioned somewhere in the threa=
d Rob
> > > linked), and so we couldn't accept more documentation (or users) =
for the
> > > feature. FWIW, my quick grep now shows there are currently 43 mai=
nline
> > > users.
> > >=20
> > > This feature is very useful. Some of the thread Rob pointed to ar=
gued
> > > that the indexing isn't HW documentation; in this case, it most
> > > certainly is. The RK3399 TRM explicitly has these SPI buses named=
 SPI0,
> > > SPI1, SPI2, SPI3, SPI4, and SPI5, and schematics that I've seen u=
se the
> > > same terminology. It is therefore *much* nicer to have my device =
show up
> > > as 'spi2.0' (reflecting their correct HW name) rather than spi327=
64.0.
> > > Sometimes I can't even get as far as mounting sysfs to check what=
 this
> > > maps to, but having spi2.0 in the kernel log can clearly tell me =
what
> > > device is causing problems.
> > >=20
> > > If Rob can support a better alternative solution, I'd be happy to
> > > switch. But I don't understand why we can't use a useful (not jus=
t to
> > > me, but presumably to at least 43 other independent users, and ma=
ny
> > > more out of tree), existing, and long-supported feature here.
>=20
> Personally, I don't have any real opinion on this but the argument so=
unds
> plausible to me (aka they are named with numbers in every manual,
> schematics) so it might be helpful to have that around - similar to i=
2c
> that is in the dtsi already.
>=20
> I think I remember Doug having a similar discussion around mmc-aliase=
s some
> time ago - that met opposition as well [0] - although I guess the num=
bering
> was a bit more arbitary there.
>=20
> I guess we'll just see what Rob says.

Uwe pointed me to a very similar discussion and response from Rob about=
 spi=20
aliases at:
https://lkml.org/lkml/2016/5/25/566
