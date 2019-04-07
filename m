From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH 00/12] Add support for Orange Pi 3
Date: Sun, 7 Apr 2019 16:32:37 +0200
Message-ID: <20190407143237.2qyoef4r5e3qvbmh@core.my.home>
References: <20190405234514.6183-1-megous@megous.com>
 <CAJiuCcew10Q3PUOk4VPoiyFc7ZhXwJzxXHQHNeVBUvVAQ3BkbQ@mail.gmail.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDXLF6FR5INBBB4UVDSQKGQETHQ7RBA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJiuCcew10Q3PUOk4VPoiyFc7ZhXwJzxXHQHNeVBUvVAQ3BkbQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>linux-arm-kernel <li>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 07, 2019 at 03:36:21PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> Hi,
>=20
> On Sat, 6 Apr 2019 at 01:45, megous via linux-sunxi
> <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org> wrote:
> >
> > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >
> > This series implements support for Xunlong Orange Pi 3 board.
>=20
> OrangePi 3 Lite2 and One Plus boards support has already been merged.
> The support is not complete but you should rebase your patches on top
> of sunxi/for-next

Hi,

OrangePi 3 is somewhat different from these two boards (mostly it has a dif=
fernt
power tree). It doesn't use the AXP regulators that are defined in the
sun50i-h6-orangepi.dtsi in the same way.

For example:

- bldo3 (is turned always on in sun50i-h6-orangepi.dtsi but unused for opi3=
)
- cldo2 and cldo3 are unused on opi3 and have nothing to do with WiFi
- aldo3 is not for dram
- bldo1 on the other hand is for dram on opi3
- some other regulators are used for different/more functions and thus
  named differntly
- USB id-det pin is differnt
- ...

OrangePi 3 is not a superset of what is defined in sun50i-h6-orangepi.dtsi.

So to base Orange Pi 3 dts on top of existing sun50i-h6-orangepi.dtsi I'd h=
ave
to first move some things out of the base dtsi to the OrangePi Lite2 and On=
e
Plus board dts files, in order to have sun50i-h6-orangepi.dtsi only describ=
e HW
that is *really* shared by these 2 boards and Orange Pi 3.

If I do that, I'd undefine all the axp805 regulator nodes and move the
configurations to each of the 3 board files. That will probably end up bein=
g
the least confusing and most maintainable. See axp81x.dtsi lines 86-144 for
what I mean.

What do you think? Is this acceptable to everyone?

regards,
  o.

> https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/tree/arch=
/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi?h=3Dsunxi/for-next
>=20
> Regards,
> Clement
>=20
> >
> > Unfortunately, this board needs some small driver patches, so I have
> > split the boards DT patch into chunks that require patches for drivers
> > in various subsystems:
> >
> > - Basic DT for the board  (patch 1)
> > - HDMI support            (patches 2, 3, 4)
> > - Ethernet support        (patches 5, 6, 7)
> > - WiFi support            (patches 8, 9, 10, 11, 12)
> >
> > This patch is also needed to not get segfault on boot:
> >   https://lkml.org/lkml/2019/4/5/856
> >
> > Please take a look.
> >
> > regards,
> >   Ondrej Jirman
> >
> > Icenowy Zheng (2):
> >   net: stmmac: sun8i: add support for Allwinner H6 EMAC
> >   net: stmmac: sun8i: force select external PHY when no internal one
> >
> > Ondrej Jirman (10):
> >   arm64: dts: allwinner: h6: Add Orange Pi 3 DTS
> >   drm: sun4i: Add support for enabling DDC I2C bus to dw_hdmi glue
> >   dt-bindings: display: sun4i-drm: Add DDC power supply
> >   arm64: dts: allwinner: orange-pi-3: Enable HDMI output
> >   arm64: dts: allwinner: orange-pi-3: Enable ethernet
> >   arm64: dts: allwinner: h6: Add MMC1 pins
> >   pinctrl: sunxi: Prepare for alternative bias voltage setting methods
> >   pinctrl: sunxi: Support I/O bias voltage setting on H6
> >   brcmfmac: Loading the correct firmware for brcm43456
> >   arm64: dts: allwinner: orange-pi-3: Enable WiFi
> >
> >  .../bindings/display/sunxi/sun4i-drm.txt      |   1 +
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 339 ++++++++++++++++++
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |   9 +
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         |  17 +-
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h         |   1 +
> >  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  22 ++
> >  .../broadcom/brcm80211/brcmfmac/sdio.c        |   4 +-
> >  drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c     |   1 +
> >  drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c     |   2 +-
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  50 ++-
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.h         |   7 +-
> >  12 files changed, 433 insertions(+), 21 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.=
dts
> >
> > --
> > 2.21.0
> >
> > --
> > You received this message because you are subscribed to the Google Grou=
ps "linux-sunxi" group.
> > To unsubscribe from this group and stop receiving emails from it, send =
an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> > For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
