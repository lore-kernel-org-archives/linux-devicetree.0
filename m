From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] arm64: dts: rockchip: add spiX aliases for rk3399
Date: Fri, 29 Jul 2016 16:39:51 -0700
Message-ID: <20160729233950.GA102046@google.com>
References: <1468545873-134339-1-git-send-email-briannorris@chromium.org>
 <20160719192912.GA142821@google.com>
 <1841177.NDa9D09EGz@diego>
 <3484113.eKHnDqRbfE@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3484113.eKHnDqRbfE@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org, Caesar Wang <wxt@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Doug Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

+ Mark

On Wed, Jul 20, 2016 at 10:11:11AM +0200, Heiko Stuebner wrote:
> Am Mittwoch, 20. Juli 2016, 00:18:40 schrieb Heiko St=FCbner:
> > Am Dienstag, 19. Juli 2016, 12:29:14 schrieb Brian Norris:
> > > On Tue, Jul 19, 2016 at 12:27:54PM -0700, Brian Norris wrote:
> > > > On Tue, Jul 19, 2016 at 08:56:47PM +0200, Heiko Stuebner wrote:
> > > > > Am Dienstag, 19. Juli 2016, 08:39:55 schrieb Uwe Kleine-K=F6n=
ig:
> > > > > > > --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > > > > > @@ -70,6 +70,12 @@
> > > > > > >=20
> > > > > > >  		serial2 =3D &uart2;
> > > > > > >  		serial3 =3D &uart3;
> > > > > > >  		serial4 =3D &uart4;
> > > > > > >=20
> > > > > > > +		spi0 =3D &spi0;
> > > > > > > +		spi1 =3D &spi1;
> > > > > > > +		spi2 =3D &spi2;
> > > > > > > +		spi3 =3D &spi3;
> > > > > > > +		spi4 =3D &spi4;
> > > > > > > +		spi5 =3D &spi5;
> > > > > >=20
> > > > > > Note that Rob Herring (with his dt-maintainer hat on) doesn=
't like
> > > > > > these
> > > > > > aliases.
> > > > > >=20
> > > > > > See for example:
> > > > > > 	http://mid.gmane.org/20160705140546.GA10601@rob-hp-laptop
> > > >=20
> > > > But why? I believe half the arguments in the linked thread were
> > > > Catch-22's -- there were no "mainline" users (which is a false =
target
> > > > IMO anyway, as Christer Weinigel mentioned somewhere in the thr=
ead Rob
> > > > linked), and so we couldn't accept more documentation (or users=
) for the
> > > > feature. FWIW, my quick grep now shows there are currently 43 m=
ainline
> > > > users.
> > > >=20
> > > > This feature is very useful. Some of the thread Rob pointed to =
argued
> > > > that the indexing isn't HW documentation; in this case, it most
> > > > certainly is. The RK3399 TRM explicitly has these SPI buses nam=
ed SPI0,
> > > > SPI1, SPI2, SPI3, SPI4, and SPI5, and schematics that I've seen=
 use the
> > > > same terminology. It is therefore *much* nicer to have my devic=
e show up
> > > > as 'spi2.0' (reflecting their correct HW name) rather than spi3=
2764.0.
> > > > Sometimes I can't even get as far as mounting sysfs to check wh=
at this
> > > > maps to, but having spi2.0 in the kernel log can clearly tell m=
e what
> > > > device is causing problems.
> > > >=20
> > > > If Rob can support a better alternative solution, I'd be happy =
to
> > > > switch. But I don't understand why we can't use a useful (not j=
ust to
> > > > me, but presumably to at least 43 other independent users, and =
many
> > > > more out of tree), existing, and long-supported feature here.
> >=20
> > Personally, I don't have any real opinion on this but the argument =
sounds
> > plausible to me (aka they are named with numbers in every manual,
> > schematics) so it might be helpful to have that around - similar to=
 i2c
> > that is in the dtsi already.
> >=20
> > I think I remember Doug having a similar discussion around mmc-alia=
ses some
> > time ago - that met opposition as well [0] - although I guess the n=
umbering
> > was a bit more arbitary there.
> >=20
> > I guess we'll just see what Rob says.
>=20
> Uwe pointed me to a very similar discussion and response from Rob abo=
ut spi=20
> aliases at:
> https://lkml.org/lkml/2016/5/25/566

I had read that already. I figured that was just rationale for not
documenting the feature (still silly IMO), and not for avoiding using
the existing feature.

What is this "label" feature Rob speaks of? Does it exist in practice
(AFAICT the answer is "no")? The description doesn't seem terrible,
depending on the implementation. Would that become the actual device
name (i.e., dev_name(dev))? Or just a filesystem symlink? And how does
one assign such a label?

Brian
