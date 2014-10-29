From: Karl Palsson <karlp@tweak.net.au>
Subject: Re: [PATCH v2] ARM: dts: rockchip: use internal pull-up resistors on
 I2C busses
Date: Wed, 29 Oct 2014 15:05:36 +0000
Message-ID: <20141029150536.GA3876@palmtree.beeroclock.net>
References: <1414492597-13566-1-git-send-email-julien.chauveau@neo-technologies.fr>
 <2234299.BSD6RSf1dG@diego>
 <20141029134415.GA3499@palmtree.beeroclock.net>
 <32904940.RFLKbTnBmv@xq-nb>
 <5450FAF3.2010208@neo-technologies.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5450FAF3.2010208@neo-technologies.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: NEO-Technologies / Julien CHAUVEAU <julien.chauveau@neo-technologies.fr>
Cc: Max Schwarz <max.schwarz@online.de>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Addy Ke <addy.ke@rock-chips.com>, wsa@the-dreams.de, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "moderated list:ARM/Rockchip SoC..." <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


However, and possibly out of line, but should we consider submitting a =
patch to remove the
pullups by default for exynos that Doug hinted at? =20

Cheers,
Karl P


On Wed, Oct 29, 2014 at 03:34:27PM +0100, NEO-Technologies / Julien CHA=
UVEAU wrote:
> Hi everyone,
>=20
> Okay, I understand your opinion. So let's drop my patch in this case.
>=20
> Thank you for your comments.
>=20
> Julien
>=20
>=20
> Le 29/10/2014 15:02, Max Schwarz a =E9crit :
> >Hi,
> >
> >I'll agree with Karl and Doug. If you (as a board vendor/maintainer/=
etc) want
> >to use I2C, it's *your* responsibility to provide the pullup resisto=
rs by
> >either including pullup resistors on the board or by enabling the in=
ternal
> >ones.
> >Either way, you should think a moment about the consequences (freque=
ncy/trace
> >length limitations), which is why I'm also against the pullup-by-def=
ault
> >behavior.
> >
> >Also, it's much harder to diagnose effects like Doug is describing (=
slightly
> >out-of-spec due to internal + external pulls) than the effects you a=
re seeing
> >without any pullups. With your i2cdetect results my first thought wo=
uld have
> >been "are there pullups on the bus?".
> >
> >Cheers,
> >   Max
> >
> >Am Mittwoch, 29. Oktober 2014, 13:44:15 schrieb Karl Palsson:
> >>I'd be more inclined to have pulls disabled by default, it's more s=
tandard
> >>with what smaller micros do, but I've no experience with these bigg=
er
> >>cortex-a parts.  It's also the "least surprise" path.  If you want =
to try
> >>and use the onboard pullups, you can specify that in your board fil=
e, but
> >>for people deliberately selecting pullups for their timing and load
> >>expectations, being required to take an extra step to turn off some=
thing
> >>seems unexpected.
> >>
> >>If you _want_ to be able to probe an i2c bus for devices added afte=
rmarket,
> >>on a board that didn't get i2c pull ups because no devices were pla=
nned,
> >>and you want to turn on the internal pullups for that, I think that=
's
> >>something you need to do yourself, not making it a hard default in =
the SoC
> >>dtsi file.
> >>
> >>so, if it's off by default, you get this
> >>                                          dtsi   dts
> >>Board1, i2c periphs, designed pullups =3D> off     -
> >>board2, no peripsh, pulls in case     =3D> off     -
> >>board3, no periphs, forgot pulls, pray=3D> off    on
> >>
> >>If you turn it on by default, sure, it causes no harm in most cases=
, but
> >>you're no longer getting the values you expect, without having to t=
urn off
> >>things that are not default anyway.
> >>
> >>Sincerely,
> >>Karl Palsson
> >>
> >>On Wed, Oct 29, 2014 at 02:17:23PM +0100, Heiko St=FCbner wrote:
> >>>Hi Addy, Max, Wolfram,
> >>>
> >>>after Doug's explanation of disfavour [0] and Julien's subsequent =
response
> >>>I'm not sure which direction to go. So if possible I'd like to col=
lect
> >>>some more opinions of people knowing a lot more about i2c internal=
s than
> >>>myself :-) .
> >>>
> >>>
> >>>Thanks
> >>>Heiko
> >>>
> >>>
> >>>[0] http://lists.infradead.org/pipermail/linux-rockchip/2014-Octob=
er/000934.html
>=20
