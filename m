From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: add spiX aliases for rk3399
Date: Tue, 19 Jul 2016 20:56:47 +0200
Message-ID: <2679180.WfB7C6de5F@diego>
References: <1468545873-134339-1-git-send-email-briannorris@chromium.org> <20160719063955.GE5368@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160719063955.GE5368@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Brian Norris <briannorris@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi Uwe,

Am Dienstag, 19. Juli 2016, 08:39:55 schrieb Uwe Kleine-K=F6nig:
> On Thu, Jul 14, 2016 at 06:24:33PM -0700, Brian Norris wrote:
> > It's nicer to see this:
> >     # ls -l /sys/bus/spi/devices/
> >     total 0
> >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi0.0 ->
> >     ../../../devices/platform/ff1c0000.spi/spi_master/spi0/spi0.0
> >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi1.0 ->
> >     ../../../devices/platform/ff1d0000.spi/spi_master/spi1/spi1.0
> >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi2.0 ->
> >     ../../../devices/platform/ff1e0000.spi/spi_master/spi2/spi2.0
> >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi5.0 ->
> >     ../../../devices/platform/ff200000.spi/spi_master/spi5/spi5.0>=20
> > than this:
> >     # ls -l /sys/bus/spi/devices/
> >     total 0
> >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32763.0 ->
> >     ../../../devices/platform/ff200000.spi/spi_master/spi32763/spi3=
2763.0
> >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32764.0 ->
> >     ../../../devices/platform/ff1e0000.spi/spi_master/spi32764/spi3=
2764.0
> >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32765.0 ->
> >     ../../../devices/platform/ff1d0000.spi/spi_master/spi32765/spi3=
2765.0
> >     lrwxrwxrwx 1 root root 0 Dec 31  1969 spi32766.0 ->
> >     ../../../devices/platform/ff1c0000.spi/spi_master/spi32766/spi3=
2766.0>=20
> > With the latter, it's much clearer which bus devices are on.
> >=20
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> >=20
> >  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index
> > 4c84229789ef..b04abbfd4898 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > @@ -70,6 +70,12 @@
> >=20
> >  		serial2 =3D &uart2;
> >  		serial3 =3D &uart3;
> >  		serial4 =3D &uart4;
> >=20
> > +		spi0 =3D &spi0;
> > +		spi1 =3D &spi1;
> > +		spi2 =3D &spi2;
> > +		spi3 =3D &spi3;
> > +		spi4 =3D &spi4;
> > +		spi5 =3D &spi5;
>=20
> Note that Rob Herring (with his dt-maintainer hat on) doesn't like th=
ese
> aliases.
> See for example:
> 	http://mid.gmane.org/20160705140546.GA10601@rob-hp-laptop

thanks for the heads up on this. I've dropped this patch again.


Thanks
Heiko
