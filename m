From: Max Schwarz <max.schwarz@online.de>
Subject: Re: [PATCH v2] ARM: dts: rockchip: use internal pull-up resistors on I2C busses
Date: Wed, 29 Oct 2014 15:02:20 +0100
Message-ID: <32904940.RFLKbTnBmv@xq-nb>
References: <1414492597-13566-1-git-send-email-julien.chauveau@neo-technologies.fr> <2234299.BSD6RSf1dG@diego> <20141029134415.GA3499@palmtree.beeroclock.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141029134415.GA3499@palmtree.beeroclock.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Karl Palsson <karlp@tweak.net.au>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Julien CHAUVEAU <julien.chauveau@neo-technologies.fr>, Addy Ke <addy.ke@rock-chips.com>, wsa@the-dreams.de, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "moderated list:ARM/Rockchip SoC..." <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

I'll agree with Karl and Doug. If you (as a board vendor/maintainer/etc=
) want=20
to use I2C, it's *your* responsibility to provide the pullup resistors =
by=20
either including pullup resistors on the board or by enabling the inter=
nal=20
ones.
Either way, you should think a moment about the consequences (frequency=
/trace=20
length limitations), which is why I'm also against the pullup-by-defaul=
t=20
behavior.

Also, it's much harder to diagnose effects like Doug is describing (sli=
ghtly=20
out-of-spec due to internal + external pulls) than the effects you are =
seeing=20
without any pullups. With your i2cdetect results my first thought would=
 have=20
been "are there pullups on the bus?".

Cheers,
  Max

Am Mittwoch, 29. Oktober 2014, 13:44:15 schrieb Karl Palsson:
> I'd be more inclined to have pulls disabled by default, it's more sta=
ndard
> with what smaller micros do, but I've no experience with these bigger
> cortex-a parts.  It's also the "least surprise" path.  If you want to=
 try
> and use the onboard pullups, you can specify that in your board file,=
 but
> for people deliberately selecting pullups for their timing and load
> expectations, being required to take an extra step to turn off someth=
ing
> seems unexpected.
>=20
> If you _want_ to be able to probe an i2c bus for devices added afterm=
arket,
> on a board that didn't get i2c pull ups because no devices were plann=
ed,
> and you want to turn on the internal pullups for that, I think that's
> something you need to do yourself, not making it a hard default in th=
e SoC
> dtsi file.
>=20
> so, if it's off by default, you get this
>                                          dtsi   dts
> Board1, i2c periphs, designed pullups =3D> off     -
> board2, no peripsh, pulls in case     =3D> off     -
> board3, no periphs, forgot pulls, pray=3D> off    on
>=20
> If you turn it on by default, sure, it causes no harm in most cases, =
but
> you're no longer getting the values you expect, without having to tur=
n off
> things that are not default anyway.
>=20
> Sincerely,
> Karl Palsson
>=20
> On Wed, Oct 29, 2014 at 02:17:23PM +0100, Heiko St=FCbner wrote:
> > Hi Addy, Max, Wolfram,
> >=20
> > after Doug's explanation of disfavour [0] and Julien's subsequent r=
esponse
> > I'm not sure which direction to go. So if possible I'd like to coll=
ect
> > some more opinions of people knowing a lot more about i2c internals=
 than
> > myself :-) .
> >=20
> >=20
> > Thanks
> > Heiko
> >=20
> >=20
> > [0]
> > http://lists.infradead.org/pipermail/linux-rockchip/2014-October/00=
0934.h
> > tml>=20
> > Am Dienstag, 28. Oktober 2014, 11:36:36 schrieb Julien CHAUVEAU:
> > > According to the I2C bus specification, it is required to use pul=
l-up
> > > resistors on the clock and data lines. Probing the I2C busses wit=
h
> > > i2cdetect results in bad results when no devices are connected an=
d no
> > > external resistors are used.
> > >=20
> > > This patch configures the I2C busses to use the internal pull-up
> > > resistors
> > > on the RK3066, RK3188 and RK3288 Rockchip processors. It should a=
lso be
> > > noted that these default pull settings match the original configu=
ration
> > > on
> > > these SoCs.
> > >=20
> > > Below is the results of using i2cdetect on a I2C bus with no devi=
ces
> > > connected before (1) and after (2) applying this patch.
> > >=20
> > > (1) root@localhost:~# i2cdetect -y 3
> > >=20
> > >      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> > >=20
> > > 00:          03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f
> > > 10: 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f
> > > 20: 20 21 22 23 24 25 26 27 28 29 2a 2b 2c 2d 2e 2f
> > > 30: -- -- -- -- -- rk3x-i2c 2005a000.i2c: timeout, ipd: 0x81, sta=
te: 2
> > > -- rk3x-i2c 2005a000.i2c: timeout, ipd: 0x80, state: 2
> > > -- rk3x-i2c 2005a000.i2c: timeout, ipd: 0x80, state: 2
> > > -- rk3x-i2c 2005a000.i2c: timeout, ipd: 0x80, state: 3
> > > -- rk3x-i2c 2005a000.i2c: timeout, ipd: 0x80, state: 3
> > > -- rk3x-i2c 2005a000.i2c: timeout, ipd: 0x80, state: 3
> > > ...
> > >=20
> > > (2) root@localhost:~# i2cdetect -y 3
> > >=20
> > >      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> > >=20
> > > 00:          -- -- -- -- -- -- -- -- -- -- -- -- --
> > > 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > > 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > > 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > > 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > > 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > > 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > > 70: -- -- -- -- -- -- -- --
> > >=20
> > > Signed-off-by: Julien CHAUVEAU <julien.chauveau@neo-technologies.=
fr>
> > > ---
> > > Changes since v1:
> > > - fix the rk3066a pull settings (only available is
> > > pull_none/pull_default)
> > > - remove the warnings in the results of i2cdetect
> > >=20
> > >  arch/arm/boot/dts/rk3066a.dtsi | 20 ++++++++++----------
> > >  arch/arm/boot/dts/rk3188.dtsi  | 20 ++++++++++----------
> > >  arch/arm/boot/dts/rk3288.dtsi  | 24 ++++++++++++------------
> > >  3 files changed, 32 insertions(+), 32 deletions(-)
> > >=20
> > > diff --git a/arch/arm/boot/dts/rk3066a.dtsi
> > > b/arch/arm/boot/dts/rk3066a.dtsi index ad9c2db..dbc1a0b 100644
> > > --- a/arch/arm/boot/dts/rk3066a.dtsi
> > > +++ b/arch/arm/boot/dts/rk3066a.dtsi
> > > @@ -202,36 +202,36 @@
> > >=20
> > >  		i2c0 {
> > >  	=09
> > >  			i2c0_xfer: i2c0-xfer {
> > >=20
> > > -				rockchip,pins =3D <RK_GPIO2 28 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<RK_GPIO2 29 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <RK_GPIO2 28 RK_FUNC_1 &pcfg_pull_default>=
,
> > > +						<RK_GPIO2 29 RK_FUNC_1 &pcfg_pull_default>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >  	=09
> > >  		i2c1 {
> > >  	=09
> > >  			i2c1_xfer: i2c1-xfer {
> > >=20
> > > -				rockchip,pins =3D <RK_GPIO2 30 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<RK_GPIO2 31 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <RK_GPIO2 30 RK_FUNC_1 &pcfg_pull_default>=
,
> > > +						<RK_GPIO2 31 RK_FUNC_1 &pcfg_pull_default>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >  	=09
> > >  		i2c2 {
> > >  	=09
> > >  			i2c2_xfer: i2c2-xfer {
> > >=20
> > > -				rockchip,pins =3D <RK_GPIO3 0 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<RK_GPIO3 1 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <RK_GPIO3 0 RK_FUNC_1 &pcfg_pull_default>,
> > > +						<RK_GPIO3 1 RK_FUNC_1 &pcfg_pull_default>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >  	=09
> > >  		i2c3 {
> > >  	=09
> > >  			i2c3_xfer: i2c3-xfer {
> > >=20
> > > -				rockchip,pins =3D <RK_GPIO3 2 RK_FUNC_2 &pcfg_pull_none>,
> > > -						<RK_GPIO3 3 RK_FUNC_2 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <RK_GPIO3 2 RK_FUNC_2 &pcfg_pull_default>,
> > > +						<RK_GPIO3 3 RK_FUNC_2 &pcfg_pull_default>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >  	=09
> > >  		i2c4 {
> > >  	=09
> > >  			i2c4_xfer: i2c4-xfer {
> > >=20
> > > -				rockchip,pins =3D <RK_GPIO3 4 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<RK_GPIO3 5 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <RK_GPIO3 4 RK_FUNC_1 &pcfg_pull_default>,
> > > +						<RK_GPIO3 5 RK_FUNC_1 &pcfg_pull_default>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >=20
> > > diff --git a/arch/arm/boot/dts/rk3188.dtsi
> > > b/arch/arm/boot/dts/rk3188.dtsi
> > > index ddaada7..ee2865f 100644
> > > --- a/arch/arm/boot/dts/rk3188.dtsi
> > > +++ b/arch/arm/boot/dts/rk3188.dtsi
> > > @@ -188,36 +188,36 @@
> > >=20
> > >  		i2c0 {
> > >  	=09
> > >  			i2c0_xfer: i2c0-xfer {
> > >=20
> > > -				rockchip,pins =3D <RK_GPIO1 24 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<RK_GPIO1 25 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <RK_GPIO1 24 RK_FUNC_1 &pcfg_pull_up>,
> > > +						<RK_GPIO1 25 RK_FUNC_1 &pcfg_pull_up>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >  	=09
> > >  		i2c1 {
> > >  	=09
> > >  			i2c1_xfer: i2c1-xfer {
> > >=20
> > > -				rockchip,pins =3D <RK_GPIO1 26 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<RK_GPIO1 27 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <RK_GPIO1 26 RK_FUNC_1 &pcfg_pull_up>,
> > > +						<RK_GPIO1 27 RK_FUNC_1 &pcfg_pull_up>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >  	=09
> > >  		i2c2 {
> > >  	=09
> > >  			i2c2_xfer: i2c2-xfer {
> > >=20
> > > -				rockchip,pins =3D <RK_GPIO1 28 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<RK_GPIO1 29 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <RK_GPIO1 28 RK_FUNC_1 &pcfg_pull_up>,
> > > +						<RK_GPIO1 29 RK_FUNC_1 &pcfg_pull_up>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >  	=09
> > >  		i2c3 {
> > >  	=09
> > >  			i2c3_xfer: i2c3-xfer {
> > >=20
> > > -				rockchip,pins =3D <RK_GPIO3 14 RK_FUNC_2 &pcfg_pull_none>,
> > > -						<RK_GPIO3 15 RK_FUNC_2 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <RK_GPIO3 14 RK_FUNC_2 &pcfg_pull_up>,
> > > +						<RK_GPIO3 15 RK_FUNC_2 &pcfg_pull_up>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >  	=09
> > >  		i2c4 {
> > >  	=09
> > >  			i2c4_xfer: i2c4-xfer {
> > >=20
> > > -				rockchip,pins =3D <RK_GPIO1 30 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<RK_GPIO1 31 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <RK_GPIO1 30 RK_FUNC_1 &pcfg_pull_up>,
> > > +						<RK_GPIO1 31 RK_FUNC_1 &pcfg_pull_up>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >=20
> > > diff --git a/arch/arm/boot/dts/rk3288.dtsi
> > > b/arch/arm/boot/dts/rk3288.dtsi
> > > index 874e66d..9a4b1f7 100644
> > > --- a/arch/arm/boot/dts/rk3288.dtsi
> > > +++ b/arch/arm/boot/dts/rk3288.dtsi
> > > @@ -636,43 +636,43 @@
> > >=20
> > >  		i2c0 {
> > >  	=09
> > >  			i2c0_xfer: i2c0-xfer {
> > >=20
> > > -				rockchip,pins =3D <0 15 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<0 16 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <0 15 RK_FUNC_1 &pcfg_pull_up>,
> > > +						<0 16 RK_FUNC_1 &pcfg_pull_up>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >  	=09
> > >  		i2c1 {
> > >  	=09
> > >  			i2c1_xfer: i2c1-xfer {
> > >=20
> > > -				rockchip,pins =3D <8 4 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<8 5 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <8 4 RK_FUNC_1 &pcfg_pull_up>,
> > > +						<8 5 RK_FUNC_1 &pcfg_pull_up>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >  	=09
> > >  		i2c2 {
> > >  	=09
> > >  			i2c2_xfer: i2c2-xfer {
> > >=20
> > > -				rockchip,pins =3D <6 9 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<6 10 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <6 9 RK_FUNC_1 &pcfg_pull_up>,
> > > +						<6 10 RK_FUNC_1 &pcfg_pull_up>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >  	=09
> > >  		i2c3 {
> > >  	=09
> > >  			i2c3_xfer: i2c3-xfer {
> > >=20
> > > -				rockchip,pins =3D <2 16 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<2 17 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <2 16 RK_FUNC_1 &pcfg_pull_up>,
> > > +						<2 17 RK_FUNC_1 &pcfg_pull_up>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >  	=09
> > >  		i2c4 {
> > >  	=09
> > >  			i2c4_xfer: i2c4-xfer {
> > >=20
> > > -				rockchip,pins =3D <7 17 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<7 18 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <7 17 RK_FUNC_1 &pcfg_pull_up>,
> > > +						<7 18 RK_FUNC_1 &pcfg_pull_up>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> > >  	=09
> > >  		i2c5 {
> > >  	=09
> > >  			i2c5_xfer: i2c5-xfer {
> > >=20
> > > -				rockchip,pins =3D <7 19 RK_FUNC_1 &pcfg_pull_none>,
> > > -						<7 20 RK_FUNC_1 &pcfg_pull_none>;
> > > +				rockchip,pins =3D <7 19 RK_FUNC_1 &pcfg_pull_up>,
> > > +						<7 20 RK_FUNC_1 &pcfg_pull_up>;
> > >=20
> > >  			};
> > >  	=09
> > >  		};
> >=20
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
