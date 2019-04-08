From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH 00/12] Add support for Orange Pi 3
Date: Mon, 8 Apr 2019 14:46:45 +0200
Message-ID: <20190408124645.gv2tezjqhoxxx2yg@core.my.home>
References: <20190405234514.6183-1-megous@megous.com>
 <CAJiuCcew10Q3PUOk4VPoiyFc7ZhXwJzxXHQHNeVBUvVAQ3BkbQ@mail.gmail.com>
 <20190407143237.2qyoef4r5e3qvbmh@core.my.home>
 <CAMty3ZDpppM5zBvxCBx3NjdVsRm4S93yz5kqi5Z5a0rhC-+zPg@mail.gmail.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDXLF6FR5INBBN4FVXSQKGQEEHJ2KVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMty3ZDpppM5zBvxCBx3NjdVsRm4S93yz5kqi5Z5a0rhC-+zPg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel <dri-devel@li>
List-Id: devicetree@vger.kernel.org

Hi Jagan,

On Mon, Apr 08, 2019 at 11:31:22AM +0530, Jagan Teki wrote:
> On Sun, Apr 7, 2019 at 8:02 PM 'Ond=C5=99ej Jirman' via linux-sunxi
> <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org> wrote:
> >
> > On Sun, Apr 07, 2019 at 03:36:21PM +0200, Cl=C3=A9ment P=C3=A9ron wrote=
:
> > > Hi,
> > >
> > > On Sat, 6 Apr 2019 at 01:45, megous via linux-sunxi
> > > <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org> wrote:
> > > >
> > > > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > > >
> > > > This series implements support for Xunlong Orange Pi 3 board.
> > >
> > > OrangePi 3 Lite2 and One Plus boards support has already been merged.
> > > The support is not complete but you should rebase your patches on top
> > > of sunxi/for-next
> >
> > Hi,
> >
> > OrangePi 3 is somewhat different from these two boards (mostly it has a=
 differnt
> > power tree). It doesn't use the AXP regulators that are defined in the
> > sun50i-h6-orangepi.dtsi in the same way.
> >
> > For example:
> >
> > - bldo3 (is turned always on in sun50i-h6-orangepi.dtsi but unused for =
opi3)
> > - cldo2 and cldo3 are unused on opi3 and have nothing to do with WiFi
> > - aldo3 is not for dram
> > - bldo1 on the other hand is for dram on opi3
> > - some other regulators are used for different/more functions and thus
> >   named differntly
> > - USB id-det pin is differnt
> > - ...
>=20
> Based on my communication with OrangePI, OPI-3 has PCIE, 4 USB-3.0
> ports and AV are the key differences and rest seems to be similar. but
> if we have a diff or unused regulators may be we can't enable them in
> dtsi (I never looked that close as of now)

These regulators are not just disabled on Opi 3, they have different/no mea=
ning.

Schematics allow for high amount of variability in the power tree (see all =
the
NC (not connected) / 0R resistors) in the schematic around AXP805. Every bo=
ard
based on this Xunlong design can be subtly different.=20

I already suggested a maintainable solution, below. Where base dtsi has emp=
ty
config for regulators and every board based on that just defines it complet=
ely
for itself.

A few regulators (for CPU/GPU) will most probably have the same meaning on =
every
derived board, so these can probably be kept in dtsi without causing too mu=
ch
annoyance.

It's unpleasant to have wrong regulator setup defined in an underlying dtsi=
, and
then trying to override it by removing/adding random properties in the boar=
d dts
for the new boards based on that, so that it fits.

The rest of the current HW descriptions in the sun50i-h6-orangepi.dtsi can =
be
shared (as of now).

thank you and regards,
  o.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
